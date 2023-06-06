# README
### MultiTenantFlutterTemplate - Siltium

Plantilla para generar aplicaciones similares en funcionamiento, pero con diseño distinto.

## Archivos para modificar
### Colores:
- lib/values/k_colors.dart
- "Color" recibe un valor hexadecimal para determinar el color.

### Font Sizes
- lib/values/k_values.dart
- Nombre debe contener tamaño según xd, valor debe ser el equivalente en flutter

### Styles:
- lib/values/k_styles.dart
- Box Shadows (color, spreadRadius, blurRadius, offset) y Text Styles (color, fontWeight y fontSize)

### Api Endpoints:
- lib/values/k_api.dart
- KApi: String de la url raiz de api
- Los demás endpoints desde el siguiente

### App Icon
- Se usa la librería flutter_launcher_icons incluida en pubspec.yaml
- Incluir lo siguiente:
  # Global
  image_path: "images/app_icon/icon.png" -> Icono realizado por diseño
  # Android
  android: "launcher_icon"
  adaptive_icon_foreground: "images/app_icon/icon_transparent_background.png" -> Icono adaptativo para distintas formas de íconos en android. Icono con fondo transparente, en una relacion de tamaño de 2.71 veces más grande el fondo que el ícono.
  adaptive_icon_background: "#FFFFFF" -> Color de fondo para reemplazar el fondo transparente anterior.
  # iOS
  ios: false
  remove_alpha_ios: true

### Splash 
- Construir vista en lib/pages/init_page.dart




