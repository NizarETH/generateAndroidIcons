# Générateur d'icônes Android en Ruby

Ce script Ruby télécharge une image depuis une URL et génère automatiquement les icônes nécessaires pour une application Android.  
Les icônes sont placées dans les dossiers `mipmap` correspondants.

---

## Prérequis

Avant d'exécuter le script, assure-toi d'avoir installé :

### Ruby et les Gems nécessaires :
`gem install mini_magick`

### Utilisation
1- Télécharge le script : </br>
`git clone https://github.com/ton-repo/android-icon-generator.git`   </br>
`cd android-icon-generator`  </br>
2- Exécute le script en fournissant l'URL de ton image :  </br>
`ruby generate_icons.rb "https://example.com/image.png"`   </br>
3- Les icônes seront générées dans le dossier android_icons/ sous les dossiers `mipmap-*`. </br>

## Arborescence des fichiers générés
android_icons/ </br>
 ├── mipmap-mdpi/ic_launcher.png (48x48) </br>
 ├── mipmap-hdpi/ic_launcher.png (72x72) </br>
 ├── mipmap-xhdpi/ic_launcher.png (96x96) </br>
 ├── mipmap-xxhdpi/ic_launcher.png (144x144) </br>
 ├── mipmap-xxxhdpi/ic_launcher.png (192x192) </br>

