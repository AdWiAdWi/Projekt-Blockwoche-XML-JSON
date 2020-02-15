<?php
include("parser.php");
function main()
{
    // parse GET & POST params
    $paramsXML = parse();

    // validate params
    $xsd = "get.xsd";
    $result = $paramsXML->schemaValidate($xsd);
    echo "validation with schema:";

    
    // create xhtml doc
    // this process should be used for every html we show to the user!
    $xsl = new DOMDocument();
    $xsl->load('transform.xsl');
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    $dom = $processor->transformToDoc($paramsXML);
    echo $dom->saveXML();
}
main();
?>
