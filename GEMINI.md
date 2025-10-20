# Resumen del Proyecto

El propósito de este proyecto es crear un script de instalación automatizado y completo para una configuración de Hyprland en Arch Linux, incluyendo todas las aplicaciones y herramientas que el usuario utiliza en su flujo de trabajo diario. El script `arch_setup_nvmfish_extras_fix.sh` es el componente central para lograr esta automatización.

El script es interactivo y pregunta al usuario qué componentes instalar. Maneja paquetes del sistema a través de `pacman` y paquetes de AUR a través de un ayudante de AUR (como `yay` o `paru`), que instala si no está presente.

## Tecnologías y Herramientas Clave

*   **Shell:** Bash (para el script), Fish (como la shell de usuario de destino)
*   **Gestión de Paquetes:** `pacman`, `yay`/`paru` (ayudante de AUR)
*   **Herramientas de Desarrollo:**
    *   `nvm.fish` (a través de `fisher`) para la gestión de versiones de Node.js
    *   `neovim` con una configuración personalizada desde un repositorio de Git
    *   `lazygit`, `aws-cli-v2`, `gitflow-avh`, `zoxide`
    *   MongoDB Compass, Postman
*   **Aplicaciones:** Spotify, LibreOffice, Zen Browser, Zathura, Obsidian, Notion
*   **Fuentes:** Varias Nerd Fonts para iconos centrados en el desarrollador.

# Compilación y Ejecución

Este es un script de configuración, no una aplicación tradicional que se "compila".

## Ejecutando el Script

Para ejecutar el script de configuración, ejecútelo desde su terminal:

```bash
bash arch_setup_nvmfish_extras_fix.sh
```

El script solicitará la contraseña de `sudo` ya que necesita instalar paquetes en todo el sistema.

### Modo no Interactivo

El script admite un modo no interactivo, donde utilizará las respuestas predeterminadas a todas las preguntas.

```bash
NON_INTERACTIVE=1 bash arch_setup_nvmfish_extras_fix.sh
```

### Dry Run (Simulacro)

Para ver qué haría el script sin realizar ningún cambio real en el sistema, puede usar la variable de entorno `DRY_RUN`.

```bash
DRY_RUN=1 bash arch_setup_nvmfish_extras_fix.sh
```

## Post-Instalación

El script genera un archivo `POSTINSTALACION.md` en el directorio de inicio del usuario (`~/POSTINSTALACION.md`). Este archivo contiene los pasos de configuración manual necesarios para el software instalado, como la configuración de AWS CLI, la inicialización de `git-flow` y la configuración de Neovim.

# Convenciones de Desarrollo

*   El script está escrito en Bash y sigue las mejores prácticas como `set -Eeuo pipefail`.
*   Está diseñado para ser idempotente siempre que sea posible, utilizando `pacman -Q` para verificar los paquetes instalados y `grep` para verificar las líneas existentes en los archivos de configuración antes de agregarlas.
*   Respeta las configuraciones de usuario existentes, especialmente para la shell Fish, agregando solo las configuraciones mínimas necesarias.
*   Se utiliza el registro para rastrear la ejecución del script, con registros guardados en `${XDG_STATE_HOME:-$HOME/.local/state}/setup/`.
