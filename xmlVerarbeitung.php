<?php
require_once 'php/fo/fop_service_client.php';

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

function loadingAndReturnMainDB(){
    $data = 'Datenbank.xml';
    $eventXML = new DOMDocument('1.0', 'UTF-8');
    $eventXML->load($data);
    $eventXML->formatOutput = true;
    return $eventXML;
}

function loadXSLwithMainDB($xslPath) {
    // load XML
    $data = file_get_contents('Datenbank.xml');
    $xml = new DOMDocument();
    $xml->loadXML($data);

    // create xhtml doc
    // this process should be used for every html we show to the user!
    $xsl = new DOMDocument();
    $xsl->load($xslPath);
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    $dom = $processor->transformToDoc($xml);
    echo $dom->saveXML();
}




function transformXmlToPdf($eventID) {
    $foData = generateFoFile($eventID);

    $serviceClient = new FOPServiceClient();
    $pdfFile = $serviceClient->processData($foData, tempnam(sys_get_temp_dir(), 'confirmation.') . '.pdf');

    return sprintf('Generated Confirmation PDF: <strong><a href="%s">download PDF</a></strong>', $pdfFile);
}

function generateFoFile($eventID){
    $eventDB = loadingAndReturnMainDB();

    // Need Information where xsl is located...
    $xsl = new DOMDocument();
    $xsl->load('confirmationReservation.xsl');

    // transform
    $xslt_proc = new XSLTProcessor();
    $xslt_proc->importStylesheet($xsl);
    $xslt_proc->setParameter('', 'eventID', $eventID);

    $dom = $xslt_proc->transformToDoc($eventDB);
    return $dom->saveXML();
}



?>