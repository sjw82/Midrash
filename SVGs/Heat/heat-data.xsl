<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <data>
            <xsl:apply-templates select="//midrashim"/>
        </data>
    </xsl:template>
    <xsl:template match="midrashim">
        <midrashim book="{@book}">
            <source>
                <midtext><xsl:value-of select="source/midtext"/></midtext>
                <midpass><xsl:value-of select="source/midpass"/></midpass>
            </source>
            <xsl:apply-templates select="//ref[@bibverse]"/>
        </midrashim>
    </xsl:template>
    <xsl:template match="midtext"/>
    <xsl:template match="midpass"/>
    <xsl:template match="ref[@bibverse]">
        <xsl:choose>
            <xsl:when test="contains(@bibverse, ' ')">
                <xsl:variable name="multiple-verses" select="tokenize(@bibverse, ' ')"/>
                <xsl:for-each select="$multiple-verses">
                    <xsl:variable name="current-verse" select="current()"/>
                    <ref bibverse="{replace($current-verse, '[0-9:]+', '')}"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <ref bibverse="{replace(@bibverse, '[0-9:]+', '')}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
