# Bitwarden (Vaultwarden) – Docker Deployment

## Objectif
Déployer un gestionnaire de mots de passe sécurisé via Docker Compose,
dans le cadre d’une migration de secrets on-prem vers le cloud.

## Architecture
- Vaultwarden (Bitwarden compatible)
- Docker Engine
- Volumes persistants

## Lancement
```bash
docker compose --env-file env/bitwarden.env up -d