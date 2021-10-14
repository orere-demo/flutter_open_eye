import 'package:flutter/material.dart';
import 'package:demo2_eye/utils/theme.dart';
import 'package:demo2_eye/config/string_config.dart';
import 'package:demo2_eye/view_model/home_view_model/home_tab_view_model.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  HomeTabViewModel _tabViewModel = new HomeTabViewModel(0);
  add() {
    setState(() {
      _tabViewModel.currentIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ModelContainer(model: this, child: ModelWidget(), increment: add);
  }
}

class ModelWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ModelContainer container = ModelContainer.of(context);
    return Scaffold(
      body: PageView(
        children: [
          Text("${container.model._tabViewModel.currentIndex}")
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: themeColor(),
        unselectedItemColor: Color(0xff9a9a9a),
        currentIndex: container.model._tabViewModel.currentIndex,
        // onTap: (index){
        //   // model.changeBottomTabIndex(index);
        //   // print(model);
        //   setState(() {
        //     model.changeBottomTabIndex(index);
        //     // model.currentIndex= index;
        //   });
        //   print(model.currentIndex);
        //
        // },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home, color: themeColor()),
              label: StringConfig.HOME
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              activeIcon: Icon(Icons.find_in_page, color: themeColor()),
              label: StringConfig.FIND
          )
        ],
      ),
    );
  }

}

class ModelContainer extends InheritedWidget{
  static ModelContainer? of(BuildContext context) {
     return context.dependOnInheritedWidgetOfExactType<ModelContainer>();
  }

  final _RootPageState model;
  final Function() increment;

  ModelContainer({
    Key? key,
    required this.model,
    required Widget child,
    required this.increment,
  }):super(key: key, child: child);

  @override
  bool updateShouldNotify(ModelContainer oldWidget) => model != oldWidget.model;
}