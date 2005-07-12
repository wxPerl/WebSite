<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <xsl:call-template name="page-head-links">
    <xsl:with-param name="items" select="/data/download/item" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="/data/versions" />

<xsl:template match="/data/download">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="win32-ppm">
  <a xsl:use-attribute-sets="a-target">
    <xsl:attribute name="href" xml:space="default">
      <xsl:text>http://prdownloads.sourceforge.net/wxperl/Wx-</xsl:text>
      <xsl:if test="@dev=1">
        <xsl:text>dev-</xsl:text>
      </xsl:if>
      <xsl:value-of select="/data/versions/wxperl" />
      <xsl:text>-wxmsw</xsl:text>
      <xsl:value-of select="/data/versions/win32/wxwidgets" />
      <xsl:text>-win32-</xsl:text>
      <xsl:if test="@unicode=1">
        <xsl:text>u-</xsl:text>
      </xsl:if>
      <xsl:value-of select="/data/versions/win32/perl" />
      <xsl:text>.zip</xsl:text>
    </xsl:attribute>
      
    <xsl:copy-of select="child::node()" />
  </a>
</xsl:template>

<xsl:template match="linux-rpm">
  <a xsl:use-attribute-sets="a-target">
    <xsl:attribute name="href" xml:space="default">
      <xsl:text>http://prdownloads.sourceforge.net/wxperl/perl-Wx-</xsl:text>
      <xsl:value-of select="/data/versions/wxperl" />
      <xsl:text>-1</xsl:text>
      <xsl:choose>
        <xsl:when test="@src=1">
          <xsl:text>.src</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>_wxgtk</xsl:text>
          <xsl:value-of select="/data/versions/linux/wxwidgets" />
          <xsl:text>.i386</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>.rpm</xsl:text>
    </xsl:attribute>

    <xsl:copy-of select="child::node()" />
  </a>
</xsl:template>

<xsl:template match="mac-dmg">
  <a xsl:use-attribute-sets="a-target">
    <xsl:attribute name="href" xml:space="default">
      <xsl:text>http://prdownloads.sourceforge.net/wxperl/wxPerl-</xsl:text>
      <xsl:value-of select="/data/versions/wxperl" />
      <xsl:text>-wxmac</xsl:text>
      <xsl:value-of select="/data/versions/linux/wxwidgets" />
      <xsl:text>-osx</xsl:text>
      <xsl:value-of select="@osx" />
      <xsl:text>-u.dmg</xsl:text>
    </xsl:attribute>

    <xsl:copy-of select="child::node()" />
  </a>
</xsl:template>

<xsl:template match="src-cpan">
  <a xsl:use-attribute-sets="a-target">
    <xsl:attribute name="href" xml:space="default">
      <xsl:text>http://prdownloads.sourceforge.net/wxperl/Wx-</xsl:text>
      <xsl:value-of select="/data/versions/wxperl" />
      <xsl:text>.tar.gz</xsl:text>
    </xsl:attribute>

    <xsl:copy-of select="child::node()" />
  </a>
</xsl:template>

</xsl:stylesheet>
