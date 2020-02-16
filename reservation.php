<?php

include("index.php");

$vorname = $_POST["vorname"];
$nachname = $_POST["nachname"];
$geschlecht = $_POST["geschlecht"];
$adresse = $_POST["adresse"];
$stadt = $_POST["stadt"];
$telefonnummer = $_POST["telefonnummer"];
$geburtstag = $_POST["geburtstag"];
$behinderungen = $_POST["behinderungen"];
$einzelzimmer = $_POST["einzelzimmer"];
$spezielles = $_POST["spezielles"];
// $event = $_POST["event"];

$validatedXML = createNewXML($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $event);
addReservation($validatedXML);

function createNewXML($vorname, $nachname, $geschlecht, $adresse, $stadt, $telefonnummer, $geburtstag, $behinderungen, $einzelzimmer, $spezielles, $event){

    $xml = new DomDocument('1.0', 'UTF-8');
    $example_element = $xml->createElement('teilnehmer');


    $subnode1_element = $xml->createElement('vorname', $vorname);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('nachname', $nachname);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('geschlecht', $geschlecht);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('adresse', $adresse);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('stadt', $stadt);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('telefonnummer', $telefonnummer);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('geburtstag', $geburtstag);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('behinderung', 'Psychische Behinderung');
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('einzelzimmer', 'true');
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('spezielles', $spezielles);
    $example_element->appendChild($subnode1_element);

    $subnode1_element = $xml->createElement('event', 'Fussball');
    $example_element->appendChild($subnode1_element);

    $xml->appendChild($example_element);
    $xml->formatOutput = TRUE;
    
    if (validationOfNewXML($xml, "schemaEventDB.xsd")){
        echo "Validation successfull";
        $xml->save("test.xml");
        return $xml;
    } else {
        echo "Problem with creating and validating new Registration!";
        return null;
    }

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
