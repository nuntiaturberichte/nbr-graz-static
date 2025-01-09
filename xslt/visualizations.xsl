<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Visualisierungen'"/>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="de">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
                <style>
                    main {
                        display: flex;
                        justify-content: center; /* Horizontal zentrieren */
                        align-items: center; /* Vertikal zentrieren */
                        height: 100vh; /* Container auf volle Höhe setzen */
                    }
                    
                    .iframe-container {
                        position: relative;
                        width: 80%;
                        height: 700px; /* Visible height excluding navbar/footer */
                        overflow: hidden; /* Hide the unwanted parts */
                        border-radius: 20px;
                        border: 1px solid black;
                        margin: 0 auto; /* Optional: Centering the iframe */
                    }
                    
                    iframe {
                        position: relative;
                        top: -50px;
                        width: 80%;
                        height: 800px;
                        border: 1px solid black;
                        border-top-left-radius: 20px;
                        border-top-right-radius: 20px;
                        border-bottom-left-radius: 20px;
                        border-bottom-right-radius: 20px;
                    }</style>
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <main>
                    <div class="iframe-container">
                        <iframe
                            src="https://correspsearch.net/de/vis.html?c=https://raw.githubusercontent.com/nuntiaturberichte/nbr-graz-data/main/cmif/gn_cmif.xml&amp;x=1&amp;w=0&amp;vistype=0"
                        />
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
