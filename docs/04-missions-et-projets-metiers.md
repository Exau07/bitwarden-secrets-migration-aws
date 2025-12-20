# Missions et projets métier

Ce document présente les missions techniques et les projets réalisés
dans le cadre d’un scénario réaliste d’entreprise autour de la gestion
sécurisée des secrets et de la migration vers le cloud.

---

## Projet 1 – Migration sécurisée des secrets vers Bitwarden Cloud

### Contexte métier
Une entreprise souhaite moderniser la gestion de ses mots de passe
et secrets techniques, historiquement stockés de manière dispersée
(fichiers locaux, gestionnaires on-prem, accès manuels).

Les objectifs sont :
- renforcer la sécurité des accès
- centraliser les secrets
- faciliter l’intégration cloud
- améliorer l’expérience utilisateur et les processus DevOps

---

### Problématiques rencontrées
- Absence de gestion centralisée des secrets
- Risques de fuite de mots de passe
- Manque de traçabilité et de contrôle des accès
- Déploiements manuels non reproductibles
- Faible intégration avec les outils cloud modernes

---

### Solution proposée
La solution repose sur :
- une infrastructure cloud modulaire et sécurisée (AWS)
- l’usage de Terraform pour l’infrastructure as code
- le déploiement de Bitwarden (Vaultwarden) via Docker
- une approche progressive, sans Kubernetes dans un premier temps

---

### Missions réalisées

#### Conception et architecture
- Analyse des besoins sécurité et métier
- Conception d’une architecture cible cloud
- Découpage en modules Terraform (network, security, compute)

#### Infrastructure & sécurité
- Déploiement d’un VPC et sous-réseaux dédiés
- Mise en place de groupes de sécurité restrictifs
- Création d’un IAM Role EC2 sans clés statiques
- Application du principe du moindre privilège (IAM)

#### Déploiement applicatif
- Installation et configuration de Docker sur EC2
- Déploiement de Bitwarden (Vaultwarden) via Docker Compose
- Gestion des volumes persistants
- Séparation du code et des secrets via variables d’environnement

#### DevOps & collaboration
- Gestion du code via Git et GitHub
- Travail par branches (infra / feat / chore)
- Pull Requests documentées et tracées
- Documentation technique et métier

---

### Journée type (exemple)

- Revue des besoins sécurité et des incidents
- Analyse ou évolution de l’infrastructure Terraform
- Tests de déploiement et validation des changements
- Déploiement ou mise à jour de services Docker
- Documentation et support aux équipes techniques
- Participation aux revues de code et Pull Requests

---

### Compétences mobilisées

#### Cloud & Infrastructure
- AWS (EC2, VPC, IAM)
- Terraform (modulaire, bonnes pratiques)

#### DevOps
- Docker / Docker Compose
- Git / GitHub (branches, PR, reviews)
- Infrastructure as Code

#### Sécurité
- Gestion des secrets
- IAM et least privilege
- Sécurisation des accès et des déploiements

---

### Évolutions envisagées
- Intégration avec AWS Secrets Manager
- Mise en place du HTTPS (reverse proxy)
- Ajout d’un pipeline CI/CD
- Migration progressive vers Kubernetes
- Support SSO / SCIM pour organisations