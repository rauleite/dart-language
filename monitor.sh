#!/bin/sh
####
# Monitoring .dart files inside lib and bin
# In the output terminal, you can do space keyboard for re-running
###

# Check if 'entr' is installed
if ! command -v entr >/dev/null; then
  echo "❌ 'entr' não está instalado!"

  # Detects the Operacional System correctly
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

# starts monitoring
find lib bin -type f -name "*.dart" | entr -r dart run
