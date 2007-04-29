<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:namespace-alias stylesheet-prefix="xhtml" result-prefix="#default" />

<xsl:output method="xml"
            indent="yes"
            encoding="utf-8"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

<xsl:variable name="skip-navigation" />
<xsl:variable name="body-style" />

<!-- XHTML 1.0 does not support "target" -->
<xsl:attribute-set name="a-target">
  <xsl:attribute name="onclick"
      >window.open(this.href); return false;</xsl:attribute>
</xsl:attribute-set>

<!-- pass-through xhtml:*, stripping namespace prefix -->
<xsl:template match="xhtml:*">
  <xsl:element name="{local-name(.)}">
    <xsl:copy-of select="@*" />

    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<!-- XHTML 1.0 strict does not have target attribute in <a> -->
<xsl:template match="xhtml:a">
  <xsl:choose>
    <xsl:when test="@target">
      <a xsl:use-attribute-sets="a-target"><xsl:copy-of
         select="child::node()|@*[local-name()!='target']" /></a>
    </xsl:when>
    <xsl:otherwise>
      <a><xsl:copy-of
         select="child::node()|@*[local-name()!='target']" /></a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- utility template, generate a lateral navigation link -->
<xsl:template name="item-link">
  <xsl:element name="a">
    <xsl:attribute name="href">#<xsl:choose>
        <xsl:when test="anchor">
          <xsl:value-of select="anchor" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="title" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>&#8250; <xsl:value-of select="title" />
  </xsl:element>
</xsl:template>

<xsl:template match="item/anchor" />

<!-- utility template, generate a lateral navigation title with
     anchor in body -->
<xsl:template name="item-title" match="item/title">
  <h1>
    <a>
      <!-- use either anchor or title for name -->
      <xsl:attribute name="name">
        <xsl:choose>
          <xsl:when test="../anchor">
            <xsl:value-of select="../anchor" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="../title" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </a>
    <xsl:value-of select="../title" />
  </h1>
</xsl:template>

<!-- generate links in lateral navigation bar -->
<xsl:template name="page-head-links">
  <xsl:param name="items" />

  <xsl:for-each select="$items">
    <xsl:call-template name="item-link" />
  </xsl:for-each>
</xsl:template>

<!-- templates for header and footer -->
<xsl:template name="wxperl-header">
  <xsl:param name="path" select="'.'" />

  <div id="top"></div>

  <div id="header">
    <div style="padding: 8pt">
      <!-- wxPerl logo -->
      <img height="70" alt="wxPerl logo" src="{$path}/wxperl.gif" />
    </div>

    <div class="menuBar">
      <a href="{$path}/index.html">Home</a>|
      <a href="{$path}/about.html">About</a>|
      <a href="{$path}/download.html">Download</a>|
      <a href="{$path}/documentation.html">Documentation</a>|
      <a href="{$path}/support.html">Support/Resources</a>
    </div>
  </div>
</xsl:template>

<xsl:template name="wxperl-footer">
  <xsl:param name="path" select="'.'" />

  <div id="footer">
    <div class="footerLHS">

      <!-- sourceforge logo -->
      <a href="http://sourceforge.net/" xsl:use-attribute-sets="a-target">
        <img src="http://sflogo.sourceforge.net/sflogo.php?group_id=15655" 
             width="88" height="31" alt="SourceForge Logo" />
      </a>

      <!-- valid HTML 4.0 Transitional -->
      <a href="http://validator.w3.org/check?uri=referer"
         xsl:use-attribute-sets="a-target">
        <img height="31" width="88" alt="Valid XHTML 1.0!"
             src="{$path}/valid-xhtml10.png" />
      </a>

      <!-- valid CSS 2 -->
      <a href="http://jigsaw.w3.org/css-validator/check/referer"
         xsl:use-attribute-sets="a-target">
        <img height="31" width="88" alt="Valid CSS 2"
             src="{$path}/vcss.png" />
      </a>
    </div>
      
    <div>
        Based upon <a xsl:use-attribute-sets="a-target"
              href="http://www.oswd.org/design/1112/bluehaze/index.html">
              Blue Haze</a>
    </div>

    <div>
       by <a xsl:use-attribute-sets="a-target"
          href="http://www.oswd.org/email.phtml?user=haran" title="Author">
          haran</a>
    </div>
  </div>
  <p />
</xsl:template>

<!-- root template, generates header and footer -->
<xsl:template match="/">
<html xml:lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="haran" />
    <meta name="generator" content="GNU Emacs" />
    <link rel="stylesheet" type="text/css" href="bluehaze.css" title="Blue Haze stylesheet" />
    <link rel="stylesheet" type="text/css" href="color-scheme.css" title="Blue Haze stylesheet" />
    <link rel="shortcut icon" href="favicon.ico" type="text/css" />

    <title>wxPerl</title>
  </head>

  <body>  
    <!-- ###### Header ###### -->
    <xsl:call-template name="wxperl-header" />

    <!-- ###### Side Boxes ###### -->

    <xsl:if test="not(boolean($skip-navigation))">
      <div class="sideBox LHS">
        <div>This Page</div>
          <xsl:call-template name="fxm" />
      </div>
    </xsl:if>

    <!-- ###### Body Text ###### -->
    <div id="bodyText" style="{$body-style}">
      <xsl:apply-templates />
    </div>
    
    <!-- ###### Footer ###### -->
    <xsl:call-template name="wxperl-footer" />

  </body>
</html>
</xsl:template>

<!-- list item -->
<xsl:template match="item">
  <xsl:apply-templates />
</xsl:template>

<!-- news item -->
<xsl:template match="news/item">
  <dt><xsl:value-of select="date" /></dt> 
  <dd><xsl:apply-templates select="content" /></dd>
</xsl:template>

<!-- override this in importing XSLT -->
<xsl:template match="/data/news|/data/home|
                     /data/download|/data/about|/data/documentation">
</xsl:template>

</xsl:stylesheet>
