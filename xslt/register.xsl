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
        <html>
            <head>
                <xsl:call-template name="html_head"/>
                <style>
                    /* CSS für Zellumbruch */
                    .wrap-cell {
                        white-space: normal !important;
                        word-wrap: break-word;
                    }
                    
                    /* CSS für den Ladebildschirm */
                    #loader {
                        position: fixed;
                        left: 50%;
                        top: 50%;
                        width: 50px;
                        height: 50px;
                        margin-left: -25px;
                        margin-top: -25px;
                        border: 4px solid rgba(0, 0, 0, .1);
                        border-radius: 50%;
                        border-top-color: #3498db;
                        animation: spin 1s infinite linear;
                        z-index: 1000;
                    }
                    
                    @keyframes spin {
                to { transform: rotate(360deg); }
                }
                    
                    #tabulator-table-wrapper {
                        display: none;
                    }</style>
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <main>
                    <div class="my-4" style="text-align:center">
                        <h1>Register</h1>
                    </div>
                    <div id="loader"/>
                    <div style="display: block; justify-content: center; margin: 0 2em;"
                        id="tabulator-table-wrapper">
                        <table class="table table-sm display" id="tabulator-table">
                            <thead>
                                <tr>
                                    <th>Begriff (1. Ebene)</th>
                                    <th>Begriff (2. Ebene)</th>
                                    <th>Verweis</th>
                                    <th>Seiten (1. Band)</th>
                                    <th>Seiten (2. Band)</th>
                                    <th>Seiten (3. Band)</th>
                                    <th>Seiten (4. Band)</th>
                                    <th>Seiten (5. Band)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:apply-templates select="//tei:body/tei:list/tei:item"/>
                            </tbody>
                        </table>
                    </div>
                    <xsl:call-template name="html_tabulator_dl_buttons"/>
                </main>
                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="tabulator_js"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:item[ancestor::tei:body]">
        <tr>
            <td>
                <xsl:value-of select="tei:term"/>
            </td>
            <td/>
            <td>
                <xsl:apply-templates select="tei:ref"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-1')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/1/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-2')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/2/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-3')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/3/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-4')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/4/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-5')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/5/')]"/>
            </td>
        </tr>
        <xsl:apply-templates select="tei:list/tei:item"/>
    </xsl:template>

    <xsl:template match="tei:item[ancestor::tei:item]">
        <tr>
            <td/>
            <td>
                <xsl:value-of select="tei:term"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:ref"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-1')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/1/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-2')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/2/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-3')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/3/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-4')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/4/')]"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'meta/fronts/front-5')]"/>
                <xsl:apply-templates select="tei:rs[starts-with(@ref, 'editions/5/')]"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="tei:ref">
        <xsl:value-of select="."/>
        <xsl:if test="position() != last()">
            <xsl:text>; </xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:rs">
        <!-- Get the part before the .xml and after .xml (if any) -->
        <a href="{concat(substring-before(@ref, '.xml'), '.html', substring-after(@ref, '.xml'))}">
            <xsl:value-of select="."/>
        </a>
        <xsl:if test="following-sibling::tei:rs">
            <xsl:text>, </xsl:text>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>
