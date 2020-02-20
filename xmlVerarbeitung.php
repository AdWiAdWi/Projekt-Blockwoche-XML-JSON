<?php

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

?>