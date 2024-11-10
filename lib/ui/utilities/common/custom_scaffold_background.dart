import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/utilities/common/app_colors.dart';

class CustomScaffoldBackground extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;

  const CustomScaffoldBackground(
      {super.key,
      this.body,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.appBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).scaffoldBackgroundColor
            ],
            stops: [
              0.2,
              0.2
            ], // you have to make them equal to make the gradient solid
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // to make your design appears
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: appBar,
      ),
    );
  }
}
