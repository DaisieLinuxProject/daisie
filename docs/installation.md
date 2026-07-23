# Daisie Linux Installation and Transformation Manual

## 1. Prerequisites and Target System Requirements

The Daisie Linux installation process requires an existing, clean deployment of upstream Debian. The target host must conform to the following minimal operational constraints:

* **Base Operating System:** Upstream Debian GNU/Linux (Testing or Stable release tree).
* **Desktop Environment:** GNOME Desktop Environment (Wayland or X11 session host).
* **Architecture:** `x86_64` (amd64).
* **Privileges:** Standard user with full `sudo` execution authorization.
* **Network Access:** Unrestricted HTTPS connectivity to official Debian APT mirrors.

---

## 2. Deployment Sequence

### Step 1: Repository Retrieval

Clone the repository to a local directory:

```bash
git clone https://github.com/DaisieLinuxProject/daisie
cd daisie

```

### Step 2: Execution Permission Assignment

Grant execution rights to the primary transformation engine:

```bash
chmod +x bin/upgrade-to-daisie

```

### Step 3: Executing the Transformation Engine

Launch the transformation process using superuser privileges:

```bash
sudo ./bin/upgrade-to-daisie

```

---

## 3. Internal Transformation Stages

Upon invocation, `upgrade-to-daisie` initiates the following sequential pipeline:

1. **Host Environment Verification (`lib/verify-env.sh`):** Validates Debian and GNOME state. Terminates execution on environment mismatch.
2. **Dependency Resolution (`lib/install-packages.sh`):** Provision system tools and libraries required for the workspace.
3. **Session Registration (`lib/register-session.sh`):** Writes `daisie-gnome.desktop` into `/usr/share/xsessions/`.
4. **Bootloader Deployment (`lib/install-grub-theme.sh`):** Copies boot assets to `/boot/grub/themes/daisie/` and updates system boot configurations.

---

## 4. Post-Installation Verification

After completion, restart the system host. At the Display Manager (GDM) login prompt, select **Daisie Linux (GNOME)** from the session parameters menu prior to entering user credentials.
