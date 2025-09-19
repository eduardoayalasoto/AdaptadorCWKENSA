<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Output method configuration -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <!-- Root template -->
    <xsl:template match="/">
        <adaptedData>
            <xsl:attribute name="version">1.0</xsl:attribute>
            
            <!-- Process the root element -->
            <xsl:apply-templates select="*"/>
        </adaptedData>
    </xsl:template>
    
    <!-- Template for processing customer data -->
    <xsl:template match="customers">
        <clientList>
            <xsl:attribute name="count">
                <xsl:value-of select="count(customer)"/>
            </xsl:attribute>
            <xsl:apply-templates select="customer"/>
        </clientList>
    </xsl:template>
    
    <!-- Template for individual customer records -->
    <xsl:template match="customer">
        <client>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            
            <!-- Transform customer name -->
            <fullName>
                <xsl:value-of select="concat(firstName, ' ', lastName)"/>
            </fullName>
            
            <!-- Transform email to lowercase -->
            <emailAddress>
                <xsl:value-of select="translate(email, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
            </emailAddress>
            
            <!-- Process contact information -->
            <xsl:if test="phone">
                <contactPhone>
                    <xsl:value-of select="phone"/>
                </contactPhone>
            </xsl:if>
            
            <!-- Transform address if present -->
            <xsl:if test="address">
                <location>
                    <street><xsl:value-of select="address/street"/></street>
                    <city><xsl:value-of select="address/city"/></city>
                    <xsl:if test="address/zipCode">
                        <postalCode><xsl:value-of select="address/zipCode"/></postalCode>
                    </xsl:if>
                    <xsl:if test="address/country">
                        <nation><xsl:value-of select="address/country"/></nation>
                    </xsl:if>
                </location>
            </xsl:if>
            
            <!-- Process orders if present -->
            <xsl:if test="orders/order">
                <purchaseHistory>
                    <xsl:attribute name="totalOrders">
                        <xsl:value-of select="count(orders/order)"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="orders/order"/>
                </purchaseHistory>
            </xsl:if>
        </client>
    </xsl:template>
    
    <!-- Template for order processing -->
    <xsl:template match="order">
        <purchase>
            <xsl:attribute name="orderNumber">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <orderDate><xsl:value-of select="date"/></orderDate>
            <totalAmount>
                <xsl:attribute name="currency">
                    <xsl:choose>
                        <xsl:when test="@currency">
                            <xsl:value-of select="@currency"/>
                        </xsl:when>
                        <xsl:otherwise>USD</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="total"/>
            </totalAmount>
            
            <!-- Process items -->
            <xsl:if test="items/item">
                <itemList>
                    <xsl:apply-templates select="items/item"/>
                </itemList>
            </xsl:if>
        </purchase>
    </xsl:template>
    
    <!-- Template for item processing -->
    <xsl:template match="item">
        <product>
            <productName><xsl:value-of select="name"/></productName>
            <quantity><xsl:value-of select="quantity"/></quantity>
            <unitPrice><xsl:value-of select="price"/></unitPrice>
            <xsl:if test="category">
                <productCategory><xsl:value-of select="category"/></productCategory>
            </xsl:if>
        </product>
    </xsl:template>
    
    <!-- Generic template for processing unknown elements -->
    <xsl:template match="*">
        <unknownElement>
            <xsl:attribute name="originalName">
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </unknownElement>
    </xsl:template>
    
    <!-- Template to skip text nodes by default -->
    <xsl:template match="text()"/>
    
</xsl:stylesheet>