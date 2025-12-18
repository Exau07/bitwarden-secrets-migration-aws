# Architecture existante (avant migration)

## Description
L’architecture actuelle repose sur un stockage local des secrets.

## Composants
- Postes utilisateurs (Windows / Linux)
- Fichiers KeePass (.kdbx)
- Partages réseau non sécurisés

## Flux
1. Les utilisateurs accèdent aux fichiers KeePass localement
2. Les mots de passe sont partagés manuellement
3. Aucune authentification forte ou journalisation

## Limites
- Architecture non scalable
- Forte dépendance aux utilisateurs
- Sécurité non homogène
