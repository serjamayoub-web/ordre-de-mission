# Ordres de mission — application de gestion

Application locale de saisie, de génération et d’archivage des **ordres de mission**
de la Direction Provinciale, conforme au formulaire officiel
*(Formulaire Direction Provinciale — Ordre de mission, Version 01)*.

Utilisable **sur le poste principal, depuis un téléphone ou depuis un autre poste**
du même réseau Wi-Fi.

---

## 1. Démarrer l’application

Double-cliquez sur :

```
Ordres de mission.bat
```

Une fenêtre applicative s’ouvre automatiquement. Aucune installation n’est
nécessaire : l’application utilise uniquement **Windows PowerShell** et
**Microsoft Edge**, déjà présents sur le poste.

| Fichier | Quand s’en servir |
|---|---|
| `Ordres de mission.bat` | Usage quotidien |
| `Creer le raccourci sur le Bureau.bat` | Une fois, pour un raccourci avec icône |
| `Autoriser l'acces reseau.bat` | Une fois, pour ouvrir l’accès aux téléphones |
| `Diagnostic.bat` | En cas de problème sur un poste |
| `Ordres de mission (console).bat` | Pour voir les messages détaillés |

Si l’application est déjà démarrée, un nouveau lancement rouvre simplement
la fenêtre au lieu de créer un second service.
Pour fermer proprement : bouton **Quitter**. Le service s’arrête aussi
automatiquement après 15 minutes sans aucune utilisation.

---

## 2. L’installer sur un autre ordinateur

1. Copiez **tout le dossier** `ordre de mission` sur le disque local du
   second poste (pas sur une clé USB en lecture seule, ni sur un lecteur réseau `\\serveur\...`).
2. Lancez **`Diagnostic.bat`**. Il vérifie en quelques secondes :
   la version de PowerShell, la présence de Microsoft Edge ou Chrome,
   les droits d’écriture, les ports disponibles, et **génère réellement un PDF de test**.
3. S’il n’indique aucun problème, lancez `Ordres de mission.bat`.

Si l’application ne démarre pas, un fichier `donnees\ERREUR.txt` s’ouvre
automatiquement dans le Bloc-notes et indique la cause.

> **Important** : chaque poste ainsi installé possède **ses propres données**.
> Pour travailler à plusieurs sur les mêmes ordres de mission, n’installez pas
> l’application deux fois : gardez un seul poste et connectez les autres
> appareils par le réseau (section suivante).

---

## 3. Utiliser depuis un téléphone ou un autre poste

L’application s’ouvre dans le navigateur de n’importe quel appareil du même réseau.

**Une seule fois, sur le poste principal :**

1. Lancez `Autoriser l'acces reseau.bat` — une demande administrateur s’affiche.
   Le script crée la règle de pare-feu (ports TCP 8765-8790) et, si votre Wi-Fi est
   déclaré **Public**, propose de le passer en **Privé** (indispensable : Windows
   refuse toute connexion entrante sur un réseau Public).
2. Relancez l’application.

**Ensuite, depuis le téléphone :**

1. Connectez-le au **même réseau Wi-Fi** que le poste principal.
2. Sur le poste, ouvrez l’onglet **Réseau** : un **QR code** et l’adresse
   (par exemple `http://192.168.1.20:8765/`) s’affichent.
3. Scannez le QR code avec l’appareil photo, ou saisissez l’adresse.
4. Dans le navigateur du téléphone : *Partager → Sur l’écran d’accueil*, pour
   retrouver l’application comme une icône.

Le poste principal doit rester allumé et l’application ouverte : c’est lui qui
conserve les données et fabrique les PDF. Depuis le téléphone, les PDF générés
peuvent être ouverts et téléchargés directement.

**Plusieurs appareils en même temps** : les données sont synchronisées toutes les
20 secondes. Si deux appareils modifient en parallèle, les modifications sont
fusionnées automatiquement, sans écrasement.

---

## 4. Créer un ordre de mission

1. Onglet **Nouvel ordre**.
2. Renseignez le **Demandeur**. Le bouton bleu **« + Ajouter un agent »**
   permet d’inscrire autant d’agents que nécessaire sur la même mission :
   chaque agent donne lieu à son propre ordre de mission A4.
   * *Copier le service* reprend Direction / Département / Division / Service /
     Province du premier agent.
   * *Au répertoire* enregistre l’agent pour les prochaines fois.
3. Renseignez l’**Objet de la mission**, le **Moyen de transport** et la
   **Signature**.
4. **Enregistrer et générer le PDF**.

L’aperçu A4 reflète en temps réel le document final (sur téléphone, bouton
**Aperçu A4**). Avec plusieurs agents, des onglets permettent de passer d’une
page à l’autre.

### Saisie automatique

* Le **répertoire des agents** complète matricule, fonction, direction,
  département, division, service et province dès que le nom est reconnu.
* Les **valeurs par défaut** (onglet *Paramètres*) pré-remplissent chaque
  nouvel ordre de mission.
* Les lieux, motifs et villes déjà utilisés sont proposés en suggestion.
* Tout agent saisi dans un ordre enregistré rejoint automatiquement le répertoire.

### Raccourcis clavier

| Raccourci  | Action              |
|------------|---------------------|
| `Ctrl + S` | Enregistrer l’ordre |
| `Ctrl + M` | Ajouter un agent    |
| `Échap`    | Fermer l’aperçu     |

---

## 5. Classement automatique des PDF

Chaque PDF est un document **A4, une page, fidèle au formulaire officiel**
(mise en page, cartouche, logo, bandeaux et encadrés d’origine conservés
au point près).

Les fichiers sont rangés automatiquement selon le **mois de la date de départ** :

```
Ordres de mission\
└── 2026\
    ├── 09 - Septembre\
    │   ├── OM-2026-09-001 - BENALI Karim.pdf
    │   └── OM-2026-09-002 - EL IDRISSI Fatima.pdf
    └── 10 - Octobre\
        └── OM-2026-10-001 - ...
```

Chaque ordre reçoit un numéro séquentiel par mois : `OM-AAAA-MM-NNN`.
Le préfixe `OM` est modifiable dans les *Paramètres*.

Par défaut, **un PDF distinct est créé par agent**. L’option
*« Regrouper tous les agents dans un seul fichier »* (Paramètres) produit
au contraire un document unique à plusieurs pages.

---

## 6. Consulter et gérer les ordres enregistrés

Onglet **Archives** :

* Regroupement automatique par **année** puis par **mois**, avec le nombre
  d’ordres et d’agents.
* Recherche libre (agent, matricule, lieu, motif, numéro) et filtres
  année / mois.
* Pour chaque ordre : **Modifier**, **Dupliquer**, **Regénérer le PDF**,
  **Supprimer**.
* Clic sur une pastille verte : ouverture du PDF (téléchargement depuis un
  téléphone).
* *Ouvrir le dossier* : affiche le dossier du mois dans l’Explorateur
  (uniquement sur le poste principal).

---

## 7. Sauvegarde des données

Les données sont enregistrées sur le poste principal dans :

```
donnees\donnees.json        (données courantes)
donnees\donnees.json.bak    (copie de la version précédente)
```

Depuis les *Paramètres*, **Exporter une sauvegarde** produit un fichier JSON
daté ; **Importer une sauvegarde** le restaure.
Pour une sauvegarde complète, copiez les dossiers `Ordres de mission\` (les PDF)
et `donnees\`.

---

## 8. Organisation des fichiers

| Élément                                  | Rôle                                         |
|------------------------------------------|----------------------------------------------|
| `Ordres de mission.bat`                  | Lanceur principal                            |
| `Creer le raccourci sur le Bureau.bat`   | Crée le raccourci avec icône                 |
| `Autoriser l'acces reseau.bat`           | Pare-feu et profil réseau (administrateur)   |
| `Diagnostic.bat`                         | Vérification complète d’un poste             |
| `Ordres de mission (console).bat`        | Lanceur avec console (diagnostic)            |
| `serveur\server.ps1`                     | Service : données, PDF, classement, réseau   |
| `serveur\diagnostic.ps1`                 | Contrôles d’installation                     |
| `serveur\pare-feu.ps1`                   | Ouverture de l’accès réseau                  |
| `serveur\raccourci.ps1`                  | Création du raccourci                        |
| `app\index.html`                         | Interface                                    |
| `app\app.js`                             | Logique de l’application                     |
| `app\formulaire.js`                      | Construction du document (coordonnées exactes)|
| `app\qr.js`                              | Générateur de QR code (hors ligne)           |
| `app\form.css`                           | Mise en page A4 officielle                   |
| `app\styles.css`                         | Habillage de l’interface (bureau et mobile)  |
| `app\logo.png`, `app\icone.ico`          | Logo extrait du formulaire d’origine         |
| `donnees\`                               | Base de données locale, journal, diagnostic  |
| `Ordres de mission\`                     | PDF classés par année et par mois            |

---

## 9. En cas de problème

| Symptôme | Cause probable et solution |
|---|---|
| Rien ne s’ouvre au lancement | Lancez `Diagnostic.bat`, puis `Ordres de mission (console).bat` pour voir l’erreur. Consultez `donnees\ERREUR.txt`. |
| « Microsoft Edge est introuvable » | Installez Microsoft Edge ou Google Chrome : la génération PDF s’appuie sur son moteur d’impression. |
| Le téléphone n’atteint pas l’adresse | Même Wi-Fi ? Règle de pare-feu créée ? Réseau en profil **Privé** ? Voir §3. |
| L’adresse a changé | L’adresse IP est attribuée par le Wi-Fi et peut changer au redémarrage. Reprenez celle de l’onglet **Réseau**. |
| « Hors ligne » en haut à droite | Le poste principal a été éteint, mis en veille, ou l’application y a été fermée. |
| Les PDF ne se créent pas | Testez avec `Diagnostic.bat` (étape 5) : il génère un PDF de contrôle. |

---

## 10. Notes techniques

* Les coordonnées du formulaire (traits, bandeaux, cartouche, positions des
  libellés) ont été extraites directement du PDF officiel et sont reprises
  à l’identique en points typographiques : l’aperçu écran et le PDF généré
  utilisent **exactement la même feuille de style**.
* La génération PDF s’appuie sur le moteur d’impression de Microsoft Edge
  (`--headless --print-to-pdf`) : le PDF obtenu est vectoriel, au format A4,
  avec texte sélectionnable et polices incorporées.
* Le service écoute sur toutes les interfaces réseau via `TcpListener`, ce qui
  évite d’avoir besoin de droits administrateur au quotidien.
* Rien ne sort du réseau local : aucune donnée n’est envoyée sur Internet.
