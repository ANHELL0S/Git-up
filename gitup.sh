#!/bin/bash

# Establecer colores
reset="\033[0m"
green="\033[0;32m"
blue="\033[0;34m"
yellow="\033[0;93m"
red="\033[0;31m"

# Iconos
pin="✍️"
warning="🤬"

# Verificar si es un repositorio de Git
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo -e "\n${warning} ${red}Error: This is not a Git repository. Please initialize Git first (git init).${reset}\n"
    exit 1
fi

# Ingresar el mensaje de commit
echo -e "${pin} ${blue}Enter your commit description:${reset} \c"
read commit_message

# Agregar cambios al staging area
echo -e "\n${yellow}Staging the changes...${reset}"
git add .

# Mostrar resumen de los cambios
echo -e "\n${blue}Here's a quick look at your changes:${reset}\n"
git status -s

# Confirmar si se quiere hacer el commit
branch_name=$(git branch --show-current)
echo -e "\n${blue}You're currently on branch --> ${green}${branch_name}${reset}\n"
echo -e "Ready to commit these changes? (y/n): \c"
read confirm_commit

if [[ "$confirm_commit" == "y" || "$confirm_commit" == "Y" ]]; then
    # Realizar commit
    echo -e "\n${green}Committing your changes...${reset}"
    git commit -m "$commit_message"

    # Hacer push
    echo -e "\n${blue}Pushing the updates to the server...${reset}"
    git push

    # Mensaje final
    echo -e "\n${green}All done! Your changes have been uploaded successfully! 🎉${reset}"
else
    # Si se cancela el commit
    echo -e "\n${red}Commit canceled. Try again later.${reset}"
fi
