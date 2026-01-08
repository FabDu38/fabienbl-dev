#!/usr/bin/env node
// Script post-build pour copier le dossier /seo vers build/web/seo

const fs = require('fs');
const path = require('path');

const sourceDir = path.join(__dirname, '..', 'seo');
const targetDir = path.join(__dirname, '..', 'build', 'web', 'seo');

function copyRecursiveSync(src, dest) {
  const exists = fs.existsSync(src);
  const stats = exists && fs.statSync(src);
  const isDirectory = exists && stats.isDirectory();

  if (isDirectory) {
    if (!fs.existsSync(dest)) {
      fs.mkdirSync(dest, { recursive: true });
    }
    fs.readdirSync(src).forEach((childItemName) => {
      copyRecursiveSync(
        path.join(src, childItemName),
        path.join(dest, childItemName)
      );
    });
  } else {
    fs.copyFileSync(src, dest);
  }
}

console.log('📋 Copie du dossier SEO vers build/web...');

try {
  if (!fs.existsSync(sourceDir)) {
    console.error(`❌ Le dossier source ${sourceDir} n'existe pas`);
    process.exit(1);
  }

  copyRecursiveSync(sourceDir, targetDir);
  console.log(`✅ Dossier SEO copié avec succès vers ${targetDir}`);
} catch (error) {
  console.error('❌ Erreur lors de la copie:', error.message);
  process.exit(1);
}
