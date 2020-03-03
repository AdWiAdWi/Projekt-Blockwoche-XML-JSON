<?php
include("parser.php");
include("xmlVerarbeitung.php");
loadFilter();


function loadFilter()
{
    $data = file_get_contents('Datenbank.xml');
    $xml = new DOMDocument();
    $xml->loadXML($data);

    $parsedParams = parse();
    $paramsValidationResult = $parsedParams->schemaValidate('filter.xsd');

    loadIndex();
}
