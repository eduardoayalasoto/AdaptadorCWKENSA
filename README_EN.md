# AdaptadorCWKENSA - English Version

An XSLT 1.0 adapter for XML transformations that converts customer data into a structured and normalized format.

## Description

This project provides XSLT 1.0 transformations to convert input XML data into an adapted and structured format. It's especially useful for data integration from different systems and XML format normalization.

## Main Files

- `transform.xsl` - Main XSLT 1.0 stylesheet for transformations
- `sample_input.xml` - Sample input data file
- `sample_output.xml` - Example transformation result
- `test_transform.sh` - Test script to validate transformations

## Features

- ✅ XSLT 1.0 compatible
- ✅ Customer data transformation
- ✅ XML element normalization
- ✅ Address and order handling
- ✅ Email format conversion to lowercase
- ✅ Full name concatenation
- ✅ Currency validation with default values
- ✅ Automatic counting of records and orders

## Requirements

To run the transformations you need:

```bash
# On Ubuntu/Debian systems
sudo apt-get install xsltproc libxml2-utils

# On RedHat/CentOS systems
sudo yum install libxslt libxml2
```

## Usage

### Basic Transformation

```bash
# Run the transformation
xsltproc transform.xsl sample_input.xml > output.xml
```

### Test Script

```bash
# Make script executable (first time)
chmod +x test_transform.sh

# Run tests
./test_transform.sh
```

## License

This project is available under MIT license.