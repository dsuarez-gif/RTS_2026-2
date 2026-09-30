# Tutorial de Lingua Franca para Sistemas de Tiempo-Real

## Introducción

**Lingua Franca (LF)** es un lenguaje de coordinación *polyglot*
orientado a sistemas concurrentes y sensibles al tiempo. Permite
complementar lenguajes de programación como **C, C++, Python, Rust y
TypeScript** con mecanismos para especificar concurrencia reactiva
determinista y comportamiento temporal.

En LF, un sistema se estructura mediante **reactors**. Cada reactor
puede contener reacciones, puertos, temporizadores, acciones, estado y
otros reactors. Las reacciones se ejecutan como respuesta a eventos, y
el modelo de tiempo lógico permite expresar explícitamente relaciones
temporales entre los componentes.

Para el presente curso de **Sistemas de Tiempo-Real**, LF resulta especialmente interesante porque permite estudiar conjuntamente:

-   Sistemas dirigidos por eventos (*event-driven systems*).
-   Tiempo lógico y tiempo físico.
-   Reactors y reactions.
-   Puertos, conexiones y eventos.
-   Timers y ejecuciones periódicas.
-   Concurrencia determinista.
-   Generación automática de código.
-   Sistemas distribuidos y federados.
-   Implementación sobre plataformas embebidas.

### Documentación oficial

-   [Lingua Franca --- Documentation](https://www.lf-lang.org/docs/)

------------------------------------------------------------------------

# Instalación

Para trabajar con Lingua Franca se puede utilizar el **Visual Studio
Code extension**, las herramientas de línea de comandos (**CLI**) o
entornos de desarrollo preconfigurados.

La documentación actual indica que el toolchain de LF requiere **Java 17
o superior**. Para el target C, además, se necesita un compilador C y
las herramientas de construcción correspondientes.

## Documentación oficial de instalación

-   [Lingua Franca ---
    Installation](https://www.lf-lang.org/docs/installation/)
-   [Lingua Franca --- Installation
    Repository](https://github.com/lf-lang/installation)

### Instalación rápida del CLI

En Linux/macOS, la documentación oficial proporciona el siguiente
procedimiento:

``` bash
curl -Ls https://install.lf-lang.org | bash -s cli
```

En caso de problemas de permisos puede ser necesario utilizar:

``` bash
curl -Ls https://install.lf-lang.org | sudo bash -s cli
```

También es posible utilizar un argumento `--prefix=<path>` para
seleccionar una ubicación diferente de instalación.

curl -Ls https://install.lf-lang.org | sudo bash -s cli --prefix=/home/codespace/.local/

### Extensión para Visual Studio Code

La extensión oficial puede instalarse desde VS Code utilizando:

``` text
Ctrl + P
ext install lf-lang.vscode-lingua-franca
```

También puede instalarse desde una terminal:

``` bash
code --install-extension lf-lang.vscode-lingua-franca
```

La extensión también funciona con herramientas compatibles con VS Code,
como Cursor.

### Verificación de la instalación

Una instalación básica para trabajar con el target C puede comprobarse
con:

``` bash
java -version
lfc --version
cc --version
cmake --version
```

En un entorno docente conviene comprobar estos comandos antes de
comenzar los ejercicios.

> **Nota:** Para Windows, la documentación actual recomienda utilizar
> **WSL** para la instalación de LF. El tutorial de CPS-IoT Week 2026
> también utiliza esta estrategia.

------------------------------------------------------------------------

# Tutorial

La siguiente secuencia está organizada a partir de los tutoriales
oficiales de Lingua Franca y puede utilizarse como ruta de aprendizaje
para el curso de Sistemas de Tiempo-Real.

## 1. A First Reactor

El primer ejercicio introduce la estructura mínima de un programa LF.

Un programa sencillo con target C puede ser:

``` lf
target C

main reactor {
    reaction(startup) {=
        printf("Hello World.\n");
    =}
}
```

Este ejemplo permite introducir:

-   `target C`.
-   `main reactor`.
-   `reaction`.
-   El evento `startup`.
-   Código C embebido dentro de una reaction.
-   Generación y ejecución del programa.

### Referencia

-   [A First Reactor --- Lingua
    Franca](https://www.lf-lang.org/docs/writing-reactors/a-first-reactor/)

------------------------------------------------------------------------

## 2. Time and Timers

El concepto de **tiempo lógico** es fundamental en Lingua Franca.

Los eventos de LF tienen una etiqueta temporal (*tag*) y el runtime
intenta mantener una relación controlada entre el tiempo lógico y el
tiempo físico durante la ejecución.

Los **timers** permiten generar eventos periódicos o eventos únicos.

Ejemplo:

``` lf
target C

main reactor {
    timer t(0, 1 sec)

    reaction(t) {=
        printf("Periodic event.\n");
    =}
}
```

En este caso:

-   `0` es el *offset* inicial.
-   `1 sec` es el período.
-   La reaction se activa periódicamente.
-   La periodicidad se expresa mediante tiempo lógico.

Este concepto permite conectar LF con temas fundamentales de Sistemas de
Tiempo-Real:

-   Periodic tasks.
-   Event-triggered tasks.
-   Sampling.
-   Temporal constraints.
-   Scheduling.
-   Logical time.
-   Physical time.
-   Deadlines.

### Referencia

-   [Time and Timers --- Lingua
    Franca](https://www.lf-lang.org/docs/writing-reactors/time-and-timers/)

------------------------------------------------------------------------

## 3. Composing Reactors

Una aplicación real puede construirse mediante varios reactors que se
comunican a través de **ports** y **connections**.

Una arquitectura típica puede incluir:

``` text
Sensor → Controller → Actuator
```

Cada componente puede modelarse como un reactor independiente.

Por ejemplo:

``` lf
reactor Sensor {
    output data: int

    timer t(0, 100 ms)

    reaction(t) -> data {=
        // Read sensor
        =}
}
```

El reactor puede conectarse posteriormente con un controlador y un
actuador.

La composición de reactors permite estudiar:

-   Modularidad.
-   Interfaces mediante puertos.
-   Flujo de datos.
-   Dependencias entre reactions.
-   Deterministic concurrency.
-   Jerarquías de componentes.
-   Diagramas automáticos del sistema.

### Referencia

-   [Composing Reactors --- Lingua
    Franca](https://www.lf-lang.org/docs/writing-reactors/composing-reactors/)

------------------------------------------------------------------------

# Tutorial on Lingua Franca in CPS-IoT Week 2026

El tutorial de **CPS-IoT Week 2026** constituye un recurso especialmente
relevante para complementar este tutorial académico.

El evento presentó Lingua Franca como un lenguaje de coordinación de
código abierto para la integración determinista de sistemas
ciberfísicos.

Se realizó el **11 de mayo de 2026**, en Saint-Malo, Francia, como
actividad asociada a CPS-IoT Week 2026.

El tutorial tuvo una duración aproximada de cuatro horas y combinó:

1.  Introducción conceptual.
2.  Demostraciones de sistemas CPS.
3.  Instalación y *Hello World*.
4.  Ejercicios prácticos.
5.  Discusión de concurrencia determinista.
6.  Tiempo lógico.
7.  Ejecución distribuida/federada.

Los ejercicios prácticos utilizaron principalmente los conceptos de LF
sobre sistemas ciberfísicos y el **target C**.

## Recursos del tutorial

-   [LF Tutorial at CPS-IoT Week
    2026](https://www.lf-lang.org/events/cpsweek-2026-tutorial/)
-   [Videos del tutorial ---
    YouTube](https://www.youtube.com/watch?v=lp4w3sL77-Y)

La documentación oficial también mantiene una página de videos del
proyecto:

-   [Lingua Franca --- Videos](https://www.lf-lang.org/docs/videos/)

### Temas especialmente relevantes para Sistemas de Tiempo-Real

El tutorial de CPS-IoT Week 2026 permite profundizar en:

-   Reactor-oriented programming.
-   Reactors, ports and connections.
-   Timers.
-   Logical time.
-   Deterministic concurrency.
-   Distributed/federated execution.
-   Integración de sistemas ciberfísicos.
-   Programación con C y Python.
-   Uso de VS Code.
-   LF Playground.

------------------------------------------------------------------------

# Lingua Franca's Playground

El **Lingua Franca Playground** contiene numerosos ejemplos que pueden
utilizarse para complementar las prácticas del curso.

El repositorio permite:

-   Explorar ejemplos de programas LF.
-   Ejecutarlos localmente.
-   Utilizar Visual Studio Code.
-   Utilizar GitHub Codespaces.
-   Utilizar Gitpod.
-   Examinar diferentes características del lenguaje.

### Repositorio

-   [Lingua Franca Playground ---
    GitHub](https://github.com/lf-lang/playground-lingua-franca/tree/main)

### Ejecución local

Una forma de comenzar es clonar el repositorio:

``` bash
git clone https://github.com/lf-lang/playground-lingua-franca.git
cd playground-lingua-franca
```

Después se puede abrir el proyecto con VS Code:

``` bash
code .
```

Los ejemplos se encuentran en:

``` text
examples/
```

Desde VS Code se puede utilizar el comando:

``` text
Lingua Franca: Build and Run
```

El Playground también proporciona entornos de desarrollo basados en la
nube mediante **GitHub Codespaces** y **Gitpod**.

------------------------------------------------------------------------

# Plataformas Embebidas

Una de las características particularmente interesantes de Lingua Franca
para un curso de **Sistemas de Tiempo-Real** es la posibilidad de
utilizar LF en plataformas embebidas.

La documentación del proyecto incluye soporte y plantillas para
diferentes plataformas y arquitecturas.

## Arduino

Lingua Franca puede utilizar el **target C** con la plataforma Arduino.
En este caso, el compilador de LF puede generar un sketch `.ino` que
posteriormente puede ser compilado y cargado utilizando `arduino-cli`.

### Documentación

-   [Arduino --- Lingua
    Franca](https://www.lf-lang.org/docs/embedded/arduino/)

### Conceptos a estudiar

La utilización de LF sobre Arduino permite relacionar los conceptos
abstractos del lenguaje con un sistema embebido real:

``` text
Sensor
   │
   ▼
Reactor
   │
   ▼
Control
   │
   ▼
Actuator
```

Esto permite estudiar experimentalmente:

-   Periodic sampling.
-   Event-triggered computation.
-   Sensor/actuator interfaces.
-   Timing constraints.
-   Embedded execution.
-   Generated C code.
-   Hardware interaction.

------------------------------------------------------------------------

# Propuesta de secuencia para el curso

Una posible secuencia didáctica basada en estos recursos es:

  Etapa   Tema                Actividad
  ------- ------------------- -----------------------------------
  1       Introducción a LF   Lectura de la documentación
  2       Instalación         Java 17+, LF CLI y VS Code
  3       Hello World         Primer reactor
  4       Eventos             `startup`, reactions y eventos
  5       Tiempo lógico       Introducción a logical time
  6       Timers              Tareas periódicas
  7       Reactors            Modelado de componentes
  8       Ports               Interfaces entre componentes
  9       Connections         Comunicación entre reactors
  10      Composición         Sensor--Controller--Actuator
  11      Determinismo        Orden de ejecución y concurrencia
  12      Playground          Exploración de ejemplos
  13      CPS-IoT Tutorial    Ejercicios prácticos
  14      Embedded            Implementación sobre Arduino
  15      Proyecto final      Sistema de Tiempo-Real completo

------------------------------------------------------------------------

# Referencias principales

1.  [Lingua Franca Documentation](https://www.lf-lang.org/docs/)
2.  [Lingua Franca
    Installation](https://www.lf-lang.org/docs/installation/)
3.  [Lingua Franca Installation
    Repository](https://github.com/lf-lang/installation)
4.  [A First
    Reactor](https://www.lf-lang.org/docs/writing-reactors/a-first-reactor/)
5.  [Time and
    Timers](https://www.lf-lang.org/docs/writing-reactors/time-and-timers/)
6.  [Composing
    Reactors](https://www.lf-lang.org/docs/writing-reactors/composing-reactors/)
7.  [CPS-IoT Week 2026
    Tutorial](https://www.lf-lang.org/events/cpsweek-2026-tutorial/)
8.  [CPS-IoT Week 2026 Tutorial
    Video](https://www.youtube.com/watch?v=lp4w3sL77-Y)
9.  [Lingua Franca
    Playground](https://github.com/lf-lang/playground-lingua-franca/tree/main)
10. [Lingua Franca ---
    Arduino](https://www.lf-lang.org/docs/embedded/arduino/)

------------------------------------------------------------------------

## Observación sobre versiones

La documentación oficial consultada actualmente corresponde a **Lingua
Franca 0.13.0**. Las páginas de documentación pueden cambiar entre
versiones; por ello, para las prácticas del curso se recomienda mantener
una versión del toolchain consistente entre los estudiantes y registrar
la versión utilizada mediante:

``` bash
lfc --version
```

Para un curso académico, esta práctica ayuda a evitar diferencias de
sintaxis, APIs o herramientas entre instalaciones.
