# Architecture cible – AWS

## Objectifs
- Centraliser la gestion des secrets
- Renforcer la sécurité
- Améliorer la traçabilité
- Préparer une migration Cloud complète

## Vue d’ensemble
La solution cible repose sur le déploiement de Bitwarden self-hosted
dans une infrastructure AWS sécurisée.

## Composants principaux
- VPC dédiée
- EC2 hébergeant Bitwarden (Docker)
- RDS PostgreSQL (subnets privés)
- IAM Roles
- AWS KMS pour le chiffrement
- Accès HTTPS sécurisé

## Sécurité
- Chiffrement des données au repos et en transit
- Accès restreint par Security Groups
- Pas d’accès public à la base de données
- MFA pour les utilisateurs Bitwarden

## Évolutivité
Cette architecture est conçue pour être facilement déclinée
vers Azure et GCP via des modules Terraform réutilisables.
