import 'package:flutter/material.dart';

class Tab extends StatefulWidget {
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<Tab> with SingleTickerProviderStateMixin {
  TabController _tabController;
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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('myservices'),
          bottom: TabBar(
            tabs: <Tab>[
              Tab(
                  // text: 'seeked',
                  ),
              Tab(
                  //   text: 'provided',
                  ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            //  SeekedTab(), // return SeekedTab page
            //   ProvidedTab(), // return provided tab
          ],
        ),
      ),
    );
  }
}
