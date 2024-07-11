
# NCC Industrie - Bureau d'Études Nucléaire

## Description

Bienvenue dans le dépôt du site web pour le bureau d'études NCC. Ce site est construit avec le framework Ruby on Rails et utilise Stimulus pour la partie JavaScript. Il inclut également un blog pour gérer les actualités du bureau ainsi que les offres d'emploi, grâce à la gem Devise pour la gestion des utilisateurs.

## Fonctionnalités

- **Gestion des actualités** : Publiez et gérez les actualités du bureau.
- **Offres d'emploi** : Publiez et gérez les offres d'emploi.
- **Authentification** : Gestion des utilisateurs avec la gem Devise.
- **Interactivité** : Utilisation de Stimulus pour des fonctionnalités JavaScript réactives.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- [Ruby](https://www.ruby-lang.org/fr/)
- [Rails](https://rubyonrails.org/)
- [Bundler](https://bundler.io/)

## Installation

1. Clonez le dépôt :
   ```sh
   git clone https://github.com/votre-utilisateur/bureau-etudes-nucleaire.git
   cd bureau-etudes-nucleaire
   ```

2. Installez les dépendances :
   ```sh
   bundle install
   ```

3. Configurez la base de données :
   ```sh
   rails db:setup
   ```

4. Démarrez le serveur :
   ```sh
   rails server
   ```

5. Visitez [http://localhost:3000](http://localhost:3000) dans votre navigateur.

## Utilisation

### Gestion des actualités et des offres d'emploi

Pour ajouter ou modifier des actualités et des offres d'emploi, connectez-vous en tant qu'administrateur et utilisez l'interface d'administration fournie.

### Stimulus

J'utilise Stimulus pour améliorer l'interactivité sur le site. Les contrôleurs Stimulus sont situés dans le dossier `app/javascript/controllers`.
