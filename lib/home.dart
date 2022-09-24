import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  myAchievement(num, type){
    return Row(
      children: [
        Text(num,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(type),
        )
      ],
    );
  }

  mySpec(icon, tech){
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(height: 10),
              Text(tech, style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          color: Colors.black,
          icon: Icon(Icons.menu),
          itemBuilder: (context)=>[
            PopupMenuItem(child: TextButton(
              child: Text("Projects", style: TextStyle(color: Colors.white)),
              onPressed: (){
                Navigator.pushNamed(context, 'projects');
              },
            )),
            PopupMenuItem(child: TextButton(
              child: Text("About Me", style: TextStyle(color: Colors.white)),
              onPressed: (){
                Navigator.pushNamed(context, 'about');
              },
            ))
    ]
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ShaderMask(
                    shaderCallback: (rect){
                      return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset('assets/Yusuf-img-bw-rs.png', fit: BoxFit.fitHeight)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.49),
                child: Column(
                  children: [
                    Text("Yusuf Ansari",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),
                    ),
                    SizedBox(height:2),
                    Text("App Developer",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            height: 500,
            margin: EdgeInsets.only(right: 20, left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myAchievement("78", " Projects"),
                    myAchievement("65", " Clients"),
                    myAchievement("92", " Messages"),
                  ],
                ),
                SizedBox(height: 30),
                Text("Specialized In",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.android, "Android"),
                        mySpec(FontAwesomeIcons.python, "Python"),
                        mySpec(FontAwesomeIcons.java, "Java"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.html5, "HTML5"),
                        mySpec(FontAwesomeIcons.css3, "CSS"),
                        mySpec(FontAwesomeIcons.js, "JavaScript"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.database, "Database"),
                        mySpec(FontAwesomeIcons.git, "Git"),
                        mySpec(FontAwesomeIcons.nodeJs, "NodeJs"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  void showAsBottomSheet() async {
    final result = await showSlidingBottomSheet(
        context,
        builder: (context) {
          return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: 400,
                child: Center(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.pop(context, 'This is the result.'),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'This is the content of the sheet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
