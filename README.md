<h1 align="center"> Tema de Pulsar estilo MacOS </h1>
<p align="center"> <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/picture## Corrección para libadwaita (no del todo perfecta)

<details> <summary> Detalles <b>(pulsa para abrir)</b> </summary>

  Desde el lanzamiento de `Gnome 43.0`, cada vez más aplicaciones incorporadas usan `libadwaita`, y libadwaita no admite temas personalizados, lo que significa que no podemos cambiar la apariencia de las aplicaciones que usan libadwaita a través de `gnome-tweaks` o `dconf-editor`. ¡Para los usuarios que aman los temas personalizados, esto realmente es molesto!

  De todos modos, si al guien aún quiere personalizar los temas, solo podemos hacerlo de esta manera:

  usar el `archivo de tema` para sobrescribir el `archivo de configuración gtk-4.0`. El resultado es que solo se pueden hacer temas fijos haciendo que todas las aplicaciones gtk4 usen un tema y no se pueda cambiar (ni siquiera se puede cambiar al modo oscuro). Si quieres cambiar un tema, solo puedes volver a sobrescribir el `archivo de configuración gtk-4.0` con un nuevo tema. Sé que este método no es perfecto, pero por el momento es la única forma posible de seguir usando temas para las aplicaciones de libadwaita...

</details>

## Dona al autor principal

Si et gusta el proyecto cómprale un café al autor principal ❤️ !

<span class="paypal"><a href="https://www.paypal.me/vinceliuice" title="Donate to this project using Paypal"><img src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png" alt="PayPal donate button" /></a></span>

# Instalar este tema es sencillamente simple
<details> <summary> Dependencias necesarias <b>(pulsar para abrir)</b> </summary>

### Dependencias para "Instalar desde la fuente"
- sassc
- libglib2.0-dev-bin     `ubuntu 20.04`
- libglib2.0-dev         `ubuntu 18.04` `debian 10.03` `linux mint 19`
- libxml2-utils          `ubuntu 18.04` `debian 10.03` `linux mint 19`
- glib2-devel            `Fedora` `Redhat`

### Dependencias adicionales
- imagemagick            `(opcional para ajustes del tema GDM)`
- dialog                 `(opcional para instalación en modo diálogo)`
- optipng                `(opcional para renderizado de recursos)`
- inkscape               `(opcional para renderizado de recursos)`

No se preocupe, el instalador le proveerá de estas dependencias...
</details>

<details> <summary> Extensiones de GNOME recomendadas <b>(pulsar para abrir)</b> </summary>

- [user-themes](https://extensions.gnome.org/extension/19/user-themes/) para activar el tema de gnome-shell que el isntalador aplicará
- [dash-to-dock](https://extensions.gnome.org/extension/307/dash-to-dock)
- [blur-my-shell](https://extensions.gnome.org/extension/3193/blur-my-shell)

</details>

## instalación rápida

### Instalando desde la fuente

1. Corre `git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1`

2. Luego corre `./install.sh` apra instalar el tema por defecto.

### Desinstalar

- Desinstalar temas de GTK: `./install.sh -r`
- Desinstalar temas de GDM: `sudo ./tweaks.sh -g -r`
- Desinstalar team de Firefox: `./tweaks.sh -f -r`
- Desinstalar temas de Flatpack GTK: `./tweaks.sh -F -r`

## Puedes personalizar a full!
Escribe:  `./install.sh [OPTIONS...]`

<details> <summary> Opciones <b>(pulsa para abrir)</b> </summary>

```bash

OPTIONS:
  -d, --dest DIR
   Set destination directory. Default is '/home/[USER_NAME]/.themes'

  -n, --name NAME
   Set theme name. Default is 'WhiteSur'

  -o, --opacity [normal|solid]
   Set theme opacity variants. Repeatable. Default is all variants

  -c, --color [light|dark]
   Set theme color variants. Repeatable. Default is all variants

  -a, --alt [normal|alt|all]
   Set window control buttons variant. Repeatable. Default is 'normal'

  -t, --theme [default|blue|purple|pink|red|orange|yellow|green|grey|all]
   Set theme accent color. Repeatable. Default is BigSur-like theme

  -s, --scheme [standard|nord]
   Set theme colorscheme style. Repeatable. Default is 'standard'

  -m, --monterey 
   Set to MacOS Monterey style. 

  -N, --nautilus [stable|normal|mojave|glassy|right]
   Set Nautilus style. Default is BigSur-like style (stabled sidebar)

  -l, --libadwaita 
   Install theme into gtk4.0 config for libadwaita. Default is dark version

  -f, --fixed 
   Install fixed accent color version. Default is adaptive version

  -HD, --highdefinition 
   Set to High Definition size. Default is laptop size

  --shell, --gnomeshell 
   Tweaks for gnome-shell. Options:

     1. -i, -icon [apple|simple|gnome|ubuntu|tux|arch|manjaro|fedora|debian|void|opensuse|popos|mxlinux|zorin|budgie|gentoo]
     Set gnome-shell panel 'Activities' icon. Default is 'standard'

     2. -b, -background [default|blank|IMAGE_PATH]
     Set gnome-shell background image. Default is BigSur-like wallpaper

     3. -p, -panelopacity [default|30|45|60|75]
     Set gnome-shell panel transparency. Default is 15%

     4. -h, -panelheight [default|smaller|bigger]
     Set gnome-shell panel height size. Default is 32px

     5. -sf, -smallerfont 
     Set gnome-shell font size to smaller (10pt). Default is 11pt

     6. normal, -normal 
     Set gnome-shell show apps button style to normal. Default is BigSur

  --round, --roundedmaxwindow 
   Set maximized window to rounded. Default is square

  --black, --blackfont 
   Set panel font color to black. Default is white

  --darker, --darkercolor 
   Install darker 'WhiteSur' dark themes. 

  --dialog, --interactive 
   Run this installer interactively, with dialogs. 

  --silent-mode 
   Meant for developers: ignore any confirm prompt and params become more strict. 

  -r, --remove, -u, --uninstall 
   Remove all installed WhiteSur themes. 

  -h, --help 
   Show this help. 

```

</details>

## Corrección para libadwaita (no del todo perfecta)

<details> <summary> Detalles <b>(pulsa para abrir)</b> </summary>

  Since the release of `Gnome 43.0`, more and more built-in apps use `libadwaita` now, and libadwaita does not support custom themes, which means we cannot change the appearance of app using libadwaita through `gnome-tweaks` or `dconf-editor`. For users who love custom themes, it’s really sucks!

  Anyway if anybody who still want to custom themes we can only do this way:

  that is to use the `theme file` to overwrite the `gtk-4.0 configuration file`. The result is that only Fixed making all gtk4 apps use one theme and cannot be switched (even can not switch to dark mode) If you want to change a theme, you can only re-overwrite the `gtk-4.0 configuration file` with a new theme, I know this method is not perfect, But at the moment it is only possible to continue using themes for libadwaita's apps ...

</details>

Ejecuta este comando para instalar `WhiteSur` en la `carpeta de configuración gtk-4.0` ($HOME/.config/gtk-4.0)

```bash
./install.sh -l                # Por defecto es el tema oscuro normal
./install.sh -l -c light       # instalar tema claro para libadwaita
```

## <p align="center"> <b> Cambiar color y acento del tema </b> </p>
<p align="center"> <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/colors-themes.png"/> </p>

#### - Instalar acento del tema
Parameter: `--theme` `-t` (repeatable)

Ejemplo:

```bash
./install.sh -t red            # instalar solo el acento rojo del tema
./install.sh -t red -t green   # instalar los acentos rojo y verde del tema
./install.sh -t all            # instalar todos los acentos disponibles del tema
```

## <p align="center"> <b> Cambiar el estilo de Nautilus </b> </p>
<p align="center"> <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/nautilus.png"/> </p>

Parameter: `--nautilus` `-N`

Example: `./install.sh -N mojave`

## <p align="center"> <b> ¡Explora más características de personalización! </b> </p>
Puedes ejecutar `./install.sh -h` para explorar más opciones de personalización
como cambiar la opacidad del panel, la opacidad del tema (variante normal y sólida),
la variante de los botones de control de ventana, etc.

# <p align="center"> <b> ¡Vamos a hacer ajustes! </b> </p>
Uso:  `./tweaks.sh [OPCIONES...]`

<details> <summary> Opciones <b>(pulsar para abrir)</b> </summary>

```bash

OPCIONES:
  -o, --opacity [normal|solid]
   Establecer variantes de opacidad del tema 'WhiteSur' GDM/Flatpak. Por defecto es 'normal'

  -c, --color [light|dark]
   Establecer variantes de color del tema 'WhiteSur' GDM/Flatpak. Por defecto es 'light'

  -t, --theme [default|blue|purple|pink|red|orange|yellow|green|grey]
   Establecer color de acento del tema 'WhiteSur' GDM/Flatpak. Por defecto es estilo BigSur

  -s, --scheme [standard|nord]
   Establecer estilo de esquema de colores del tema 'WhiteSur' GDM/Flatpak. Por defecto es 'standard'

   
 Ajustes para el tema GDM. opciones

  -g, --gdm    Sin opciones se instalará el tema GDM por defecto... 

      1. -i, -icon [apple|simple|gnome|ubuntu|tux|arch|manjaro|fedora|debian|void|opensuse|popos|mxlinux|zorin|budgie|gentoo]   Establecer icono de 'Actividades' del panel GDM. Por defecto es 'standard'

      2. -b, -background [default|blank|IMAGE_PATH]   Establecer imagen de fondo GDM. Por defecto es fondo estilo BigSur

      3. -p, -panelopacity [default|30|45|60|75]   Establecer transparencia del panel GDM. Por defecto es 15%

      4. -h, -panelheight [default|smaller|bigger]   Establecer altura del panel GDM. Por defecto es 32px

      5. -sf, -smallerfont    Establecer tamaño de fuente GDM más pequeño (10pt). Por defecto es 11pt

      6. -nd, -nodarken    No oscurecer la imagen de fondo del tema GDM 'WhiteSur'

      7. -nb, -noblur    No desenfocar la imagen de fondo del tema GDM 'WhiteSur'

   
 Ajustes para Firefox. opciones

  -f, --firefox         [(monterey|flat)|alt|(darker|adaptive)]   Sin opciones se instalará el tema WhiteSur por defecto...   Opciones:

      1. monterey       [3+3|3+4|3+5|4+3|4+4|4+5|5+3|5+4|5+5]   Número de botones en la barra superior: 'a+b'   a: número de botones del lado izquierdo, b: número de botones del lado derecho

      2. flat           Versión alternativa de Monterey    Pestañas redondas planas...

      3. alt            Versión alternativa de botones de ventana    Estilo de botones de ventana como el tema gtk

      4. darker         Versión oscura del tema Firefox    Versión más oscura del tema Firefox

      5. nord           Versión del esquema de colores Nord    Versión del esquema de colores Nord para Firefox

      6. adaptive       Versión de color adaptativo   Necesitas instalar primero el complemento adaptive-tab-bar-colour   https://addons.mozilla.org/firefox/addon/adaptive-tab-bar-colour/

  -e, --edit-firefox [(monterey|flat)|alt|(darker|adaptive)]
   Editar el tema 'WhiteSur' para la configuración de Firefox y también conectar el tema a los perfiles actuales de Firefox. 

   
 Otras opciones

  -F, --flatpak Opciones de soporte: [-o, -c, -t...]   Conectar el tema 'WhiteSur' a Flatpak. Sin opciones solo se instalarán los temas por defecto

      1.  -o, --opacity [normal|solid]   Establecer variantes de opacidad del tema 'WhiteSur' para flatpak. Por defecto es 'normal'

      2.  -c, --color [Light|Dark]   Establecer variantes de color del tema 'WhiteSur' para flatpak. Por defecto es 'light'

      3.  -t, --theme [default|blue|purple|pink|red|orange|yellow|green|grey]   Establecer color de acento del tema 'WhiteSur' para flatpak. Por defecto es estilo BigSur

      4.  -s, --scheme [standard|nord]   Establecer estilo de esquema de colores del tema 'WhiteSur' para flatpak. Por defecto es 'standard'

  -d, --dash-to-dock 
   Corregir problema del tema Dash to Dock. 

  -r, --remove, --revert 
   Revertir a los temas originales, hacer lo opuesto a instalar y conectar. 

  --silent-mode 
   Para desarrolladores: ignorar cualquier confirmación y hacer los parámetros más estrictos. 

  -h, --help 
   Mostrar esta ayuda. 

```

</details>

## ¡Hay más temas que puedes probar!
### <p align="center"> <b> Instalar y editar tema de Firefox </b> </p>

<p align="center"> <a href="src/other/firefox">
<img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/firefox.svg"/>
</a> </p>

#### - [Install Firefox theme](src/other/firefox)
Parameter: `--firefox` `-f`

Example: `./tweaks.sh -f`

#### - Edit Firefox theme
Parameter: `--edit-firefox` `-e`

Example:

```bash
./tweaks.sh -e           # edit the installed Firefox theme
./tweaks.sh -f -r        # remove installed Firefox theme
./tweaks.sh -f monterey  # install Monterey Firefox theme
```

##

### <p align="center"> <b> Instalar y personalizar el tema GDM </b> </p>
<p align="center"> <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/gdm.png"/> </p>

#### - Instalar tema GDM
Parámetro: `--gdm` `-g` (requiere ser ejecutado como root)

Ejemplo: `sudo ./tweaks.sh -g`

#### - Cambiar el fondo
Parámetro: `--background` `-b`

Ejemplo:

```bash
sudo ./tweaks.sh -g -b "mi imagen.jpg" # usar un fondo personalizado
sudo ./tweaks.sh -g -b default         # usar el fondo predeterminado
sudo ./tweaks.sh -g -b blank           # dejarlo en blanco
```

#### - No oscurecer el fondo
Parámetro: `--nodarken` `-nd`

Ejemplo:

```bash
sudo ./tweaks.sh -g -nd                          # no oscurecer el fondo predeterminado
sudo ./tweaks.sh -g -nd -b "wallpapers/snow.jpg" # no oscurecer el fondo personalizado
```

#### - No desenfocar el fondo
Parámetro: `--noblur` `-nb`

Ejemplo:

```bash
sudo ./tweaks.sh -g -nb                           # no desenfocar el fondo predeterminado
sudo ./tweaks.sh -g -nb -b "wallpapers/rocks.jpg" # no desenfocar el fondo personalizado
```

#### - Realizar más personalizaciones de GDM
Puedes realizar [las mismas personalizaciones que en `./install.sh`](#theres-so-many-customizations-you-can-do)
como cambiar el color del tema (variante clara y oscura) y acentos, el ícono de
'Actividades' de GNOME Shell, etc. relacionados con GDM. ¡Ejecuta `./tweaks.sh -h` para explorar!

##

### <p align="center"> <b> Corrección para Flatpak </b> </p>

#### 1. Ejecuta el comando para corregirlo

```sh
sudo flatpak override --filesystem=xdg-config/gtk-3.0 && sudo flatpak override --filesystem=xdg-config/gtk-4.0
```

Si usas aplicaciones flatpak, puedes ejecutar esto para corregir problemas con el tema

#### 2. Conectar el tema WhiteSur a Flatpak (gtk 3.0) (Snap no es compatible)

Parámetro: `--flatpak` `-F`

Ejemplo: `./tweaks.sh -F`

## <p align="center"> <b> Otras recomendaciones </b> </p>
### <p align="center"> <b> Tema de iconos WhiteSur </b> </p>
<p align="center"> <a href="https://github.com/vinceliuice/WhiteSur-icon-theme">
  <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/icon-theme.png"/>
</a> </p>
<br>
<p align="center"> <a href="https://github.com/vinceliuice/WhiteSur-icon-theme">
  <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/download-button.svg"/>
</a> </p>
<br>

### <p align="center"> <b> Fondos de pantalla WhiteSur </b> </p>
<p align="center"> <a href="https://github.com/vinceliuice/WhiteSur-wallpapers">
  <img class="image" src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/wallpaper.gif"/>
</a> </p>
<br>
<p align="center"> <a href="https://github.com/vinceliuice/WhiteSur-wallpapers">
  <img src="https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/pictures/pictures/download-button.svg"/>
</a> </p>
<br>

## Detalles técnicos y cómo participar
Por favor, lee [CONTRIBUTING.md](.github/CONTRIBUTING.md) para más información
