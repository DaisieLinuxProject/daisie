#!/usr/bin/env bash

register_daisie_session() 
{
    echo "[Daisie UI] Registering Daisie Linux GNOME session..."

    cat <<'EOF' | sudo tee /usr/share/xsessions/daisie-gnome.desktop > /dev/null
[Desktop Entry]
Name=Daisie Linux (GNOME)
Comment=Hyper-optimized Developer Sanctuary Environment
Exec=gnome-session
TryExec=gnome-session
Type=Application
DesktopNames=GNOME;Daisie;
Keywords=Launch;GNOME;Daisie;Development;
EOF

    chmod 644 /usr/share/xsessions/daisie-gnome.desktop
    echo "[Daisie UI] Custom session successfully registered in Display Manager."
}
