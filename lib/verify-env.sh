#!/usr/bin/env bash

verify_system_environment() 
{
    local os_info=""
    if [ -f /etc/os-release ]
    then
        os_info=$(cat /etc/os-release | tr '[:upper:]' '[:lower:]')
    elif command -v hostnamectl >/dev/null 2>&1
    then
        os_info=$(hostnamectl | tr '[:upper:]' '[:lower:]')
    fi

    local desktop_info=""
    desktop_info=$(echo "${XDG_CURRENT_DESKTOP:-$DESKTOP_SESSION}" | tr '[:upper:]' '[:lower:]')

    if [[ "$os_info" == *"debian"* ]] && [[ "$desktop_info" == *"gnome"* ]]
    then
        echo "[Daisie Sentinel] Host verified: Upstream Debian with GNOME detected."
        return 0
    else
        echo "[Daisie Error] Incompatible host architecture detected!" >&2
        echo "               Daisie Linux requires a clean upstream Debian installation running GNOME." >&2
        echo "               Current OS/Desktop state does not match validation constraints." >&2
        exit 1
    fi
}
