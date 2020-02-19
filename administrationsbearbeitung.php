<?php

include("reservation.php");

$eventType = $_POST["eventType"];
$startDatum = $_POST["startdatum"];
$dauerInTagen = $_POST["dauerInTagen"];
$beschreibung = $_POST["beschreibung"];
$behinderungen = $_POST["behinderung"];

$eventDatenbank = loadingAndReturnMaindDB();

$validiertesXML = insertIntoEventDatenbank($eventType, $startDatum, $dauerInTagen, $beschreibung, $behinderungen, $eventDatenbank);

function insertIntoEventDatenbank($eventType, $startDatum, $dauerInTagen, $beschreibung, $behinderungen, $eventDatenbank) {

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

}

?>