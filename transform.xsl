<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
		<html>
            <h1>Hello World!</h1>
            
            <!-- Formular für Registrierung Evt. bei entsprechendem event oder auf neuer seite? -->
            <form action="reservation.php" method="post">
				<p>Vorname: <input type="text" name="vorname"/></p>
				<p>Nachname: <input type="text" name="nachname"/></p>
				<p>Geschlecht:</p>
				<input type="radio" id="männlich" name="geschlecht" value="männlich" />
				<label for="männlich">Männlich</label><br/>
				  <input type="radio" id="weiblich" name="geschlecht" value="weiblich" />
				  <label for="weiblich">Weiblich</label><br/>
				  <input type="radio" id="anderes" name="geschlecht" value="other" />
				  <label for="other">Anderes</label>
				 <p>Adresse: <input type="text" name="adresse"/></p>
				 <p>Stadt: <input type="text" name="stadt"/></p>
				 <p>Telefonnummer: <input type="text" name="telefonnummer"/></p>
				<label>
				Geburtsdatum: 
				<input type="date" id="geburtstag"/>
				</label>
				<label>Behinderung (Mehrfachauswahl möglich):
					<select name="behinderungen[]" size="1" multiple="multiple">
					  <option>geistige Behinderung</option>
					  <option>höhrbehinderung</option>
					  <option>sehrbehinderung</option>
					  <option>psychische Behinderung</option>
					  <option>nichtbehindert</option>
					  <option>körperbehinderung</option>
					  <option>diverse Behinderungen</option>
					</select>
				</label>
				<p>Einzelzimmer gewünscht:</p>
				<input type="radio" id="ja" name="einzelzimmer" value="Ja" />
				<label for="ja">Ja</label><br/>
				<input type="radio" id="nein" name="einzelzimmer" value="Nein" />
				<label for="nein">Nein</label><br/>
				<input type="submit" value="Senden" />
            </form>
		</html>
	</xsl:template>
</xsl:stylesheet>
