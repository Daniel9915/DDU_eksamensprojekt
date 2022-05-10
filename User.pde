char[] alphabet = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
boolean creatingUser = false;
InputField username = new InputField(600, 250, "Username");
InputField password = new InputField(600, 450, "Password");

String error = "";

//Det der vises når man er på login siden
void signIn() {  
  image(menu2, width/2, height/2, width, height);

  username.display();
  password.display();
  back.display();

  fill(255);
  if (!creatingUser) {
    textSize(60);
    text("Sign in", width/2, 100);
    textSize(42);

    image(button, width/2, 600, 300, 75);
    fill(0);
    text("New User", width/2, 610);

    if (mousePressed) {
      if (abs(width/2-mouseX)<150 && abs(600-mouseY)<(75/2)) {
        creatingUser = true;
      }
    }
  } else {
    textSize(60);
    text("Create User", width/2, 100);
  }

  text(error, width/2, 550);
}



//funktion, der enten kryptere en String ud fra minuttet, eller en givet værdi
String encrypt(String input, int givenOfset) {
  int ofset = (minute()%9)+1; 
  if (givenOfset > 0) {
    ofset = givenOfset;
  }
  String result = ""; 
  result += ofset;

  for (int i = 0; i<input.length(); i++) {
    int cPlace = 0;
    for (char c : alphabet) {
      if (input.charAt(i) == c) {
        int spot = cPlace+ofset; // der tilføjes bare et ofset til bogstavets plads i alfabetet
        if (spot>25) {
          spot -= 25;
        }
        result += alphabet[spot];
      }
      cPlace++;
    }
  }

  return result;
}



void logIn() {
  if (!creatingUser) {
    if ( Data.connect() ) {
      Data.query( "SELECT Name, Password, Completed FROM Users;" );
      while (Data.next()) {
        if (Data.getString("Name").equals(username.tempText)) { // tjekker om navnet er i databasen
          if (Data.getString("Password").equals(encrypt(password.tempText, (Data.getString("Password").charAt(0))-48))) { //tjekker om passwordet passer til navnet
            signedIn = true;
            for (int i = 0; i < Data.getInt("Completed"); i++) {
              levelsCompleted[i] = true;
            }
            scene = 0;
          } else {
            error = "Incorrect Password";
          }
        } else
          error = "User does not exist";
      }
    }
  } else {
    newUser(username.tempText, password.tempText);
  }
}


void newUser(String name, String password) {

  if ( Data.connect() ) {
    Data.query( "SELECT Name, Password, Completed FROM Users;" );
    String sql = "INSERT INTO Users( Name, Password, Completed)VALUES ('" + name + "', '" + encrypt(password, 0) + "', '" + 0 + "');";
    Data.execute(sql);
  }
  scene = 0;
  signedIn = true;
}
