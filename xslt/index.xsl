<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>


    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Über das Projekt'"/>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html class="h-100">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <style>
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-bottom: 20px;
                    }
                    
                    table th, table td {
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
                    
                </style>
            </head>            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container">
                        <div class="my-4" style="text-align:center">
                            <h1>Über das Projekt</h1>
                        </div>
                        <xsl:apply-templates select="//tei:body/tei:div"/>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:table">
        <table>
            <xsl:for-each select="tei:row">
                <tr>
                    <xsl:choose>
                        <xsl:when test="position() = 1">
                            <xsl:for-each select="tei:cell">
                                <th>
                                    <xsl:value-of select="."/>
                                </th>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="tei:cell">
                                <xsl:choose>
                                    <xsl:when test="position()=1">
                                        <th>
                                            <xsl:value-of select="."/>
                                        </th>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="tei:ref">
                                                    <a href="{tei:ref/@target}">
                                                        <xsl:value-of select="tei:ref"/>
                                                    </a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="."/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h2><xsl:value-of select="."/></h2>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='unordered']">
        <ul><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='ordered']">
        <ol><xsl:apply-templates/></ol>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
    
</xsl:stylesheet>