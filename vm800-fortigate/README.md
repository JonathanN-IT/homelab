# VM800 — FortiGate

Pare-feu virtuel Fortinet déployé sous Proxmox VE.

## Informations système

| Champ | Valeur |
|-------|--------|
| **OS** | FortiOS 8.0 (Fortinet) |
| **Plateforme** | FortiGate VM (KVM/Proxmox) |
| **Licence** | *à compléter* |

## Accès

| Méthode | Détail |
|---------|--------|
| **SSH** | Via Guacamole → connexion "FortiGate" |
| **Interface Web** | Via interface FortiOS (port 443) |

## Rôle dans l'infrastructure

Pare-feu virtuel intégré au homelab Proxmox pour :
- Filtrage de trafic réseau
- Inspection des paquets (IPS/IDS)
- Gestion des politiques de sécurité

## Commandes utiles

```bash
# Statut système
get system status

# Interfaces réseau
get system interface

# Politiques firewall actives
show firewall policy

# Sessions actives
get system session list
```

## TODO

- [ ] Compléter le type de licence
- [ ] Documenter les interfaces et politiques configurées
- [ ] Documenter l'intégration réseau avec le reste du homelab
