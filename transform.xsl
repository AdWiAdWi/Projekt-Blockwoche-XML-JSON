<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
		<html>
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
        		<h1>SPORTZENTRUM FÜR BEHINDERUNGEN</h1>	
				<br/>
				<h3>Anstehende Events</h3>

    		</section>

			<!--About-->
			<section class="text-center">
				<h1>ABOUT US</h1>
			</section>

			<!--Angebot-->
			<section class="text-center">
					<h1>SERVICES</h1>
					<h2>Unsere Themenwochen</h2>
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
                        	<option id="männlich" name="geschlecht" value="männlich">Männlich</option>
                        	<option id="weiblich" name="geschlecht" value="weiblich">Weiblich</option>
                        	<option id="anderes" name="geschlecht" value="other">anderes</option>
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
                        	<option id="männlich" name="behinderung" value="höhrbehinderung">Höhrbehinderung</option>
                        	<option id="weiblich" name="behinderung" value="geistige Behinderung">Geistige Behinderung</option>
                        	<option id="männlich" name="behinderung" value="nichtbehindert">Keine Behinderung</option>
							<option id="anderes" name="behinderung" value="körperbehinderung">Körperbehinderung</option>
                        	<option id="weiblich" name="behinderung" value="psychische Behinderung">Psychische Behinderung</option>
                        	<option id="anderes" name="behinderung" value="sehbehinderung">Sehbehinderung</option>
							<option id="anderes" name="behinderung" value="diverse Behinderungen">Diverse Behinderungen</option>
						</select>
					</div>
					<div class="form-group">
						<span>Einzelzimmer</span>
						<select class="form-control">
                        	<option  id="ja" name="einzelzimmer" value="Ja">Ja</option>
                        	<option  id="nein" name="einzelzimmer" value="Nein">Nein</option>
						</select>
					</div>
					<div class="col-12 text-center">
                    <button class="btn btn-lg btn-primary center-block" type="submit" value="Senden">Senden</button>
                	</div>
				</div>	
            </form>
			</body> 
		</html>
	</xsl:template>
</xsl:stylesheet>
