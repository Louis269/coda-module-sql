# 🐘 Guide d'utilisation de pgAdmin avec Docker

Ce guide explique comment utiliser pgAdmin via Docker pour gérer votre base de données PostgreSQL.

---

## 🚀 Démarrage rapide

### 1. Lancer PostgreSQL + pgAdmin

```bash
docker-compose -f docker-compose-pgadmin.yml up -d
```

Cette commande démarre :
- PostgreSQL sur le port **5432**
- pgAdmin sur le port **5050**

### 2. Vérifier que les conteneurs sont lancés

```bash
docker-compose -f docker-compose-pgadmin.yml ps
```

Vous devriez voir deux conteneurs :
- `coda-postgres` (PostgreSQL)
- `coda-pgadmin` (pgAdmin)

---

## 🌐 Accéder à pgAdmin

### URL d'accès

Ouvrez votre navigateur et allez à :

```
http://localhost:5050
```

### Première connexion

Lors de votre première visite, connectez-vous avec :

- **Email** : `admin@coda-school.com`
- **Password** : `admin`

> 💡 **Note** : Ces identifiants sont définis dans le fichier `docker-compose-pgadmin.yml`. Vous pouvez les modifier si nécessaire.

---

## 🔗 Connecter pgAdmin à PostgreSQL

Une fois connecté à pgAdmin, vous devez ajouter votre serveur PostgreSQL.

### Étape 1 : Ajouter un nouveau serveur

1. Dans le panneau de gauche, faites un **clic droit** sur "Servers"
2. Sélectionnez **"Register"** → **"Server..."**

Ou cliquez sur le bouton **"Add New Server"** en haut de l'interface.

### Étape 2 : Onglet "General"

Dans l'onglet **"General"** :

- **Name** : `Coda School` (ou un nom de votre choix)

### Étape 3 : Onglet "Connection"

Dans l'onglet **"Connection"**, remplissez les champs suivants :

| Champ | Valeur | Explication |
|-------|--------|-------------|
| **Host name/address** | `postgres` | ⚠️ **Important** : Utilisez `postgres` (nom du service Docker), **PAS** `localhost` |
| **Port** | `5432` | Port par défaut de PostgreSQL |
| **Maintenance database** | `codaSchool` | Nom de la base de données |
| **Username** | `codaSchoolUser` | Utilisateur PostgreSQL |
| **Password** | `verySecretAndSecurePassword` | Mot de passe PostgreSQL |
| **Save password** | ✅ Cochez | Pour ne pas avoir à ressaisir le mot de passe |

> ⚠️ **Important** : 
> - Utilisez `postgres` comme host (pas `localhost`) car pgAdmin et PostgreSQL communiquent via le réseau Docker interne
> - Si vous utilisez `localhost`, la connexion échouera

### Étape 4 : Sauvegarder

Cliquez sur **"Save"** en bas de la fenêtre.

---

## ✅ Vérifier la connexion

Si tout s'est bien passé, vous devriez voir :

1. Dans le panneau de gauche, un nouveau serveur **"Coda School"** apparaît
2. En cliquant dessus, vous pouvez explorer :
   - **Databases** → `codaSchool`
   - **Schemas** → `student`
   - **Tables** → `etudiant`, `cours`, `inscription`, `note`, `etablissement`

---

## 📊 Utiliser pgAdmin

### Exécuter une requête SQL

1. Cliquez sur votre serveur **"Coda School"**
2. Naviguez : `Databases` → `codaSchool` → `Schemas` → `student`
3. Faites un **clic droit** sur `student` → **"Query Tool"**
4. Tapez votre requête SQL dans l'éditeur
5. Cliquez sur **"Execute"** (ou `F5`)

### Exemple de requête

```sql
SET search_path TO student;

SELECT * FROM etudiant LIMIT 10;
```

### Voir les données d'une table

1. Naviguez : `Databases` → `codaSchool` → `Schemas` → `student` → `Tables`
2. Faites un **clic droit** sur une table (ex: `etudiant`)
3. Sélectionnez **"View/Edit Data"** → **"First 100 Rows"**

---

## 🛠️ Commandes utiles

### Arrêter les conteneurs

```bash
docker-compose -f docker-compose-pgadmin.yml down
```

### Redémarrer les conteneurs

```bash
docker-compose -f docker-compose-pgadmin.yml restart
```

### Voir les logs de pgAdmin

```bash
docker-compose -f docker-compose-pgadmin.yml logs pgadmin
```

### Voir les logs en temps réel

```bash
docker-compose -f docker-compose-pgadmin.yml logs -f pgadmin
```

---

## 🔧 Dépannage

### pgAdmin ne démarre pas

1. Vérifiez que le port 5050 n'est pas déjà utilisé :
   ```bash
   lsof -i :5050
   ```
   Si un processus utilise le port, arrêtez-le ou changez le port dans `docker-compose-pgadmin.yml`

2. Vérifiez les logs :
   ```bash
   docker-compose -f docker-compose-pgadmin.yml logs pgadmin
   ```

### Impossible de se connecter à PostgreSQL depuis pgAdmin

**Erreur** : "Unable to connect to server"

**Solutions** :

1. Vérifiez que vous utilisez `postgres` comme host (pas `localhost`)
2. Vérifiez que PostgreSQL est bien démarré :
   ```bash
   docker-compose -f docker-compose-pgadmin.yml ps
   ```
3. Vérifiez que les deux conteneurs sont sur le même réseau :
   ```bash
   docker network inspect coda-module-sql_coda-network
   ```

### Mot de passe oublié pour pgAdmin

Les identifiants par défaut sont :
- Email : `admin@coda-school.com`
- Password : `admin`

Si vous avez modifié le mot de passe et l'avez oublié, vous pouvez réinitialiser en supprimant le volume :

```bash
docker-compose -f docker-compose-pgadmin.yml down -v
docker-compose -f docker-compose-pgadmin.yml up -d
```

⚠️ **Attention** : Cela supprimera toutes vos configurations pgAdmin (serveurs enregistrés, etc.)

---

## 🔐 Sécurité

### Changer les identifiants par défaut

Pour des raisons de sécurité, modifiez les identifiants dans `docker-compose-pgadmin.yml` :

```yaml
environment:
  PGADMIN_DEFAULT_EMAIL: votre-email@exemple.com
  PGADMIN_DEFAULT_PASSWORD: votre-mot-de-passe-securise
```

Puis redémarrez :

```bash
docker-compose -f docker-compose-pgadmin.yml down
docker-compose -f docker-compose-pgadmin.yml up -d
```

---

## 📚 Ressources

- [Documentation officielle pgAdmin](https://www.pgadmin.org/docs/)
- [Documentation Docker pgAdmin](https://hub.docker.com/r/dpage/pgadmin4/)

---

## 💡 Astuces

### Sauvegarder vos requêtes

pgAdmin permet de sauvegarder vos requêtes favorites :
1. Dans le Query Tool, tapez votre requête
2. Cliquez sur **"Save"** (icône disquette)
3. Donnez un nom à votre requête

### Exporter les résultats

1. Exécutez votre requête
2. Dans les résultats, cliquez sur **"Download"** (icône téléchargement)
3. Choisissez le format (CSV, JSON, etc.)

### Historique des requêtes

pgAdmin garde un historique de vos requêtes :
- Menu **"Tools"** → **"Query History"**

---

## 🆘 Besoin d'aide ?

Si vous rencontrez des problèmes :

1. Consultez les logs : `docker-compose -f docker-compose-pgadmin.yml logs`
2. Vérifiez que les conteneurs sont bien démarrés : `docker-compose -f docker-compose-pgadmin.yml ps`
3. En cas de problème persistant, utilisez le `docker-compose.yml` simple (sans pgAdmin) et installez un client externe

---

**Bon travail avec pgAdmin ! 🚀**

