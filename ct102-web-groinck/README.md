# CT102 — Hébergement Web (Groinck)

Site WordPress hébergé derrière Nginx Proxy Manager (CT101).

## Stack

- **WordPress** + **MariaDB**
- **Nginx**, **PHP 8.3-FPM**, **Redis** (cache objet)

## Choix techniques

- **Redis** : cache objet WordPress pour réduire les requêtes base de données et améliorer les temps de réponse
- **PHP 8.3-FPM** : gestion des processus PHP en mode FastCGI pour de meilleures performances sous charge
- **MariaDB** : base de données dédiée isolée du reste de l'infrastructure
