#!/usr/bin/env bash

install_target_packages() 
{
    local package_file="packages.list"

    if [ ! -f "$package_file" ]
    then
        echo "[Daisie Error] Package list file ($package_file) not found." >&2
        exit 1
    fi

    echo "[Daisie Package Manager] Reading dependency manifest..."

    local packages=()
    while IFS= read -r line || [ -n "$line" ]
    do
        line=$(echo "$line" | xargs)
        if [ -n "$line" ]
        then
            packages+=("$line")
        fi
    done < "$package_file"

    if [ ${#packages[@]} -eq 0 ]
    then
        echo "[Daisie Warning] Package manifest is empty."
        return 0
    fi

    echo "[Daisie Package Manager] Installing dependencies: ${packages[*]}"
    sudo apt-get update -y
    sudo apt-get install -y "${packages[@]}"
}
