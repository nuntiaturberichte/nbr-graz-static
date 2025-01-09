<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="partials/tooltip_js.xsl"/>

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
                        padding-top: 7px;
                    }
                    
                    .iframe-wrapper {
                        display: flex;
                        gap: 15px; /* Abstand zwischen iframe und Button */
                        align-items: center; /* Vertikale Ausrichtung */
                    }
                    
                    .iframe-container {
                        position: relative;
                        width: 80%;
                        height: 800px; /* Visible height excluding navbar/footer */
                        border-radius: 20px;
                        border: 1px solid black;
                        overflow: hidden;
                    }
                    
                    iframe {
                        position: relative;
                        width: 100%;
                        height: 800px;
                    }</style>
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="iframe-wrapper">
                        <div class="iframe-container">
                            <iframe
                                src="https://correspsearch.net/de/vis.html?c=https://raw.githubusercontent.com/nuntiaturberichte/nbr-graz-data/main/cmif/gn_cmif.xml&amp;x=1&amp;w=0&amp;vistype=0"
                                scrolling="yes" sandbox="allow-scripts allow-same-origin"/>
                        </div>
                        <span id="tooltip" title="Hinweis">
                            <button class="btn btn-collapse btn-lg" type="button"
                                data-bs-toggle="collapse" data-bs-target="#collapseExample"
                                aria-expanded="false" aria-controls="collapseExample">
                                <i class="bi bi-info-square-fill"/>
                            </button>
                        </span>
                        <div class="collapse collapse-overlay" id="collapseExample">
                            <div class="card">
                                <div class="card-header">Hinweis zu den Visualisierungen</div>
                                <div class="card-body">
                                    <p> Die Visualisierungen werden von <a
                                            href="https://correspsearch.net" target="_blank"
                                            rel="noopener noreferrer">CorrespSearch</a> via iframe
                                        auf dieser Webseite eingebunden. Weitere Informationen
                                        finden Sie auf der <a
                                            href="https://correspsearch.net/de/vis.html"
                                            target="_blank" rel="noopener noreferrer"
                                        >Quellseite</a>.</p>
                                </div>
                                <div class="card-footer text-end">
                                    <button type="button"
                                        onclick="document.getElementById('collapseExample').classList.remove('show')"
                                        class="btn" style="background-color: gray;color: white;"
                                        >Schließen</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </main>
                <xsl:call-template name="html_footer"/>
                <xsl:call-template name="tooltip"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
