char[] alphabet = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
boolean creatingUser = false;
InputField username = new InputField(600, 200, "Username");
InputField password = new InputField(600, 400, "Password");


String encrypt(String input, int givenOfset) {
  int ofset = (minute()%25)+1; 
  if (givenOfset > 0) {
    ofset = givenOfset;
  }
  String result = ""; 
  result += ofset;

  for (int i = 0; i<input.length(); i++) {
    int cPlace = 0;
    for (char c : alphabet) {
      if (input.charAt(i) == c) {
        int spot = cPlace+ofset;
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




void signIn() {

  image(menu2, width/2, height/2, width, height);

  username.display();
  password.display();
}



void logIn() {

  if ( Data.connect() ) {
    Data.query( "SELECT Name, Password, Completed FROM Users;" );
    while (Data.next()) {
      if (Data.getString("Name").equals(username.tempText)) {
        if (Data.getString("Password").equals(encrypt(password.tempText, (Data.getString("Password").charAt(0))-48))) {
          signedIn = true;
          for (int i = 0; i < Data.getInt("Completed"); i++) {
            levelsCompleted[i] = true;
          }
          scene = 0;
        }
      }
    }
  }
}


void newUser(String name, String password) {

  if ( Data.connect() ) {
    Data.query( "SELECT Name, Password, Completed FROM Users;" );
    String sql = "INSERT INTO Users( Name, Password, Completed)VALUES ('" + name + "', '" + encrypt(password, 0) + "', '" + 0 + "');";
    Data.execute(sql);
  }
}
