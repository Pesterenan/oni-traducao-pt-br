#!/bin/bash

DIST_DIR="dist"

# Remove a pasta se já existir (build limpa)
if [ -d "$DIST_DIR" ]; then
  rm -rf "$DIST_DIR"
fi

mkdir "$DIST_DIR"

# Lista de arquivos que devem ser copiados
FILES=("mod_info.yaml" "README.md" "LICENSE" "strings.mo" "strings.po")

# Copia cada arquivo para a pasta dist
for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    cp "$file" "$DIST_DIR/"
  else
    echo "Aviso: arquivo $file não encontrado."
  fi
done

echo "Build concluído! Arquivos copiados para a pasta $DIST_DIR."

# Cria o arquivo TGZ com a data de hoje
COMPRESSED_FILE="oni-traducao-$(date +%Y%m%d).tgz"

# Cria o TGZ na pasta dist
tar -czf "./$COMPRESSED_FILE" $(printf '%s ' "${FILES[@]}")
echo "Arquivo de build: $COMPRESSED_FILE"
