# SOAP Number Conversion - Proyecto Multilenguaje

## Descripción

Este proyecto tiene como objetivo demostrar el consumo de servicios web SOAP desde diferentes lenguajes de programación del lado del servidor.

Se utiliza el servicio web público:

https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL

El proyecto implementa tres versiones para cada lenguaje:

### Versión 1 - Cliente SOAP

Consume el servicio SOAP y devuelve el número en letras en inglés.

Ejemplo:

Entrada:

```text
http://localhost:8000/?n=10
```

Salida:

```text
ten
```

### Versión 2 - SOAP + Traducción

Consume el servicio SOAP y traduce el resultado al español.

Ejemplo:

Entrada:

```text
http://localhost:8000/?n=10
```

Salida:

```text
diez
```

### Versión 3 - Conversión Directa

Convierte números a letras en español sin utilizar SOAP.

Ejemplo:

Entrada:

```text
http://localhost:8000/?n=10
```

Salida:

```text
diez
```

---

# Estructura del Proyecto

```text
soap-number-conversion-multilanguage/

├── ruby/
├── perl/
├── nodejs/
├── dotnet10/
├── golang/
├── java/
├── cpp/
└── rust/
```

---

# Ruby

## Instalar Dependencias

```bash
gem install savon
gem install google_translate
gem install humanize
```

## Ejecutar Versión 1

```bash
ruby clisoap1.rb
```

## Ejecutar Versión 2

```bash
ruby clisoap2.rb
```

## Ejecutar Versión 3

```bash
ruby connumero.rb
```

## Probar

```text
http://localhost:8000/?n=10
```

---

# Perl

## Instalar Dependencias

```bash
cpan SOAP::Lite
cpan HTTP::Server::Simple::CGI
cpan LWP::UserAgent
cpan JSON
cpan URI::Escape
cpan Lingua::ES::Numeros
```

## Ejecutar Versión 1

```bash
perl clisoap1.pl
```

## Ejecutar Versión 2

```bash
perl clisoap2.pl
```

## Ejecutar Versión 3

```bash
perl connumero.pl
```

## Probar

```text
http://localhost:8000/?n=10
```

---

# Node.js

## Instalar Dependencias

```bash
npm install
npm install soap
npm install translate-google
npm install num2words
```

## Ejecutar Versión 1

```bash
node app.js
```

## Ejecutar Versión 2

```bash
node app.js
```

## Ejecutar Versión 3

```bash
node app.js
```

## Probar

```text
http://localhost:3000/?n=10
```

---

# .NET 10

## Restaurar Dependencias

```bash
dotnet restore
```

## Ejecutar Versión 1

```bash
dotnet run
```

## Ejecutar Versión 2

```bash
dotnet run
```

## Ejecutar Versión 3

```bash
dotnet run
```

## Probar

```text
http://localhost:5000/?n=10
```

---

# Golang

## Instalar Dependencias

```bash
go mod tidy
```

## Ejecutar

```bash
go run main.go
```

## Probar

```text
http://localhost:8000/?n=10
```

---

# Java

## Compilar

```bash
mvn clean install
```

## Ejecutar

```bash
mvn exec:java -Dexec.mainClass="com.soap.App"
```

## Probar

```text
http://localhost:8000/?n=10
```

---

# C++

## Compilar

```bash
g++ main.cpp -o app
```

## Ejecutar

```bash
./app
```

Windows:

```bash
app.exe
```

## Probar

```text
10
100
1000
```

---

# Rust

## Compilar

```bash
cargo build
```

## Ejecutar

```bash
cargo run
```

## Probar

```text
http://localhost:8000/?n=10
```

---

# Casos de Prueba

## Caso 1

Entrada:

```text
10
```

Resultados:

```text
SOAP: ten
Traducido: diez
Directo: diez
```

## Caso 2

Entrada:

```text
100
```

Resultados:

```text
SOAP: one hundred
Traducido: cien
Directo: cien
```

## Caso 3

Entrada:

```text
1000
```

Resultados:

```text
SOAP: one thousand
Traducido: mil
Directo: mil
```

---

# Resultados

Se desarrollaron correctamente 24 aplicaciones distribuidas en 8 lenguajes de programación:

* Ruby
* Perl
* Node.js
* .NET 10
* Golang
* Java
* C++
* Rust

Cada lenguaje implementa:

* Cliente SOAP
* Cliente SOAP con traducción
* Conversión directa en español

Total:

```text
8 Lenguajes × 3 Versiones = 24 Aplicaciones
```

---

# Autor

Manuel Pérez López

## Materia

Servicios Web SOAP

## Profesor

Javier Nolasco Hernández
