<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtmlAlias"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <xhtml:a href="#news">&#8250; News</xhtml:a>
</xsl:template>

<xsl:template match="/data/news">
  <xhtml:h1><xhtml:a name="news"></xhtml:a>News</xhtml:h1>
  <xhtml:dl>
    <xsl:apply-templates />
  </xhtml:dl>
</xsl:template>

</xsl:stylesheet>
