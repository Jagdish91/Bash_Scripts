# 🧮 Disk Utilization Monitoring Service

A Linux system monitoring project that checks disk usage regularly using a **Bash script**, **systemd service**, and **timer**.  
It logs results when usage exceeds a threshold.

---

## 🧰 Features
- Monitors disk utilization using `df`
- Excludes system mounts (tmpfs, overlay)
- Logs results to `/var/log/disk_usage.log`
- Runs automatically via systemd timer (default: every 30 minutes)

---

## 📁 Project Files
| File | Description |
|------|--------------|
| `disk_usage.sh` | Main Bash script that performs the disk utilization check |
| `disk_check.service` | Defines the systemd service that runs the script |
| `disk_check.timer` | Defines the timer interval (every 30 minutes by default) |

---

## ⚙️ Installation Steps
```bash
# Copy script
sudo cp disk_check.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/disk_check.sh

# Copy systemd files
sudo cp disk_check.service /etc/systemd/system/
sudo cp disk_check.timer /etc/systemd/system/

# Reload and enable timer
sudo systemctl daemon-reload
sudo systemctl enable --now disk_check.timer

# Check status
systemctl status disk_check.timer

