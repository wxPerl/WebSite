<?xml version="1.0" ?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" /> <!-- order matters! -->
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl" />

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

<xsl:param name="html.stylesheet" select="'../default.css'"></xsl:param>
<xsl:param name="chunker.output.doctype-public"
           select="'-//W3C//DTD HTML 4.0 Transitional//EN'"/>
<xsl:param name="chunk.section.depth" select="0"></xsl:param>

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
