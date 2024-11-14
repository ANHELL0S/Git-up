# Gitup - Script de Automación para Git

Este proyecto permite automatizar los pasos básicos de **commit** y **push** en un repositorio Git mediante un script llamado `gitup`.

## Requisitos Previos
- Tener instalado **Git** en tu sistema.
- Acceso a un terminal de comandos (Linux/MacOS).


## Uso
Escribe en el terminal:

```bash
gitup
```

## Instalación y Configuración

Sigue estos pasos para configurar y usar el script `gitup` en tu sistema.

### 1. Crear la carpeta de scripts (si no existe)

Primero, asegúrate de que el directorio `~/.scripts` exista en tu sistema. Si no, puedes crearlo con el siguiente comando:

```bash
mkdir -p ~/.scripts
```

### 2. Añadir la carpeta .scripts al PATH

```bash
echo 'export PATH="$PATH:$HOME/.scripts"' >> ~/.bashrc
```
### 3. Cargar la configuración del terminal

```bash
source ~/.bashrc
```

### 4. Crear el archivo del script gitup

```bash
nano ~/.scripts/gitup
```
Copia y pega el siguiente código en el archivo

### 5. Dar permisos de ejecución al script

```bash
chmod +x ~/.scripts/gitup
```




