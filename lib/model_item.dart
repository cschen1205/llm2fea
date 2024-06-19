import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelItem{
  String name;
  String path;
  String gen;
  var imageMode = true.obs;
  final PageController pageController = PageController();

  ModelItem({required this.name, required this.path, required this.gen});

  void openPage(bool mode) {
    if (imageMode.value != mode) {
      if(mode) {
        pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOutCirc);
      }else{
        pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInCirc);
      }
      imageMode.value = mode;
    }
  }

  void switchPage(){
    openPage(!imageMode.value);
  }


}