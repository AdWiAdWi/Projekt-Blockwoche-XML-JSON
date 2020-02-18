<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"> 

    
    <!--Durchschnittliche Auslastung insgesamt in Prozenten-->
    <xsl:variable name="anzahlPlätze" select="sum(//anzahlMöglicheTeilnehmer/text())"/>
    <xsl:variable name="anzahlGebucht" select="sum(//anzahlTeilnehmer/text())"/>
    <xsl:variable name="auslastungInsgesamt" select="(($anzahlGebucht div $anzahlPlätze))"/>
    <xsl:variable name="auslastungInsgesamtProzent" select="format-number($auslastungInsgesamt, '##%')"/>


    <!--Behinderungen-->
     <xsl:variable name="diverseBehinderungen" select="count(//teilnehmer/behinderung[text() = 'Diverse Behinderungen'])"/>
     <xsl:variable name="diverseBehinderungenProzent" select="(450 div $anzahlGebucht) * $diverseBehinderungen"/>
     <xsl:variable name="diverseBehinderungenAbstand" select="450 - $diverseBehinderungenProzent"/>
     <xsl:variable name="hörbehinderung" select="count(//teilnehmer/behinderung[text() = 'Höhrbehinderung'])"/>
     <xsl:variable name="hörbehinderungProzent" select="(450 div $anzahlGebucht) * $hörbehinderung"/>
     <xsl:variable name="hörbehinderungAbstand" select="450 - $hörbehinderungProzent"/>
     <xsl:variable name="körperbehinderung" select="count(//teilnehmer/behinderung[text() = 'Körperbehinderung'])"/>
     <xsl:variable name="körperbehinderungProzent" select="(450 div $anzahlGebucht) * $körperbehinderung"/>
     <xsl:variable name="körperbehinderungAbstand" select="450 - $körperbehinderungProzent"/>
     <xsl:variable name="psychischeBehinderung" select="count(//teilnehmer/behinderung[text() = 'Psychische Behinderung'])"/>
     <xsl:variable name="psychischeBehinderungProzent" select="(450 div $anzahlGebucht) * $psychischeBehinderung"/>
     <xsl:variable name="psychischeBehinderungAbstand" select="450 - $psychischeBehinderungProzent"/>
     <xsl:variable name="sehbehinderung" select="count(//teilnehmer/behinderung[text() = 'Sehbehinderung'])"/>
     <xsl:variable name="sehbehinderungProzent" select="(450 div $anzahlGebucht) * $sehbehinderung"/>
     <xsl:variable name="sehbehinderungAbstand" select="450 - $sehbehinderungProzent"/>
     <xsl:variable name="keineBehinderung" select="count(//teilnehmer/behinderung[text() = 'Keine Behinderung'])"/>
     <xsl:variable name="keineBehinderungProzent" select="(450 div $anzahlGebucht) * $keineBehinderung"/>
     <xsl:variable name="keineBehinderungAbstand" select="450 - $keineBehinderungProzent"/>
     <xsl:variable name="geistigeBehinderung" select="count(//teilnehmer/behinderung[text() = 'Geistige Behinderung'])"/>
     <xsl:variable name="geistigeBehinderungProzent" select="(450 div $anzahlGebucht) * $geistigeBehinderung"/>
     <xsl:variable name="geistigeBehinderungAbstand" select="450 - $geistigeBehinderungProzent"/>


     <!--Gender-->
    <xsl:variable name="weiblich" select="count(//teilnehmer/geschlecht[text() = 'Weiblich'])"/>
    <xsl:variable name="weiblichProzent" select="format-number($weiblich div $anzahlGebucht, '##%')"/>
    <xsl:variable name="männlich" select="count(//teilnehmer/geschlecht[text() = 'Männlich'])"/>
    <xsl:variable name="männlichProzent" select="format-number($männlich div $anzahlGebucht, '##%')"/>
    <xsl:variable name="anderes" select="count(//teilnehmer/geschlecht[text() = 'Anderes'])"/>
    <xsl:variable name="anderesProzent" select="format-number($anderes div $anzahlGebucht, '##%')"/>
    <xsl:variable name="pointer" select="format-number(($weiblich + $männlich) div $anzahlGebucht, '##%')"/>


    <!--Events-->
    <xsl:variable name="events" select="count(//event)"/>
    <xsl:variable name="klettern" select="count(//event[@name = 'Klettern'])"/>
    <xsl:variable name="kletternProzent" select="(450 div $events) * $klettern"/>
    <xsl:variable name="kletternAbstand" select="450 - $kletternProzent" />
    <xsl:variable name="fussball" select="count(//event[@name = 'Fussball'])"/>
    <xsl:variable name="fussballProzent" select="(450 div $events) * $fussball"/>
    <xsl:variable name="fussballAbstand" select="450 - $fussballProzent"/>
    <xsl:variable name="basketball" select="count(//event[@name = 'Basketball'])"/>
    <xsl:variable name="basketballProzent" select="(450 div $events) * $basketball"/>
    <xsl:variable name="basketballAbstand" select="450 - $basketballProzent"/>
    <xsl:variable name="schwimmen" select="count(//event[@name = 'Schwimmen'])"/>
    <xsl:variable name="schwimmenProzent" select="(450 div $events) * $schwimmen"/>
    <xsl:variable name="schwimmenAbstand" select="450 - $schwimmenProzent"/>
    <xsl:variable name="ski" select="count(//event[@name = 'Ski und Snowboard'])"/>
    <xsl:variable name="skiProzent" select="(450 div $events) * $ski"/>
    <xsl:variable name="skiAbstand" select="450 - $skiProzent"/>
    <xsl:variable name="schnitzeljagd" select="count(//event[@name = 'Schnitzeljagd'])"/>
    <xsl:variable name="schnitzeljagdProzent" select="(450 div $events) * $schnitzeljagd"/>
    <xsl:variable name="schnitzeljagdAbstand" select="450 - $schnitzeljagdProzent"/>
    <xsl:variable name="wandern" select="count(//event[@name = 'Wandern'])"/>
    <xsl:variable name="wandernProzent" select="(450 div $events) * $wandern"/>
    <xsl:variable name="wandernAbstand" select="450 - $fussballProzent"/>
    <xsl:variable name="fahrrad" select="count(//event[@name = 'Fahrrad'])"/>
    <xsl:variable name="fahrradProzent" select="(450 div $events) * $fahrrad"/>
    <xsl:variable name="fahrradAbstand" select="450 - $fahrradProzent"/>



    
   

    


<xsl:template match="/">
    <html>
    <body>



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


<!--Prozentuale Verteilung der Geschlechter-->
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


<!--Prozentuale Verteilung Sportarten-->
 <h3>Aufteilung Veranstaltungen pro Sportart</h3>


        <svg width="90%" height="500px"
			
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">

      
           
  
	<g transform="translate(40,20)">
	<g class="x axis" transform="translate(0,450)">
			<g class="tick" transform="translate(25.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
		
		</g>
		
		
		<path class="domain" d="M0,6V0H900V6"></path>
	</g>
		<g class="y axis">
			<g class="tick" transform="translate(0,450)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">0%</text>
		</g>
			<g class="tick" transform="translate(0,337.5)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">25%</text>
		</g>
				<g class="tick" transform="translate(0,225)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">50%</text>
		</g>
			<g class="tick" transform="translate(0,112.5)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">75%</text>
		</g>
			<g class="tick" transform="translate(0,0)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">100%</text>
		</g>
			
		<path class="domain" d="M-6,0H0V450H-6"></path>
	
	</g>
		<rect class="bar" x="20" width="31" y="{$kletternAbstand}" height="{$kletternProzent}"></rect>
		<rect class="bar" x="100" width="31" y="{$basketballAbstand}" height="{$basketballProzent}"></rect>
		<rect class="bar" x="180" width="31" y="{$schwimmenAbstand}" height="{$schwimmenProzent}"></rect>
		<rect class="bar" x="260" width="31" y="{$schnitzeljagdAbstand}" height="{$schnitzeljagdProzent}"></rect>
		<rect class="bar" x="340" width="31" y="{$wandernAbstand}" height="{$wandernProzent}"></rect>
		<rect class="bar" x="420" width="31" y="{$fahrradAbstand}" height="{$fahrradProzent}"></rect>
		<rect class="bar" x="500" width="31" y="{$skiAbstand}" height="{$skiProzent}"></rect>
    <rect class="bar" x="580" width="31" y="{$fussballAbstand}" height="{$fussballProzent}"></rect>

		
	</g>
</svg>

<!--Prozentuale Verteilung Behinderungen-->
 <h3>Aufteilung Behinderung aller Teilnehmenden</h3>


        <svg width="90%" height="500px"
			
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">

      
           
  
	<g transform="translate(40,20)">
	<g class="x axis" transform="translate(0,450)">
			<g class="tick" transform="translate(25.5,0)" style="opacity: 1;"><line y2="6" x2="0"></line>
			
		</g>
		
		
		<path class="domain" d="M0,6V0H900V6"></path>
	</g>
		<g class="y axis">
			<g class="tick" transform="translate(0,450)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">0%</text>
		</g>
			<g class="tick" transform="translate(0,337.5)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">25%</text>
		</g>
				<g class="tick" transform="translate(0,225)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">50%</text>
		</g>
			<g class="tick" transform="translate(0,112.5)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">75%</text>
		</g>
			<g class="tick" transform="translate(0,0)" style="opacity: 1;"><line x2="-6" y2="0"></line>
			<text dy=".32em" x="-9" y="0" style="text-anchor: end;">100%</text>
		</g>
			
		<path class="domain" d="M-6,0H0V450H-6"></path>
	
	</g>
		<rect class="bar" x="20" width="31" y="{$diverseBehinderungenAbstand}" height="{$diverseBehinderungenProzent}"></rect>
		<rect class="bar" x="100" width="31" y="{$hörbehinderungAbstand}" height="{$hörbehinderungProzent}"></rect>
		<rect class="bar" x="180" width="31" y="{$körperbehinderungAbstand}" height="{$körperbehinderungProzent}"></rect>
		<rect class="bar" x="260" width="31" y="{$psychischeBehinderungAbstand}" height="{$psychischeBehinderungProzent}"></rect>
		<rect class="bar" x="340" width="31" y="{$sehbehinderungAbstand}" height="{$sehbehinderungProzent}"></rect>
		<rect class="bar" x="420" width="31" y="{$keineBehinderungAbstand}" height="{$keineBehinderungProzent}"></rect>
		<rect class="bar" x="500" width="31" y="{$geistigeBehinderungAbstand}" height="{$geistigeBehinderungProzent}"></rect>
   

		
	</g>
</svg>




  



    </body>
    </html>
        

    </xsl:template>

    
</xsl:stylesheet>