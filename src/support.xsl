<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template match="support">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/support/item" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="/support/item">
<h1><xsl:call-template name="item-anchor" /></h1>

<xsl:choose>
  <!-- preformatted text -->
  <xsl:when test="content">
    <xsl:copy-of select="content/child::node()" />
  </xsl:when>
  <!-- list of modules -->
  <xsl:otherwise>
    <xsl:for-each select="module">
      <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                       'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      <div class="module">
        <b>
        <xsl:choose>
          <xsl:when test="distname">
            <xsl:element name="a">
              <xsl:attribute name="href">http://search.cpan.org/dist/<xsl:value-of select="distname" />/</xsl:attribute>
              <xsl:attribute name="target">_blank</xsl:attribute>
              <tt><xsl:value-of select="name" /></tt>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <tt><xsl:value-of select="name" /></tt>
          </xsl:otherwise>
        </xsl:choose></b>:
        <div class="module-description">
        <xsl:copy-of select="description/child::node()" />
        <br />
        <b>Author: </b> <xsl:value-of select="author/name" />
        <xsl:if test="download">
          <br />
          <b>Download: </b>
          <xsl:for-each select="download/item">
            <xsl:element name="a">
              <xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
              <xsl:attribute name="target">_blank</xsl:attribute>
              <xsl:value-of select="label" />
            </xsl:element>
            <xsl:if test="position()!=last()">, </xsl:if>
          </xsl:for-each>
        </xsl:if>
        </div>
      </div>
    </xsl:for-each>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>
