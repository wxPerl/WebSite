<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />
<xsl:variable name="skip-navigation">1</xsl:variable>
<xsl:variable name="body-style">margin: 10mm 5mm 0 10mm</xsl:variable>

<!-- navigation bar -->
<xsl:template name="fw-bw">
  <div>
    <!-- previous -->
    <xsl:if test="$page &gt; 1">
      <div class="LHS">
        <xsl:element name="a"><xsl:attribute name="href">sshot<xsl:number value="$page - 1" format="01"/>.html</xsl:attribute>Previous</xsl:element>
      </div>
    </xsl:if>

    <!-- next -->
    <xsl:if test="$page &lt; count(../page)">
      <div class="RHS">
        <xsl:element name="a"><xsl:attribute name="href">sshot<xsl:number value="$page + 1" format="01"/>.html</xsl:attribute>Next</xsl:element>
      </div>
    </xsl:if>  
  </div>
</xsl:template>

<!-- current page -->
<xsl:template name="current-sshot-page">
  <!-- top navigation -->
  <xsl:call-template name="fw-bw" />
  <br /><br />

  <!-- images -->
  <div>
    <xsl:apply-templates select="description" />
    <xsl:apply-templates select="image" />
  </div>

  <!-- bottom navigation -->
  <xsl:call-template name="fw-bw" />
  <br />
</xsl:template>

<!-- process current page, skip others -->
<xsl:template match="/screenshots">
  <xsl:for-each select="page[position() = $page]">
    <xsl:call-template name="current-sshot-page" />
  </xsl:for-each>
</xsl:template>

<!-- single image -->
<xsl:template match="image">
  <div style="padding: 20pt; text-align: center;">
    <xsl:value-of select="text" /><br />

    <img alt="{text}" src="{file}" />
  </div>
</xsl:template>

</xsl:stylesheet>
