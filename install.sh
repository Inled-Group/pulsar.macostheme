#!/usr/bin/env bash

# WARNING: Please make this shell not working-directory dependent, for example
# instead of using 'ls blabla', use 'ls "${REPO_DIR}/blabla"'
#
# WARNING: Don't use "cd" in this shell, use it in a subshell instead,
# for example ( cd blabla && do_blabla ) or $( cd .. && do_blabla )
#
# SUGGESTION: Please don't put any dependency installation here

###############################################################################
#                             VARIABLES & HELP                                #
###############################################################################

readonly REPO_DIR="$(dirname "$(readlink -m "${0}")")"
source "${REPO_DIR}/libs/lib-install.sh"

# Customization, default values
colors=("${COLOR_VARIANTS[@]}")
opacities=("${OPACITY_VARIANTS[@]}")

usage() {
  # Please specify their default value manually, some of them come from _variables.scss
  # You also have to check and update them regularly
  helpify_title
  helpify "-d, --dest"                    "DIR"                                               "  Configura destination directory"                      "Predeterminado es '${THEME_DIR}'"
  helpify "-n, --name"                    "NAME"                                              "  Configura theme name"                                 "Predeterminado es '${THEME_NAME}'"
  helpify "-o, --opacity"                 "[$(IFS='|'; echo "${OPACITY_VARIANTS[*]}")]"       "  Configura theme opacity variants"                     "Repeatable. Predeterminado es all variants"
  helpify "-c, --color"                   "[$(IFS='|'; echo "${COMMAND_COLOR_VARIANTS[*]}")]" "  Configura theme color variants"                       "Repeatable. Predeterminado es all variants"
  helpify "-a, --alt"                     "[$(IFS='|'; echo "${ALT_VARIANTS[*]}")|all]"       "  Configura window control buttons variant"             "Repeatable. Predeterminado es 'normal'"
  helpify "-t, --theme"                   "[$(IFS='|'; echo "${THEME_VARIANTS[*]}")|all]"     "  Configura theme accent color"                         "Repeatable. Predeterminado es BigSur-like theme"
  helpify "-s, --scheme"                  "[$(IFS='|'; echo "${SCHEME_VARIANTS[*]}")]"        "  Configura theme colorscheme style"                    "Repeatable. Predeterminado es 'standard'"
#  helpify "-s, --size"                    "[$(IFS='|'; echo "${SIDEBAR_SIZE_VARIANTS[*]}")]"  "  Configura Nautilus (version < 40.0) sidebar minimum width" "Predeterminado es 200px"

  helpify "-m, --monterey"                ""                                                  "  Configura to MacOS Monterey style"                     ""
  helpify "-N, --nautilus"                "[$(IFS='|'; echo "${NAUTILUS_STYLE_VARIANTS[*]}")]" "  Configura Nautilus style"                             "Predeterminado es BigSur-like style (stabled sidebar)"
  helpify "-l, --libadwaita"              ""                                                  "  Instala el tema en gtk4.0 config for libadwaita" "Predeterminado es dark version"
  helpify "-f, --fixed"                   ""                                                  "  Install fixed accent color version"              "Predeterminado es adaptive version"
  helpify "-HD, --highdefinition"         ""                                                  "  Configura to High Definition size"                     "Predeterminado es laptop size"

  helpify "--shell, --gnomeshell"         ""                                                  "  Tweaks for gnome-shell"                          "Options:"
  helpify "   1. -i, -icon"               "[$(IFS='|'; echo "${ICON_VARIANTS[*]}")]"          "    Configura gnome-shell panel 'Activities' icon"       "Predeterminado es 'standard'"
  helpify "   2. -b, -background"         "[default|blank|IMAGE_PATH]"                        "    Configura gnome-shell background image"              "Predeterminado es BigSur-like wallpaper"
  helpify "   3. -p, -panelopacity"       "[$(IFS='|'; echo "${PANEL_OPACITY_VARIANTS[*]}")]" "    Configura gnome-shell panel transparency"            "Predeterminado es 15%"
  helpify "   4. -h, -panelheight"        "[$(IFS='|'; echo "${PANEL_SIZE_VARIANTS[*]}")]"    "    Configura gnome-shell panel height size"             "Predeterminado es 32px"
  helpify "   5. -sf, -smallerfont"       ""                                                  "    Configura gnome-shell font size to smaller (10pt)"   "Predeterminado es 11pt"
  helpify "   6. normal, -normal"         ""                                                  "    Configura gnome-shell show apps button style to normal" "Predeterminado es BigSur"

  helpify "--round, --roundedmaxwindow"   ""                                                  "  Configura maximized window to rounded"                 "Predeterminado es square"
  helpify "--black, --blackfont"          ""                                                  "  Set panel font color to black"                   "Predeterminado es white"
  helpify "--darker, --darkercolor"       ""                                                  "  Install darker '${THEME_NAME}' dark themes"      ""
  helpify "--dialog, --interactive"       ""                                                  "  Run this installer interactively, with dialogs"  ""
  helpify "--silent-mode"                 ""                                                  "  Meant for developers: ignore any confirm prompt and params become more strict" ""
  helpify "-r, --remove, -u, --uninstall" ""                                                  "  Remove all installed ${THEME_NAME} themes"       ""
  helpify "-h, --help"                    ""                                                  "  Show this help"                                  ""
}

###############################################################################
#                                  MAIN                                       #
###############################################################################

#-----------------------------PARSE ARGUMENTS---------------------------------#

echo

while [[ $# -gt 0 ]]; do
  # Don't show any dialog here. Let this loop checks for errors or shows help
  # We can only show dialogs when there's no error and no -r parameter
  #
  # * shift for parameters that have no value
  # * shift 2 for parameter that has a value
  #
  # Please don't exit any error here if possible. Let it show all error warnings
  # at once

  case "${1}" in
    # Parameters that require a value, multiple use
    -o|--opacity)
      check_param "${1}" "${1}" "${2}" "not-at-all" "must" "must" && shift 2 || shift ;;
    -c|--color)
      check_param "${1}" "${1}" "${2}" "not-at-all" "must" "must" && shift 2 || shift ;;
    -t|--theme)
      check_param "${1}" "${1}" "${2}" "not-at-all" "must" "must" && shift 2 || shift ;;
    -s|--scheme)
      check_param "${1}" "${1}" "${2}" "not-at-all" "must" "must" && shift 2 || shift ;;
    -a|--alt)
      check_param "${1}" "${1}" "${2}" "not-at-all" "must" "must" && shift 2 || shift ;;
    # Parameters that require a value, single use
    -d|--dest)
      check_param "${1}" "${1}" "${2}" "must" "must" "not-at-all" && shift 2 || shift ;;
    -n|--name)
      check_param "${1}" "${1}" "${2}" "must" "must" "not-at-all" && shift 2 || shift ;;
#    -s|--size) # only works on gnome < 40.0
#      check_param "${1}" "${1}" "${2}" "optional" "optional" "optional" && shift 2 || shift ;;
    -N|--nautilus)
      check_param "${1}" "${1}" "${2}" "optional" "optional" "optional" && shift 2 || shift ;;
    # Parameters that require a second value
    --shell|--gnome-shell)
      shift
      for variant in "${@}"; do
        case "${variant}" in
          -i|-icon)
            activities_icon="true";
            check_param "${1}" "${1}" "${2}" "must" "must" "must" && shift 2 || shift ;;
          -b|-background)
            check_param "${1}" "${1}" "${2}" "must" "must" "must" "false" && shift 2 || shift ;;
          -p|-panelopacity)
            check_param "${1}" "${1}" "${2}" "optional" "optional" "optional" && shift 2 || shift ;;
          -h|-panelheight)
            check_param "${1}" "${1}" "${2}" "optional" "optional" "optional" && shift 2 || shift ;;
          -sf|-smallerfont)
            smaller_font="true"; shift ;;
          normal|-normal)
            showapps_normal="true"; shift ;;
        esac
      done
      ;;
    # Parameters that don't require a value
    --right|--rightplacement)
      right_placement="true"; shift ;;
    --round|--roundedmaxwindow)
      max_round="true"; shift ;;
    --black|--blackfont)
      black_font="true"; shift ;;
    --darker|--darkercolor)
      darker="true"; shift ;;
    -HD|--highdefinition)
      compact="false"; shift ;;
    -m|--monterey)
      monterey="true"; shift ;;
    -l|--libadwaita)
      libadwaita="true"; shift ;;
    -f|--fixed)
      accent_type="fixed"; shift ;;
    -r|--remove|-u|-uninstall)
      uninstall='true'; shift ;;
    --silent-mode)
      full_sudo "${1}"; silent_mode='true'; shift ;;
    --dialog|--interactive)
      interactive='true'; shift ;;
    -h|--help)
      need_help="true"; shift ;;
    *)
      prompt -e "ERROR: Opción de instalación no reconocida '${1}'."
      has_any_error="true"; shift ;;
  esac
done

finalize_argument_parsing

#---------------------------START INSTALL THEMES-------------------------------#

if [[ "${uninstall}" == 'true' ]]; then
  if [[ "${libadwaita}" == 'true' ]]; then
    if [[ "$UID" != '0' ]]; then
      remove_libadwaita
      prompt -s "Eliminados archivos de Gtk4.0 en '${HOME}/.config/gtk-4.0/'!"
    else
      prompt -e "No arranque la opción --libadwaita con sudo!"; echo
    fi
  else
    prompt -i "Eliminando '${name}' temas de gtk en '${dest}'... \n"
    prompt -w "ELIMINACIÓN: Non-file-related parameters will be ignored. \n"
    remove_themes; remove_libadwaita
    prompt -s "Listo! Todos los '${name}' temas de gtk han sido eliminados."
  fi

  if [[ -f "${MISC_GR_FILE}.bak" ]]; then
    prompt -e "Hemos encontrado instalado un tema de GDM, tienes que hacer: 'sudo ./tweaks.sh -g -r' para eliminarlo!"
  fi
else
  if [[ "${interactive}" == 'true' ]]; then
    show_panel_opacity_dialog
#    show_sidebar_size_dialog
    show_nautilus_style_dialog
#  else
#    show_needed_dialogs
  fi

  prompt -w "Eliminando los viejos '${name}' temas\n"

  if [[ "${libadwaita}" != 'true' ]]; then
    remove_themes
  fi

  customize_theme; avoid_variant_duplicates;

  prompt -w "Instalando los temas '${name}' en '${dest}'...\n";

  prompt -t "--->>> GTK | GNOME Shell | Cinnamon | Metacity | XFWM | Plank <<<---"
  prompt -i "Variantes de color   : $( IFS=';'; echo "${colors[*]}" )"
  prompt -i "Variantes de tema   : $( IFS=';'; echo "${themes[*]}" )"
  prompt -i "Variantes de opacidad : $( IFS=';'; echo "${opacities[*]}" )"
  prompt -i "Alt variants     : $( IFS=';'; echo "${alts[*]}" )"
  prompt -i "variantes de esquema  : $( IFS=';'; echo "${schemes[*]}" )"
  prompt -i "Estilo de start icono : ${icon}"
  prompt -i "Estilo del Nautilus   : ${nautilus_style}"

  if [[ "${libadwaita}" == 'true' ]]; then
    if [[ "$UID" != '0' ]]; then
      install_libadwaita
      echo; prompt -w "Alguna extensión puede reescribir los ficheros de configuración en '${HOME}/.config/gtk-4.0' como: 'custom-accent-colors' ¡tienes que desactivarla, por favor!"
    else
      echo; prompt -e "No uses --libadwaita con sudo!"
    fi
  else
    echo; install_themes; echo; prompt -s "¡Hecho!"
  fi

  if (is_my_distro "solus") && (is_running "gnome-session"); then
    msg="GNOME: puede que tengas que desactivar la extensión User Themes para corregir el dock"
  fi

  if [[ "${msg}" ]]; then
    echo; prompt -w "${msg}"
    notif_msg="${msg}\n\n${final_msg}"
  else
    notif_msg="${final_msg}"
  fi

  echo; prompt -i "${final_msg}"
fi

echo
