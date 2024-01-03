


double height = 1, width = 1, arifmethic = 1; //size variables

extension ExtSize on num {
  double get h {
    return this * height;
  }

  double get w {
    return this * width;
  }

  double get o {
    return this * arifmethic;
  }
}

double bottom = 0; // keyboarg height

String dispacherLink = ''; // dispecher link

bool isOnline =
    true; // if user is connected is online value = true else value = false
bool isWifi = false; // if user using internet value = false else value = true

bool notifIntialzed =
    false; // if Notification service is intializes value = true else value = false

bool isDark = false; // app theme is dark this value = true else value = false
 // app theme is dark this value = true else value = false

// it result returned don't get api information

//map styles and markers
String darkMap = '';
String lightMap = '[]';
const String apiKey = 'AIzaSyCo7hWHhn7zrGZ9stscoIND1EXjWDUh3dM';


