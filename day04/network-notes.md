# Day 04 — SSH & Networking

## SSH Config
Created ~/.ssh/config with GitHub shortcut.
Test: ssh github -> authenticates successfully

## Open Ports (ss -tulnp)
- 53 UDP/TCP -> systemd-resolved (WSL DNS)
- 323 UDP -> chronyd (time sync)
- 35599 TCP -> VS Code node process (localhost only)
- 80 TCP -> nginx listening on 0.0.0.0 (all interfaces)

## DNS Check
dig github.com -> 140.82.112.4 (resolved in 28ms)
DNS server: 172.19.48.1 (WSL gateway)

## Key Concepts Locked In
- Public key = padlock (safe to share)
- Private key = never leaves machine, chmod 600
- Port 80 = HTTP, 443 = HTTPS, 22 = SSH
- ss -tulnp = see everything listening and who owns it
- dig = DNS lookup tool
