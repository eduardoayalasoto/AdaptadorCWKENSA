# AdaptadorCWKENSA

Un adaptador XSLT 1.0 para transformaciones XML que convierte datos de clientes en un formato estructurado y normalizado.

## Descripción

Este proyecto proporciona transformaciones XSLT 1.0 para convertir datos XML de entrada en un formato adaptado y estructurado. Es especialmente útil para la integración de datos de diferentes sistemas y la normalización de formatos XML.

## Archivos Principales

- `transform.xsl` - Hoja de estilo XSLT 1.0 principal para transformaciones
- `sample_input.xml` - Archivo de ejemplo con datos de entrada
- `sample_output.xml` - Ejemplo del resultado de la transformación
- `test_transform.sh` - Script de prueba para validar las transformaciones

## Características

- ✅ Compatible con XSLT 1.0
- ✅ Transformación de datos de clientes
- ✅ Normalización de elementos XML
- ✅ Manejo de direcciones y pedidos
- ✅ Conversión de formato de email a minúsculas
- ✅ Concatenación de nombres completos
- ✅ Validación de monedas con valor por defecto
- ✅ Conteo automático de registros y pedidos

## Requisitos

Para ejecutar las transformaciones necesitas:

```bash
# En sistemas Ubuntu/Debian
sudo apt-get install xsltproc libxml2-utils

# En sistemas RedHat/CentOS
sudo yum install libxslt libxml2
```

## Uso

### Transformación Básica

```bash
# Ejecutar la transformación
xsltproc transform.xsl sample_input.xml > output.xml
```

### Script de Prueba

```bash
# Hacer el script ejecutable (primera vez)
chmod +x test_transform.sh

# Ejecutar las pruebas
./test_transform.sh
```

### Ejemplo de Transformación

**Entrada (sample_input.xml):**
```xml
<customers>
    <customer id="C001">
        <firstName>Juan</firstName>
        <lastName>Pérez</lastName>
        <email>JUAN.PEREZ@EXAMPLE.COM</email>
        <phone>+1-555-0123</phone>
        <!-- ... más datos ... -->
    </customer>
</customers>
```

**Salida (después de la transformación):**
```xml
<adaptedData version="1.0">
    <clientList count="1">
        <client id="C001">
            <fullName>Juan Pérez</fullName>
            <emailAddress>juan.perez@example.com</emailAddress>
            <contactPhone>+1-555-0123</contactPhone>
            <!-- ... datos transformados ... -->
        </client>
    </clientList>
</adaptedData>
```

## Transformaciones Aplicadas

1. **Estructura de datos**: Convierte `customers/customer` a `clientList/client`
2. **Nombres**: Concatena `firstName` y `lastName` en `fullName`
3. **Email**: Convierte a minúsculas automáticamente
4. **Direcciones**: Reorganiza campos de dirección con nuevos nombres
5. **Pedidos**: Transforma pedidos con conteo automático
6. **Monedas**: Aplica USD como moneda por defecto si no se especifica
7. **Contadores**: Añade atributos de conteo para listas y colecciones

## Estructura del XML de Salida

- `adaptedData` - Elemento raíz con versión
  - `clientList` - Lista de clientes con conteo total
    - `client` - Datos individuales del cliente
      - `fullName` - Nombre completo concatenado
      - `emailAddress` - Email normalizado
      - `contactPhone` - Teléfono de contacto
      - `location` - Información de dirección reorganizada
      - `purchaseHistory` - Historial de compras (si existe)

## Validación

El script `test_transform.sh` incluye:

- ✅ Verificación de archivos requeridos
- ✅ Validación de herramientas instaladas
- ✅ Ejecución de la transformación
- ✅ Validación de XML de salida
- ✅ Conteo de registros transformados

## Personalización

Para adaptar el XSLT a tus necesidades:

1. Modifica los templates en `transform.xsl`
2. Ajusta los nombres de elementos de salida
3. Añade nuevas reglas de transformación
4. Actualiza los archivos de ejemplo

## Contribución

Para contribuir al proyecto:

1. Fork el repositorio
2. Crea una rama para tu función
3. Realiza tus cambios
4. Ejecuta las pruebas
5. Envía un pull request

## Licencia

Este proyecto está disponible bajo licencia MIT.