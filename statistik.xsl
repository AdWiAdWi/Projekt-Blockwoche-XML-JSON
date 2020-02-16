<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"> 

    
    <!--Durchschnittliche Auslastung insgesamt in Prozenten-->
    <xsl:variable name="anzahlPlätze" select="sum(//anzahlMöglicheTeilnehmer/text())"/>
    <xsl:variable name="anzahlGebucht" select="sum(//anzahlTeilnehmer/text())"/>
    <xsl:variable name="auslastungInsgesamt" select="ceiling($anzahlPlätze div $anzahlGebucht)" />



    <!--Arten von Behinderungen-->
     <xsl:variable name="diverseBehinderungen" select="count(//teilnehmer/behinderung[text() = 'Diverse Behinderungen'])"/>
     <xsl:variable name="hörbehinderung" select="count(//teilnehmer/behinderung[text() = 'Höhrbehinderung'])"/>
     <xsl:variable name="körperbehinderung" select="count(//teilnehmer/behinderung[text() = 'Körperbehinderung'])"/>
     <xsl:variable name="psychischeBehinderung" select="count(//teilnehmer/behinderung[text() = 'Psychische Behinderung'])"/>
     <xsl:variable name="sehbehinderung" select="count(//teilnehmer/behinderung[text() = 'Sehbehinderung'])"/>
     <xsl:variable name="keineBehinderung" select="count(//teilnehmer/behinderung[text() = 'Keine Behinderung'])"/>
    


    <xsl:variable name="baseline" select="480"/>

<xsl:template match="/">
    <html>
    <body>
        <p>Test</p>

       

          <svg width="30cm" height="15cm"
			 viewBox="0 0 1000 800" preserveAspectRatio="none"
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">

        

           
  <text id="title">A bar chart showing information</text>
  
  <g class="bar">
    <rect  width="{$diverseBehinderungen*100}" height="19"></rect>
    <text x="{$diverseBehinderungen*100+5}" y="9.5" dy=".35em"> Diverse Behinderungen (<xsl:value-of select="$diverseBehinderungen"/> Personen)</text>
  </g>
  <g class="bar">
    <rect width="{$hörbehinderung*100}" height="19" y="20"></rect>
    <text x="{$hörbehinderung*100+5}" y="28" dy=".35em"><xsl:value-of select="$hörbehinderung"/> Höhrbehinderung</text>
  </g>
  <g class="bar">
    <rect width="{$körperbehinderung*100}" height="19" y="40"></rect>
    <text x="{$körperbehinderung*100+5}" y="48" dy=".35em"> <xsl:value-of select="$körperbehinderung"/> Körperbehinderung </text>
  </g>
  <g class="bar">
    <rect width="{$psychischeBehinderung*100}" height="19" y="60"></rect>
    <text x="{$psychischeBehinderung*100+5}" y="68" dy=".35em"><xsl:value-of select="$psychischeBehinderung"/> Psychische Behinderungen</text>
  </g>
  <g class="bar">
    <rect width="{$sehbehinderung*100}" height="19" y="80"></rect>
    <text x="{$sehbehinderung*100+5}" y="88" dy=".35em"><xsl:value-of select="$sehbehinderung"/> Sehbehinderung</text>
  </g>
  <g class="bar">
    <rect width="{$keineBehinderung*100}" height="19" y="100"></rect>
    <text x="{$keineBehinderung*100 +5}" y="108" dy=".35em"><xsl:value-of select="$keineBehinderung"/> Keine Behinderung</text>
  </g>
</svg>

           

            


      


        

      



    </body>
    </html>
        

    </xsl:template>

    
</xsl:stylesheet>