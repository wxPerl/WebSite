<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtmlAlias"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/data/home/item" />
  </xsl:call-template>
  <xhtml:a href="sshot01.html">&#8250; Screenshots</xhtml:a>
  <xhtml:a href="users.html">&#8250; Users</xhtml:a>
</xsl:template>

<xsl:template match="/data/home">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="/data/news">
  <xhtml:dl>
    <xsl:apply-templates select="item[position() &lt; 5]" />
  </xhtml:dl>
  <xhtml:a href="news.html">older news...</xhtml:a>
</xsl:template>

</xsl:stylesheet>
