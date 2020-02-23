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
			<title>Home</title>
			</head>

            <body>
				<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="#home">HOME<span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#about">ÜBER UNS</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#services">ANGEBOT</a>
							</li>
						</ul>
						<a href="administration.php"><button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Administration</button></a>	
						<a href="statistik.php"><button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Statistik</button></a>	
					</div>
				</nav>
				<!--Homepage-->
				<section class="home text-center" id="home">
					<div class="container">
						<h1 class="display-4">SPORTZENTRUM FÜR BEHINDERUNGEN</h1>
						<br />
						<h2>Anstehende Themenwochen</h2>
						<br />
						<div class="row">
							<xsl:apply-templates select="//event[position() &lt;= 3]"/>
						</div>
					</div>
				</section>

				<!--About-->
				<section class="about text-center" id="about">
					<div class="container">
						<h1 class="display-4">ÜBER UNS</h1>
						<br />
						<p style="font-weight:bold">Liebe Gäste,</p>
						<p class="offset-md-1 col-md-10 offset-lg-2 col-lg-8">
						Wir sind ein Sportzentrum und Hotelbetrieb für Athleten mit Leidenschaft. Unser Motto ist "Sport für alle!" - Denn Sport ist gesund und sollte jedem zugänglich gemacht werden. Deshalb versuchen wir auch stark im Behindertensport Fuss zu fassen und unser Angebot bestmöglich auf die jeweiligen Fähigkeiten unserer Kunden auszurichten.
						<br />
						<br />
						Unsere Infastruktur umfasst eine Schwimmanlage, Fussballplätze, eine Sporthalle sowie eine Rennbahn. Unsere Anlage ist umgegeben von atemberaubenden Berlandschaften, Flüssen und Wälder - Der perfekte Rückzugsort, um sich zu erholen oder sportlich auszutoben.
						<br />
						<br />
						Unseren Kundinnen und Kunden bieten wir diverse Themenwochen, die auf ihre Bedürfnisse angepasst sind. Wir sind bestrebt unser Angebot stets auszubauen und mit neuen kreativen Ideen zu ergänzen! 
						<br />
						<br />
						Wir hoffen, auch Sie zu unseren Kunden zählen zu dürfen!
						</p>
					</div>
				</section>

				<!--Angebot-->
				<section class="service text-center" id="services">
					<div class="container">
						<h1 class="display-4">UNSERE THEMENWOCHEN</h1>
						<br />
						<br />
						<h3>Filtern</h3>
						<form class="filter" method="get" action="filter.php">
							<input type="date" id="start" name="startdatum"></input> <!-- start date should be param -->
							<select name="eventType"> <!-- options should come from db -->
								<option value="Basketball">Basketball</option>
                                <option value="Fahrrad">Fahrrad</option>
                                <option value="Fussball">Fussball</option>
								<option value="Klettern">Klettern</option>
                                <option value="Schnitzeljagd">Schnitzeljagd</option>
                                <option value="Schwimmen">Schwimmen</option>
								<option value="Ski und Snowboard">Ski und Snowboard</option>
								<option value="Wandern">Wandern</option>
							</select>
							<select name="behinderung"> <!-- options should come from db -->
								<option value="Geistige Behinderung">Geistige Behinderung</option>
                                <option value="Höhrbehinderung">Höhrbehinderung</option>
                                <option value="Körperbehinderung">Körperbehinderung</option>
								<option value="Psychische Behinderung">Psychische Behinderung</option>
                                <option value="Sehbehinderung">Sehbehinderung</option>
                                <option value="Keine Behinderung">Keine Behinderung</option>
								<option value="Diverse Behinderungen">Diverse Behinderungen</option>
							</select>
							<a href="filter.php"><button>Suchen</button></a>
						</form>
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
