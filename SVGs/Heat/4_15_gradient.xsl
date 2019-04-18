<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/1999/xhtml" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output indent="yes" doctype-system="about:legacy-compat"/>
    <!-- //@bibverse ! replace(., "\d.*", "") ! replace(.,"^II?[Ss]am","sam") ! lower-case(.) -->
    <!-- Tool Tips = svg:title in rects -->
    <!--   <xsl:variable name="torah" as="xs:string+"
        select="('genesis', 'exodus', 'leviticus', 'numbers', 'deuteronomy')"/>
    <xsl:variable name="prophets" as="xs:string+"
        select="('joshua', 'judges', 'samuel', 'kings', 'isaiah', 'jeremiah', 'ezekial', 'twelve')"/>
    <xsl:variable name="writings" as="xs:string+"
        select="('psalm', 'proverbs', 'job', 'songofsongs', 'ruth', 'lamentations', 'ecclesiastes', 'esther', 'daniel', 'ezra', 'chronicles')"/>-->
    <xsl:variable name="root" select="/"/>
    <xsl:variable name="books" as="xs:string+"
        select="('genesis', 'exodus', 'leviticus', 'numbers', 'deuteronomy', 'joshua', 'judges', 'samuel', 'kings', 'isaiah', 'jeremiah', 'ezekial', 'twelve', 'psalm', 'proverbs', 'job', 'songofsongs', 'ruth', 'lamentations', 'ecclesiastes', 'esther', 'daniel', 'ezra', 'chronicles')"/>
    <xsl:variable name="dimension" as="xs:integer" select="30"/>
    <xsl:variable name="sorted-midrashim" as="element(midrashim)+"
        select="
            sort(//midrashim, (), function ($x) {
                normalize-space($x)
            })"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Gradient</title>
            </head>
            <body>
                <div class="svgwrap">
                    <svg:svg height="{count(//midrashim) * $dimension}" width="100%">
                        <xsl:apply-templates select="$sorted-midrashim"/>
                    </svg:svg>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="midrashim">
        <xsl:variable name="current-mid" select="current()"/>
        <xsl:variable name="midrashpos" as="xs:integer" select="position() - 1"/>
        <xsl:variable name="labelwidth" as="xs:integer" select="320"/>
        <svg:g>
            <xsl:variable name="ypos" as="xs:double" select="$midrashpos * $dimension"/>

            <!-- could put all of this in a for-each, consider the multiplier on y -->
            <!-- hsl vs hsv, color -->

            <svg:rect x="0" y="{$ypos}" height="{$dimension}" width="{$labelwidth}" stroke="black"
                stroke-width="1" fill="white"/>
            <svg:text x="5" y="{$ypos  + .5 * $dimension}" alignment-baseline="middle">
                <xsl:value-of
                    select="string-join(source/(* except edition), ' ') => replace('\(midrash\)', '')"
                />
            </svg:text>
            <xsl:for-each select="$books">
                <xsl:variable name="current-book" select="current()"/>
                <xsl:variable name="match" select="count($current-mid//ref[@bibverse eq $current-book])"/>
                <xsl:variable name="xpos" as="xs:double"
                    select="(position() - 1) * $dimension + $labelwidth"/>
                <svg:text x="{$xpos + .5 * $dimension}" y="{$ypos + .5 * $dimension}"
                    text-anchor="middle" alignment-baseline="middle">
                    <xsl:value-of select="upper-case(substring(., 1, 1)) || substring(., 2, 1)"/>
                </svg:text>
                <!--<svg:rect x="{$xpos}" y="{$ypos}" width="{$dimension}" height="{$dimension}"
                    stroke="black" stroke-width="1" fill="white" fill-opacity="0">
                    <svg:title>
                        <xsl:value-of select="."/>
                    </svg:title>
                </svg:rect>-->
            </xsl:for-each>
        </svg:g>
    </xsl:template>
</xsl:stylesheet>
<!-- figure out first how to clip off the numbers -->
