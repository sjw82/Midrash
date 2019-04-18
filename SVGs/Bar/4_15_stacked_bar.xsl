<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barInterval" as="xs:integer" select="15"/>
    <xsl:variable name="barHeight" as="xs:integer" select="15"/> <!-- this is the height added for each instance of god -->
    <xsl:template match="/">
        <svg>
            <g transform="translate(80,400)">
                <line x1="0" y1="0" x2="100" y2="0" stroke="black" stroke-width="2"
                    stroke-linecap="4"/>
                <line x1="0" y1="0" x2="0" y2="-400" stroke="black" stroke-width="2"/>
            </g>
        </svg> 
    </xsl:template>
</xsl:stylesheet>