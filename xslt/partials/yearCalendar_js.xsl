<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/" name="yearCalendar_js">
        <script src="https://unpkg.com/js-year-calendar@latest/dist/js-year-calendar.min.js"/>
        <script src="https://unpkg.com/js-year-calendar@latest/locales/js-year-calendar.de.js"/>
        <script src="./js-data/calendarData.js"/>
        <script>
            function getYear(item) {
            return item.startDate.split('-')[0];
            }
            
            function createyearcell(val) {
            return (val !== undefined) ? '<div class="col-xs-6" style="width: auto;">' +
                '<button id="ybtn' + val + '" class="btn btn-light btn-sm rounded-0 yearbtn" value="' + val + '" onclick="updateyear(this.value)">' + val + '</button>' +
                '</div>' : '';
            }
            
            // Konvertiere die Daten in das benötigte Format
            var data = calendarData.map(r => ({
            startDate: new Date(r.startDate),
            endDate: new Date(r.endDate),  // Verwende das Enddatum, wenn vorhanden
            name: r.name,
            linkId: r.id,
            color: r.color
            })).filter(r => r.startDate.getFullYear() === 1580);  // Zeige standardmäßig das Jahr 1600
            
            // Erstelle die Liste der Jahre aus calendarData
            var years = Array.from(new Set(calendarData.map(getYear))).sort();
            var yearsTable = document.getElementById('years-table');
            
            // Erstelle dynamisch die Buttons für die verschiedenen Jahre
            for (var i = 0; i &lt; years.length; i++) {
            yearsTable.insertAdjacentHTML('beforeend', createyearcell(years[i]));
            }
            
            // Initialisiere den Kalender mit den gefilterten Daten
            const calendar = new Calendar('#calendar', {
            startYear: 1580,  // Setze das Startjahr auf 1580
            language: "de",
            dataSource: data,
            displayHeader: false,
            mouseOnDay: function(e) {
            if (e.events.length > 0) {
            let tooltipContent = '<ul>';  // Erstelle eine ungeordnete Liste
                e.events.forEach(event => {
                tooltipContent += `<li>${event.name}</li>`;  // Jedes Event in ein Listenelement setzen
                });
                tooltipContent += '</ul>';
            
            // Tooltip setzen mit HTML-Option
            $(e.element).attr('data-bs-toggle', 'tooltip');
            $(e.element).attr('title', tooltipContent);
            
            // Existierende Tooltips entfernen, um Überlagerungen zu verhindern
            if (e.element._tooltipInstance) {
            e.element._tooltipInstance.dispose();
            }
            
            // Bootstrap Tooltip mit HTML aktivieren
            const tooltip = new bootstrap.Tooltip(e.element, {
            html: true // Erlaubt HTML im Tooltip
            });
            
            // Speichere die Tooltip-Instanz, um sie später zu entfernen
            e.element._tooltipInstance = tooltip;
            
            tooltip.show();
            
            // Event zum Ausblenden des Tooltips bei Mausverlassen
            $(e.element).on('mouseleave', function() {
            tooltip.hide();
            });
            
            } else {
            // Entferne den Tooltip, wenn keine Events vorhanden sind
            $(e.element).removeAttr('data-bs-toggle');
            $(e.element).removeAttr('title');
            if (e.element._tooltipInstance) {
            e.element._tooltipInstance.dispose();
            }
            }
            },
            clickDay: function (e) {
            var entries = [];
            $.each(e.events, function (key, entry) {
            entries.push(entry);
            });
            if (entries.length > 1) {
            let html = '<div class="modal fade" id="dialogForLinks" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">';
            html += '<div class="modal-dialog" role="document">';
            html += '<div class="modal-content">';
            html += '<div class="modal-header">';
            html += '<h5 class="modal-title" id="modalLabel">Folgende Briefe wurden an diesem Tag versendet:</h5>';
            html += '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>';
            html += '</div><div class="modal-body">';
            let numbersTitlesAndIds = [];
            for (let i = 0; i &lt; entries.length; i++) {
            let linkTitle = entries[i].name;
            let linkId = entries[i].linkId;
            let numberInSeriesOfLetters = entries[i].tageszaehler;
            numbersTitlesAndIds.push({ 'i': i, 'position': numberInSeriesOfLetters, 'linkTitle': linkTitle, 'id': linkId });
            }
            
            // Sortiere die Einträge nach Tageszähler
            numbersTitlesAndIds.sort(function (a, b) {
            let positionOne = parseInt(a.position);
            let positionTwo = parseInt(b.position);
            return positionOne - positionTwo;
            });
            
            // Erstelle Links im Modal für jeden Eintrag
            for (let k = 0; k &lt; numbersTitlesAndIds.length; k++) {
            // Extrahiere die Bandnummer (\d) aus der ID
            let match = numbersTitlesAndIds[k].id.match(/^L(\d)/);
            let bandNumber = match ? `(Bd. ${match[1]})` : ""; // Falls keine Übereinstimmung, bleibt bandNumber leer
            
            // Generiere HTML: Bandnummer in einem span, außerhalb des a
            html += '<div class="indent"><a href="' + numbersTitlesAndIds[k].id + '">' + numbersTitlesAndIds[k].linkTitle + '</a>&#160;<span>' + bandNumber + '</span></div>';
                }
                
            html += '</div>';
            html += '<div class="modal-footer">';
            html += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Schließen</button>';
            html += '</div></div></div></div>';
            $('#dialogForLinks').remove();
            $('#loadModal').append(html);
            $('#dialogForLinks').modal('show');
            } else {
            window.location = entries.map(entry => entry.linkId).join();
            }
            },
            renderEnd: function (e) {
            const buttons = document.querySelectorAll(".yearbtn");
            for (var i = 0; i &lt; buttons.length; i++) {
            buttons[i].classList.remove('focus');
            }
            document.getElementById(`ybtn${e.currentYear}`).classList.add("focus");
            }
            });
            
            // Funktion zur Aktualisierung des Jahres im Kalender
            function updateyear(year) {
            calendar.setYear(year);
            const dataSource = calendarData.map(r => ({
            startDate: new Date(r.startDate),
            endDate: new Date(r.endDate),  // Verwende das Enddatum
            name: r.name,
            linkId: r.id,
            color: r.color
            })).filter(r => r.startDate.getFullYear() === parseInt(year));
            calendar.setDataSource(dataSource);
            }
        </script>

    </xsl:template>
</xsl:stylesheet>
