<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:include href="./params.xsl"/>
    <xsl:template match="/" name="nav_bar">
        <header>
            <nav class="navbar navbar-expand-lg fixed-top" style="border-bottom-left-radius: 20px;
                border-bottom-right-radius: 20px;
                background-color: #E0E0E0;
                border: 1px solid #666;
                box-shadow: 0px 5px 20px 0px rgba(0,0,0,0.35);">
                <div class="container-fluid">
                    <!-- Linksbündig -->
                    <a href="index.html" class="navbar-brand custom-logo-link" rel="home"
                        itemprop="url">
                        <img src="./images/schriftzug-navbar.png" class="img-fluid"
                            title="grazer-nuntiaturberichte" alt="grazer-nuntiaturberichte"
                            itemprop="logo"/>
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"/>
                    </button>

                    <!-- Rechtsbündige Navigationselemente -->
                    <div class="collapse navbar-collapse justify-content-end"
                        id="navbarSupportedContent">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link sec dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Projekt</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="about.html">Über das
                                            Projekt</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="imprint.html">Impressum</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown disabled">
                                <a class="nav-link sec dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Technisches</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="elements.html"
                                            >Kodierungsrichtlinien</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="workflow.html"
                                            >Arbeitsablauf</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item"
                                            href="https://github.com/nuntiaturberichte/nbr-graz-data"
                                            target="_blank">Quelldaten auf GitHub</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item"
                                            href="https://github.com/nuntiaturberichte/nbr-graz-static"
                                            target="_blank">App auf GitHub</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link sec dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false"
                                    >Bandeinleitungen</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="front-1.html">Band 1</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="front-2.html">Band 2</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="front-3.html">Band 3</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="front-4.html">Band 4</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="front-5.html">Band 5</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link pri" href="toc.html">Briefe</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link pri" href="calendar.html">Kalender</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link pri" href="register.html">Register</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link pri" href="visualizations.html">Visualisierungen</a>
                            </li>

                            <li class="nav-item">
                                <a title="Suche" class="nav-link pri" href="search.html">Suche</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

        </header>
    </xsl:template>
</xsl:stylesheet>
