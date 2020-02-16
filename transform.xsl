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
			<title>Sportzentrum für Behinderungen</title>
			</head>

            <body>

			<!--Homepage-->
    		<section class="home text-center">
				<div class="container">
					<h1 class="display-4">SPORTZENTRUM FÜR BEHINDERUNGEN</h1>
					<br />
					<h2>Anstehende Themenwochen</h2>
					<br />
					<br />
					<div class="row">
						<xsl:apply-templates select="//event[position() &lt;= 3]"/>
					</div>
				</div>
    		</section>

			<!--About-->
			<section class="about text-center">
				<div class="container">
					<h1 class="display-4">ABOUT US</h1>
					<br />
					<p style="font-weight:bold">Liebe Gäste,</p>
					<p>
					Es freut uns, Sie auf unserer Webseite begrüssen zu dürfen. bla bla bla...
					</p>
					
				</div>
    		</section>

			<!--Angebot-->
			<section class="service text-center">
				<div class="container">
					<h1 class="display-4">SERVICES</h1>
					<br />
					<h2>Unsere Themenwochen</h2>
					<br />
					<br />
					<div class="row">
						<xsl:apply-templates select="//event"/>
					</div>
				</div>
    		</section>

			<!-- Formular für Registrierung Evt. bei entsprechendem event oder auf neuer seite? -->
            <form action="reservation.php" method="post">
				<div class="offset-md-1 col-md-10 offset-lg-2 col-lg-8">
					<div class="form-group">
						<input class="form-control" type="text" name="vorname" placeholder="Vorname*" />
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="nachname" placeholder="Nachname*" />
					</div>
					<div class="form-group">
						<span>Geschlecht</span>
						<select class="form-control">
                        	<option name="geschlecht" value="Männlich">Männlich</option>
                        	<option name="geschlecht" value="Weiblich">Weiblich</option>
                        	<option name="geschlecht" value="Anderes">anderes</option>
						</select>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="adresse" placeholder="Adresse*" />
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="stadt" placeholder="Stadt*" />
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="telefonnummer" placeholder="Telefonnummer*" />
					</div>
					<div class="form-group">
						<span>Geburtsdatum</span>
						<input class="form-control" type="date" name="geburtstag" />
					</div>
					<div class="form-group">
						<span>Behinderungen</span>
						<select class="form-control" name="behinderungen[]" size="1" multiple="multiple">
                        	<option name="behinderung" value="Höhrbehinderung">Höhrbehinderung</option>
                        	<option name="behinderung" value="Geistige Behinderung">Geistige Behinderung</option>
                        	<option name="behinderung" value="Keine Behinderung">Keine Behinderung</option>
							<option name="behinderung" value="Körperbehinderung">Körperbehinderung</option>
                        	<option name="behinderung" value="Psychische Behinderung">Psychische Behinderung</option>
                        	<option name="behinderung" value="Sehbehinderung">Sehbehinderung</option>
							<option name="behinderung" value="Diverse Behinderungen">Diverse Behinderungen</option>
						</select>
					</div>
					<div class="form-group">
						<span>Einzelzimmer</span>
						<select class="form-control">
                        	<option name="einzelzimmer" value="Ja">Ja</option>
                        	<option name="einzelzimmer" value="Nein">Nein</option>
						</select>
					</div>
					<div class="col-12 text-center">
                    <button class="btn btn-lg btn-primary center-block" type="submit" value="Senden">Buchen</button>
                	</div>
				</div>	
            </form>
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
