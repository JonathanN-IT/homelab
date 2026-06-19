# CT104 — Bureau Linux

Environnement bureau Linux complet accessible à distance via navigateur ou Guacamole.

## Services

- **XRDP** — accès bureau distant via protocole RDP
- **TigerVNC + noVNC** — accès bureau via navigateur web (WebSocket)
- **LightDM** — gestionnaire de session graphique
- **Fail2ban** — prévention active des intrusions (brute-force SSH/RDP)

## Accès

| Méthode | Description |
|---------|-------------|
| **Navigateur** | https://linux.rippers.be/vnc.html — bureau Linux directement dans le navigateur |
| **Guacamole** | Connexion "debian-lab CT" — RDP ou SSH via Guacamole |

## Cas d'usage

Environnement de lab graphique isolé : tests d'applications, développement, environnement desktop jetable sans toucher à la machine hôte.
