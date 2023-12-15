import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

var bgColor = Color(0xFF0d193a);
var buttonColor = Color(0xFF1b335d);

var blueGradient1 = Color(0xFF52b2f0);
var blueGradient2 = Color(0xFF4968d3);

var pinkGradient1 = Color(0xFFfc6d86);
var pinkGradient2 = Color(0xFFfed0d1);

class HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: buttonColor,
        height: 50,
        notchMargin: 12,
        shape: CircularNotchedRectangle(),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, color: Colors.purple,),
              Icon(Icons.ac_unit, color: Colors.blue,),
            ],
          ),
        ),
      ),
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        children: [
          Stack(
            children: [
              Arc(
                  height: 30,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [blueGradient1, blueGradient2],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  )
              ),

               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today.",style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
                        CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/47.jpg"), radius: 24,)
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Trending", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),),
                  ),

                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [

                        getTrendingUI("https://img.icons8.com/color/48/slack.png","Slack","Business","1350"),
                        getTrendingUI("https://img.icons8.com/plasticine/48/sketch.png","Sketch","Design Tools","1190"),
                        getTrendingUI("https://img.icons8.com/plasticine/48/apple-photos.png","Photos","Photography","900"),
                        getTrendingUI("https://img.icons8.com/color/48/slack.png","Slack","Business","1350"),
                        getTrendingUI("https://img.icons8.com/color/48/slack.png","Slack","Business","1350"),

                      ],
                    ),
                  )

                ],
              )


            ],
          )
        ],
      ),
    );
  }
}


Widget getTrendingUI(String imageUrl, String title, String subTitle, String number) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 80,
        width: 120,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: buttonColor.withOpacity(0.7),
       ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(image: NetworkImage(imageUrl), height: 50, fit: BoxFit.fill,),
              SizedBox(height: 4,),
              Text(title,style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),),
              Text(subTitle,style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),),
              SizedBox(height: 8,),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_drop_up, color: Colors.green,),
                    Text(number,style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),
        )
    ),
  );
}
