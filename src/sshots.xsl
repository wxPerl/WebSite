<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fw-bw">
<!-- navigation bar -->
<div>
  <table width="100%">
    <tr>
      <td align="left">
        <xsl:if test="$page &gt; 1">
          <xsl:element name="a">
            <xsl:attribute name="href">sshot<xsl:number value="$page - 1" format="01"/>.html</xsl:attribute>
            Previous
          </xsl:element>
        </xsl:if>
      </td>
      <td align="right">
        <xsl:if test="$page &lt; count(../page)">
          <xsl:element name="a">
            <xsl:attribute name="href">sshot<xsl:number value="$page + 1" format="01"/>.html</xsl:attribute>
            Next
          </xsl:element>
        </xsl:if>
      </td>
    </tr>
  </table>
</div>
</xsl:template>

<xsl:template match="/screenshots/page[position() = $page]">

<xsl:call-template name="fw-bw" />

<!-- images -->
<div class="screenshots">
  <xsl:copy-of select="description/child::node()" />
  <xsl:apply-templates select="image" />
</div>

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
