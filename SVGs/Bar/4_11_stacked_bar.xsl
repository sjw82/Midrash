<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/1999/xhtml" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output indent="yes"/>
    <xsl:variable name="barInterval" select="15"/>
    <xsl:variable name="barHeight" select="15"/>
    <!-- this is the height added for each instance of god -->
    <xsl:variable name="barWidth" select="15"/>
    <xsl:template match="/">
        <!-- <xsl:variable name="sorted" as="node()+">
            <xsl:for-each select="//midrashim/@book">
                <xsl:sort select="//ref[@god='Lord'] div sum(//ref)"
                    order="descending"/>
                <xsl:copy-of select="current()"/>
            </xsl:for-each>
        </xsl:variable> -->

        <html>
            <head>
                <title>Stacked Bar Chart of Word for God by Book</title>
            </head>
            <body>
                <div id="svg-wrap">
                    <svg:svg height="600">
                        <svg:g transform="translate(50, 400)">
                            <!-- y axis -->
                            <svg:line x1="20" y1="0" x2="20" y2="-{count(//ref/@god)*$barHeight}"
                                stroke="black" stroke-width="2"/>
                            <!-- x axis -->
                            <svg:line x1="20" y1="0" x2="405" y2="0" stroke="black" stroke-width="2"/>
                            <!-- 405 = 9 books * (30 bar width + 15 bar interval) -->
                            <xsl:apply-templates select="//midrashim"/>
                            <!-- <xsl:for-each select="$sorted">
                                <xsl:variable name="statePos" select="position()-1"/>
                                <xsl:variable name="xPosition"
                                    select="$statePos*$barInterval + sum($sorted[position() lt ($statePos + 1)]//@god)*2 + 22"/>
                            </xsl:for-each> -->
                        </svg:g>
                    </svg:svg>
                    <!-- <xsl:for-each select="//midrashim">
                                <xsl:variable name="color"> 
                                    <xsl:choose>
                                        <xsl:when test="@god='Lord'">blue</xsl:when>
                                        <xsl:when test="@god='mighty_God'">red</xsl:when>
                                        <xsl:when test="@god='Master_of_the_Universe'"
                                            >yellow</xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                    <rect x="" y="" stroke="" stroke-width="" width="" height="" fill="{$color}" />
                            </xsl:for-each> -->
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="midrashim">
        <xsl:variable name="preceding-bar" as="xs:integer"
            select="count(preceding-sibling::midrashim)"/>
        <svg:rect x="{$barInterval+($barWidth+$barInterval)*$preceding-bar}" y="0" width="20"
            height="100" fill="blue"/>
    </xsl:template>
</xsl:stylesheet>
