<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/tabulator_js.xsl"/>

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head"/>
            </head>
            <body class="page">
                <div class="my-4" style="text-align:center">
                    <h1>Postwege</h1>
                </div>
                <div style="display: block; justify-content: center; margin: 0 2em;"
                    id="tabulator-table-wrapper">
                    <table class="table table-sm display" id="tabulator-table-correspaction">
                        <thead>
                            <tr>
                                <th scope="col" tabulator-headerFilter="input"
                                    tabulator-formatter="html">Briefnummer</th>
                                <th scope="col" tabulator-headerFilter="input"
                                    tabulator-formatter="html">Titel</th>
                                <th scope="col" tabulator-headerFilter="input"
                                    tabulator-formatter="html">Sendedatum</th>
                                <th scope="col" tabulator-headerFilter="input"
                                    tabulator-formatter="html">Sendeort</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each
                                select="collection('../../nbr-graz-data/editions/?select=*.xml')/tei:TEI">
                                <xsl:variable name="full_path">
                                    <xsl:value-of select="document-uri(/)"/>
                                </xsl:variable>
                                <tr>
                                    <td>
                                        <span hidden="true">
                                            <xsl:value-of
                                                select="descendant::tei:titleStmt/tei:title[@level = 'a'][1]/text()"
                                            />
                                        </span>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of
                                                  select="replace(tokenize($full_path, '/')[last()], '.xml', '.html')"
                                                />
                                            </xsl:attribute>
                                            <xsl:value-of
                                                select="descendant::tei:titleStmt/tei:title[@level = 'a'][1]/text()"
                                            />
                                        </a>
                                    </td>
                                    <td>
                                        <span hidden="true">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@when">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@when"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@from">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@from"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@notBefor">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@notBefore"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@notAfter">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@notAfter"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@to">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date[1]/@to"
                                                  />
                                                </xsl:when>
                                            </xsl:choose>
                                        </span>
                                        <xsl:value-of
                                            select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:date"
                                        />
                                    </td>
                                    <td>
                                        <span hidden="true">
                                            <xsl:value-of
                                                select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:placeName"
                                            />
                                        </span>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of
                                                  select="concat(replace(descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:placeName/@ref, '#', ''), '.html')"
                                                />
                                            </xsl:attribute>
                                            <xsl:value-of
                                                select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[1]/tei:placeName"
                                            />
                                        </a>
                                    </td>
                                    <td>
                                        <xsl:for-each
                                            select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[not(position() = 1 or position() = last())]">
                                            <xsl:if test="tei:date">
                                                <xsl:value-of select="tei:date"/>
                                            </xsl:if>
                                            <xsl:if test="tei:date and tei:placeName">
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="tei:placeName">
                                                <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of
                                                  select="concat(replace(tei:placeName/@ref, '#', ''), '.html')"
                                                  />
                                                  </xsl:attribute>
                                                  <xsl:value-of select="tei:placeName"/>
                                                </a>
                                            </xsl:if>
                                            <xsl:if test="not(position() = last())">
                                                <br/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <span hidden="true">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@when">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@when"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@from">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@from"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@notBefor">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@notBefore"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@notAfter">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@notAfter"
                                                  />
                                                </xsl:when>
                                                <xsl:when
                                                  test="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@to">
                                                  <xsl:value-of
                                                  select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date[1]/@to"
                                                  />
                                                </xsl:when>
                                            </xsl:choose>
                                        </span>
                                        <xsl:value-of
                                            select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:date"
                                        />
                                    </td>
                                    <td>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of
                                                  select="concat(replace(descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:placeName/@ref, '#', ''), '.html')"
                                                />
                                            </xsl:attribute>
                                            <xsl:value-of
                                                select="descendant::tei:teiHeader[1]/tei:profileDesc[1]/tei:correspDesc[1]/tei:correspAction[last()]/tei:placeName"
                                            />
                                        </a>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>

                <xsl:call-template name="tabulator_dl_buttons"/>

                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="tabulator_correspaction_js"/>

            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="tei:p">
        <p id="{generate-id()}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:list">
        <ul id="{generate-id()}">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:item">
        <li id="{generate-id()}">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
