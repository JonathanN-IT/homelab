# Homelab — Infrastructure Auto-Hébergée

Homelab construit de zéro dans le cadre de ma reconversion professionnelle vers
l'Administration Réseau & Systèmes, avec une spécialisation en cybersécurité et virtualisation.
Hébergé sur un serveur dédié sous Proxmox VE, gérant plusieurs conteneurs LXC, VMs et services Docker.

---

## Configuration Matérielle

| Composant | Détail |
|-----------|--------|
| **Machine** | MEDION Akoya P5360 E |
| **CPU** | Intel Core i5-6402P @ 2.80GHz — 4 cœurs |
| **RAM** | 16 Go DDR4 |
| **SSD** | 120 Go Samsung (OS + Proxmox) |
| **HDD** | 3x 1 To (Seagate x2, WD x1) — données & médias |
| **Stockage total** | ~3.1 To |

---

## Architecture

```
Internet
    │
    ▼
Cloudflare (DNS + Tunnel Zero Trust)
    │
    ▼
┌──────────────────────────────────────────────────────────────┐
│                      Proxmox VE (Hôte)                       │
│                                                              │
│  CT100 — Média & Cloud      CT101 — Passerelle (gateway)     │
│  CT102 — Web (Groinck)      CT103 — Web (Tatouage)           │
│  CT104 — Bureau Linux       CT105 — DNS (Pi-hole)            │
│  CT301 — ASOV (BookStack)   CT401 — Travel & Photos          │
│  CT500 — Cybersec / Kali    VM800 — FortiGate                │
└──────────────────────────────────────────────────────────────┘
```

Flux : `Navigateur → Cloudflare Edge → Tunnel → Nginx Proxy Manager → Service cible`

---

## Sécurité & Réseau

| Technologie | Rôle |
|------------|------|
| **Cloudflare Tunnel** | Aucun port exposé sur internet — trafic chiffré via tunnel |
| **Nginx Proxy Manager** | Reverse proxy + certificats SSL/TLS automatiques (DNS challenge) |
| **FortiGate VM** | Pare-feu virtuel (FortiOS 8.0) — inspection et filtrage réseau |
| **Pi-hole + DNSCrypt** | DNS local filtrant + chiffrement DNS |
| **Fail2ban** | Protection contre les attaques brute-force |
| **Vaultwarden** | Gestionnaire de mots de passe auto-hébergé |
| **Cloudflare DNS** | Gestion DNS avec 15+ sous-domaines |

> Tout le trafic externe transite par le tunnel Cloudflare Zero Trust — l'IP publique du serveur n'est jamais exposée.

---

## Conteneurs & VMs

| Instance | Rôle | Détails |
|----------|------|---------|
| **CT100** | Média & Cloud | [→ ct100-media/](ct100-media/) |
| **CT101** | Passerelle | [→ ct101-passerelle/](ct101-passerelle/) |
| **CT102** | Web (Groinck) | [→ ct102-web-groinck/](ct102-web-groinck/) |
| **CT103** | Web (Tatouage) | [→ ct103-web-tatouage/](ct103-web-tatouage/) |
| **CT104** | Bureau Linux | [→ ct104-bureau-linux/](ct104-bureau-linux/) |
| **CT105** | DNS | [→ ct105-dns/](ct105-dns/) |
| **CT301** | ASOV — BookStack | *documentation interne* |
| **CT401** | Travel & Photos | *documentation interne* |
| **CT500** | Cybersec / Kali Linux | [→ ct500-cybersec/](ct500-cybersec/) |
| **VM800** | FortiGate (pare-feu) | [→ vm800-fortigate/](vm800-fortigate/) |

📂 Scripts d'automatisation : [→ scripts/](scripts/)
📐 Schéma d'architecture détaillé : [→ architecture/](architecture/)

---

## Compétences Démontrées

- **Virtualisation** : Proxmox VE, conteneurs LXC, VMs KVM, gestion des ressources
- **Réseau & Sécurité** : FortiGate (FortiOS 8.0), Cloudflare Zero Trust, reverse proxy, SSL/TLS, Pi-hole, Fail2ban
- **Linux** : Administration système Debian/Ubuntu/Kali, services systemd, scripting Bash
- **Docker** : Déploiements multi-conteneurs, images custom, gestion volumes et réseau
- **Cybersécurité** : Kali Linux, OSINT (SpiderFoot, Sherlock, Maigret…), kali-linux-headless, FortiGate
- **Accès distant** : Apache Guacamole, XRDP, VNC, noVNC — accès SSH/RDP/VNC centralisé
- **Automatisation** : Scripting Bash, API REST Cloudflare, API Guacamole, API NPM
- **Sauvegardes** : Scripts Bash automatisés avec rotation, sauvegarde SQLite chiffrée

---

## Sauvegardes

- **Vaultwarden** — Backup automatique quotidien (2h00) avec rotation sur 7 jours
- Script Bash dédié : sauvegarde SQLite + clé RSA + pièces jointes compressées en .tar.gz
- **Proxmox** — Snapshots des conteneurs LXC

---

## Domaine & DNS

- Domaine : rippers.be (enregistré chez one.com)
- DNS géré par **Cloudflare**
- 15+ sous-domaines configurés, chacun routé via Cloudflare Tunnel → Nginx Proxy Manager

---

## À Propos

Électricien en reconversion vers l'Administration Réseau & Systèmes.
Ce homelab est mon environnement d'apprentissage pratique — chaque service, configuration
et décision technique a été recherché, implémenté et débogué par moi-même.

**Formation en cours** : Administrateur Réseau & Systèmes — orientation Cybersécurité (cours débutant sept. 2026)

**Certifications** :
- Fortinet **NSE 1** — Network Security Associate : Introduction to the Threat Landscape 3.0

---

## Contact

- **Email** : Jon@rippers.be
- **LinkedIn** : https://www.linkedin.com/in/jonathan-nuttin-it
