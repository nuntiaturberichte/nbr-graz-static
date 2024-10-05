<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:include href="./params.xsl"/>
    <xsl:template match="/" name="nav_bar">
        <header>
            <nav class="navbar navbar-expand-lg" style="background-color: #cccccc;">
                <div class="container-fluid">
                    <!-- Linksbündig -->
                    <a href="index.html" class="navbar-brand custom-logo-link" rel="home"
                        itemprop="url">
                        <img
                            src="./images/schriftzug-navbar.png"
                            class="img-fluid" title="grazer-nuntiaturberichte" alt="grazer-nuntiaturberichte"
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
                                <a class="nav-link dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Projekt</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="index.html">Über das
                                            Projekt</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="...">Editionsrichtlinien</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="imprint.html">Impressum</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false"
                                    >Bandeinleitungen</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="...">Band 1</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="...">Band 2</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="...">Band 3</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="...">Band 4</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="...">Band 5</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="...">Briefe</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="...">Kalender</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="register.html">Register</a>
                            </li>

                            <li class="nav-item dropdown disabled">
                                <a class="nav-link dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Technisches</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="kodierungsrichtlinien.html"
                                            >Kodierungsrichtlinien</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="arbeitsablauf.html">Arbeitsablauf</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="https://github.com/nuntiaturberichte/nbr-graz-data">Quelldaten auf
                                            GitHub</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="https://github.com/nuntiaturberichte/nbr-graz-static">App auf GitHub</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a title="Suche" class="nav-link" href="search.html">Suche</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

        </header>
    </xsl:template>
</xsl:stylesheet>
