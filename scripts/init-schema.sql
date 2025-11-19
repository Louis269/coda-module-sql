-- =========================================
-- Script d'initialisation du schéma
-- Base de données : codaSchool
-- Schéma : student
-- =========================================

-- Création du schéma student
CREATE SCHEMA IF NOT EXISTS student;

-- Utilisation du schéma student
SET search_path TO student;

-- =========================================
-- Table Etablissement
-- =========================================
CREATE TABLE student.etablissement (
    id_etablissement SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse TEXT NOT NULL
);

-- =========================================
-- Table Etudiant
-- =========================================
CREATE TABLE student.etudiant (
    id_etudiant SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_naissance DATE NOT NULL,
    id_etablissement INT NOT NULL,
    FOREIGN KEY (id_etablissement) REFERENCES student.etablissement(id_etablissement)
);

-- =========================================
-- Table Cours
-- =========================================
CREATE TABLE student.cours (
    id_cours SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    categorie VARCHAR(100) NOT NULL
);

-- =========================================
-- Table Inscription (relation N..N entre Etudiant et Cours)
-- =========================================
CREATE TABLE student.inscription (
    id_inscription SERIAL PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_cours INT NOT NULL,
    date_inscription DATE NOT NULL DEFAULT NOW(),

    FOREIGN KEY (id_etudiant) REFERENCES student.etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES student.cours(id_cours),

    -- Un étudiant ne peut s'inscrire qu'une seule fois à un cours
    UNIQUE (id_etudiant, id_cours)
);

-- =========================================
-- Table Note (relation 0..N entre Etudiant et Cours)
-- =========================================
CREATE TABLE student.note (
    id_note SERIAL PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_cours INT NOT NULL,
    valeur NUMERIC(5,2) NOT NULL CHECK (valeur >= 0 AND valeur <= 20),
    date_note DATE NOT NULL DEFAULT NOW(),

    FOREIGN KEY (id_etudiant) REFERENCES student.etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES student.cours(id_cours)
);
