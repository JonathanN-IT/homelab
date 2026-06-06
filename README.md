# 🖥️ Homelab — Infrastructure Auto-Hébergée

Homelab construit de zéro dans le cadre de ma reconversion professionnelle vers
lAdministration Réseau & Systèmes. Hébergé sur un serveur dédié sous Proxmox VE,
gérant plusieurs conteneurs LXC et services Docker.

---

## 🏗️ Architecture

```
Internet
    │
    ▼
Cloudflare (DNS + Tunnel Zero Trust)
    │
    ▼
┌─────────────────────────────────────────┐
│           Proxmox VE (Hôte)             │
│                                         │
│  CT101 - Passerelle      CT100 - Média  │
│  CT102 - Web (WordPress) CT103 - Web    │
│  CT104 - Bureau Linux                   │
└─────────────────────────────────────────┘
```

---

## 🔒 Sécurité & Réseau

| Technologie | Rôle |
|------------|------|
| **Cloudflare Tunnel** | Accès Zero Trust — aucun port ouvert sur internet |
| **Nginx Proxy Manager** | Reverse proxy + certificats SSL/TLS automatiques |
| **Fail2ban** | Protection contre les attaques brute-force |
| **Vaultwarden** | Gestionnaire de mots de passe auto-hébergé |
| **Cloudflare DNS** | Gestion DNS avec 13+ sous-domaines |

> Tout le trafic externe transite par le tunnel Cloudflare — lIP publique du serveur nest jamais exposée.

---

## 📦 Conteneurs (LXC)

### CT101 — Passerelle
Point dentrée de linfrastructure. Gère le routage de tout le trafic entrant.

- **Nginx Proxy Manager** — Reverse proxy avec SSL Lets Encrypt pour 13+ sous-domaines
- **Cloudflare Tunnel (cloudflared)** — Tunnel sécurisé Zero Trust
- **Apache Guacamole** — Passerelle daccès distant (RDP/SSH/VNC via navigateur)
- **Homepage** — Dashboard de supervision de tous les services
- **Docker** — Orchestration des conteneurs

### CT100 — Média & Cloud
- **Plex** — Serveur multimédia personnel
- **Jellyfin** — Streaming vidéo open-source
- **Nextcloud** — Stockage cloud privé
- **Vaultwarden** — Gestionnaire de mots de passe
- **Navidrome** — Streaming musical
- **Jellyseerr** — Gestion des demandes de médias
- **qBittorrent + Sonarr + Radarr + Lidarr + Prowlarr** — Stack de gestion automatisée des médias

### CT102 & CT103 — Hébergement Web
- Instances **WordPress** hébergées derrière Nginx Proxy Manager

### CT104 — Bureau Linux & Sécurité
- **Environnement bureau Linux** accessible à distance via Guacamole
- **Fail2ban** — Prévention active des intrusions

---

## 🌐 Domaine & DNS

- Domaine : rippers.be (enregistré chez one.com)
- DNS géré par **Cloudflare**
- 13 sous-domaines configurés, chacun routé via Cloudflare Tunnel → Nginx Proxy Manager

---

## 🛠️ Compétences Démontrées

- **Virtualisation** : Proxmox VE, conteneurs LXC
- **Réseau** : Gestion DNS, reverse proxy, SSL/TLS
- **Sécurité** : Architecture Zero Trust, prévention dintrusion, gestion des secrets
- **Linux** : Administration système Debian, services systemd
- **Docker** : Déploiements multi-conteneurs, gestion des volumes et du réseau
- **Automatisation** : Scripting API Cloudflare (gestion en masse des enregistrements DNS via REST API)

---

## 📊 Dashboard de Supervision

Tous les services sont supervisés via un dashboard **Homepage** auto-hébergé sur home.rippers.be
avec statut ping en temps réel pour chaque service.

---

## 🎯 À Propos

Électricien en reconversion vers lAdministration Réseau & Systèmes, avec pour objectif
de me spécialiser en **Cybersécurité**.
Ce homelab est mon environnement dapprentissage pratique — chaque service, configuration
et décision de sécurité a été recherché, implémenté et débogué par moi-même.

**Formation en cours** : Administrateur Réseau & Systèmes
**Objectif** : Spécialisation Cybersécurité (Zero Trust, sécurité réseau, ethical hacking)

---

## 📫 Contact

- **Email** : rjnuttin@gmail.com
- **LinkedIn** : *(à ajouter)*
