#!/bin/sh

# Verifica se 'entr' está instalado
if ! command -v entr >/dev/null; then
  echo "❌ 'entr' não está instalado!"

  # Detecta o sistema operacional corretamente
  case "$(uname -s)" in
  Linux)
    echo "💡 Para instalar 'entr', use: sudo apt update && sudo apt install entr"
    ;;
  Darwin)
    echo "💡 Para instalar 'entr', use: brew install entr"
    ;;
  CYGWIN* | MINGW32* | MSYS* | MINGW*)
    echo "💡 Para instalar 'entr', use: sudo apt update && sudo apt install entr"
    ;;
  *)
    echo "⚠️ Sistema não identificado! Instale manualmente 'entr' pelo gerenciador de pacotes da sua distro."
    ;;
  esac

  exit 1
fi

# Monitoramento dos arquivos .dart dentro de lib e bin
find lib bin -type f -name "*.dart" | entr -r dart run
