<?php

include("xmlVerarbeitung.php");

if ($_POST["absenden"]) {
    $vorname = $_POST["vorname"];
    $nachname = $_POST["nachname"];
    $geschlecht = $_POST["geschlecht"];
    $adresse = $_POST["adresse"];
    $stadt = $_POST["stadt"];
    $telefonnummer = $_POST["telefonnummer"];
    $geburtstag = $_POST["geburtstag"];
    $behinderungen = $_POST["behinderung"];
    $einzelzimmer = $_POST["einzelzimmer"];
    $spezielles = $_POST["spezielles"];
    $eventID = $_POST["event"];


    $eventXML = getMainDB();

    $validatedXML = insertIntoDB($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $eventID, $eventXML);
    if ($validatedXML) {
        // TODO: PDF needs to be generated her.
        $pdfLink = transformXmlToPdf($eventID);
        loadXSLwithPdfLink($pdfLink);
    } else {
        loadXSLwithMainDB('fehlerReservation.xsl');
    }
}

function insertIntoDB($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $eventID, $eventXML){

    // Creating new DOM 
    $xml = new DomDocument('1.0', 'UTF-8');
    $teilnehmer = $xml->createElement('teilnehmer');

    // creating new Teilnehmer
    $subnode1_element = $xml->createElement('vorname', $vorname);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('nachname', $nachname);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('geschlecht', $geschlecht);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('adresse', $adresse);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('stadt', $stadt);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('telefonnummer', $telefonnummer);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('geburtstag', $geburtstag);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('behinderung', $behinderungen);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('einzelzimmer', $einzelzimmer);
    $teilnehmer->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('spezielles', $spezielles);
    $teilnehmer->appendChild($subnode1_element);

    // teilnehmer in Datenbank hinzufügen
    $xpath = new DOMXPath( $eventXML );
    $eventIDforXpath = '//event[@id="'.$eventID.'"]/teilnehmerListe';
    $eventTeilnehmerListe = $xpath->query( $eventIDforXpath )->item(0);
    $importedEvent = $eventXML->importNode($teilnehmer, true);
    $eventTeilnehmerListe->appendChild($importedEvent);

    //Teilnehmeranzahl erhöhen. Wenn Teilnehmeranzahl maximalgrösse erreicht hat, schlägt Reservation fehl.
    $anzahlMöglicheTeilnehmerInEventXpath = '//event[@id="'.$eventID.'"]/anzahlMöglicheTeilnehmer';
    $anzahlAngemeldeteTeilnehmerXpath = '//event[@id="'.$eventID.'"]/anzahlTeilnehmer';
    $anzahlMöglicheTeilnehmerInEvent = $xpath->query($anzahlMöglicheTeilnehmerInEventXpath)->item(0)->nodeValue;
    $anzahlAngemeldeteTeilnehmerNode = $xpath->query($anzahlAngemeldeteTeilnehmerXpath)->item(0);

    if ($anzahlMöglicheTeilnehmerInEvent > $anzahlAngemeldeteTeilnehmerNode->nodeValue) {
        echo "Es hat noch genug Platz in diesem Event";
        // Anzahl Teilnehmer um 1 erhöhen
        $anzahlAngemeldeteTeilnehmerNode->nodeValue = $anzahlAngemeldeteTeilnehmerNode->nodeValue + 1;

        // Validierung XML, Wenn OK, soll PDF generiert werden.
        if (validationOfNewXML($eventXML, "schemaEventDB.xsd")) {
            echo "Validation successfull";
            $eventXML->save("Datenbank.xml");
            return true;
        } else {
            echo "Problem with creating and validating new Registration!";
            return false;
        }
    } else {
        echo "Maximale Anzahl Teilnehmer am Event bereits erreicht!";
        return false;
    }
}
