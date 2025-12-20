# Choix technologiques et justifications

Ce document présente les choix technologiques effectués dans le cadre
du projet de migration sécurisée des secrets vers le cloud.
Chaque décision est expliquée afin de démontrer une capacité de recul,
de conseil et d’adaptation aux contraintes réelles d’entreprise.

---

## Cloud Provider – AWS

### Choix
Amazon Web Services (AWS)

### Justification
- Large adoption en entreprise
- Services de sécurité matures (IAM, Security Groups, Secrets Manager)
- Intégration native avec Terraform
- Documentation et écosystème riches

### Alternatives envisagées
- Microsoft Azure
- Google Cloud Platform

L’architecture est volontairement modulaire afin de permettre
une duplication future sur d’autres fournisseurs cloud.

---

## Infrastructure as Code – Terraform

### Choix
Terraform avec une approche modulaire

### Justification
- Standard de facto en entreprise
- Support multi-cloud
- Traçabilité et reproductibilité
- Séparation claire des responsabilités (network, security, compute)

### Alternatives envisagées
- AWS CloudFormation
- Pulumi

---

## Type de serveur – EC2 (VM)

### Choix
Instance EC2 (Amazon Elastic Compute Cloud)

### Justification
- Contrôle total du système (OS, réseau, firewall)
- Compatibilité native avec Docker
- Approche pédagogique et réaliste pour des environnements hybrides
- Facilité de debug et d’évolution

### Alternatives envisagées
- AWS ECS
- AWS Fargate
- Solutions serverless (non adaptées ici)

---

## Pourquoi EC2 + Docker et non AWS Lambda ?

Bien que AWS Lambda permette l’exécution de conteneurs, ce service est
principalement conçu pour des workloads événementiels, stateless et
de courte durée.

Bitwarden (Vaultwarden) est une application :
- long-running
- stateful
- exposant un service web permanent
- nécessitant un stockage persistant

L’utilisation de Lambda dans ce contexte présenterait plusieurs limites :
- durée maximale d’exécution
- absence de stockage persistant fiable
- inadéquation avec un modèle serveur web classique

Le choix d’une instance EC2 avec Docker permet :
- un contrôle complet de l’environnement
- la persistance des données
- une exposition réseau standard (HTTP/HTTPS)
- une transition facilitée vers des solutions d’orchestration futures
  (ECS ou Kubernetes)

---

## Type d’instance EC2

### Choix
Instances de type `t3.micro` / `t3.small`

### Justification
- Coût réduit (compatible Free Tier)
- Ressources suffisantes pour une charge modérée
- Facilité de redimensionnement

### Vision d’évolution
- Auto Scaling Group
- Instances plus performantes selon la charge réelle

---

## Système d’exploitation

### Choix
Amazon Linux 2023

### Justification
- Maintenu et sécurisé par AWS
- Optimisé pour EC2
- Support long terme
- Bon compromis sécurité / performance

### Alternatives envisagées
- Ubuntu Server
- Debian

---

## Conteneurisation – Docker

### Choix
Docker et Docker Compose

### Justification
- Simplicité de mise en œuvre
- Faible courbe d’apprentissage
- Suffisant pour un premier niveau de microservices
- Large adoption en entreprise

### Alternatives envisagées
- Podman
- Kubernetes (non retenu à ce stade)

---

## Orchestration – Kubernetes (reporté)

### Choix
Non implémenté dans la première phase

### Justification
- Complexité non nécessaire pour le besoin initial
- Surcoût opérationnel
- Priorité donnée à la sécurité et à la stabilité

Kubernetes est envisagé comme une évolution naturelle ultérieure.

---

## Gestion des secrets – Bitwarden / Vaultwarden

### Choix
Bitwarden auto-hébergé via Vaultwarden

### Justification
- Solution open-source mature et largement adoptée
- Compatible avec l’écosystème Bitwarden
- Léger et adapté aux environnements Docker
- Intégration possible avec SSO / SCIM

### Alternatives envisagées
- KeePass
- HashiCorp Vault
- Solutions SaaS propriétaires

---

## Base de données

### Choix initial
Base embarquée SQLite (via Vaultwarden)

### Justification
- Simplicité de déploiement
- Faible charge initiale
- Suffisant pour un POC ou petite équipe

### Limites connues
- Scalabilité
- Haute disponibilité

### Évolutions prévues
- PostgreSQL
- AWS RDS / Aurora

---

## Stockage

### Choix
Volumes Docker persistants

### Justification
- Séparation des données et des conteneurs
- Persistance des secrets
- Facilité de sauvegarde et de restauration

### Évolutions possibles
- Volumes EBS dédiés
- Chiffrement renforcé
- Sauvegardes automatisées

---

## Réseau et sécurité

### Choix
- VPC dédié
- Subnet public (phase initiale)
- Security Groups restrictifs
- IAM Roles sans clés statiques

### Justification
- Réduction de la surface d’attaque
- Contrôle précis des flux réseau
- Conformité aux bonnes pratiques cloud

---

## CI/CD (prévu)

### Choix
GitHub Actions

### Justification
- Intégration native avec GitHub
- Simplicité de configuration
- Suffisant pour Terraform et Docker

### Alternatives envisagées
- GitLab CI
- Jenkins (on-prem)

---

## Vision d’évolution

- Intégration AWS Secrets Manager
- Mise en place HTTPS (reverse proxy)
- Ajout d’un pipeline CI/CD
- Migration progressive vers Kubernetes
- Support SSO / SCIM pour organisations

---

## Conclusion

Les choix technologiques réalisés visent un équilibre entre :
- sécurité
- simplicité
- maintenabilité
- évolutivité

Ils reflètent une approche pragmatique, progressive et réaliste,
alignée avec les contraintes rencontrées en environnement professionnel.