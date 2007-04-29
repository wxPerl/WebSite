<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <a href="#news">&#8250; News</a>
</xsl:template>

<xsl:template match="/data/news">
  <h1><a name="news"></a>News</h1>
  <dl>
    <xsl:apply-templates />
  </dl>
</xsl:template>

</xsl:stylesheet>
