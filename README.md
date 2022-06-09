# MSE_BDA_2022

# But

Dans le cadre du cours de BIG DATA ANALYSIS (BDA), nous devons réaliser un projet d'analyse sur un dataset. Les outils utilisés seront Apache Spark et Scala. Nous avons choisi de réaliser un topique du livre Advanced Analytics with Spark de Oreilly.
Nous avons pris "**Recommending Music and the Audioscrobbler Data Set**". Il s'agit d'une analyse de collaborative filtering sur un dataset d'écoute de musique par utilisateurs. Dans le projet de base, les données sont traitées puis elles permettent d'entraîner un modèle ALS (Alternating Least Squares). Ce modèle permet de trouver des suggestions de contenu pour un utilisateur donné.

# Description du Dataset

Les données proviennent d'un ancien système de recommendation de musique appelé Audioscrobbler. Il était proposé par last.fm, un des premiers sites de streaing de music. L'idée était que les utilisateurs ajoutaient le plugin à leur lecteur. Celui-ci analyse les écoutes faites par les utilisateurs de la manière suivante:
Un utilisateur X à écouter l'artiste Y.
Ceci est très sommaire car nous n'avons pas d'autres informations sur la musique, le genre, etc...
Mais il a été très populaire car il pouvait être ajouter à des application tierce facilement.
Un point à noter est que les données étaient envoyées par l'utilisateur. C.à.d que chaque utilisateur X propose le nom de l'artiste Y. Donc un utilisateur peut orthographier un artiste de plusieurs façon par exemple: Metalica, Metallica, metalICA, etc... Il y a donc un travail de traitement des données.

Le Dataset audioscrobbler dispose de 3 fichiers contenant des données:

- artist_alias.txt

  Comme l'orthographes des artistes est parfois mal orthographié dans les données, un fichier qui lie les différentes orthographes à l'ID de l'artiste est disponibles. Ceci nous evite de devoir faire une rechercher de proximiter entre les nom des artistes.

- artist_data.txt

  Il s'agit du lien entre les noms des artistes (avec plusieurs orthographes) et un ID.

- user_artist_data.txt

  Ce fichier correspond au lien entre un utilisateur (catégorisé par un ID), un artiste et le nombre de fois qu'il l'a écouté.

http://millionsongdataset.com/

https://www.kaggle.com/general/168181

## Description des features et du prétraitement

## Description du projet de base

## Description du Modèle

# Questions supplémentaires
Dans le cadre du projet, Nous devons aussi résoudre des problématiques choisies par nous même. Nous avons choisi d'en ajouter 3 (une par membres du groupe).

## Market basket analysis

Dans le projet de base, l'algorithme utilisé (ALS) est un algorithme de collaborative filtering qui permet de répondre à la question "**Quels sont les artistes qu'un utilisateur, avec les mêmes goûts, aime ?**".

Alors qu'une autre question pourrait être posée : "**Quels sont les artistes qui apparaissent fréquemment ensemble ?**" Cette question peut être répondue avec une analyse du panier d'achat ou règle d'association. Notre intention est donc d'utiliser cet algorithme pour voir si effectivement, il permet de répondre à cette question.

## Clustering visualisation
​
Une autre question qu'il serait interressante de poser et "**Est-ce que des clusters apparaissent entre les artistes?**" ou "**Est-ce qu'on peut distinguer les genres musicaux avec simplement les données de base ?**". Pour prouver la veracité des résultats un 2ème dataset devra être utilisé pour vérifer les clusters.

## Ratio torrent achat

Les données fournies par le dataset sont très limitées. Il serait intéressant d'extraire des features supplémentaires à partir d'un de données disponibles.
Le faite que les données de base sont mal orthographiées peut nous donner des informations. En effet, les utilisateurs d'audioscrobbler enregistrait leur propre musique donc il pouvait avoir plusieurs orthographes différentes pour le même artistes. Nous faisons l'assomption que dans une playlist d'un utilisateur, un artiste mal orthographié a sûrement été piraté, car sur une plateforme comme Itunes les artistes était correctement orthographié. En sachant cela, nous pouvons nous poser la question : "**Quelle est la proportion de piratage ?**"

# Conclusion
