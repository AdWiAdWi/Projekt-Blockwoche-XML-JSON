<?php
require_once 'php/fo/fop_service_client.php';
require_once 'parser.php';

function validationOfNewXML($xml, $xsd)
{
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
        return true;
    }
}
/**
 * Loads the database
 * @return      DOMNode
 */
function getMainDB()
{
    $data = 'Datenbank.xml';
    $eventXML = new DOMDocument('1.0', 'UTF-8');
    $eventXML->load($data);
    $eventXML->formatOutput = true;
    return $eventXML;
}

function loadXSLwithMainDB($xslPath)
{
    $processor = createXSLProcessor($xslPath);
    $xml = getMainDB();
    transformAndEchoXSLT($processor, $xml);
}

function loadXSLwithPdfLink($pdfLink)
{
    $xml = getMainDB();
    $xsl = new DOMDocument();
    $xsl->load('transformation/bestätigungReservation.xsl');
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    $processor->setParameter( '', 'pdfLink', $pdfLink);
    $dom = $processor->transformToDoc($xml);
    echo $dom->saveXML();
}

/**
 * @param XSLTProcessor $xsltProcessor 
 * @param DOMNode $xml
 */
function transformAndEchoXSLT($xsltProcessor, $xml)
{
    $dom = $xsltProcessor->transformToDoc($xml);
    echo $dom->saveXML();
}


/**
 * @return XSLTProcessor
 */
function createXSLProcessor($xslPath)
{
    $xsl = new DOMDocument();
    $xsl->load($xslPath);
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    return $processor;
}


function loadIndex()
{

    $processor = createXSLProcessor('transformation/index.xsl');
    $processor->setParameter('', 'date', date('Ymd'));

    $parsedParams = parse();
    if ($parsedParams->schemaValidate('schemas/filter.xsd')) {
        if (isset($_GET['startdatum'])) {
            $processor->setParameter('', 'selectedDate', $_GET['startdatum']);
        } else {
            $processor->setParameter('', 'selectedDate', date('Y-m-d'));
        }
        if (isset($_GET['behinderung'])) {
            $processor->setParameter('', 'selectedHandicap', $_GET['behinderung']);
        } else {
            $processor->setParameter('', 'selectedHandicap', 'all');
        }
        if (isset($_GET['eventType'])) {
            $processor->setParameter('', 'selectedEventType', $_GET['eventType']);
        } else {
            $processor->setParameter('', 'selectedEventType', 'all');
        }
    }
    transformAndEchoXSLT($processor, getMainDB());
}

function transformXmlToPdf($eventID)
{
    $foFile = 'files/confirmation-'.uniqid().'.fo';
    generateFoFile($eventID, $foFile);
    $serviceClient = new FOPServiceClient();
    return $serviceClient->processFile($foFile);;
}

function generateFoFile($eventID, $fileName)
{
    $eventDB = getMainDB();

    $xslt_proc = createXSLProcessor('transformation/confirmationReservation.xsl');
    $xslt_proc->setParameter('', 'eventID', $eventID);

    $dom = $xslt_proc->transformToDoc($eventDB);
    $dom->save($fileName);
}
