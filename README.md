#  Esta es mi configuración de hyprland

Esta es una instalación minima con todas las herramientas de trabajo que uso día a día.

## Versiones:

### Version 0.0.1

Este script instala y configura un entorno de Arch Linux y Hyprland.
Si no se proporcionan banderas, se ejecutará en modo interactivo, preguntando para cada sección.

 ```Bash
BANDERAS:
  --all           Instala todo (equivale a todas las banderas de abajo).
  --base          Instala paquetes base y configura el AUR helper.
  --shell         Instala y configura la shell (Zsh, Oh My Zsh, etc.).
  --dev           Instala herramientas de desarrollo (Node, AWS CLI, etc.).
  --neovim        Instala y configura Neovim con la configuración personal.
  --apps          Instala aplicaciones de escritorio y productividad (navegador,etc.).
  --office        Instala LibreOffice y paquetes de idioma.
  --fonts         Instala una colección de Nerd Fonts.
  --configs       Ejecuta el script de configuración de dotfiles.
  -h, --help      Muestra este mensaje de ayuda.

VARIABLES DE ENTORNO:
  DRY_RUN=1         Ejecuta el script en modo de simulación sin hacer cambios.
  NON_INTERACTIVE=1 Responde 'sí' por defecto a todas las preguntas en modo interactivo.
```
#### Aplicaciones instaladas:
- git
- curl
- ca-certificates
- base-devel
- zsh
- zoxide
- lazygit
- yazi
- oh-my-zsh-git
- aws-cli-v2
- nodejs
- npm
- mongodb-compass-bin
- postman-bin
- gitflow-avh
- neovim
- ripgrep
- fd
- unzip
- fzf
- gcc
- make
- python-pynvim
- lua-language-server
- stylua
- zathura
- zathura-pdf-mupdf
- pipewire-pulse
- pavucontrol-qt
- qt5ct
- qt6ct
- kvantum
- swww
- waybar
- kitty
- fuzzel
- wl-clipboard
- cliphist
- hyprlock
- slurp
- grim
- hypridl
- calcurse
- networkmanager
- blueman
- brightnessctl
- nwg-look
- papirus-icon-theme
- zen-browser-bin
- obsidian
- notion-app-enhanced
- spotify
- hyprshot-git
- satty
- catppuccin-gtk-theme-mocha
- LibreOffice-fresh
- LibreOffice-fresh-es
- hunspell-en_us
- hunspell-es_co
- hyphen-en
- hyphen-es
- mythes-en
- mythes-es
- noto-fonts
- noto-fonts-nerd
- ttf-firacode-nerd
- ttf-cascadia-code-nerd
- ttf-iosevka-nerd
- ttf-sourcecodepro-nerd
- ttf-ubuntu-mono-nerd
- ttf-jetbrains-mono-nerd
- ttf-hack-nerd
- ttf-ms-fonts

### Version 0.1.0
- [ ] Control de música en forma de pildora que muestre la caratula de la canción.
- [ ] widget para ver la canción y canva.
- [ ] Panel para cerrar cesion, apagar y reiniciar el computador de forma grafica.
- [ ] Panel que se muestre cuando se realice mausower sobre el boton.
- [ ] Menu fuzzel para abrir las notas de mi segundo cerebro digital.

