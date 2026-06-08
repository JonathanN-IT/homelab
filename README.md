# 🖥️ Homelab — Infrastructure Auto-Hébergée

Homelab construit de zéro dans le cadre de ma reconversion professionnelle vers
lAdministration Réseau & Systèmes, avec une spécialisation en virtualisation.
Hébergé sur un serveur dédié sous Proxmox VE, gérant plusieurs conteneurs LXC et services Docker.

---

## 🖥️ Configuration Matérielle

| Composant | Détail |
|-----------|--------|
| **Machine** | MEDION Akoya P5360 E |
| **CPU** | Intel Core i5-6402P @ 2.80GHz — 4 cœurs |
| **RAM** | 16 Go DDR4 |
| **SSD** | 120 Go Samsung (OS + Proxmox) |
| **HDD** | 3x 1 To (Seagate x2, WD x1) — données & médias |
| **Stockage total** | ~3.1 To |

---

## 🏗️ Architecture

```
Internet
    │
    ▼
Cloudflare (DNS + Tunnel)
    │
    ▼
┌─────────────────────────────────────────┐
│           Proxmox VE (Hôte)             │
│                                         │
│  CT100 - Média       CT101 - Passerelle │
│  CT102 - Web (WordPress) CT103 - Web    │
│  CT104 - Bureau Linux                   │
└─────────────────────────────────────────┘
```

---

## 🔒 Sécurité & Réseau

| Technologie | Rôle |
|------------|------|
| **Cloudflare Tunnel** | Aucun port exposé sur internet — trafic chiffré via tunnel |
| **Nginx Proxy Manager** | Reverse proxy + certificats SSL/TLS automatiques |
| **Fail2ban** | Protection contre les attaques brute-force |
| **Vaultwarden** | Gestionnaire de mots de passe auto-hébergé |
| **Cloudflare DNS** | Gestion DNS avec 13+ sous-domaines |

> Tout le trafic externe transite par le tunnel Cloudflare — lIP publique du serveur nest jamais exposée.

---

## 📦 Conteneurs (LXC)

### CT100 — Média & Cloud
- **Plex** — Serveur multimédia personnel
- **Jellyfin** — Streaming vidéo open-source
- **Nextcloud** — Stockage cloud privé
- **Vaultwarden** — Gestionnaire de mots de passe
- **Navidrome** — Streaming musical
- **Jellyseerr** — Gestion des demandes de médias
- **qBittorrent + Sonarr + Radarr + Lidarr + Prowlarr** — Stack de gestion automatisée des médias

### CT101 — Passerelle
Point dentrée de linfrastructure. Gère le routage de tout le trafic entrant.

- **Nginx Proxy Manager** — Reverse proxy avec SSL Lets Encrypt pour 13+ sous-domaines
- **Cloudflare Tunnel (cloudflared)** — Tunnel chiffré sans port ouvert
- **Apache Guacamole** — Passerelle daccès distant (RDP/SSH/VNC via navigateur)
- **Homepage** — Dashboard de supervision de tous les services
- **Docker** — Orchestration des conteneurs

### CT102 & CT103 — Hébergement Web
- Instances **WordPress** hébergées derrière Nginx Proxy Manager

### CT104 — Bureau Linux & Sécurité
- **Environnement bureau Linux** accessible à distance via Guacamole
- **Fail2ban** — Prévention active des intrusions

---

## 💾 Sauvegardes

- **Vaultwarden** — Backup automatique quotidien (2h00) avec rotation sur 7 jours
- Script Bash dédié : sauvegarde SQLite + clé RSA + pièces jointes compressées en .tar.gz
- **Proxmox** — Snapshots des conteneurs LXC

---

## 🌐 Domaine & DNS

- Domaine : rippers.be (enregistré chez one.com)
- DNS géré par **Cloudflare**
- 13 sous-domaines configurés, chacun routé via Cloudflare Tunnel → Nginx Proxy Manager

---

## 🛠️ Compétences Démontrées

- **Virtualisation** : Proxmox VE, conteneurs LXC, gestion des ressources
- **Réseau** : Gestion DNS, reverse proxy, SSL/TLS, tunnel Cloudflare
- **Linux** : Administration système Debian, services systemd
- **Docker** : Déploiements multi-conteneurs, gestion des volumes et du réseau
- **Automatisation** : Scripting API Cloudflare (gestion en masse des enregistrements DNS via REST API)
- **Sauvegardes** : Scripts Bash automatisés avec rotation, sauvegarde SQLite en ligne

---

## 📊 Dashboard de Supervision

Tous les services sont supervisés via un dashboard **Homepage** auto-hébergé sur home.rippers.be
avec statut ping en temps réel pour chaque service.

---

## 🎯 À Propos

Électricien en reconversion vers lAdministration Réseau & Systèmes, avec une spécialisation en **virtualisation**.
Ce homelab est mon environnement dapprentissage pratique — chaque service, configuration
et décision technique a été recherché, implémenté et débogué par moi-même.

**Formation en cours** : Administrateur Réseau & Systèmes — Spécialisation Virtualisation

---

## 📫 Contact

- **Email** : rjnuttin@gmail.com
- **LinkedIn** : https://www.linkedin.com/in/jonathan-nuttin-it
