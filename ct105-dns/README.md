# CT105 — DNS Local

Filtrage DNS et chiffrement pour tout le réseau local.

## Services

| Service | Rôle |
|---------|------|
| **Pi-hole FTL** | Blocage publicités & tracking au niveau DNS |
| **DNSCrypt-proxy** | Chiffrement des requêtes DNS sortantes (DNS-over-HTTPS) |

## Architecture DNS

```
Client réseau local
    │
    ▼
Pi-hole (filtrage + blocage)
    │
    ▼
DNSCrypt-proxy (chiffrement)
    │
    ▼
Resolver externe (DNS-over-HTTPS)
```

## Avantages

- Blocage des publicités et trackers pour **tous** les appareils du réseau (y compris mobiles et Smart TV) sans configuration par appareil
- Requêtes DNS chiffrées — le FAI ne peut pas intercepter ni enregistrer les résolutions DNS
