<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/" name="register_pop_up">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <script>
            // Funktion zum Anzeigen des Modals beim ersten Laden der Seite in der Sitzung
            document.addEventListener("DOMContentLoaded", function () {
            if (!sessionStorage.getItem("modalDisplayed")) {
            var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
            infoModal.show();
            sessionStorage.setItem("modalDisplayed", "true");
            }
            });
        </script>
    </xsl:template>

</xsl:stylesheet>
