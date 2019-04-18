<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head><title>corpus</title></head>
            <body>
                <xsl:apply-templates select="//section"></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="section[@user eq 'ben']"> <!-- the selecting by use didn't work, just gonna separate manually -->
        <xsl:apply-templates select="//midrashim"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="midrashim">
        <h3><xsl:apply-templates select="source"></xsl:apply-templates></h3>
    <p><xsl:apply-templates select="p"></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="quotation">
        <xsl:text>“</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>”</xsl:text>
    </xsl:template>
    <xsl:template match="quote">
        <xsl:text>“</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>”</xsl:text>
    </xsl:template>
    <xsl:template match="speech">
        <span class="speech"><xsl:text>“</xsl:text>
        <xsl:apply-templates/>
            <xsl:text>”</xsl:text></span>
    </xsl:template>
    <xsl:template match="paren">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    <xsl:template match="ref[@rabbi]">
        <span class="rabbi">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="ref[@god]">
        <span class="god">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="ref[@character]">
        <span class="character">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>