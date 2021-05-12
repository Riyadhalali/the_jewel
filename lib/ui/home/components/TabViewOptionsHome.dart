import 'package:flutter/material.dart';

class TabViewOptionsHome extends StatefulWidget {
  @override
  _TabViewOptionsHomeState createState() => _TabViewOptionsHomeState();
}

class _TabViewOptionsHomeState extends State<TabViewOptionsHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.white10,
            child: TabBar(tabs: [
              Tab(
                child: Text(
                  "Offers",
                  style: TextStyle(color: Color(0xff707070)),
                ),
              ),
              Tab(
                child: Text(
                  "Best Sell",
                  style: TextStyle(color: Color(0xff707070)),
                ),
              ),
              Tab(
                child: Text(
                  "Most popular",
                  style: TextStyle(color: Color(0xff707070)),
                ),
              ),
            ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                Container(
                  child: Text(
                    "Home Body",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  child: Text("Articles Body",
                      style: TextStyle(color: Colors.black)),
                ),
                Container(
                  child:
                      Text("User Body", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//done
