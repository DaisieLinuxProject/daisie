# Daisie Linux System Architecture Specification

## 1. System Overview and Operational Model

The Daisie Linux framework is a deterministic, lightweight system transformation and workspace automation architecture designed to operate directly on top of an active upstream Debian release. Unlike traditional Linux distributions that distribute pre-built OS states via monolithic ISO images and compressed filesystems (squashfs), Daisie Linux operates as a stateless translation layer.

The core operational objective is to preserve the base operating system’s security, package integrity, and long-term stability by delegating lower-level system maintenance strictly to Debian, while using a modular, dual-engine script structure to automate developer tool deployment, system configuration, and C++ workspace integration.

```text
+-----------------------------------------------------------------+
|                       User / Shell Space                        |
|   +---------------------------------------------------------+   |
|   |         Daisie C++ Core Libraries & Toolchains          |   |
|   +---------------------------------------------------------+   |
+-----------------------------------------------------------------+
|                    Daisie Framework Layer                       |
|   +--------------------------+   +--------------------------+   |
|   |   upgrade-to-daisie      |   |      update-daisie       |   |
|   |  (Transformation Engine) |   |    (Sentinel Engine)     |   |
|   +--------------------------+   +--------------------------+   |
+-----------------------------------------------------------------+
|                 Upstream Debian Base System                     |
|   +---------------------------------------------------------+   |
|   |        Linux Kernel  |  dpkg/apt  |  systemd            |   |
|   +---------------------------------------------------------+   |
+-----------------------------------------------------------------+

```

---

## 2. Core Architectural Subsystems

### 2.1 The Transformation Engine (`bin/upgrade-to-daisie`)

The initial state shift from generic Debian to the Daisie workspace is driven by `upgrade-to-daisie`. The execution flow is strictly sequential and transactional:

1. **Environment Verification:** Validates superuser execution privileges, host CPU architecture (`x86_64`), and upstream repository connectivity.
2. **Package Provisioning:** Invokes native `apt-get` procedures to retrieve foundational C++ build environments (`build-essential`, `cmake`, `g++`, system headers).
3. **FS Layout Deployment:** Populates `/usr/local/bin/` with Daisie binary interfaces and links internal modules into `/usr/local/lib/daisie/`.
4. **Hardware Profile Configuration:** Detects system-specific hardware parameters (thermal interfaces, display servers, backlight controllers) and applies targeted kernel parameter overrides.
5. **Boot Sequence Modification:** Stages the custom GRUB theme and updates `/etc/default/grub` configuration parameters without interrupting active kernel execution.

### 2.2 The Invisible Sentinel Engine (`bin/update-daisie`)

Maintenance of custom developer frameworks and configurations is handled by `update-daisie`, operating as a stateless background task:

1. **Remote Handshake:** Queries remote upstream source repositories to calculate SHA-256 state differentials.
2. **Source Fetching & Local Compilation:** Downloads modified C++ header files and source units directly onto the host, compiling binaries locally using native hardware instruction sets.
3. **Atomic Asset Linking:** Replaces updated binaries and header definitions in global compiler search paths (`/usr/local/include/daisie/`) using atomic symbolic links to prevent partial execution states during active development.

### 2.3 The Custom C++ Runtime and Header Layer (`include/daisie/`)

Daisie Linux injects optimized, zero-dependency C++ headers directly into system compiler search paths. These components are designed with the following constraints:

* Target standard: **C++20/C++23**.
* Zero mandatory third-party runtime dependencies.
* Direct system call abstractions for direct hardware status monitoring and low-latency thermal diagnostic routines.

---

## 3. Filesystem Hierarchy Mapping

The framework adheres strictly to the target system's Filesystem Hierarchy Standard (FHS):

| Local Repository Source Path | Target Host System Deployment Path | Purpose / Function |
| --- | --- | --- |
| `bin/upgrade-to-daisie` | `/usr/local/bin/upgrade-to-daisie` | Primary transformation initiation binary |
| `bin/update-daisie` | `/usr/local/bin/update-daisie` | Background update and compilation manager |
| `lib/*.sh` | `/usr/local/lib/daisie/*.sh` | Internal system setup and theme installation modules |
| `include/daisie/*` | `/usr/local/include/daisie/*` | Globally available C++ header interfaces |
| `assets/grub/*` | `/boot/grub/themes/daisie/*` | Static GRUB bootloader graphical assets |

---

## 4. Bootloader and UI Integration Subsystem

Visual alterations introduced by Daisie Linux are designed to impose zero performance overhead on post-boot system operation:

* **GRUB Theme Layer:** Configured via `assets/grub/theme.txt`. Renders the visual interface prior to kernel initialization, terminating completely upon kernel handoff to ensure zero passive RAM allocation.
* **First-Launch Interface:** Executed exactly once upon the first successful desktop login post-transformation. Utilizes native lightweight UI rendering engines to present system documentation and path maps before immediately freeing allocated memory resources.

---

## 5. Security and Upstream Isolation Sentry

To prevent core system decay and dependency conflicts:

1. **No Proprietary Binary Repositories:** Daisie Linux does not maintain separate APT package repositories. All OS-level binary dependencies originate strictly from official Debian mirrors.
2. **Read-Only System Integrity:** Framework operations strictly avoid replacing fundamental Debian system binaries (e.g., `/bin/bash`, `/usr/bin/dpkg`, system daemons). All modifications exist isolated within `/usr/local/` namespaces or non-destructive configuration overrides.
