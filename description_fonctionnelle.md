# Description fonctionnelle

## Objectif
Cette base de données permet de gérer les bars, les bières proposées,
leurs prix et leur localisation par quartier.

## Entités principales

### Bars
Représente les bars de la ville.
Chaque bar possède un nom, une adresse et appartient à un quartier.

### Bières
Représente les différentes bières disponibles.
Chaque bière est définie par un nom, un type, un degré d’alcool et une catégorie.

### Prix
Permet d’indiquer le prix d’une bière dans un bar donné.
Un même bar peut proposer plusieurs bières à des prix différents.

### Quartiers
Représente les quartiers de la ville.
Un quartier peut contenir plusieurs bars.

## Relations
- Un bar appartient à un seul quartier
- Un quartier peut contenir plusieurs bars
- Un bar peut proposer plusieurs bières
- Une bière peut être vendue dans plusieurs bars
- Le prix dépend à la fois du bar et de la bière

## Règles métier
- Un prix est exprimé en euros avec deux décimales
- Un bar ne peut pas exister sans quartier
- Une bière peut exister sans être encore vendue
