<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template match="/data/news/item">
<div class="wxperl-news">
  <b><xsl:value-of select="date" /></b> - 
  <xsl:copy-of select="content/child::node()" />
</div>  
</xsl:template>

</xsl:stylesheet>
