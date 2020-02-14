<?php
include("parser.php");
$paramsXML = parse();
echo $paramsXML->saveXML();

$xsd = "get.xsd";
$result = $paramsXML->schemaValidate($xsd);
echo $result;

