# Med-IA – Assistant IA pour médecins généralistes

Med-IA aide le médecin généraliste à aller plus vite du symptôme au bon spécialiste : il décrit les symptômes de son patient, l'IA propose trois pistes de diagnostic avec la spécialité concernée, et le médecin peut orienter le patient vers un confrère et échanger avec lui directement dans l'application.

Projet final du bootcamp **Le Wagon Paris** (titre RNCP niveau 6 « Concepteur Développeur Web & Automation IA »), réalisé en équipe de 4 et présenté devant un jury en avril 2025.

> L'application était déployée sur Heroku pour la soutenance et n'est plus en ligne. Voir « Lancer le projet en local ».

## Aperçu

<img width="2959" height="1266" alt="Aperçu de Med-IA : accueil, saisie des symptômes, diagnostics proposés, échanges entre médecins et messagerie" src="https://github.com/user-attachments/assets/8fabdc8b-b5f9-4414-bc8b-28a2dcfc085a" />


*Captures réalisées en local avec les données de démonstration du projet ; les textes des diagnostics et des messages sont des exemples.*

## Parcours utilisateur

1. Le médecin se connecte et choisit une consultation de la journée.
2. Il décrit les symptômes du patient en texte libre.
3. Med-IA (API OpenAI, modèle GPT-4o-mini) renvoie **trois diagnostics possibles**, chacun rattaché à une spécialité (dermatologie, neurologie, urologie…), ou suggère une autre spécialité si aucune ne correspond.
4. Le médecin retient un diagnostic et, si besoin, **oriente le patient vers un spécialiste** de l'annuaire.
5. Les deux médecins **échangent dans une messagerie dédiée** au dossier ; le médecin retrouve aussi la **fiche de chaque patient**.

L'IA est un outil d'aide : la décision médicale reste toujours celle du médecin.

## Fonctionnalités

- Authentification des médecins (Devise), avec spécialité et adresse de cabinet
- Liste des consultations du jour
- Diagnostic assisté par IA, avec un prompt qui impose une réponse structurée en JSON
- Orientation vers un spécialiste et suivi du statut de l'orientation
- Messagerie entre médecins par orientation
- Dossiers patients
- Interface pensée pour le mobile (PWA)

## Stack technique

Ruby on Rails 7.1 · PostgreSQL · Hotwire (Turbo, Stimulus) · Bootstrap 5 · Devise · ruby-openai (GPT-4o-mini) · Heroku

## Organisation de l'équipe

Projet mené en **méthode Scrum** sur environ deux semaines :

- user stories et découpage des tâches en début de sprint ;
- **daily meetings** pour suivre l'avancement de chacun et débloquer les points difficiles ;
- maquettes réalisées sur **Figma** avant le développement ;
- fonctionnalités arbitrées entre le back-end et le reste de l'équipe : avec un délai court, nous avons préféré une application stable à des fonctionnalités de dernière minute.

| Membre | Rôle |
| --- | --- |
| Álvaro Castillo ([@vancastle](https://github.com/vancastle)) | Chef de projet (initialisation du projet, user stories, sprints, daily meetings), maquettes Figma, front-end (messagerie, liste des spécialistes, PWA mobile, page d'accueil), contenus de l'interface, priorisation des fonctionnalités avec le back-end, présentation devant le jury |
| Erwann Defoy | Back-end : authentification des médecins (Devise), routes et contrôleurs, données de démonstration, intégration de l'API OpenAI et traitement de ses réponses, messagerie entre médecins (back et affichage) |
| Victoire Berthet-Bondet | Maquettes Figma, typographie et couleurs de l'application, front-end du parcours de diagnostic, de l'orientation vers un spécialiste et de la liste des patients, mise en place de la PWA |
| Marc Plagnes | Modèles de données et leurs associations, fonctionnalité d'orientation vers un spécialiste (back et front), front-end de la page d'accueil, de la barre de navigation et des cartes, pages d'erreur |

## Lancer le projet en local

Prérequis : Ruby 3.3, PostgreSQL et une clé API OpenAI.

```bash
git clone https://github.com/vancastle/MEDIA.git
cd MEDIA
bundle install
echo "OPENAI_ACCESS_TOKEN=votre_cle" > .env
rails db:create db:migrate db:seed
rails server
```

Puis ouvrir http://localhost:3000. Les données de démonstration (médecins, patients, consultations) viennent de `db/seeds.rb`.

---

Application générée avec [lewagon/rails-templates](https://github.com/lewagon/rails-templates), créé par l'équipe du [Le Wagon coding bootcamp](https://www.lewagon.com).
