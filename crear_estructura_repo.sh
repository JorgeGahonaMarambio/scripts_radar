#!/bin/bash

echo "🛠️ Creando estructura profesional del repositorio..."

# Seguridad: detener si algo falla
set -e

# 1. Crear carpetas base
mkdir -p scripts src auditoria data tests utils notebooks

# 2. Mover el script de setup SSH si existe
if [ -f setup_git_access.sh ]; then
  mv setup_git_access.sh scripts/
  echo "✅ Script setup_git_access.sh movido a scripts/"
fi

# 3. Crear README.md si no existe
if [ ! -f README.md ]; then
  cat <<EOF > README.md
# 🚀 Radar EDGE-ALPHA

Repositorio privado del sistema de trading cuantitativo EDGE-ALPHA.
Incluye scripts, filtros, auditorías, y código principal.

## Estructura

- \`scripts/\`: Scripts de inicialización, setup y automatización.
- \`src/\`: Código fuente del radar y sus módulos.
- \`data/\`: Datos crudos y preprocesados.
- \`auditoria/\`: Archivos YAML/CSV de auditorías.
- \`utils/\`: Funciones auxiliares reutilizables.
- \`tests/\`: Pruebas unitarias y de integración.

⚠️ Solo para uso profesional. No compartir.

EOF
  echo "📝 README.md generado."
fi

# 4. Inicializar el repositorio si aún no se hizo
if [ ! -d .git ]; then
  git init
  echo "🔁 Repositorio Git inicializado localmente."
fi

# 5. Agregar todos los archivos y subir
echo "📦 Commit inicial..."
git add .
git commit -m "📦 Estructura inicial profesional del radar"

# 6. Subir al repositorio remoto
echo "🚀 Subiendo a GitHub..."
git branch -M main
git remote add origin git@github.com:JorgeGahonaMarambio/scripts_radar.git
git push -u origin main

echo "✅ ESTRUCTURA Y PUSH COMPLETADO"
