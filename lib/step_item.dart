import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepItem {
  String title;
  String subTitle;
  Icon icon;
  int time;
  var progress = 0.0.obs;
  String? log;
  List<StepItem>? subSteps;

  StepItem({required this.title, required this.subTitle, required this.icon, this.subSteps, this.time = 500, this.log});
}