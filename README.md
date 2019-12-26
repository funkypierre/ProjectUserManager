# README

Les groupes sont définis par les rôles de la gem Rolify

Les groupes et permissions sont :
* Admin :
Peut tout faire

* Employé :
Peut lire et créer des projets et contacts. Modifier et supprimer des projets et contacts SI il est celui qui les a crée

* Visiteur :
Peut lire les projets

Les permissions sont gérées grâce à CanCanCan, elles sont définies dans le model ability.rb

# Pour tester le projet

```
git clone
bundle install
yarn install
rails db:migrate
bundle exec rspec --format documentation
```
