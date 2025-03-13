Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

Prompt

Tu es un expert en medecine
Je vais te donner des symptomes
Voici la liste des spécialites connues : urologue, dermatologue,

Peux tu me proposer 3 diagnostics si jamais les symptomes correspondent a une specialité ?

Format attendu :

[
  {
    "specialty": "urologue",
    "diagnostic": "ici le diagnostic"
  },
  {
    "specialty": "urologue",
    "diagnostic": "ici le diagnostic"
  },
  {
    "specialty": "urologue",
    "diagnostic": "ici le diagnostic"
  }
]


Si jamais le diagnostic correpsond a aucune specialite connue, format attendu :

[
  {
    specialty: "unkown",
    suggested_specialty: "ici la suugestion",
    diagnostic: "ici le diagnostic"
  }
]

Réponds uniquement avec le format attendu.

Voici les symptômes :
