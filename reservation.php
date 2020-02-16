<?php

include("index.php");

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

$eventXML = loadingAndReturnMainDB();
$reservationXML = loadingAndReturnReservationDB();

$validatedXML = insertIntoReservationXML($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $eventID, $eventXML, $reservationXML);
//addReservation($validatedXML);

function insertIntoReservationXML($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $eventID, $eventXML, $reservationXML){

    // Creating new DOM 
    $xml = new DomDocument('1.0', 'UTF-8');
    $reservation = $xml->createElement('reservation');
    $teilnehmer = $xml->createElement('teilnehmer');
    $reservation->appendChild($teilnehmer);

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

    $event = $eventXML->getElementByID($eventID);
    $reservation->appendChild($event);

    $reservationen = $reservationXML->getElementsByTagName('reservationen');
    $reservationen[0]->appendChild($reservation);

    if (validationOfNewXML($reservationen[0], "schemaReservation.xsd")){
        echo "Validation successfull";
        $reservationXML->save("test.xml");
        return $xml;
    } else {
        echo "Problem with creating and validating new Registration!";
        return null;
    }

}

function loadingAndReturnMainDB(){
    $data = file_get_contents('Datenbank.xml');
    $eventXML = new DOMDocument();
    $eventXML->loadXML($data);
    return $eventXML;
}

function loadingAndReturnReservationDB(){
    $data = file_get_contents('Reservationen.xml');
    $reservationXML = new DOMDocument();
    $reservationXML->loadXML($data);
    return $reservationXML;
}

function validationOfNewXML($xml, $xsd) {
        // disable error output to client   
        libxml_use_internal_errors(true);

        $result = $xml->schemaValidate($xsd);
    
        // show errors   
        if (!$result) {     
            $errors = libxml_get_errors();     
            foreach ($errors as $error) {       
                echo sprintf('Line [%d]: %s', $error->line, $error->message);     
            }     
            libxml_clear_errors();   
            return false;
        } else {
            echo "Validation successfull";
            return true;
        }

}

// Fügt Reservation in der Datenbank ein
function addReservation($xmlToInsert){
    
    // Pfad zur Datenbank
    $eventXMLPath = "Datenbank.xml";

    // XML Datenbank laden
    $eventXML = simplexml_load_file($eventXMLPath);

    //Event-Typ herauslesen
    $eventElementFromNewMember = $xmlToInsert->getElementsByTagName('event');


    //Xpath um auf die Teilnehmerliste des angemeldeten Events zuzugreifen
    $path ="//event[@name=". $eventElementFromNewMember[0] ."]/teilnehmerliste";
    $element = $eventXML->xpath($path);

    //Neuen Teilnehmer als Child hinzufügen und validieren
    $element->appendChild($xmlToInsert);
    validationOfNewXML($eventXML, "schemaEventDB.xsd");

    //TO-DO: PDF generieren

    // Home wieder laden
    main();
}
