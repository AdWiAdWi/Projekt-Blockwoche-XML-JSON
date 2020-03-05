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
			<title>Error - Reservation</title>
			</head>

            <body>
				
				<!--Eventeingabe-->
				<section class="administration text-center" id="services">
					<div class="container">
						<h1 class="display-4">ERROR</h1>
						<br />
						<br />
						<p>Die Reservation hat leider nicht geklappt - Bitte kehren Sie zurück zur Startseite und versuchen Sie es erneut!</p>
						<br />
						<br />
						<a href="index.php"><button class="btn btn-outline-success my-2 my-sm-0 ml-3" type="submit">Zurück zur Startseite</button></a>
					</div>
				</section>
			</body> 
		</html>
	</xsl:template>
</xsl:stylesheet>