#!/bin/bash

# 📁 Define la carpeta de origen (donde están los archivos desordenados)
echo "Por favor, introduce la ruta de la carpeta de origen:"
read ORIGEN
$ORIGEN="~/Descargas"

# 📁 Define la carpeta destino donde se organizarán los archivos
echo "Por favor, introduce la ruta de la carpeta donde se organizarán los archivos:"
read DESTINO
$DESTINO="~/Documentos/Organizados"
DESTINO=~/Documentos/Organizados

# 🗂️ Crea las subcarpetas de destino si no existen
mkdir -p "$DESTINO"/{PDFs,Imágenes,Videos,ZIPs,Otros}

# 🔄 Recorre cada archivo en la carpeta de origen
for archivo in "$ORIGEN"/*; do
  # 📌 Clasifica cada archivo por su extensión y lo mueve a la carpeta correspondiente
  case "$archivo" in
    *.pdf) mv "$archivo" "$DESTINO/PDFs" ;;                        # Mueve archivos PDF
    *.jpg|*.png) mv "$archivo" "$DESTINO/Imágenes" ;;              # Mueve imágenes JPG o PNG
    *.mp4|*.mkv) mv "$archivo" "$DESTINO/Videos" ;;                # Mueve videos MP4 o MKV
    *.zip|*.rar) mv "$archivo" "$DESTINO/ZIPs" ;;                  # Mueve archivos comprimidos
    *) mv "$archivo" "$DESTINO/Otros" ;;                           # Mueve cualquier otro archivo no clasificado
  esac
done

# ✅ Muestra un mensaje final indicando que todo ha sido organizado
echo "🧹 Archivos organizados con éxito en $DESTINO"
