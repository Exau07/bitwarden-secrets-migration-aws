# 🔐 Migration et sécurisation de la gestion des secrets – Bitwarden sur AWS

## 🎯 Objectif du projet

Ce repository présente un ensemble de projets Cloud / DevOps / Sécurité
autour de la migration, du déploiement et de la sécurisation d’un
gestionnaire de mots de passe en environnement cloud.

L’objectif est de démontrer :
- une approche réaliste d’entreprise
- une maîtrise des bonnes pratiques sécurité
- une capacité de conception, d’implémentation et de documentation

---

## 🏢 Contexte entreprise

PME (~200 employés) confrontée aux problématiques suivantes :
- secrets stockés localement (KeePass)
- partage manuel des mots de passe
- absence de traçabilité et de MFA
- dépendance aux postes utilisateurs

---

## ❌ Problèmes identifiés

- Risque élevé de fuite de secrets
- Absence de gouvernance des accès
- Pas de journalisation
- Faible niveau de sécurité global

---

## ✅ Approche et solution globale

Le projet est structuré autour de **plusieurs axes complémentaires** :

### 1️⃣ Infrastructure Cloud sécurisée
- Déploiement d’une infrastructure AWS via Terraform
- Architecture modulaire (network, security, compute)
- IAM sans clés statiques (least privilege)

### 2️⃣ Déploiement applicatif
- Bitwarden (Vaultwarden) auto-hébergé
- Conteneurisation Docker
- Volumes persistants

### 3️⃣ Sécurisation des accès
- Reverse proxy Nginx
- HTTPS via Let’s Encrypt
- Isolation réseau et contrôle des flux

### 4️⃣ Migration des secrets
- Scénario de migration KeePass → Bitwarden
- Import contrôlé
- Validation post-migration
- Suppression sécurisée de l’existant

### 5️⃣ Vision entreprise
- Support SSO / SCIM (évolution)
- Migration possible vers Bitwarden Cloud
- Industrialisation CI/CD
- Duplicabilité Azure / GCP

---

## ☁️ Cloud cible

- AWS (implémentation principale)
- Architecture duplicable vers Azure et GCP

---

## 🛠️ Technologies utilisées

- AWS (EC2, IAM, VPC, Security Groups)
- Terraform (modulaire)
- Docker / Docker Compose
- Nginx (reverse proxy)
- Bitwarden / Vaultwarden
- GitHub Actions (prévu)

---

## 📚 Documentation

Toute la documentation détaillée est disponible dans le dossier `/docs` :

- Contexte métier
- Analyse des risques
- Architectures
- Choix technologiques
- Missions et projets
- Tests et validation
- Sécurisation HTTPS
- Migration des secrets

---

## 🚧 Évolutions prévues

- HTTPS avancé (HSTS, hardening)
- AWS Secrets Manager
- CI/CD Terraform & Docker
- Kubernetes (optionnel)
- Déclinaison Azure et GCP

---

## 🧠 Positionnement du projet

Ce projet se veut :
- pédagogique
- réaliste
- aligné avec des missions professionnelles Cloud / DevOps / Sécurité