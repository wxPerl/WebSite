#!/usr/bin/make

OUTDIR=../site
HTML=$(OUTDIR)/index.html $(OUTDIR)/download.html $(OUTDIR)/about.html \
     $(OUTDIR)/documentation.html $(OUTDIR)/support.html $(OUTDIR)/news.html \
     $(OUTDIR)/sshot01.html $(OUTDIR)/sshot02.html $(OUTDIR)/sshot03.html \
     $(OUTDIR)/users.html
XSLT=xsltproc --catalogs
XMLCHECKDTD=xmllint --catalogs --loaddtd --valid --noout
XMLCHECK=xmllint --catalogs --noout

all: $(HTML)

tutorial: $(OUTDIR)/tutorial/tutorial.html

crlf2lf:
	find $(OUTDIR) -name "*.html" | xargs flip -b -u

###############################################################################
# Tutorial
###############################################################################

$(OUTDIR)/tutorial/tutorial.html: tutorial/tutorial.xml tutorial/tutorial.xsl \
    wxperl.xsl
	$(XSLT) --output $(OUTDIR)/tutorial/ --path c:/Programmi/Varie/DocBook/docbook-xsl-1.61.2/html tutorial/tutorial.xsl \
            tutorial/tutorial.xml

###############################################################################
# Site files
###############################################################################

$(OUTDIR)/index.html: main.xml home.xsl wxperl.xsl
	$(XSLT) -o $@ home.xsl main.xml

$(OUTDIR)/download.html: main.xml download.xsl wxperl.xsl
	$(XSLT) -o $@ download.xsl main.xml

$(OUTDIR)/about.html: main.xml about.xsl wxperl.xsl
	$(XSLT) -o $@ about.xsl main.xml

$(OUTDIR)/documentation.html: main.xml documentation.xsl wxperl.xsl
	$(XSLT) -o $@ documentation.xsl main.xml

$(OUTDIR)/support.html: support.xml support.xsl wxperl.xsl
	$(XSLT) -o $@ support.xsl support.xml

$(OUTDIR)/news.html: main.xml news.xsl wxperl.xsl
	$(XSLT) -o $@ news.xsl main.xml

$(OUTDIR)/sshot01.html: sshots.xml sshots.xsl wxperl.xsl
	$(XSLT) --stringparam page 1 -o $@ sshots.xsl sshots.xml

$(OUTDIR)/sshot02.html: sshots.xml sshots.xsl wxperl.xsl
	$(XSLT) --stringparam page 2 -o $@ sshots.xsl sshots.xml

$(OUTDIR)/sshot03.html: sshots.xml sshots.xsl wxperl.xsl
	$(XSLT) --stringparam page 3 -o $@ sshots.xsl sshots.xml

$(OUTDIR)/users.html: applications.xml users.xsl wxperl.xsl
	$(XSLT) -o $@ users.xsl applications.xml

test:
	$(XMLCHECKDTD) applications.xml
	$(XMLCHECK) main.xml
	$(XMLCHECKDTD) sshots.xml
	$(XMLCHECKDTD) tutorial/tutorial.xml

.SUFFIXES: .xml .xsl .html