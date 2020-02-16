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
			<title>Reservation</title>
			</head>

            <body>

			<!--Homepage-->
    		<section class="reservation text-center">
				<div class="container">
                    <xsl:apply-templates select="//event[1]"/>
				</div>
    		</section>

            
			</body> 
		</html>
	</xsl:template>

	<xsl:template match="event">

        <!--XSL-Variables-->
        <xsl:variable name="event" select="@id"/>

        <!--Form-->
		<div class="event-field col-md-12 text-center">
					<form action="reservation.php" method="post">
                        <div class="offset-md-1 col-md-10 offset-lg-2 col-lg-8">
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
					</div>
                    <h2>Jetzt buchen</h2>
                        <div class="text-left">
                            <div class="form-group">
                                <input type="hidden" name="event" value="{$event}" />
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="vorname" placeholder="Vorname*" />
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="nachname" placeholder="Nachname*" />
                            </div>
                            <div class="form-group">
                                <label>Geschlecht</label>
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
                                <label>Geburtsdatum</label>
                                <input class="form-control" type="date" name="geburtstag" />
                            </div>
                            <div class="form-group">
                                <label>Behinderungen</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Höhrbehinderung" id="höhrBehinderung" />
                                    <label class="form-check-label" for="höhrBehinderung">Höhrbehinderung</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Geistige Behinderung" id="geistigeBehinderung" />
                                    <label class="form-check-label" for="geistigeBehinderung">Geistige Behinderung</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Keine Behinderung" id="noBehinderung" />
                                    <label class="form-check-label" for="noBehinderung">Keine Behinderung</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Körperbehinderung" id="körperBehinderung" />
                                    <label class="form-check-label" for="körperBehinderung">Körperliche Behinderung</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Psychische Behinderung" id="psychischeBehinderung" />
                                    <label class="form-check-label" for="psychischeBehinderung">Psychische Behinderung</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Sehbehinderung" id="sehBehinderung" />
                                    <label class="form-check-label" for="sehBehinderung">Sehbehinderung</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="behinderung" value="Diverse Behinderungen" id="diverseBehinderungen" />
                                    <label class="form-check-label" for="diverseBehinderungen">Diverse Behinderungen</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Einzelzimmer</label>
                                <select class="form-control">
                                    <option name="einzelzimmer" value="true">Ja</option>
                                    <option name="einzelzimmer" value="false">Nein</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="spezielles" placeholder="Spezielles*" />
                            </div>
                            <div class="col-12 text-center">
                            <a href="index.php"><button class="btn btn-lg btn-primary center-block mr-1">Zurück</button></a>
                            <button class="btn btn-lg btn-primary center-block ml-1" type="submit" value="Senden">Buchen</button>
                            </div>
                            </div>
                        </div>	
                    </form> 
                </div>
	</xsl:template>

</xsl:stylesheet>
