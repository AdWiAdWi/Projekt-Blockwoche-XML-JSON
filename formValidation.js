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



  }