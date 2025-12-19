# Sécurisation HTTPS et Reverse Proxy

Ce document décrit la mise en place d’une couche de sécurité HTTPS
via un reverse proxy Nginx afin de sécuriser l’accès à l’application
Bitwarden (Vaultwarden).

---

## Contexte

Bitwarden est un gestionnaire de mots de passe exposant une interface web
contenant des données sensibles. Une exposition en HTTP non chiffré
constitue un risque critique.

L’objectif est donc :
- de chiffrer les communications
- de limiter l’exposition directe de l’application
- de préparer une architecture évolutive

---

## Choix du reverse proxy

### Choix
Nginx

### Justification
- Léger et performant
- Très largement utilisé en entreprise
- Facile à configurer
- Compatible Docker
- Excellente intégration avec Let’s Encrypt

### Alternatives envisagées
- Traefik
- HAProxy
- AWS Application Load Balancer

---

## Architecture cible


Client (navigateur)
|
HTTPS (443)
|
Reverse Proxy (Nginx)
|
Application Bitwarden


---

## Mise en œuvre

- Déploiement de Nginx via Docker
- Exposition des ports 80 et 443
- Redirection du trafic HTTP vers HTTPS
- Bitwarden accessible uniquement via le proxy

---

## Certificats TLS

### Choix
Let’s Encrypt (Certbot)

### Justification
- Gratuit
- Automatisable
- Largement adopté
- Suffisant pour un environnement professionnel standard

---

## Bénéfices sécurité

- Chiffrement des communications
- Réduction du risque d’attaque Man-in-the-Middle
- Isolation de l’application
- Préparation à l’ajout d’authentification renforcée

---

## Vision d’évolution

- Ajout HSTS
- Reverse proxy derrière un Load Balancer
- Gestion automatique du renouvellement des certificats
- Migration vers une solution managée si nécessaire

---

## Conclusion

La mise en place d’un reverse proxy HTTPS constitue une étape essentielle
dans la sécurisation d’un service manipulant des secrets sensibles.