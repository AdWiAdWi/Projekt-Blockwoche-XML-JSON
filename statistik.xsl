<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"> 

    
    <!--Durchschnittliche Auslastung insgesamt in Prozenten-->
    <xsl:variable name="anzahlPlätze" select="sum(//anzahlMöglicheTeilnehmer/text())"/>
    <xsl:variable name="anzahlGebucht" select="sum(//anzahlTeilnehmer/text())"/>
    <xsl:variable name="auslastungInsgesamt" select="(($anzahlGebucht div $anzahlPlätze))"/>
    <xsl:variable name="auslastungInsgesamtProzent" select="format-number($auslastungInsgesamt, '##%')"/>


    <!--Arten von Behinderungen-->
     <xsl:variable name="diverseBehinderungen" select="count(//teilnehmer/behinderung[text() = 'Diverse Behinderungen'])"/>
     <xsl:variable name="hörbehinderung" select="count(//teilnehmer/behinderung[text() = 'Höhrbehinderung'])"/>
     <xsl:variable name="körperbehinderung" select="count(//teilnehmer/behinderung[text() = 'Körperbehinderung'])"/>
     <xsl:variable name="psychischeBehinderung" select="count(//teilnehmer/behinderung[text() = 'Psychische Behinderung'])"/>
     <xsl:variable name="sehbehinderung" select="count(//teilnehmer/behinderung[text() = 'Sehbehinderung'])"/>
     <xsl:variable name="keineBehinderung" select="count(//teilnehmer/behinderung[text() = 'Keine Behinderung'])"/>


     <!--Gender-->
    <xsl:variable name="weiblich" select="count(//teilnehmer/geschlecht[text() = 'Weiblich'])"/>
    <xsl:variable name="weiblichProzent" select="format-number($weiblich div $anzahlGebucht, '##%')"/>
    <xsl:variable name="männlich" select="count(//teilnehmer/geschlecht[text() = 'Männlich'])"/>
    <xsl:variable name="männlichProzent" select="format-number($männlich div $anzahlGebucht, '##%')"/>
    <xsl:variable name="anderes" select="count(//teilnehmer/geschlecht[text() = 'Anderes'])"/>
    <xsl:variable name="anderesProzent" select="format-number($anderes div $anzahlGebucht, '##%')"/>
    <xsl:variable name="pointer" select="format-number(($weiblich + $männlich) div $anzahlGebucht, '##%')"/>


 

    


    <xsl:variable name="baseline" select="480"/>

<xsl:template match="/">
    <html>
    <body>
        <h3>Behinderungen der Teilnehmer</h3>

       

          <svg width="100%" height="200px"
			 viewBox="0 0 1000 150" preserveAspectRatio="none"
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">

        

           
  
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


<!--Auslastung der angebotenen Plätze in Prozent-->
    <h3>Auslastung der Plätze insgesamt in Prozent</h3>


                   <svg width="90%" height="65px"
			 viewBox="0 0 1132 65" preserveAspectRatio="none"
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">
           

  <g class='bars'>
    <rect class='bg' fill='#ccc' width='100%' height='25'></rect>
    <rect class='data' fill='#0074d9' width="{$auslastungInsgesamtProzent}" height='25'></rect>
  </g>
  <g class='markers'>
    <rect fill='#001f3f' x='0%' y='0' width='2px' height='35'></rect>
    <rect fill='#001f3f' x='25%' y='0' width='2px' height='35'></rect>
    <rect fill='#001f3f' x='50%' y='0' width='2px' height='35'></rect>
    <rect fill='#001f3f' x='75%' y='0' width='2px' height='35'></rect>
    <rect text-anchor='' fill='#001f3f' x='1130' y='0' width='2px' height='35'></rect>
  </g>
  <g text-anchor='middle'>
    <text text-anchor='start' fill='#0074d9' x='0' y='60'>0%</text>
    <text fill='#0074d9' x='25%' y='60'>25%</text>
    <text fill='#0074d9' x='50%' y='60'>50%</text>
    <text fill='#0074d9' x='75%' y='60'>75%</text>
    <text text-anchor='end' fill='#0074d9' x='100%' y='60'>100%</text>
  </g>
</svg>



 <h3>Aufteilung der Geschlechter der Teilnehmer</h3>


                   <svg width="90%" height="65px"
			 viewBox="0 0 1132 65" preserveAspectRatio="none"
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">
           
  

  <g class='bars'>
    <rect class='bg' fill='#ccc' width='100%' height='25'></rect>
    <rect class='data' fill='blue' width="{$weiblichProzent}" height='25'></rect>
    <rect class='data' fill='red' x='{$weiblichProzent}' width="{$männlichProzent}" height='25'></rect>
    <rect class='data' fill='yellow' x='{$pointer}' width="{$anderesProzent}" height='25'></rect>
  
  </g>
  <g class='markers'>
    <rect fill='#001f3f' x='0%' y='0' width='2px' height='35'></rect>
    <rect fill='#001f3f' x='25%' y='0' width='2px' height='35'></rect>
    <rect fill='#001f3f' x='50%' y='0' width='2px' height='35'></rect>
    <rect fill='#001f3f' x='75%' y='0' width='2px' height='35'></rect>
    <rect text-anchor='' fill='#001f3f' x='1130' y='0' width='2px' height='35'></rect>
  </g>
  <g text-anchor='middle'>
    <text text-anchor='start' fill='#0074d9' x='0' y='60'>0%</text>
    <text fill='#0074d9' x='25%' y='60'>25%</text>
    <text fill='#0074d9' x='50%' y='60'>50%</text>
    <text fill='#0074d9' x='75%' y='60'>75%</text>
    <text text-anchor='end' fill='#0074d9' x='100%' y='60'>100%</text>
  </g>
</svg>



 <h3>Aufteilung Veranstaltungen pro Sportart</h3>


        <svg width="90%" height="500px"
			
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">

      
           
  
	<g transform="translate(40,20)">
	<g class="x axis" transform="translate(0,450)">
			<g class="tick" transform="translate(25.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="10" style="text-anchor: middle;">Klettern</text>
		</g>
			<g class="tick" transform="translate(59.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="50" style="text-anchor: middle;">Basketball</text>
		</g>
			<g class="tick" transform="translate(93.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="180" style="text-anchor: middle;">Schwimmen</text>
		</g>
			<g class="tick" transform="translate(127.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="260" style="text-anchor: middle;">Schnitzeljagd</text>
		</g>
			<g class="tick" transform="translate(161.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="340" style="text-anchor: middle;">Wandern</text>
		</g>
			<g class="tick" transform="translate(195.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="420" style="text-anchor: middle;">Fahrrad</text>
		</g>
			<g class="tick" transform="translate(229.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			<text dy=".71em" y="9" x="500" style="text-anchor: middle;">Ski und Snowboard</text>
		</g>
		
		<path class="domain" d="M0,6V0H900V6"></path>
	</g>
		<g class="y axis">
			<g class="tick" transform="translate(0,450)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">0%</text>
		</g>
			<g class="tick" transform="translate(0,414.57250826641473)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">1%</text>
		</g>
			<g class="tick" transform="translate(0,379.14501653282946)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">2%</text>
		</g>
			<g class="tick" transform="translate(0,343.71752479924425)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">3%</text>
		</g>
			<g class="tick" transform="translate(0,308.290033065659)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">4%</text>
		</g>
			<g class="tick" transform="translate(0,272.86254133207365)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">5%</text>
		</g>
			<g class="tick" transform="translate(0,237.43504959848843)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">6%</text>
		</g>
			<g class="tick" transform="translate(0,202.0075578649031)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">7%</text>
		</g>
			<g class="tick" transform="translate(0,166.5800661313179)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">8%</text>
		</g>
			<g class="tick" transform="translate(0,131.15257439773262)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">9%</text>
		</g>
			<g class="tick" transform="translate(0,95.72508266414734)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">10%</text>
		</g>
			<g class="tick" transform="translate(0,60.297590930562116)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">11%</text>
		</g>
			<g class="tick" transform="translate(0,24.87009919697684)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">12%</text>
		</g>
		<path class="domain" d="M-6,0H0V450H-6"></path>
		<text transform="rotate(-90)" y="6" dy=".71em" style="text-anchor: end;">Frequency</text>
	</g>
		<rect class="bar" x="20" width="31" y="160.66367501180912" height="289.3363249881909"></rect>
		<rect class="bar" x="100" width="31" y="397.1421823334908" height="52.85781766650922"></rect>
		<rect class="bar" x="180" width="31" y="351.4407179971658" height="98.55928200283421"></rect>
		<rect class="bar" x="260" width="31" y="299.3268776570619" height="150.6731223429381"></rect>
		<rect class="bar" x="340" width="31" y="0" height="450"></rect>
		<rect class="bar" x="420" width="31" y="368.94189891355694" height="81.05810108644306"></rect>
		<rect class="bar" x="500" width="31" y="378.61360415682566" height="71.38639584317434"></rect>
		
	</g>
</svg>




  



    </body>
    </html>
        

    </xsl:template>

    
</xsl:stylesheet>