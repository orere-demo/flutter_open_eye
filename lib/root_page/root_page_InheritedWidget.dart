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
  changeTabIndex(int index) {
    setState(() {
      _tabViewModel.currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ModelContainer(model: _tabViewModel, child: ModelWidget(), handleOnTap: changeTabIndex);
  }
}

class ModelWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final container = ModelContainer.of(context);
    return Scaffold(
      body: PageView(
        children: [
          Text("${container.model.currentIndex}")
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: themeColor(),
        unselectedItemColor: Color(0xff9a9a9a),
        currentIndex: container.model.currentIndex,
        onTap: (index){
          container.handleOnTap(index);
        },
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
  static ModelContainer of(BuildContext context) {
     return context.dependOnInheritedWidgetOfExactType<ModelContainer>()!;
  }

  final HomeTabViewModel model;
  final Function(int) handleOnTap;

  ModelContainer({
    Key? key,
    required Widget child,
    required this.model,
    required this.handleOnTap,
  }):super(key: key, child: child);

  @override
  bool updateShouldNotify(ModelContainer oldWidget) => model != oldWidget.model;
}