<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"
            indent="yes"
            doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />

<!-- suppress pass-through -->
<xsl:template match="text()|@*" />

<!-- utility templates -->
<xsl:template name="item-link">
  <xsl:element name="a">
    <xsl:attribute name="href">#<xsl:choose>
        <xsl:when test="./anchor">
          <xsl:value-of select="./anchor" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./title" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <xsl:value-of select="./title" />
  </xsl:element>
</xsl:template>

<xsl:template name="item-anchor">
  <xsl:element name="a">
    <xsl:attribute name="name">
      <xsl:choose>
        <xsl:when test="./anchor">
          <xsl:value-of select="./anchor" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="./title" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <xsl:value-of select="title" />
  </xsl:element>
</xsl:template>

<xsl:template name="page-head-links">
  <xsl:param name="items" />

<div class="page-head-links">
  <xsl:for-each select="$items">
    <xsl:call-template name="item-link" />
  </xsl:for-each>
</div>

<xsl:apply-templates />
</xsl:template>

<!-- templates for header and footer -->
<xsl:template name="wxperl-header">
<xsl:param name="path" select="'.'" />

<div class="header">
  <!-- wxPerl logo -->
  <xsl:element name="img">
    <xsl:attribute name="height">70</xsl:attribute>
    <xsl:attribute name="alt">wxPerl logo</xsl:attribute>
    <xsl:attribute name="src"><xsl:value-of select="$path" />/wxperl.gif</xsl:attribute>
  </xsl:element>
</div>

<div class="navigation">
  <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="$path" />/index.html</xsl:attribute>Home</xsl:element>

  <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="$path" />/about.html</xsl:attribute>About</xsl:element>

  <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="$path" />/download.html</xsl:attribute>Download</xsl:element>

  <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="$path" />/documentation.html</xsl:attribute>Documentation</xsl:element>

  <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="$path" />/support.html</xsl:attribute>Support/Resources</xsl:element>
</div>
</xsl:template>

<xsl:template name="wxperl-footer">
<xsl:param name="path" select="'.'" />

<div class="bottom-images">
  <!-- built with wxWidgets -->
<!--
  <a target="_blank" href="http://www.wxwidgets.org/">
    <img src="builtwithwx.gif" 
         width="116" heightt="49" border="0" alt="Built with wxWidgets" />
  </a>
-->

  <!-- sourceforge logo -->

  <a target="_blank" href="http://sourceforge.net/">
    <img src="http://sourceforge.net/sflogo.php?group_id=15655" 
         width="88" height="31" border="0" alt="SourceForge Logo" />
  </a>

  <!-- valid HTML 4.0 Transitional -->

  <a target="_blank" href="http://validator.w3.org/check/referer">
    <xsl:element name="img">
      <xsl:attribute name="border">0</xsl:attribute>
      <xsl:attribute name="height">31</xsl:attribute>
      <xsl:attribute name="width">88</xsl:attribute>
      <xsl:attribute name="alt">Valid HTML 4.0!</xsl:attribute>
      <xsl:attribute name="src"><xsl:value-of select="$path" />/valid-html40.png</xsl:attribute>
    </xsl:element>
  </a>

</div>
</xsl:template>

<!-- root template, generates header and footer -->
<xsl:template match="/">
<html lang="en">

<head>
  <title>wxPerl</title>
  <meta http-equiv="Content-Type" content="text/html; charset=us-ascii" />
  <link rel="stylesheet" href="default.css" type="text/css" />
  <link rel="shortcut icon" href="favicon.ico" type="text/css" />
</head>

<body>

<xsl:call-template name="wxperl-header" />

<div class="body">

<xsl:apply-templates />

</div>

<xsl:call-template name="wxperl-footer" />

</body>

</html>
</xsl:template>

</xsl:stylesheet>
