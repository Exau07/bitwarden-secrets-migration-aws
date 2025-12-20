# Tests et validation

Ce document décrit les tests réalisés afin de valider le bon
fonctionnement de l’infrastructure et du déploiement applicatif.

---

## Tests Terraform

### Tests statiques
- `terraform fmt -recursive`
- `terraform validate`

Objectif :
- vérifier la syntaxe
- garantir la cohérence des modules

---

### Tests de planification
- `terraform plan`

Objectif :
- vérifier les ressources créées
- éviter toute suppression involontaire
- valider les dépendances entre modules

---

### Tests de déploiement (sandbox)
- `terraform apply` exécuté sur un compte AWS de test

Résultats :
- VPC et subnets créés
- Security Groups appliqués
- Instance EC2 démarrée
- IAM Role attaché sans clés statiques

---

## Tests Docker

### Lancement des services
- `docker compose up -d`

Résultats :
- Conteneur Vaultwarden démarré
- Volume persistant créé
- Service accessible via navigateur

---

### Vérifications post-déploiement
- `docker ps`
- `docker logs vaultwarden`

Objectif :
- vérifier la stabilité
- détecter d’éventuelles erreurs

---

## Tests de sécurité

- Vérification de l’absence de secrets dans le code
- Utilisation exclusive d’IAM Role pour l’accès AWS
- Accès réseau restreint via Security Groups

---

## Conclusion

Les tests réalisés confirment :
- la validité de l’infrastructure Terraform
- le bon fonctionnement du déploiement Docker
- la conformité aux bonnes pratiques de sécurité

Ces validations constituent une base solide avant
l’industrialisation via CI/CD.