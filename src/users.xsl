<?xml version="1.0" ?>

<xsl:stylesheet
  version="1.0"
  exclude-result-prefixes="xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtmlAlias"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="fxm">
  <xhtml:a href="#applications">&#8250; Applications</xhtml:a>
  <xhtml:a href="#form">&#8250; Form</xhtml:a>
</xsl:template>

<xsl:template name="name-with-link">
  <xsl:choose>
    <xsl:when test="site">
      <xsl:element name="xhtml:a" xsl:use-attribute-sets="a-target">
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

<xsl:template match="organisations">
To be added to this page, simply paste the <xhtml:a href="#form">form</xhtml:a>
below in your mail client, and send it to
<xhtml:a href="mailto:mbarbon@cpan.org">Mattia Barbon</xhtml:a>.

<xhtml:hr />

  <xhtml:a name="applications" />
  <xhtml:dl>
  <xsl:for-each select="organisation">
    <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                     'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />

    <xhtml:dt>
    <xsl:call-template name="name-with-link" />
    <xsl:if test="country">, <xsl:value-of select="country" /></xsl:if></xhtml:dt>
    <xhtml:dd>
    <xsl:for-each select="applications/application">
      <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                       'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />

      <xhtml:b><xsl:call-template name="name-with-link" /></xhtml:b>
      <xsl:copy-of select="short-description/child::node()" /><xhtml:br />
    </xsl:for-each>
    <xsl:if test="contact">
      Contact: <xsl:element name="a">
        <xsl:attribute name="href">mailto:<xsl:value-of select="contact/email" />
        </xsl:attribute>
        <xsl:value-of select="contact/name" />
      </xsl:element>
    </xsl:if>
    </xhtml:dd>
  </xsl:for-each>
  </xhtml:dl>
<xhtml:hr />
<xhtml:h4><xhtml:a name="form">wxPerl application description</xhtml:a></xhtml:h4>

<xhtml:pre>
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
</xhtml:pre>
</xsl:template>

</xsl:stylesheet>
