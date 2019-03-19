<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <xsl:apply-templates select="//midrashim"/>
    </xsl:template>
    <xsl:template match="midrashim">
        <xsl:result-document method="text" href="{translate(concat('MALLET/', source/midtext, source/midpass, count(preceding-sibling::midrashim),'.txt'), ' ', '')}">
            <xsl:sequence select="p/string()"/>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>