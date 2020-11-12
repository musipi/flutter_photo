import 'package:flutter/material.dart';
import 'album-photo.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';


void main()=> runApp(MaterialApp(
  theme: ThemeData(backgroundColor:Colors.deepOrange),
  home : Album()
));
class Album extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override

 List<Slide> slides = new List();
 Function goToTab;

  void initStat(){
    super.initState();
   

  slides.add(
      new Slide(
        title: "SCHOOL",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "https://previews.123rf.com/images/mdmworks/mdmworks1410/mdmworks141000010/32535997-le-nouvel-h%C3%B4tel-de-ville-de-toronto-canada.jpg",
        backgroundImage: "https://previews.123rf.com/images/mdmworks/mdmworks1410/mdmworks141000010/32535997-le-nouvel-h%C3%B4tel-de-ville-de-toronto-canada.jpg",
      ),
    );

    // slides deux

    slides.add(
      new Slide(
        title: "MUSEUM",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "https://ak.picdn.net/shutterstock/videos/20228809/thumb/1.jpg",
      ),
    );
    slides.add(
      new Slide(
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "https://c8.alamy.com/comp/RMBJGN/feb-8th2019-chongqingchina-the-cityscape-of-chongqing-at-night-RMBJGN.jpg",
      ),
    );

  }

 void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }
 
  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

   Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }


List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xffffcc5c),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xffffcc5c),

      // Dot indicator
      colorDot: Color(0xffffcc5c),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pixabay cpu'),
      ),
      body: Center(
        // child: Text('bonjour chris')
      ),
      drawer: Drawer(
       child: ListView(
         children: <Widget> [
            DrawerHeader(child: Column(
              children: <Widget> [
                Center(
                  child: Text('pixabay Kolwezi'),
                )
              ],
            )),
            ListTile(
              trailing: Icon(Icons.home),
              title: Text('Acceuil'),
            ),
            ListTile(
             trailing: Icon(Icons.photo_album),
             title: Text('Gallerie'),
             onTap: (){
               Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> AlbumPhoto()));
             },
            ),
            ListTile(
             trailing: Icon(Icons.settings),
             title: Text('Paramettres'),
             
            )
         ],
       ) ,
      ),
      
    );
}


