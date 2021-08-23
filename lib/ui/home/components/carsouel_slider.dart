import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/webservices/api_calls/api_home.dart';
import 'package:the_jewel/webservices/models/home/home_models.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  List<GetSliderImages> getImageSliderList = [];

  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];
  //------------------------------Get Slider Images-----------------------------

  Future<List<GetSliderImages>> getImageSliderData() async {
    getImageSliderList = await ApiHome.getSliderImage();
   // print("getting image slider data ....");
 //   print(getImageSliderList);
    return getImageSliderList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getImageSliderData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // getImageSliderData();
  }

  @override
  Widget build(BuildContext context) {
    int _current = 0;
    int inded = 1;
    /*
    it is better to impement future builder better than putting api in init state because the api will be available after building the ui so future builder solves the problem
     */
    return FutureBuilder<List<GetSliderImages>>(
        future: getImageSliderData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          // return snapshot.hasData
          //     ? carouselSliderWidget()
          //     : Center(
          //         child: CircularProgressIndicator(),
          //       );
          // we can make it display circle progress indicator or we can make it display empty until it full wi images
          return carouselSliderWidget();
        });
  } //  end build

//-----------------------------------------------------------------------------
  Widget carouselSliderWidget() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          initialPage: 0,
          height: 30.0.h,
          enlargeCenterPage: false,
          autoPlay: true,
          reverse: false,
          enableInfiniteScroll: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 5000),
          scrollDirection: Axis.horizontal,
        ),
        items: getImageSliderList.map((imgUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.network(
                  imgUrl.picture,
                  fit: BoxFit.fill,
                  // loadingBuilder: (BuildContext context, Widget child,
                  //     ImageChunkEvent? loadingProgress) {
                  //   if (loadingProgress == null) return child;
                  //   return Center(
                  //     child: CircularProgressIndicator(
                  //       value: loadingProgress.expectedTotalBytes != null
                  //           ? loadingProgress.cumulativeBytesLoaded /
                  //               loadingProgress.expectedTotalBytes!
                  //           : null,
                  //     ),
                  //   );
                  //       },
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
//-----------------------------------------------------------------------------
} // end class
// https://stackoverflow.com/questions/58375939/display-json-data-to-the-carouselslider-widget-in-flutter
