<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/"> 
        <html>
            <head>
                <title></title>
            </head>
            <body>
                <h1></h1>
                <ul>
                    <xsl:apply-templates select="//"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="">
            <li><xsl:apply-templates select=""/></li>
    </xsl:template>
</xsl:stylesheet>