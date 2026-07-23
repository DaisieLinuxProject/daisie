# Daisie Linux Development Roadmap

This document outlines the strategic milestones and technical progression planned for the **Daisie Linux Project**. The roadmap is structured sequentially to ensure system stability, modular expansion, and proper architecture decoupling.

---

## Phase 1: Core Foundation and Dependency Engine (Current Stage)

*Goal: Establish a resilient base system transformation structure on Debian.*

* [ ] **Base Transformation Pipeline:** Implement `bin/upgrade-to-daisie` as the entry execution point.
* [x] **Manifest-Driven Package Management:** Decouple package installation using `packages.list` and `lib/install-packages.sh`.
* [x] **Session Integration:** Register custom GDM display manager session configuration (`daisie-gnome.desktop`).
* [x] **Bootloader Theming:** Integrate custom GRUB visual assets and theme registration scripts.
* [x] **Documentation Standard:** Establish complete system architecture and installation manuals within `docs/`.

---

## Phase 2: Environment Polish & Tooling Integration

*Goal: Deepen desktop personalization, terminal efficiency, and pre-configured utility integration.*

* [ ] **Dotfiles Automation Engine:**
* Create `lib/deploy-dotfiles.sh` to sync pre-configured configurations for `micro`, `fastfetch`, `zsh`/`bash`, and `tmux`.


* [ ] **GNOME Shell Customization:**
* Automate extension deployment (`dash-to-panel`, `appindicator`, etc.) via `dconf` database dumps.


* [ ] **Cybersecurity Toolchain Optimization:**
* Pre-configure pathing and environment variables for local security tools (`metasploit-framework`, `wireshark` group privileges).


* [ ] **Update & Maintenance Subsystem:**
* Implement `bin/update-daisie` to fetch repository updates and sync package manifests without re-running full system initialization.



---

## Phase 3: Native Core Engine & Performance Optimization

*Goal: Transition shell-bound orchestration logic to compiled native binaries for increased speed and robust error handling.*

* [ ] **C++ Transformation Core:**
* Migrate execution logic from Shell scripts to a compiled C++ core engine (`daisie-core`).
* Introduce standardized error handling, system log parsing, and strict transaction fallbacks.


* [ ] **System Status Daemon:**
* Develop a lightweight daemon/CLI utility to report Daisie system health, version status, and environment integrity.


* [ ] **Custom Desktop Profiles:**
* Offer modular profile switching during deployment (e.g., *Full Workstation* vs. *Minimal Terminal/Security* mode).


---

## Phase 4: Advertising

*Goal: Inform as much people as possible about Daisie Linux.*

* [ ] A direct code of a website using HTML, CSS and JavaScript.
* [ ] Integration of the website with the GitHub Sites Service and the domain.
* [ ] Connection of the repository and the advertising website.

---

## Phase 5: Long-Term Horizon (v2.0)

*Goal: Independent repository hosting and full distribution customization.*

* [ ] Dedicated APT package repository for Daisie-specific binaries.
* [ ] Live ISO build pipeline using `live-build` to offer standalone Daisie Linux installation media directly.
* [ ] Custom system settings application integrated with the GNOME Control Center.
