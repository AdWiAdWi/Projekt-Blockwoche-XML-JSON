<?php
include("xmlVerarbeitung.php");
$eventID = $_POST['event'];
loadReservation($eventID);

function loadReservation($eventID) {
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
       $processor->setParameter( '', 'selectedEvent', $eventID);
       $dom = $processor->transformToDoc($xml);
       echo $dom->saveXML();
}

?>