#!/bin/bash
# Script post-build pour copier le dossier /seo vers build/web/seo

set -e

SOURCE_DIR="seo"
TARGET_DIR="build/web/seo"

echo "📋 Copie du dossier SEO vers build/web..."

# Créer le répertoire cible s'il n'existe pas
mkdir -p "$TARGET_DIR"

# Copier tout le contenu de /seo vers build/web/seo
cp -r "$SOURCE_DIR"/* "$TARGET_DIR"/

echo "✅ Dossier SEO copié avec succès vers $TARGET_DIR"
