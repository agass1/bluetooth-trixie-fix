# Bluetooth Fix Script for Linux

**Reason for creation:** Frequent Bluetooth issues after installing KDE Plasma.

This script completely removes existing Bluetooth packages and data, then reinstalls them. It is useful if you are experiencing problems connecting Bluetooth devices or managing them or AD2P failed.

## How to use

1. Download the script `bluetooth_fix.sh`.
2. Make the script executable:

```bash
chmod +x bluetooth_fix.sh
```

3. Run the script as administrator:

```bash
sudo ./bluetooth_fix.sh
```

4. After completion, the script will **ask** if you want to reboot the system. To reboot, type:

```
yes
```

If you type anything else, the reboot will be skipped.

## What the script does

- Completely removes all Bluetooth-related packages.
- Deletes old configuration data (`/var/lib/blueman` and `/var/lib/bluetooth`).
- Reinstalls packages: `blueman`, `bluez`, `pulseaudio-module-bluetooth` along with suggested dependencies.
- Asks the user for confirmation to reboot the system.
- Prepares the system for clean Bluetooth functionality.
