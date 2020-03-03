<?php

include("xmlVerarbeitung.php");

if ($_POST["absenden"]) {
    $eventType = $_POST["eventType"];
    $startDatum = $_POST["startdatum"];
    $dauerInTagen = $_POST["dauerInTagen"];
    $beschreibung = $_POST["beschreibung"];
    $behinderungen = $_POST["behinderungen"];
    $title = $_POST["title"];
    $anzahlMöglicheTeilnehmer = $_POST["maximaleAnzahlTeilnehmer"];

    $eventDatenbank = getMainDB();
    $insertIntoEventDB = insertIntoEventDatenbank($eventType, $startDatum, $dauerInTagen, $beschreibung, $behinderungen, $eventDatenbank, $title, $anzahlMöglicheTeilnehmer);

    if ($insertIntoEventDB) {
        echo "Insertion successfull";
        loadXSLwithMainDB('bestätigungEventHinzufuegen.xsl');
    } else {
        echo "Insertion not successfull";
        loadXSLwithMainDB('fehlerEventHinzufuegen.xsl');
    }

}

function insertIntoEventDatenbank($eventType, $startDatum, $dauerInTagen, $beschreibung, $behinderungen, $eventDatenbank, $title, $anzahlMöglicheTeilnehmer) {

    // Creating new DOM event
    $xml = new DomDocument('1.0', 'UTF-8');
    $event = $xml->createElement('event');
    $nameAttribute = $xml->createAttribute('name');
    $event->appendChild($nameAttribute);
    $event->setAttribute('name', $eventType);

    // inserting elements into event
    $subnode1_element = $xml->createElement('title', $title);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('dauerInTagen', $dauerInTagen);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('startdatum', $startDatum);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('beschreibung', $beschreibung);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('handicap');
    foreach ($behinderungen as $item) {
        $subnode2_element = $xml->createElement('behinderung', $item);
        $subnode1_element->appendChild($subnode2_element);
    }
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('anzahlMöglicheTeilnehmer', $anzahlMöglicheTeilnehmer);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('anzahlTeilnehmer', 0);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('findetStatt', true);
    $event->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('teilnehmerListe');
    $event->appendChild($subnode1_element);

    // eventID vom letzten Event herausfinden und inkrementieren und in neues Event hinzufügen
    $xpath = new DOMXPath($eventDatenbank);
    $eventsLength = $xpath->query('//event/@id')->length;
    $newEventID = $xpath->query('//event/@id')->item($eventsLength - 1)->nodeValue + 1;
    echo $newEventID;
    $idAttribute = $xml->createAttribute('id');
    $event->appendChild($idAttribute);
    $event->setAttribute('id', $newEventID);


    // event in Datenbank.xml hinzufügen
    $xpath = new DOMXPath($eventDatenbank);
    $eventsNode = $xpath->query('//events')->item(0);
    $importedEvent = $eventDatenbank->importNode($event, true);
    $eventsNode->appendChild($importedEvent);

    // Neues XML validieren und abspeichern
    if (validationOfNewXML($eventDatenbank, 'schemaEventDB.xsd')){
        $eventDatenbank->save("Datenbank.xml");
        return true;
    } else {
        echo "Problem with creating and validation new Registration!";
        return false;
    }
}

?>