<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template match="data">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/data/documentation/item" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="/data/documentation/item">
<h1><xsl:call-template name="item-anchor" /></h1>

<xsl:for-each select="links/link">
<xsl:element name="a">
  <xsl:if test="external">
    <xsl:attribute name="target">_blank</xsl:attribute>
  </xsl:if>
  <xsl:attribute name="href">
    <xsl:value-of select="url" />
  </xsl:attribute>

  <xsl:value-of select="text" />
</xsl:element>

<br />
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
