<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fw-bw">
<!-- navigation bar -->
<div>
  <xsl:if test="$page &gt; 1">
    <div class="LHS">
      <xsl:element name="a"><xsl:attribute name="href">sshot<xsl:number value="$page - 1" format="01"/>.html</xsl:attribute>Previous</xsl:element>
    </div>
  </xsl:if>

  <xsl:if test="$page &lt; count(../page)">
    <div class="RHS">
      <xsl:element name="a"><xsl:attribute name="href">sshot<xsl:number value="$page + 1" format="01"/>.html</xsl:attribute>Next</xsl:element>
    </div>
  </xsl:if>  
</div>
</xsl:template>

<xsl:template match="/screenshots/page[position() = $page]">

<xsl:call-template name="fw-bw" />
<br /><br />

<!-- images -->
<div class="screenshots">
  <xsl:copy-of select="description/child::node()" />
  <xsl:apply-templates select="image" />
</div>

<br /><br />
<xsl:call-template name="fw-bw" />

</xsl:template>

<xsl:template match="/screenshots/page[position() = $page]/image">
<div>
  <xsl:value-of select="text" /><br />

  <xsl:element name="img">
    <xsl:attribute name="alt">
      <xsl:value-of select="text" />
    </xsl:attribute>
    <xsl:attribute name="src">
      <xsl:value-of select="file" />
    </xsl:attribute>
  </xsl:element>
</div>
</xsl:template>

</xsl:stylesheet>
