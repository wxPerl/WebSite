<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/support/item" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="/support/item">
<xsl:apply-templates select="title" />

<xsl:choose>
  <!-- preformatted text -->
  <xsl:when test="content">
    <xsl:apply-templates select="content" />
  </xsl:when>
  <!-- list of modules -->
  <xsl:otherwise>
    <dl>
    <xsl:for-each select="module">
      <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                       'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      <dt>
        <b>
        <xsl:choose>
          <xsl:when test="distname">
            <a xsl:use-attribute-sets="a-target"
               href="http://search.cpan.org/dist/{distname}">
              <tt><xsl:value-of select="name" /></tt>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <tt><xsl:value-of select="name" /></tt>
          </xsl:otherwise>
        </xsl:choose></b>:</dt>
        <dd>
        <xsl:apply-templates select="description" />
        <br />
        <b>Author: </b><xsl:choose>
          <xsl:when test="author/site">
            <a>
              <xsl:attribute name="href"><xsl:value-of select="author/site" /></xsl:attribute>
              <xsl:value-of select="author/name" />
            </a>
          </xsl:when>
          <xsl:when test="author/email">
            <a>
              <xsl:attribute name="href">mailto:<xsl:value-of select="author/email" /></xsl:attribute>
              <xsl:value-of select="author/name" />
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="author/name" />
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="download">
          <br />
          <b>Download: </b>
          <xsl:for-each select="download/item">
            <a href="{url}"><xsl:value-of select="label" /></a>
            <xsl:if test="position()!=last()">, </xsl:if>
          </xsl:for-each>
        </xsl:if>
        </dd>
    </xsl:for-each>
    </dl>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>
