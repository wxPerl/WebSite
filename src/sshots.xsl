<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtmlAlias"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />
<xsl:variable name="skip-navigation">1</xsl:variable>
<xsl:variable name="body-style">margin: 10mm 5mm 0 10mm</xsl:variable>

<!-- navigation bar -->
<xsl:template name="fw-bw">
  <xhtml:div>
    <!-- previous -->
    <xsl:if test="$page &gt; 1">
      <xhtml:div class="LHS">
        <xsl:element name="a"><xsl:attribute name="href">sshot<xsl:number value="$page - 1" format="01"/>.html</xsl:attribute>Previous</xsl:element>
      </xhtml:div>
    </xsl:if>

    <!-- next -->
    <xsl:if test="$page &lt; count(../page)">
      <xhtml:div class="RHS">
        <xsl:element name="a"><xsl:attribute name="href">sshot<xsl:number value="$page + 1" format="01"/>.html</xsl:attribute>Next</xsl:element>
      </xhtml:div>
    </xsl:if>  
  </xhtml:div>
</xsl:template>

<!-- skip pages different from the current one -->
<xsl:template match="/screenshots/page[position() != $page]" />

<!-- current page -->
<xsl:template match="/screenshots/page[position() = $page]">
  <!-- top navigation -->
  <xsl:call-template name="fw-bw" />
  <xhtml:br /><xhtml:br />

  <!-- images -->
  <xhtml:div>
    <xsl:apply-templates select="description" />
    <xsl:apply-templates select="image" />
  </xhtml:div>

  <!-- bottom navigation -->
  <xsl:call-template name="fw-bw" />
  <xhtml:br />
</xsl:template>

<!-- single image -->
<xsl:template match="image">
  <xhtml:div style="padding: 20pt; text-align: center;">
    <xsl:value-of select="text" /><xhtml:br />

    <xhtml:img alt="{text}" src="{file}" />
  </xhtml:div>
</xsl:template>

</xsl:stylesheet>
