#!/bin/bash

# Verifica que el repo fue clonado
cd ~/radar/scripts_radar || {
    echo "❌ El repositorio no fue clonado en ~/radar/scripts_radar"
    exit 1
}

# Crear README
echo "# scripts_radar

Este repositorio contiene los scripts automatizados del sistema Radar EDGE-ALPHA en EC2.
" > README.md

# Copiar scripts iniciales si existen en ~/radar (ajusta nombres si tienes otros)
cp ~/radar/setup_git_access.sh . || echo "⚠️ setup_git_access.sh no encontrado (opcional)"
cp ~/radar/tce_v1_6_1.py . || echo "⚠️ tce_v1_6_1.py no encontrado (opcional)"
cp ~/radar/watchdog_adaptativo.py . || echo "⚠️ watchdog_adaptativo.py no encontrado (opcional)"

# Inicializar Git y hacer commit
git add .
git commit -m "🚀 Primera carga: scripts base del radar"
git push origin main || git push origin master
