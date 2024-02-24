# Requerimientos de la aplicación

## Miembros

<div align="center">

[![Static Badge](https://img.shields.io/badge/1-Cakeneka-pink?style=flat&logo=github)](https://github.com/CakeNeka)&nbsp;&nbsp;
[![Static Badge](https://img.shields.io/badge/2-Leo0756-black?style=flate&logo=github)](https://github.com/Leo0756)&nbsp;&nbsp;
[![Static Badge](https://img.shields.io/badge/3-Mangus-orange?style=flat&logo=github)](https://github.com/Leo0756)&nbsp;&nbsp;
[![Static Badge](https://img.shields.io/badge/4-Iridescent-purple?style=flat&logo=github)](https://github.com/Iridescent1010)&nbsp;&nbsp;


</div >

## Miembro 1

### Login

### Menu

### Contactar por WhatsApp

## Miembro 2 

### Calendario y horario de apertura

- Accesible para **usuarios con rol gerente**.
- Pueden cambiar **calendario** y **horario** de apertura

#### Calendario de apertura

- Semanal: Días de la semana en los que la peluquería abre
    - Por ejemplo, apertura de lunes a jueves
- Festivos y vacaciones: Días del año en los que la peluquería cierra
    - por ejemplo, 1 de enero, 25 de diciembre, del 1 al 15 de agosto, etc

#### Horario de apertura

- **Horas de apertura** por día de la semana, por ejemplo:
    - De lunes a jueves de 9:00 a 13:00 y de 16:00 a 20:00
    - Viernes de 9:00 a 14:00


## Miembro 3

### Gestión de peluqueros

- Accesible para usuarios con rol **gerente**

#### Lista de peluqueros

Lista todos los usuarios registrados con **rol de peluquero**.
Pueden realizarse varias **operaciones** sobre cada peluquero:

1. Establecer **horario de trabajo**
    - Diario (09:00 - 12:00)
    - Semanal (De lunes a viernes)
2. Establecer **días de vacaciones**

#### Lista de todos los usuarios

Lista con **todos los usuarios**. Permite asignar el rol de peluquero a un usuario.

####  [Barra de búsqueda](https://pub.dev/packages/easy_search_bar)

Filtrar por **nombres**, **apellidos** y/o **teléfono**

> [Easy Search Bar](https://pub.dev/packages/easy_search_bar) o [SearchBar](https://api.flutter.dev/flutter/material/SearchBar-class.html)

## Miembro 4

- Accesible solo para **peluqueros**

### Lectura de reservas

- [**Calendario**](https://pub.dev/packages/table_calendar/example)
- Bajo el calendario, **Lista de citas** en el día seleccionado
- Al seleccionar una lista, **mostrar detalles** de la cita.

Solo hay que **leer** de la base de datos, las citas **ya están insertadas** y tienen esta estructura:

```json
"reservas": {
  "r1": {
    "cancelada:": false,
    "fecha": [
      "2023-12-14 11:30:00.000"
    ],
    "pagada": false,
    "pago": "Efectivo",
    "peluquero": "45673435J",
    "servicios": {
      "SER001": true,
      "SER002": true
    },
    "usuario": "USR0013"
  }
}
```

## Miembro 5

### Comprobación de horarios disponibles

- Accesible para **peluqueros** y **gerentes**

- [**Calendario**](https://pub.dev/packages/table_calendar/example)
    1. Seleccionar un peluquero (Si el usuario conectado tiene rol **peluquero** se selecciona a el mismo automáticamente)
    2. Seleccionar un día
- Mostrar botones con horas disponibles en rangos de 30 minutos
- No es necesario implementar la reserva de citas, solo **mostrar las horas disponibles**

  - Horario en el que la **peluquería abre**
  - Botones bloqueados en negro si el **peluquero no trabaja**
  - Botones bloqueados en otro color si **ya hay una cita en esa hora**

### Base de datos Firebase

- Creación de la base de datos
- Gestionar **reglas de seguridad**

### Generación APK

- Fichero .APK para instalar en dispositivos android
