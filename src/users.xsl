<?xml version="1.0" ?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="wxperl.xsl" />

<xsl:template name="name-with-link">
  <xsl:choose>
    <xsl:when test="site">
      <xsl:element name="a">
        <xsl:attribute name="target">_blank</xsl:attribute>
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
To be added to this page, simply paste the <a href="#form">form</a>
below in your mail client, and send it to
<a href="mailto:mbarbon@cpan.org">Mattia Barbon</a>.

<hr />

  <xsl:for-each select="organisation">
    <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                     'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />

    <div class="organisation">
    <xsl:call-template name="name-with-link" />
    <xsl:if test="country">, <xsl:value-of select="country" /></xsl:if><br />
    <div class="application-list">
    <xsl:for-each select="applications/application">
      <xsl:sort select="translate(name,'abcdefghijklmnopqrstuvwxyz',
                                       'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />

      <b><xsl:call-template name="name-with-link" /></b>
      <xsl:copy-of select="short-description/child::node()" /><br />
    </xsl:for-each>
    <xsl:if test="contact">
      Contact: <xsl:element name="a">
        <xsl:attribute name="href">mailto:<xsl:value-of select="contact/email" />
        </xsl:attribute>
        <xsl:value-of select="contact/name" />
      </xsl:element>
    </xsl:if>
    </div> <!-- application list -->
    </div> <!-- organisation -->
  </xsl:for-each>

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
