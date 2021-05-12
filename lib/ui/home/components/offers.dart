import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OffersHeader extends StatefulWidget {
  @override
  _OffersHeaderState createState() => _OffersHeaderState();
}

class _OffersHeaderState extends State<OffersHeader> {
  //-------------------------variables------------------------------------------
  //List<GetOffersModel> offersList; // get the list from model
  // ApiHome apiHome = ApiHome();

  //------------------------------Methods---------------------------------------
  // //Future<List<GetOffersModel>> getOffers() async {
  //   offersList = await ApiHome.getDataImage();
  //
  //   print(offersList);
  //   return offersList;
  // }

  // Future<String> getOffers() async {
  //   String response;
  //   response = await apiHome.getDataImage();
  //   print('the response is ' + response.toString());
  //   return response;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getOffers();
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    //   getOffers();
    return Column(
      children: [
        OffersText(),
        //Products(),
      ],
    );
  }

//------------------------------------------------------------------------------
  Widget OffersText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Last Offers ",
            style: TextStyle(fontSize: 12.0.sp),
          ),
        ),
        SizedBox(
          width: 42.0.w,
        ),
        FlatButton(
          onPressed: () {
            //TODO: Go to more details page
          },
          child: Text(
            "Load More",
            style: TextStyle(fontSize: 12.0.sp),
          ),
        ),
      ],
    );
  }

//-----------------------------------------------------------------------------
  Widget Products() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // general container
        width: 100.0.w,
        height: 25.0.h,
        color: Colors.amber,
        child: FutureBuilder(
          //future: //getOffers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:

              case ConnectionState.waiting:
                return Center(child: new CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return Text("hello");
              //return OffersCardList();
            }
          },
        ),
      ),
    );
  }

  //--------------------------------Offers Card List----------------------------
  // Widget OffersCardList() {
  //   return ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: offersList.length,
  //       itemBuilder: (context, index) {
  //         GetOffersModel list = offersList[index];
  //
  //         return OffersCard(
  //           imageURL: list.picture,
  //         );
  //       });
  // }
//------------------------------------------------------------------------------

} //------------------------End class-------------------------------------------
