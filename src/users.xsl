<?xml version="1.0" ?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <a href="#applications">&#8250; Applications</a>
  <a href="#form">&#8250; Form</a>
</xsl:template>

<xsl:template match="windows">Windows<xsl:if test="not(position()=last())">, </xsl:if></xsl:template>
<xsl:template match="linux">Linux<xsl:if test="not(position()=last())">, </xsl:if></xsl:template>
<xsl:template match="mac">Mac OS X<xsl:if test="not(position()=last())">, </xsl:if></xsl:template>

<xsl:template match="platforms"> (<xsl:apply-templates />) </xsl:template>

<xsl:template name="name-with-link">
  <xsl:choose>
    <xsl:when test="site">
      <xsl:element name="a" xsl:use-attribute-sets="a-target">
        <xsl:attribute name="href">
          <xsl:value-of select="site" />
        </xsl:attribute>

        <xsl:value-of select="name" />
      </xsl:element>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="name" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="contact">
  Contact: 
  <xsl:choose>
    <xsl:when test="email">
      <a>
        <xsl:attribute name="href">mailto:<xsl:value-of select="email" /></xsl:attribute>
        <xsl:value-of select="name" />
      </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="name" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="application">
  <b><xsl:call-template name="name-with-link" /></b>
  <xsl:apply-templates select="platforms" />
  <xsl:copy-of select="short-description/child::node()" /><br />
</xsl:template>

<xsl:template match="organisation">
  <dt>
  <xsl:call-template name="name-with-link" />
  <xsl:if test="country">, <xsl:value-of select="country" /></xsl:if></dt>
  <dd>
  <xsl:apply-templates select="applications/application">
    <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                     'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
  </xsl:apply-templates>
  <xsl:apply-templates select="contact"/>
  </dd>
</xsl:template>

<xsl:template match="organisations">
To be added to this page, simply paste the <a href="#form">form</a>
below in your mail client, and send it to
<a href="mailto:mbarbon@cpan.org">Mattia Barbon</a>.

<hr />

  <a name="applications" />
  <dl>
  <xsl:apply-templates>
    <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                     'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
  </xsl:apply-templates>
  </dl>
<hr />
<h4><a name="form">wxPerl application description</a></h4>

<pre>
Organisation Name:
Organisation Web Site:
Country:
Contact Name:
Contact Email:
Application Name:
Application Web Site:
Application Domain (e.g. Telecommunications, Insurance, ...):
Commercial/Research/Open Source/Internal Use/Other:
Application Short Description (1 to 4 lines):
Application Long Description (optional):
Version of wxPerl:
Platform(s):
Approximate number of application users (optional):
Rating of wxPerl (1-5, 1 = poor, 5 = excellent):
Comments on your wxPerl experiences (optional):
</pre>
</xsl:template>

</xsl:stylesheet>
