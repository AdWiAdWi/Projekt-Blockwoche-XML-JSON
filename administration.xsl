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
			<title>Administration</title>
			</head>

            <body>
             <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="index.php">HOME<span class="sr-only">(current)</span></a>
							</li>
					
						</ul>
						<a href="administration.php"><button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Administration</button></a>	
						<a href="statistik.php"><button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Statistik</button></a>	
					</div>
				</nav>

                <br/>
				
				<!--Eventeingabe-->
				<section class="administration text-center" id="services">
					<div class="container">
						<h1 class="display-4">ADMINISTRATION</h1>
						<br />
						<br />
						<h3>Event hinzufügen</h3>
                        <form action="administrationsbearbeitung.php" method="post">
                            <div class="offset-md-1 col-md-10 offset-lg-2 col-lg-8">
                                <div class="text-left">
                                    <div class="form-group">
                                        <label>Event</label>
                                        <select class="form-control" name="eventType"> 
                                            <option value="Basketball">Basketball</option>
                                            <option value="Fahrrad">Fahrrad</option>
                                            <option value="Fussball">Fussball</option>
                                            <option value="Klettern">Klettern</option>
                                            <option value="Schnitzeljagd">Schnitzeljagd</option>
                                            <option value="Schwimmen">Schwimmen</option>
                                            <option value="Ski und Snowboard">Ski und Snowboard</option>
                                            <option value="Wandern">Wandern</option>
                                        </select>
                                    </div>
                                                                         <div class="form-group">
                                        <textarea class="form-control" name="title" placeholder="Titel des Events*" rows="1"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="number" name="dauerInTagen" min="1" max="7" placeholder="Dauer*"/>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="date" name="startdatum" />
                                    </div>
                                     <div class="form-group">
                                        <textarea class="form-control" name="beschreibung" placeholder="Beschreibung*" rows="3"></textarea>
                                    </div>
                                                                        <div class="form-group">
                                        <input class="form-control" type="number" name="maximaleAnzahlTeilnehmer" min="1" max="50" placeholder="Maximale Anzahl Teilnehmer*"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Behinderungen</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Höhrbehinderung" id="höhrBehinderung" />
                                            <label class="form-check-label" for="höhrBehinderung">Höhrbehinderung</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Geistige Behinderung" id="geistigeBehinderung" />
                                            <label class="form-check-label" for="geistigeBehinderung">Geistige Behinderung</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Keine Behinderung" id="noBehinderung" />
                                            <label class="form-check-label" for="noBehinderung">Keine Behinderung</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Körperbehinderung" id="körperBehinderung" />
                                            <label class="form-check-label" for="körperBehinderung">Körperliche Behinderung</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Psychische Behinderung" id="psychischeBehinderung" />
                                            <label class="form-check-label" for="psychischeBehinderung">Psychische Behinderung</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Sehbehinderung" id="sehBehinderung" />
                                            <label class="form-check-label" for="sehBehinderung">Sehbehinderung</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="behinderungen[]" value="Diverse Behinderungen" id="diverseBehinderungen" />
                                            <label class="form-check-label" for="diverseBehinderungen">Diverse Behinderungen</label>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <button class="btn btn-lg btn-primary center-block" type="submit" name="absenden" value="Senden">Einfügen</button>
                                    </div>
                                </div>    
                            </div>	
                        </form>
						<br />
						<br />
					</div>
				</section>
			</body> 
		</html>
	</xsl:template>
</xsl:stylesheet>
