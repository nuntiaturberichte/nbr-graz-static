<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/download_pdf_js.xsl"/>
    <xsl:import href="./partials/scroll_offset_js.xsl"/>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of
                select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@level = 'a']"/>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
                    rel="stylesheet"/>
                <style>
                    #heading .badge {
                        font-size: 0.75rem;
                        padding: 0.3em 0.5em;
                    }</style>
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container">
                        <div class="card mt-5">
                            <div class="card-header">
                                <div class="row" id="title-nav" style="align-items: center;">
                                    <!-- LINKS -->
                                    <div
                                        class="col-12 col-sm-6 col-lg-2 d-flex justify-content-center">
                                        <h1>
                                            <nav class="navbar navbar-previous-next">
                                                <i class="bi bi-arrow-left nav-link float-start"
                                                  id="navbarDropdownLeft" role="button"
                                                  data-bs-toggle="dropdown" aria-expanded="false"/>
                                                <ul class="dropdown-menu unstyled"
                                                  aria-labelledby="navbarDropdown">
                                                  <!-- "Vorheriger Brief" -->
                                                  <span class="dropdown-item-text">Vorheriger
                                                  Brief</span>
                                                  <!-- Listenpunkt für direkten Vorfolger -->
                                                  <li>
                                                  <xsl:if
                                                  test="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'previous_letter' and @type = 'withinCollection']/@target">
                                                  <!-- Link und Linktext zum direkten Vorfolger -->
                                                  <a id="prev-doc" class="dropdown-item">
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of
                                                  select="concat(substring-before(//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'previous_letter' and @type = 'withinCollection']/@target, '.xml'), '.html')"
                                                  />
                                                  </xsl:attribute>
                                                  <i class="bi bi-arrow-left">
                                                  <xsl:value-of
                                                  select="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'previous_letter' and @type = 'withinCollection']"
                                                  />
                                                  </i>
                                                  </a>
                                                  </xsl:if>
                                                  </li>
                                                  <!-- "... in der Korrespondenz" -->
                                                  <span class="dropdown-item-text">… in der
                                                  Korrespondenz</span>
                                                  <!-- Listenpunkt für Korrespondenz-Vorfolger -->
                                                  <li>
                                                  <xsl:if
                                                  test="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'previous_letter' and @type = 'withinCorrespondence']/@target">
                                                  <!-- Link und Linktext zum Korrespondenz-Vorfolger -->
                                                  <a id="prev-doc2" class="dropdown-item">
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of
                                                  select="concat(substring-before(//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'previous_letter' and @type = 'withinCorrespondence']/@target, '.xml'), '.html')"
                                                  />
                                                  </xsl:attribute>
                                                  <i class="bi bi-arrow-left">
                                                  <xsl:value-of
                                                  select="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'previous_letter' and @type = 'withinCorrespondence']"
                                                  />
                                                  </i>
                                                  </a>
                                                  </xsl:if>
                                                  </li>
                                                </ul>
                                            </nav>
                                        </h1>
                                    </div>
                                    <!-- MITTE-LINKS -->
                                    <div
                                        class="col-12 col-sm-6 col-lg-2 d-flex justify-content-center">

                                        <span style="display: flex;
                                                    align-items: center;">
                                            <xsl:text>Briefnr.&#160;</xsl:text>
                                            <span class="badge bg-dark">
                                                <xsl:value-of
                                                  select="//tei:text/tei:body/tei:head/@n"/>
                                            </span>
                                        </span>
                                    </div>

                                    <!-- MITTE -->
                                    <div class="col-12 col-lg-4 text-center" id="heading">
                                        <h1>
                                            <xsl:apply-templates
                                                select="//tei:text/tei:body/tei:head"/>
                                        </h1>
                                        <xsl:if
                                            test="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@level = 'a' and @type = 'appendix']">
                                            <span>
                                                <em>
                                                  <xsl:value-of
                                                  select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@level = 'a' and @type = 'appendix']"
                                                  />
                                                </em>
                                            </span>
                                        </xsl:if>
                                    </div>
                                    <!-- MITTE-RECHTS -->
                                    <div
                                        class="col-12 col-sm-6 col-lg-2 d-flex justify-content-center">
                                        <span style="display: flex; align-items: center;">
                                            <span>
                                                <xsl:text>Band&#160;</xsl:text>
                                            </span>
                                            <span class="badge">
                                                <xsl:attribute name="style">
                                                  <xsl:text>margin-right: 10px; color: black; background-color:</xsl:text>
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="//tei:biblScope[@unit = 'volume']/@n = '1'">
                                                  <xsl:text>#FBBE9D</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when
                                                  test="//tei:biblScope[@unit = 'volume']/@n = '2'">
                                                  <xsl:text>#C3E4B4</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when
                                                  test="//tei:biblScope[@unit = 'volume']/@n = '3'">
                                                  <xsl:text>#DFB5E3</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when
                                                  test="//tei:biblScope[@unit = 'volume']/@n = '4'">
                                                  <xsl:text>#DCD5D0</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when
                                                  test="//tei:biblScope[@unit = 'volume']/@n = '5'">
                                                  <xsl:text>#C7EAF9</xsl:text>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:value-of
                                                  select="//tei:biblScope[@unit = 'volume']/@n"/>
                                            </span>
                                        </span>
                                    </div>


                                    <!-- RECHTS -->
                                    <div
                                        class="col-12 col-sm-6 col-lg-2 d-flex justify-content-center">
                                        <h1>
                                            <nav class="navbar navbar-previous-next">
                                                <i class="bi bi-arrow-right nav-link float-start"
                                                  id="navbarDropdownLeft" role="button"
                                                  data-bs-toggle="dropdown" aria-expanded="false"/>
                                                <ul class="dropdown-menu dropdown-menu-end unstyled"
                                                  aria-labelledby="navbarDropdownLeft">
                                                  <!-- "Nächster Brief" -->
                                                  <span class="dropdown-item-text">Nächster
                                                  Brief</span>
                                                  <!-- Listenpunkt für direkten Nachfolger -->
                                                  <li>
                                                  <xsl:if
                                                  test="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'next_letter' and @type = 'withinCollection']/@target">
                                                  <!-- Link und Linktext zum direkten Nachfolger -->
                                                  <a id="prev-doc" class="dropdown-item">
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of
                                                  select="concat(substring-before(//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'next_letter' and @type = 'withinCollection']/@target, '.xml'), '.html')"
                                                  />
                                                  </xsl:attribute>
                                                  <i class="bi bi-arrow-right">
                                                  <xsl:value-of
                                                  select="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'next_letter' and @type = 'withinCollection']"
                                                  />
                                                  </i>
                                                  </a>
                                                  </xsl:if>
                                                  </li>
                                                  <!-- "... in der Korrespondenz" -->
                                                  <span class="dropdown-item-text">… in der
                                                  Korrespondenz</span>
                                                  <!-- Listenpunkt für Korrespondenz-Vorfolger -->
                                                  <li>
                                                  <xsl:if
                                                  test="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'next_letter' and @type = 'withinCorrespondence']/@target">
                                                  <!-- Link und Linktext zum Korrespondenz-Vorfolger -->
                                                  <a id="prev-doc2" class="dropdown-item">
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of
                                                  select="concat(substring-before(//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'next_letter' and @type = 'withinCorrespondence']/@target, '.xml'), '.html')"
                                                  />
                                                  </xsl:attribute>
                                                  <i class="bi bi-arrow-right">
                                                  <xsl:value-of
                                                  select="//tei:correspDesc/tei:correspContext/tei:ref[@subtype = 'next_letter' and @type = 'withinCorrespondence']"
                                                  />
                                                  </i>
                                                  </a>
                                                  </xsl:if>
                                                  </li>
                                                </ul>
                                            </nav>
                                        </h1>
                                    </div>
                                </div>

                            </div>
                            <div id="letter-body">
                                <xsl:if test="//tei:profileDesc/tei:abstract/tei:p">
                                    <div id="abstract" class="card-body">
                                        <h3>Regest</h3>
                                        <xsl:for-each select="//tei:profileDesc/tei:abstract/tei:p">
                                            <p>
                                                <em>
                                                  <xsl:apply-templates/>
                                                </em>
                                            </p>
                                        </xsl:for-each>
                                    </div>
                                    <hr/>
                                </xsl:if>
                                <xsl:if
                                    test="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:collection">
                                    <div id="msIdentifier" class="card-body">
                                        <h3>Archiv</h3>
                                        <p>
                                            <em>
                                                <xsl:apply-templates
                                                  select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:collection"
                                                />
                                            </em>
                                        </p>
                                    </div>
                                    <hr/>
                                </xsl:if>
                                <xsl:if
                                    test="//tei:sourceDesc/tei:listBibl[@corresp = 'letter']/tei:bibl[@type = 'druck' or @type = 'beilage' or @type = 'regest']">
                                    <div id="msIdentifier" class="card-body">
                                        <h3>Referenzen</h3>
                                        <ul id="references" class="list-group list-group-flush">
                                            <xsl:for-each
                                                select="//tei:sourceDesc/tei:listBibl[@corresp = 'letter']/tei:bibl[@type = 'druck' or @type = 'beilage' or @type = 'regest']">
                                                <li class="list-group-item">
                                                  <em>
                                                  <xsl:apply-templates/>
                                                  </em>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                    <hr/>
                                </xsl:if>
                                <xsl:if test="//tei:text/tei:body/tei:div/tei:p">
                                    <div id="letter-text-container" class="card-body">
                                        <div
                                            style="display: flex; align-items: center; justify-content: space-between;">
                                            <h2>Brieftext</h2>

                                            <xsl:variable name="fileName"
                                                select="tokenize(document-uri(.), '/')[last()]"/>
                                            <div>
                                                <a id="downloadPdf" class="btn btn-danger btn-sm"
                                                  style="margin-right: .25rem;">
                                                  <span id="pdfFileName" style="display: none;">
                                                  <xsl:value-of
                                                  select="replace(tokenize(document-uri(.), '/')[last()], '.xml$', '.pdf')"
                                                  />
                                                  </span>PDF herunterladen</a>

                                                <a
                                                  href="https://grazer-nuntiatur.acdh.oeaw.ac.at/{$fileName}"
                                                  target="_blank" class="btn btn-primary btn-sm">XML
                                                  herunterladen</a>
                                            </div>
                                        </div>

                                        <xsl:for-each select="//tei:text/tei:body/tei:div">
                                            <div id="letter-text">
                                                <xsl:apply-templates/>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </xsl:if>
                                <xsl:if test="//tei:note">
                                    <hr/>
                                    <div id="footnotes-apparatus" class="card-body">
                                        <h3>Fußnoten</h3>
                                        <ul class="list-unstyled">
                                            <xsl:for-each select="//tei:note">
                                                <xsl:if test="@type = 'footnote'">
                                                  <xsl:variable name="fnSign"
                                                  select="number(substring-after(substring-after(@xml:id, '_'), '_'))"/>
                                                  <xsl:variable name="fnId" select="@xml:id"/>
                                                  <li id="{$fnId}_app" href="#{$fnId}_con">
                                                  <sup>
                                                  <span class="badge bg-primary">
                                                  <xsl:value-of select="number($fnSign)"/>
                                                  </span>
                                                  </sup>&#160;<xsl:value-of
                                                  select="normalize-space(.)"/>&#160;<a
                                                  href="#{$fnId}_con"><i class="bi bi-arrow-up"
                                                  /></a>
                                                  </li>
                                                </xsl:if>
                                                <xsl:if test="@type = 'siglum'">
                                                  <xsl:variable name="sSign"
                                                  select="substring-after(substring-after(@xml:id, '_'), '_')"/>
                                                  <xsl:variable name="sId" select="@xml:id"/>
                                                  <li id="{$sId}_app" href="#{$sId}_con">
                                                  <sup>
                                                  <span class="badge bg-primary">
                                                  <xsl:value-of select="$sSign"/>
                                                  </span>
                                                  </sup>&#160;<xsl:value-of
                                                  select="normalize-space(.)"/>&#160;<a
                                                  href="#{$sId}_con"><i class="bi bi-arrow-up"/></a>
                                                  </li>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                </xsl:if>
                            </div>
                        </div>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="scroll_offset"/>
                <xsl:call-template name="download_pdf"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:lb[position() > 1]">
        <br/>
    </xsl:template>

    <xsl:template match="tei:text/tei:body/tei:div/tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:pb">
        <sub>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:variable name="pageNr" select="substring-after(@xml:id, '_')"/>
            <span class="badge bg-warning">
                <xsl:value-of select="number($pageNr)"/>
            </span>
        </sub>
    </xsl:template>

    <xsl:template match="tei:note[@type = 'footnote']">
        <xsl:variable name="fnSign" select="substring-after(substring-after(@xml:id, '_'), '_')"/>
        <xsl:variable name="fnId" select="@xml:id"/>
        <a class="footnote" id="{$fnId}_con" href="#{$fnId}_app" title="{normalize-space(.)}">
            <sup>
                <span class="badge bg-primary">
                    <xsl:value-of select="number($fnSign)"/>
                </span>
            </sup>
        </a>
    </xsl:template>

    <xsl:template match="tei:note[@type = 'siglum']">
        <xsl:variable name="sSign" select="substring-after(substring-after(@xml:id, '_'), '_')"/>
        <xsl:variable name="sId" select="@xml:id"/>
        <a class="siglum" id="{$sId}_con" href="#{$sId}_app" title="{normalize-space(.)}">
            <sup>
                <span class="badge bg-primary">
                    <xsl:value-of select="$sSign"/>
                </span>
            </sup>
        </a>
    </xsl:template>

    <xsl:template match="tei:ref">
        <xsl:variable name="sRefSign" select="substring-after(substring-after(@xml:id, '_'), '_')"/>
        <xsl:variable name="refId" select="@target"/>
        <a class="siglum-ref" href="{$refId}">
            <sup>
                <span class="badge bg-primary">
                    <xsl:value-of select="$sRefSign"/>
                </span>
            </sup>
        </a>
    </xsl:template>



</xsl:stylesheet>
