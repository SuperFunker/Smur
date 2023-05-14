import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount:
            2,
            crossAxisSpacing:
            15.0,
            mainAxisSpacing:
            20.0,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: MyOption(Icons.accessibility_new, "TEST", Colors.white, 10.0),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "TEST", Colors.white, 30.0),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "TEST", Colors.white, 30.0),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "TEST", Colors.white, 30.0),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "TEST", Colors.white, 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyOption(IconData icon, String title, Color color, double borderRadius){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        color: color,
        elevation: 14.0,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(10.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
        ),
      )
      ),
    );
  }
}
