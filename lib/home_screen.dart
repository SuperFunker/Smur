import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String currentDate = DateTime.now().day.toString() + ' / ' + DateTime.now().month.toString() + ' / '+ DateTime.now().year.toString();

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
                mainAxisCellCount: 1.3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: MainActivity()
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "Coming Soon...", Colors.white54),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "Coming Soon...", Colors.white54),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "Coming Soon...", Colors.white54),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "Coming Soon...", Colors.white54),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "Coming Soon...", Colors.white54),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: MyOption(Icons.accessibility_new, "Coming Soon...", Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget MainActivity(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
          elevation: 14.0,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tasks');
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black45, // Background color
              onPrimary: Colors.greenAccent,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hello Ioannis",
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        Text(
                          "Current Date: \n" +
                          currentDate,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                      ],
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  Widget MyOption(IconData icon, String title, Color color){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
        onPressed: (){

        },
        style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)))),
        child: Material(
          color: color,
          elevation: 14.0,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                          style: TextStyle(
                            fontStyle: FontStyle.italic
                          ),
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
      ),
    );
  }

}
