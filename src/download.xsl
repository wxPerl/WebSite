<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template match="data">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/data/download/item" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="/data/download/item">
<h1><xsl:call-template name="item-anchor" /></h1>

<div class="wxperl-news">
  <xsl:copy-of select="content/child::node()" />
</div>  
</xsl:template>

</xsl:stylesheet>
