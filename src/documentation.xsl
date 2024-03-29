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
    <xsl:with-param name="items" select="/data/documentation/item" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="/data/documentation">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="/data/documentation/item">
  <xsl:apply-templates />
</xsl:template>

</xsl:stylesheet>
