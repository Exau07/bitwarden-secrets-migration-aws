# Automation – Terraform Project Structure

## Objectif
Ce dossier contient des scripts permettant d’automatiser la création
de la structure Terraform modulaire utilisée dans ce projet.

L’objectif est de :
- garantir une structure cohérente
- éviter les erreurs de nommage
- accélérer l’initialisation de nouveaux environnements
- standardiser les pratiques Infrastructure as Code

## Script principal
### `create-terraform-structure.ps1`

Ce script :
- crée l’arborescence Terraform modulaire
- génère les dossiers nécessaires (modules, envs)
- prépare le projet pour une utilisation immédiate avec Git

## Utilisation

Depuis la racine du projet :

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\create-terraform-structure.ps1
