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

$validatedXML = insertIntoReservationXML($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $eventID, $eventXML);


function insertIntoReservationXML($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $eventID, $eventXML){

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
        // $teilnehmer und event mit $eventIDforXpath ein PDF generieren!
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
    }
}

function loadingAndReturnMainDB(){
    $data = 'Datenbank.xml';
    $eventXML = new DOMDocument('1.0', 'UTF-8');
    $eventXML->load($data);
    $eventXML->formatOutput = true;
    return $eventXML;
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
