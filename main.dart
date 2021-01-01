import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Take the current date by this function
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async  {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,

        // Range of the date
        firstDate: DateTime(1940),
        lastDate: DateTime(2030)
    );
    if(picked != null && picked != date)
    {
      setState(() {
        // date variable picks the current date
        date = picked;
        print(date.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // to change the format of the date we use this function and import package at top intl.dart
    String _formatdate = new DateFormat.yMMMd().format(date);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          // giving shadow to bottom navigation bar
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
            ),
          ],
        ),
        // Design the bottom navigation bar
        child: BottomNavigationBar(
          showSelectedLabels: false, // hide the label of selected icon
          showUnselectedLabels: false, // hide the label of unselected icons
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 30,
              ),
              title: Text('Messages'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.article_rounded,
                  size: 30,
                ),
                title: Text('Profile'))
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2),
              child: ClipPath(
                clipper: ClippingClass(), // this class is use to giving curve to the Column Box
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          // Use Container to place the scissor image in the center
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'images/logo1.png',
                              height: 80,
                              width: 80,
                            ),
                          ),
                          // Use Container for the title
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                "K N I P T O P T I J D",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )),
                          SizedBox(height: 25.0),
                          // Use Container for the location Search Bar
                          Container(
                            width: 300,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 270,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                      hintText: "",
                                      suffixIcon: Icon(Icons.location_on, color: Colors.black,),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          bottom: 11,
                                          top: 2,
                                          right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          // Use Container for the Date and Time Search Bar
                          Container(
                            width: 280,
                            height: 35,
                            // Because we place these search bar in one row therefore we use Row widget
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Use Container for the date Search Bar
                                Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                      hintText: "",
                                      labelText: "$_formatdate", // show the format of date in calender search bar
                                      // use calender icon as button if you click on the calender icon it works as button
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_today),
                                        onPressed: () {
                                          selectTimePicker(context);
                                        },
                                        color: Colors.black,
                                        iconSize: 20,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          bottom: 11,
                                          top: 2,
                                          right: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                // Use Container for the Time Search Bar
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                      hintText: "",
                                      suffixIcon: Icon(Icons.access_time, color: Colors.black,),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 10,
                                          bottom: 11,
                                          top: 2,
                                          right: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Here the Row Widget is end
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          // Use Container for the Vind Button
                          Container(
                            width: 250,
                            alignment: Alignment.topRight,
                            child: RaisedButton(
                              color: Colors.red[400],
                              onPressed: () {},
                              child: Text(
                                'VIND',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// That is complete clipping class that we use to curve the column and provides all angles to the column on requirements
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height + 4,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
