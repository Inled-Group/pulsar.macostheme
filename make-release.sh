#! /usr/bin/env bash

readonly REPO_DIR="$(dirname "$(readlink -m "${0}")")"
readonly RELEASE_DIR="${REPO_DIR}/release"
source "${REPO_DIR}/libs/lib-install.sh"

# Customization, default values
colors=("${COLOR_VARIANTS[@]}")
opacities=("${OPACITY_VARIANTS[@]}")

C_VARIANTS=('-Light' '-Dark')
S_VARIANTS=('' '-solid')
N_VARIANTS=('' '-nord')

install() {
  remove_themes; customize_theme; avoid_variant_duplicates
  local schemes=("${SCHEME_VARIANTS[@]}")
  install_themes
  echo; prompt -s "Install GNOME ${RELEASE_VERSION} version finished!\n"
}

compress() {
  for color in "${C_VARIANTS[@]}"; do
    for solid in "${S_VARIANTS[@]}"; do
      for scheme in "${N_VARIANTS[@]}"; do
        rm -rf ${RELEASE_DIR}/${THEME_NAME}${color}${solid}${scheme}.tar.xz
      done
    done
  done

  cd ${THEME_DIR}

  for color in "${C_VARIANTS[@]}"; do
    for solid in "${S_VARIANTS[@]}"; do
      for scheme in "${N_VARIANTS[@]}"; do
        tar -Jcf ${RELEASE_DIR}/${THEME_NAME}${color}${solid}${scheme}.tar.xz ${THEME_NAME}${color}${solid}${scheme}
      done
    done
  done
}

release_info() {
rm -rf ${RELEASE_DIR}/release-info.txt

echo >> release-info.txt
echo "VERSION: (GNOME-SHELL) ${RELEASE_VERSION}" >> ${RELEASE_DIR}/release-info.txt
echo >> ${RELEASE_DIR}/release-info.txt
echo "RELEASE TIME: $(date)" >> ${RELEASE_DIR}/release-info.txt
echo >> ${RELEASE_DIR}/release-info.txt
echo "--->>> GTK | GNOME Shell | Cinnamon | Metacity | XFWM | Plank <<<---" >> ${RELEASE_DIR}/release-info.txt
echo "Variantes de color   : $( IFS=';'; echo "${colors[*]}" )" >> ${RELEASE_DIR}/release-info.txt
echo "Variantes de tema   : $( IFS=';'; echo "${themes[*]}" )" >> ${RELEASE_DIR}/release-info.txt
echo "Varianets de opacidad : $( IFS=';'; echo "${opacities[*]}" )" >> ${RELEASE_DIR}/release-info.txt
echo "Alt variants     : $( IFS=';'; echo "${alts[*]}" )" >> ${RELEASE_DIR}/release-info.txt
echo "Varianets de esquema  : $( IFS=';'; echo "${SCHEME_VARIANTS[*]}" )" >> ${RELEASE_DIR}/release-info.txt
echo "Estilod e botón de inicio : ${icon}" >> ${RELEASE_DIR}/release-info.txt
echo "Estilo del Nautilus   : ${nautilus_style}" >> ${RELEASE_DIR}/release-info.txt
}

#GNOME_VERSION="3-28"
#RELEASE_VERSION="-3-38"
#install && compress
#prompt -s "Compress Gnome${RELEASE_VERSION} version finished!"; echo

GNOME_VERSION="48-0"
RELEASE_VERSION="48.0"
install && compress
prompt -i "Compress ${THEME_NAME} themes TERMINADO!\n"
release_info
prompt -s "¡Hecho!"; echo

exit 0
