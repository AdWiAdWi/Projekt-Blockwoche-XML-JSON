<?php
include("xmlVerarbeitung.php");
$eventDatenbank = loadingAndReturnMainDB();
$event = $_POST['event'];
echo $event;
$xPathOfEvent = '/title[text() = "'.$event.'"]/..';
loadReservation($xPathOfEvent);

function loadReservation($xPathOfEvent) {
       // load XML
       $data = file_get_contents('Datenbank.xml');
       $xml = new DOMDocument();
       $xml->loadXML($data);
   
       // create xhtml doc
       // this process should be used for every html we show to the user!
       $xsl = new DOMDocument();
       $xsl->load('reservation.xsl');
       $processor = new XSLTProcessor();
       $processor->importStylesheet($xsl);
       $processor->setParameter( '', 'selectedEvent', $xPathOfEvent);
       $dom = $processor->transformToDoc($xml);
       echo $dom->saveXML();
}

?>