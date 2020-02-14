<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
		<html>
            <h1>Filter!</h1>
            <form method="get" action="filter.php">
                <input type="date" id="start"></input> <!-- start date should be param -->
                <input type="date" id="end"></input>
                <select> <!-- options should come from db -->
                    <option>Ballsport</option>
                    <option>Leichtatletik</option>
                    <option>Fangis</option>
                </select>
                <select> <!-- options should come from db -->
                    <option>Sehbehindert</option>
                    <option>Gehbehindert</option>
                    <option>Komplett behindert</option>
                </select>
                <input type="submit"></input>
            </form>
		</html>
	</xsl:template>
</xsl:stylesheet>
