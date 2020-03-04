function validateForm() {
    var x = document.forms["myForm"]["vorname"].value;
    if (x == "") {
      alert("Vorname muss ausgefüllt sein");
      return false;
    }

    var y = document.forms["myForm"]["nachname"].value;
    if (y == "") {
      alert("Nachname muss ausgefüllt sein");
      return false;
    }

    var z = document.forms["myForm"]["adresse"].value;
    if (z == "") {
      alert("Adresse muss ausgefüllt sein");
      return false;
    }

    var b = document.forms["myForm"]["adresse"].value;
    if (b == "") {
      alert("Adresse muss ausgefüllt sein");
      return false;
    }

    var a = document.forms["myForm"]["stadt"].value;
    if (a == "") {
      alert("Stadt muss ausgefüllt sein");
      return false;
    }

    var c = document.forms["myForm"]["telefonnummer"].value;
    if (c == "") {
      alert("Telefonnummer muss ausgefüllt sein");
      return false;
    }

    var d = document.forms["myForm"]["geburtstag"].value;
    if (d == "") {
      alert("Geburtstag muss ausgefüllt sein");
      return false;
    }



  }