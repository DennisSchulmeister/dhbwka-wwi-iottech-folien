#! /bin/sh

# Signalhandler registrieren
trap "/sbin/poweroff" USR1                 # System auf Anforderung herunterfahren
trap "/sbin/reboot" INT                    # System auf Anforderung neustarten
trap ":" ALRM                              # SIGALRM ignorieren
trap ":" CHLD                              # SIGCHLD ignorieren

# Dateisysteme einhängen
/bin/mount -t proc proc /proc              # Proc Filesystem einhängen
/bin/mount -o remount,rw /                 # Schreibzugriff auf das Root Filesystem
/bin/mount -a                              # Dateisysteme aus /etc/fstab einhängen

# Systemdienste starten
/bin/hostname -F /etc/hostname             # Hostname aus /etc/hostname setzen
/usr/bin/loadkeys de-latin1                # Deutsches Tastaturlayout setzen
/sbin/ifup -a                              # Netzwerk starten
/usr/sbin/sshd &                           # Remote Login via SSH zulassen

# Login-Konsole starten
while [ 1 ]; do                            # Init-Script niemals beenden!
    /sbin/getty -L tty1 0 vt100            # Login-Konsole auf /dev/tty1 starten
done
