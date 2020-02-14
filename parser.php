<?php
// returns a DOMDocument
function parse()
{  
    $doc = new DOMDocument();
    $getRoot = $doc->createElement("Get");
    $doc->appendChild($getRoot);
    setValues($getRoot, $doc, $_GET);
    $postRoot = $doc->createElement("Post");
    setValues($postRoot, $doc, $_POST);
    $doc->appendChild($postRoot);
    return $doc;
    
}

function setValues($root, $doc, $values){
    foreach($values as $title =>$value){
        $newElement = $doc->createElement($title);
        $newElement->nodeValue = $value;
        $root->appendChild($newElement);
    }
}