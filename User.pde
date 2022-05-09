char[] alphabet = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
boolean creatingUser = false;


String encrypt(String input) {
  int ofset = (minute()%25)+1; 
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
}

void newUser(String name, String password) {

  if ( Data.connect() ) {
    Data.query( "SELECT Name, Password, Completed FROM Users;" );
    String sql = "INSERT INTO Users( Name, Password, Completed)VALUES ('" + name + "', '" + encrypt(password) + "', '" + 0 + "');";
    Data.execute(sql);
  }
}
