<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
		<html lang="de">
			<head>
			<!-- Bootstrap -->
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
			
			<!-- Google Font -->
			<link href="https://fonts.googleapis.com/css?family=Oswald&amp;display=swap" rel="stylesheet" />

			<!-- CSS -->
    		<link href="css/style.css" rel="stylesheet" />

			<!-- Title -->
			<title>Angebot</title>
			</head>

            <body>
				<!--Angebot-->
				<section class="filtered-service text-center" id="services">
					<div class="container">
						<h1 class="display-4">UNSERE THEMENWOCHEN</h1>
						<br />
						<br />
						<div class="row">
							<xsl:apply-templates select="//event"/>
						</div>
					</div>
				</section>
			</body> 
		</html>
	</xsl:template>

	<xsl:template match="event">
		<div class="event-field col-md-4 text-center">
			<div class="event-border mt-2 mr-0.2 mb-2 ml-0.2">
				<p class="service-title">
					<xsl:value-of select="@name" />	
				</p>
				<p class="service-content">
					Beginn: 
					<xsl:value-of select="startdatum/text()" />
				</p>
				<p class="service-content">
					Dauer des Anlasses:  
					<xsl:value-of select="dauerInTagen/text()" />
					Tage
				</p>
				<p class="service-content">
					Teilnahmeberechtigt: 
					<xsl:value-of select="handicap/behinderung/text()" />
				</p>
				<p class="service-description">
					<xsl:value-of select="beschreibung/text()" />
				</p>
				<button class="btn btn-lg btn-primary center-block" type="submit" value="Senden">Buchen</button>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
