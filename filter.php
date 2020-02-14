<?php
    $xml = new DOMDocument();

    $xsl = new DOMDocument();
    $xsl->load('filter.xsl');
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    $dom = $processor->transformToDoc($xml);
    echo $dom->saveXML();