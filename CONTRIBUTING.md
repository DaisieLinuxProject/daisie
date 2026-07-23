# Contributing to The Daisie Linux Project

Thank you for your interest in contributing to The Daisie Linux Project. To maintain architectural integrity, build determinism, and strict adherence to our design philosophy, all contributors are expected to read and follow the guidelines outlined in this document.

---

## 1. Architectural Principles and Scope

Daisie Linux is not a monolithic Linux distribution; it is a programmatic transformation and customization framework designed to operate on top of a clean upstream Debian base.

All contributions must respect the following core technical constraints:

* **No Monolithic ISO Build Pipeline:** Contributions attempting to introduce custom installation images, live environment squashfs modifications, or custom distribution ISOs will be rejected.
* **Bare-Metal and Compilation Priority:** System utilities and frameworks must favor native, compiled C++ code or lightweight POSIX-compliant shell execution over high-overhead interpreted runtimes or containerized wrappers.
* **Upstream Reliance:** Core operating system packages, security patches, and kernel updates must remain delegated to official upstream Debian repositories.

---

## 2. Code Structure and Directory Standards

All merged code must align with the repository file layout and the Target System Filesystem Hierarchy Standard (FHS):

```text
.
├── bin/                    # User-facing transformation and maintenance binaries
├── lib/                    # Internal shell modules and auxiliary execution scripts
├── include/                # Global C++ header files and namespace definitions
├── assets/                 # Bootloader themes, graphical elements, and static assets
├── docs/                   # Architectural documentation
├── CONTRIBUTING.md
├── LICENSE
└── README.md

```

### Script and Binary Conventions

1. Executable scripts targeted for system deployment (`/usr/local/bin/`) must **not** include file extensions (e.g., `upgrade-to-daisie`, not `upgrade-to-daisie.sh`).
2. Internal modules residing in `lib/` must retain the `.sh` extension and be designed strictly for sourcing by primary execution engines.
3. All shell scripts must be POSIX-compliant or clean Bash and must pass `shellcheck` static analysis without warnings prior to submission.

### C++ Development Standards

1. C++ codebase components must target **C++20** (or higher) standards.
2. Dependencies should be kept to absolute zero or limited to header-only libraries.
3. Explicit memory management and deterministic execution paths are strictly enforced.

---

## 3. Submitting Pull Requests (PR)

To ensure a smooth review process, follow this workflow:

1. **Fork and Branch:** Fork the repository and create a distinct topic branch using the format `feature/description` or `fix/description`.
2. **Local Validation:** Test all transformation routines and scripts inside a clean Debian environment (Virtual Machine or isolated container) to prevent breaking edge cases.
3. **Commit Messages:** Write descriptive, imperative commit messages (e.g., `Fix hardware driver initialization sequence in lib/hw-drivers.sh`).
4. **Pull Request Description:** Clearly state the bug, hardware optimization, or architectural refactor introduced by the PR, including logs or testing results where applicable.

---

## 4. Licensing and Intellectual Property

By contributing to The Daisie Linux Project, you explicitly agree that your contributions will be licensed under the terms of the **GNU General Public License v3.0 (GPLv3)**. All rights, patents, and modifications remain copyleft and publicly available under the terms of this license.
