<?xml version="1.0" ?>

<xsl:stylesheet
  version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" /> <!-- order matters! -->
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/chunk.xsl" />

<!-- don't generate TOC on chapters/sections -->
<xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,table,example,equation
chapter   nop
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
</xsl:param>

<xsl:param name="html.stylesheet" select="'../docbook.css'" />

<!--
<xsl:param name="chunker.output.doctype-public"
           select="'-//W3C//DTD XHTML 1.0 Strict//EN'"/>
<xsl:param name="chunker.output.doctype-system"
           select="'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'"/>
-->
<xsl:param name="chunker.output.doctype-public"
           select="'-//W3C//DTD XHTML 1.0 Transitional//EN'"/>
<xsl:param name="chunker.output.doctype-system"
           select="'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'"/>
<xsl:param name="chunker.output.indent"
           select="'yes'"/>
<xsl:param name="chunker.output.encoding" select="'UTF-8'"/>

<xsl:param name="chunk.section.depth" select="0" />

<xsl:template name="body.attributes">
  <!-- use CSS! -->
</xsl:template>

<xsl:template name="user.header.navigation">
  <xsl:call-template name="wxperl-header">
    <xsl:with-param name="path">..</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="user.footer.navigation">
  <xsl:call-template name="wxperl-footer">
    <xsl:with-param name="path">..</xsl:with-param>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
