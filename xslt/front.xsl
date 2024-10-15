<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@level='a']"/>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head"/>
                <style>
                    .indent-2 {
                        margin-left: 2em;
                    }
                    .indent-4 {
                        margin-left: 4em;
                    }
                    .indent-6 {
                        margin-left: 6em;
                    }
                    .indent-8 {
                        margin-left: 8em;
                    }
                    .sticky {
                        position: -webkit-sticky; /* Safari */
                        position: sticky;
                        top: 20px; /* Abstand vom oberen Rand */
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 20px;
                    }
                    
                    table th,
                    table td {
                        padding: 10px;
                        border: 1px solid #dee2e6;
                        text-align: left;
                    }
                    
                    table th {
                        background-color: #f8f9fa;
                    }
                    
                    table tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                    
                    table a {
                        color: #007bff;
                        text-decoration: none;
                    }
                    
                    table a:hover {
                        text-decoration: underline;
                    }
                    .border {
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    padding: 10px;
                    width: fit-content;
                    }
                    
                </style>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
                    rel="stylesheet"/>
            </head>
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container">
                        <div class="my-4" style="text-align:center">
                            <h1>
                                <xsl:value-of select="//tei:title[@level = 'a']"/>
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <ul class="list-unstyled sticky border">
                                    <xsl:for-each select="//tei:head">
                                        <li>
                                            <xsl:choose>
                                                <xsl:when test="@n = '1'">
                                                  <a>
                                                  <xsl:attribute name="href">#<xsl:value-of
                                                  select="@xml:id"/>
                                                  </xsl:attribute>
                                                  <xsl:apply-templates/>
                                                  </a>
                                                </xsl:when>
                                                <xsl:when test="@n = '2'">
                                                  <a class="indent-2">
                                                  <xsl:attribute name="href">#<xsl:value-of
                                                  select="@xml:id"/>
                                                  </xsl:attribute>
                                                  <xsl:apply-templates/>
                                                  </a>
                                                </xsl:when>
                                                <xsl:when test="@n = '3'">
                                                  <a class="indent-4">
                                                  <xsl:attribute name="href">#<xsl:value-of
                                                  select="@xml:id"/>
                                                  </xsl:attribute>
                                                  <xsl:apply-templates/>
                                                  </a>
                                                </xsl:when>
                                            </xsl:choose>
                                        </li>
                                    </xsl:for-each>
                                    <li>
                                        <a href="#fnApp">Fußnotenapparat</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <xsl:apply-templates select="//tei:body"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h2 id="fnApp">Fußnotenapparat</h2>
                                <ul class="list-unstyled">
                                    <xsl:for-each select="//tei:note">
                                        <xsl:variable name="fnSign"
                                            select="number(substring-after(@xml:id, '_'))"/>
                                        <xsl:variable name="fnId" select="@xml:id"/>
                                        <li id="{$fnId}_app">
                                            <sup>
                                                <span class="badge bg-primary">
                                                  <xsl:value-of select="number($fnSign)"/>
                                                </span>
                                            </sup>&#160;<xsl:value-of select="normalize-space(.)"
                                            /><a href="#{$fnId}_con">&#160;<i class="bi bi-arrow-up"
                                                /></a>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                        </div>
                    </div>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:div">
        <div class="border">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:head">
        <xsl:choose>
            <xsl:when test="@n = '1'">
                <h2>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </h2>
            </xsl:when>
            <xsl:when test="@n = '2'">
                <h3>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </h3>
            </xsl:when>
            <xsl:when test="@n = '3'">
                <h4>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </h4>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:pb">
        <sub>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:variable name="pageNr" select="substring-after(@xml:id, '_')"/>
            <xsl:variable name="romanNr" select="translate($pageNr, '0', '')"/>
            <span class="badge bg-warning">
                <xsl:value-of select="$romanNr"/>
            </span>
        </sub>
    </xsl:template>


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:note">
        <xsl:variable name="fnSign" select="substring-after(@xml:id, '_')"/>
        <xsl:variable name="fnId" select="@xml:id"/>
        <a class="footnote" href="#{$fnId}_app" id="{$fnId}_con">
            <sup>
                <span class="badge bg-primary">
                    <xsl:value-of select="number($fnSign)"/>
                </span>
            </sup>
        </a>
    </xsl:template>

    <xsl:template match="tei:lb[position() > 1]">
        <br/>
    </xsl:template>

    <xsl:template match="tei:space[@unit = 'tab']">
        <xsl:choose>
            <xsl:when test="@quantity = '1'">
                <span class="indent-2"/>
            </xsl:when>
            <xsl:when test="@quantity = '2'">
                <span class="indent-4"/>
            </xsl:when>
            <xsl:when test="@quantity = '3'">
                <span class="indent-6"/>
            </xsl:when>
            <xsl:when test="@quantity = '4'">
                <span class="indent-8"/>
            </xsl:when>
            <xsl:otherwise>
                <span class="indent-1"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:table">
        <table>
            <xsl:for-each select="tei:row">
                <tr>
                    <xsl:if test="@n = '0'">
                        <xsl:for-each select="tei:cell">
                            <th>
                                <xsl:apply-templates/>
                            </th>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@n != '0'">
                        <xsl:for-each select="tei:cell">
                            <td>
                                <xsl:apply-templates/>
                            </td>
                        </xsl:for-each>
                    </xsl:if>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>



</xsl:stylesheet>
