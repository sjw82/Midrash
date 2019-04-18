<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>blah</title>
            </head>
            <body>
                <xsl:apply-templates select="//section"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//section[@user eq 'sam']">
        <h1>Sam</h1>
        <h2>Characters</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@character)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Words for God</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@god)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Rabbis</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@rabbi)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="//section[@user eq 'Ben']">
        <h1>Ben</h1>
        <h2>Characters</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@character)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Words for God</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@god)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Rabbis</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@rabbi)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="//section[@user eq 'Thyra']">
        <h1>Thyra</h1>
        <h2>Characters</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@character)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Words for God</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@god)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Rabbis</h2>
        <ul>
            <xsl:for-each select="distinct-values(//ref/@rabbi)">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
