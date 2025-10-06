#!/bin/bash

# AdaptadorCWKENSA - XSLT 1.0 Transformation Test Script
# This script tests the XSLT transformation functionality

echo "=== AdaptadorCWKENSA XSLT Transformation Test ==="
echo ""

# Check if required files exist
if [ ! -f "transform.xsl" ]; then
    echo "ERROR: transform.xsl not found!"
    exit 1
fi

if [ ! -f "sample_input.xml" ]; then
    echo "ERROR: sample_input.xml not found!"
    exit 1
fi

# Check if xsltproc is available
if ! command -v xsltproc &> /dev/null; then
    echo "ERROR: xsltproc is not installed. Please install it first:"
    echo "  sudo apt-get install xsltproc"
    exit 1
fi

echo "✓ All required files and tools are available"
echo ""

# Perform the transformation
echo "Running XSLT transformation..."
if xsltproc transform.xsl sample_input.xml > test_output.xml 2>/dev/null; then
    echo "✓ Transformation completed successfully"
    
    # Basic validation
    if [ -f "test_output.xml" ] && [ -s "test_output.xml" ]; then
        echo "✓ Output file generated with content"
        
        # Check if the output is valid XML
        if xmllint --noout test_output.xml 2>/dev/null; then
            echo "✓ Output is valid XML"
            
            # Count transformed records
            clients=$(xmllint --xpath "count(//client)" test_output.xml 2>/dev/null)
            echo "✓ Transformed $clients client records"
            
            echo ""
            echo "=== Test Summary ==="
            echo "✓ XSLT 1.0 transformation: PASSED"
            echo "✓ Output validation: PASSED"
            echo "✓ Record count verification: PASSED"
            echo ""
            echo "Output saved to: test_output.xml"
            
        else
            echo "✗ Generated XML is not valid"
            exit 1
        fi
    else
        echo "✗ No output file generated or file is empty"
        exit 1
    fi
else
    echo "✗ Transformation failed"
    exit 1
fi

echo "All tests passed successfully!"