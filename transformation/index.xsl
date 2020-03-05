<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="selectedDate" />
	<xsl:param name="selectedHandicap" />
	<xsl:param name="selectedEventType" />
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
								<a class="nav-link" href="#home">HOME<span class="sr-only">(current)</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#about">ÜBER UNS</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#services">ANGEBOT</a>
							</li>
						</ul>
						<a href="administration.php">
							<button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Administration</button>
						</a>
						<a href="statistik.php">
							<button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Statistik</button>
						</a>
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
							<xsl:apply-templates select="//event[number(translate(startdatum,'-',''))&gt;=$date][position() &lt;= 3]"/>
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
							<div class="row offset-md-1 col-md-10 offset-lg-2 col-lg-8">
								<div class="iconborder col-md-4 text-center">
									<img class="icon" src="img/ballsportart.png" alt="Bild: Schwimmen" />
								</div>
								<div class="iconborder col-md-4 text-center">
									<img class="icon" src="img/schwimmen.png" alt="Bild: Ballsportart" />
								</div>
								<div class="iconborder col-md-4 text-center">
									<img class="icon" src="img/wandern.png" alt="Bild: Wandern" />
								</div>
							</div>
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
						<form class="filter" method="get" action="#services">
							<input type="date" id="start" name="startdatum" value="{$selectedDate}"></input>
							<select name="eventType">
								<option value="all">Alle</option>
								<option value="Basketball">Basketball</option>
								<option value="Fahrrad">Fahrrad</option>
								<option value="Fussball">Fussball</option>
								<option value="Klettern">Klettern</option>
								<option value="Schnitzeljagd">Schnitzeljagd</option>
								<option value="Schwimmen">Schwimmen</option>
								<option value="Ski und Snowboard">Ski und Snowboard</option>
								<option value="Wandern">Wandern</option>
							</select>
							<select name="behinderung">
								<option value="all">Alle</option>
								<option value="Geistige Behinderung">Geistige Behinderung</option>
								<option value="Höhrbehinderung">Höhrbehinderung</option>
								<option value="Körperbehinderung">Körperbehinderung</option>
								<option value="Psychische Behinderung">Psychische Behinderung</option>
								<option value="Sehbehinderung">Sehbehinderung</option>
								<option value="Keine Behinderung">Keine Behinderung</option>
								<option value="Diverse Behinderungen">Diverse Behinderungen</option>
							</select>
							<a>
								<button>Suchen</button>
							</a>
						</form>
						<br />
						<br />
						<div class="row" value="{$selectedHandicap}">
							<xsl:apply-templates select="//event[number(translate(startdatum,'-',''))&gt;=number(translate($selectedDate,'-',''))][*/behinderung=$selectedHandicap or $selectedHandicap='all'][@name=$selectedEventType or $selectedEventType='all']"/>
						</div>
					</div>
				</section>
				<div class ="text-center">Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="event">

		<!--XSL-Variables-->
		<xsl:variable name="event" select="@id"/>

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
				<form action="makeReservation.php" method="POST">
					<div class="form-group">
						<input type="hidden" name="event" value="{$event}"></input>
					</div>
					<button class="btn btn-lg btn-primary center-block" type="submit" value="Senden">Buchen</button>
				</form>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
