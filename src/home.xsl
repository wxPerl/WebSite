<?xml version="1.0"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template match="/data/news">
<div class="what-is-wxperl">
  <div><b>What is wxPerl?</b></div>
  <div>
wxPerl is an extension module allowing the creation of GUI
  (Graphical User Interface) from 
<a target="_blank" href="http://www.perl.com/">Perl</a>; 
it is built as a wrapper for the
awesome <a target="_blank" href="http://www.wxwindows.org/">wxWindows</a>
C++ GUI toolkit.

You can look at some <a href="sshot01.html">screenshots</a> or
read about wxPerl <a href="users.html">users</a>.
  </div>
</div>

<xsl:apply-templates />

<a href="news.html">older news...</a>
</xsl:template>

<xsl:template match="/data/news/item[position() &lt; 5]">
<div class="wxperl-news">
  <b><xsl:value-of select="date" /></b> - 
  <xsl:copy-of select="content/child::node()" />
</div>  
</xsl:template>

</xsl:stylesheet>
