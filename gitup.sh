#!/bin/bash

# Establecer el color
reset="\033[0m"
green="\033[0;32m"    
blue="\033[0;34m"      
yellow="\033[0;93m"    
red="\033[0;31m"       
purple="\033[0;35m" 

pin="✍️"
brach="🔎"
summary="📢"
check_mark="🔨"
warning="🤬"
push_done="🚀"
wait="🙏"
thinking="🤔"
fire="🔥"
push="💾"

# Verificar si es un repositorio de Git
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo -e "\n${warning} ${red}Error: This is not a Git repository. Please initialize Git first (git init).${reset}\n"
    exit 1
fi

# Ingresar el mensaje de commit en la misma línea
echo -e "${pin} ${blue} Enter your commit description:${reset} \c"
read commit_message

# Agregar cambios al staging area
echo -e "\n${wait} ${yellow}Hang on, we're staging the changes...${reset}"
git add .

# Mostrar resumen de los cambios
echo -e "\n${pin} ${blue} Here's a quick look at your changes:${reset}\n"
git status -s

# Confirmar si se quiere hacer el commit
echo -e "\n${brach} ${blue}You're currently on branch --> ${green}$(git branch --show-current)${reset}\n"
echo -e "${thinking} ${yellow}Ready to commit these changes? (y/n):${reset} \c"
read confirm_commit

if [[ "$confirm_commit" == "y" || "$confirm_commit" == "Y" ]]; then
    # Realizar commit
    echo -e "\n${check_mark} ${green}Great! We're committing your changes...${reset}\n"
    git commit -m "$commit_message"

    # Verificar si hay cambios para hacer push
    echo -e "\n${push} ${blue}Pushing the updates to the server...${reset}\n"
    git push

    # Mensaje final
    echo -e "\n${push_done} ${green}All done! Your changes have been uploaded successfully! 🎉${reset}\n"
else
    # Si se cancela el commit
    echo -e "\n${warning} ${red}Oops! Commit canceled. No worries, try again later. 😅${reset}\n"
fi
