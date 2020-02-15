<?php

include("index.php");
$vorname = $_POST["vorname"];
$nachname = $_POST["nachname"];
$adresse = $_POST["adresse"];
$stadt = $_POST["stadt"];
$telefonnummer = $_POST["telefonnummer"];
$geburtstag = $_POST["geburtstag"];
$behinderungen = $_POST["behinderungen"];
$einzelzimmer = $_POST["einzelzimmer"];
$spezielles = $_POST["spezielles"];
$event = $_POST["event"];

createAndValidateXML($vorname, $nachname, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $event);
// addReservation($_POST["vorname"], $_POST["nachname"], $_POST["geschlecht"], $_POST["adresse"], $_POST["stadt"], $_POST["telefonnummer"], $_POST["geburtstag"], $_POST["behinderungen"], $_POST["einzelzimmer"], $_POST["spezielles"], $_POST["event"]);

function createAndValidateXML($vorname, $nachname, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $event){

$xml = new DomDocument('1.0', 'UTF-8');
    $example_element = $xml->createElement('teilnehmer');


$subnode1_element = $xml->createElement('vorname', $vorname);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('nachname', $nachname);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('adresse', $adresse);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('stadt', $stadt);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('telefonnummer', $telefonnummer);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('geburtstag', $geburtstag);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('behinderungen', $behinderungen);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('einzelzimmer', $einzelzimmer);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('spezielles', $spezielles);
$example_element->appendChild($subnode1_element);

$subnode1_element = $xml->createElement('event', $event);
$example_element->appendChild($subnode1_element);

$xml->appendChild($example_element);
$xml->formatOutput = TRUE;
$xml->save("test.xml");
}

// Fügt Reservation in der Datenbank ein
function addReservation($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $event){
    
    // Pfad zur Datenbank
    $eventXMLPath = "Datenbank.xml";

    // XML Datenbank laden
    $eventXML = simplexml_load_file($eventXMLPath);

    //Xpath um auf die Teilnehmerliste des angemeldeten Events zuzugreifen
    $path ="//event[@name=". $event ."]/teilnehmerliste";
    $element = $eventXML->xpath($path);

    //Neuen Teilnehmer als Child hinzufügen
    $newMember = $element->addChild('teilnehmer');
    $newMember->addChild('vorname', $vorname);
    $newMember->addChild('nachname', $nachname);
    $newMember->addChild('geschlecht', $geschlecht);
    $newMember->addChild('adresse', $adresse);
    $newMember->addChild('stadt', $stadt);
    $newMember->addChild('telefonnummer', $telefonnummer);
    $newMember->addChild('geburtstag', $geburtstag); //muss evt. noch angepasst werden da Datum im XML das Format YYYY-MM-DD verwendet
    $newMember->addChild('behinderung', $behinderungen);
    $newMember->addChild('einzelzimmer', $einzelzimmer);
    $newMember->addChild('spezielles', $spezielles);

    //TO-DO: PDF generieren

    // Home wieder laden
    main();
}
