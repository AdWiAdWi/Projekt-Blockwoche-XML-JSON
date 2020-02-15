<?php

include("index.php");

addReservation($_POST["vorname"], $_POST["nachname"], $_POST["geschlecht"], $_POST["adresse"], $_POST["stadt"], $_POST["telefonnummer"], $_POST["geburtstag"], $_POST["behinderungen"], $_POST["einzelzimmer"], $_POST["spezielles"], $_POST["event"]);

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
?>