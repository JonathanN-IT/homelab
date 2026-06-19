# Architecture

Schéma réseau de l'infrastructure (à ajouter : export `.png` ou `.drawio`).

```
Internet
    │
    ▼
Cloudflare (DNS + Tunnel)
    │
    ▼
┌─────────────────────────────────────────────────────┐
│                  Proxmox VE (Hôte)                  │
│                                                     │
│  CT100 - Média & Cloud    CT101 - Passerelle        │
│  CT102 - Web (Groinck)    CT103 - Web (Tatouage)    │
│  CT104 - Bureau Linux     CT105 - DNS (Pi-hole)     │
│  CT500 - Cybersec / OSINT                           │
└─────────────────────────────────────────────────────┘
```

## TODO

- [ ] Remplacer ce schéma ASCII par un vrai diagramme (draw.io, Excalidraw...)
- [ ] Ajouter les VLAN/sous-réseaux si pertinent
