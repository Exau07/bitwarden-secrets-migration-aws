# 🔐 Migration de gestion des secrets – KeePass vers Bitwarden (AWS)

## 🎯 Objectif
Ce projet présente un scénario réaliste de migration d’une gestion de mots de passe
locale et non sécurisée vers une solution Cloud sécurisée et auditable.

Le projet couvre :
- l’analyse de l’existant
- la conception de l’architecture cible
- la migration progressive
- les aspects sécurité et conformité

## 🏢 Contexte entreprise
PME (~200 employés) avec :
- mots de passe stockés dans des fichiers KeePass locaux
- partage manuel des secrets
- aucune traçabilité ni MFA

## ❌ Problèmes identifiés
- risque de fuite de secrets
- absence de contrôle d’accès centralisé
- pas de journalisation
- dépendance aux postes utilisateurs

## ✅ Solution proposée
1. Déploiement de Bitwarden self-hosted sur AWS
2. Migration automatisée depuis KeePass
3. Mise en place de contrôles de sécurité (MFA, RBAC)
4. Migration finale vers Bitwarden Cloud
5. Suppression sécurisée de l’existant

## ☁️ Cloud cible
- AWS (implémentation principale)
- Architecture duplicable vers Azure et GCP

## 🛠️ Technologies
- AWS (EC2, RDS, KMS, IAM)
- Docker / Docker Compose
- Terraform
- GitHub Actions
- Bitwarden

## 📚 Documentation
Voir le dossier `/docs` pour les détails d’architecture, sécurité et migration.

## 🚧 Évolutions prévues
- Déclinaison Azure et GCP
- Intégration SSO
- Monitoring et alerting
