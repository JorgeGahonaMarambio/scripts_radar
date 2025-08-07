#!/bin/bash

# 🚨 SEGURIDAD: Verifica que la clave exista antes de seguir
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "❌ Error: No se encontró ~/.ssh/id_ed25519"
    exit 1
fi

echo "🔐 Asegurando permisos..."
chmod 600 ~/.ssh/id_ed25519

echo "⚙️ Iniciando el agente SSH..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "🧠 Registrando github.com como host conocido..."
mkdir -p ~/.ssh
touch ~/.ssh/known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts

echo "📁 Creando carpeta del radar..."
mkdir -p ~/radar
cd ~/radar

echo "🐙 Clonando repositorio privado por SSH..."
git clone git@github.com:edge-alpha/scripts_radar.git

if [ $? -eq 0 ]; then
    echo "✅ Repositorio clonado correctamente."
else
    echo "❌ Falló la clonación del repositorio."
fi

# ❗ OPCIONAL: Borrar la clave para mayor seguridad (si deseas dejar EC2 sin clave)
# echo "🧹 Borrando clave por seguridad..."
# rm -f ~/.ssh/id_ed25519
# ssh-add -D

echo "🔚 Finalizado."
