<?php
include("parser.php");
function main()
{
    
   // load XML
    $data = file_get_contents('Datenbank.xml');
    $xml = new DOMDocument();
    $xml->loadXML($data);

    // create xhtml doc
    // this process should be used for every html we show to the user!
    $xsl = new DOMDocument();
    $xsl->load('statistik.xsl');
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    $dom = $processor->transformToDoc($xml);
    echo $dom->saveXML();
}
main();



