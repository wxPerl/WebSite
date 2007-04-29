<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/data/home/item" />
  </xsl:call-template>
  <a href="sshot01.html">&#8250; Screenshots</a>
  <a href="users.html">&#8250; Users</a>
</xsl:template>

<xsl:template match="/data/home">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="/data/news">
  <dl>
    <xsl:apply-templates select="item[position() &lt; 5]" />
  </dl>
  <a href="news.html">older news...</a>
</xsl:template>

</xsl:stylesheet>
