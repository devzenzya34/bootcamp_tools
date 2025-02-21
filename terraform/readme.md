Déployer une infra complète avec terraform

- écrire un module pour créer une instance ec2 
- ecrire un module pour créer un volume ebs dont la taille variablisé
- ecrire un module pour un ip publique
- ecrire un module pour créer un security group
- créer un dossier app qui va utiliser les 4 modules precedents
- deploiement: installer nginx et enregistrer l'ip public dans un fichier ip_ec2.txt


utilise aws cli pour configurer les Access Key
aws ec2 create-key-pair --key-name terraform-mini-projet --query 'KeyMaterial' --output text > terraform-mini-projet.pem && chmod 400 terraform-mini-projet.pem


terraform init
terraform fmt
terraform validate
terraform plan
terraform apply => yes