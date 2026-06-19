# Architecture

Schéma réseau de l'infrastructure.

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
│  CT100 — Média & Cloud     CT101 — Passerelle (gateway)      │
│  CT102 — Web (Groinck)     CT103 — Web (Tatouage)            │
│  CT104 — Bureau Linux      CT105 — DNS (Pi-hole)             │
│  CT301 — ASOV (BookStack)  CT401 — Travel / Immich           │
│  CT500 — Cybersec / Kali   VM800 — FortiGate                 │
└──────────────────────────────────────────────────────────────┘
```

## Flux de trafic

```
Navigateur
    │  HTTPS
    ▼
Cloudflare Edge (SSL terminé)
    │  Cloudflare Tunnel (chiffré)
    ▼
CT101 — cloudflared
    │
    ▼
CT101 — Nginx Proxy Manager (port 80/443)
    │  routing par nom de domaine
    ▼
Service cible (CT100, CT104, CT500, etc.)
```

## Réseau local

- Plage : réseau privé /24
- DNS local : Pi-hole (CT105) + DNSCrypt-proxy
- Tous les conteneurs LXC : non-privilégiés, amd64

## TODO

- [ ] Remplacer ce schéma ASCII par un vrai diagramme (draw.io, Excalidraw...)
- [ ] Ajouter les VLAN/sous-réseaux si pertinent
