import 'dart:math';

import 'package:llm2fea/model_item.dart';
import 'package:llm2fea/step_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  var loading = 0.obs;
  var currentStep = "".obs;
  var currentGen = "";
  // Map<String, List<ModelItem>> carInfo = {"gen1":[], "gen2":[], "gen3":[]};
  Map<String, List<ModelItem>> carInfo = {"gen-1":[], "gen-2":[]};
  List<RxInt> step = [0.obs, 0.obs, 0.obs, 0.obs];

  // List<StepItem> mainSteps = [
  //   StepItem(title: "Initialize CMA-ES", subTitle: "", icon: const Icon(Icons.start, color: Colors.white)),
  //   StepItem(title: "Generation 1", subTitle: "Training for generation 1", icon: const Icon(Icons.looks_one, color: Colors.white)),
  //   StepItem(title: "Generation 2", subTitle: "Training for generation 2", icon: const Icon(Icons.looks_two, color: Colors.white)),
  //   StepItem(title: "Generation 3", subTitle: "Training for generation 3", icon: const Icon(Icons.looks_3, color: Colors.white))];
  List<StepItem> mainSteps = [
    StepItem(title: "Populations Sampling", subTitle: "", icon: const Icon(Icons.auto_awesome, color: Colors.white),
    log: "Populations Sampling: \nSample 𝐱~𝑁(𝜇,𝜎), K population of adjective and noun WordNet pair words where 𝑥_i closely matches the WU-Palmer similarity "
        "distance between the corresponding reference and a WordNet word.\n\n"),
    StepItem(title: "Build Text Prompts", subTitle: "", icon: const Icon(Icons.text_increase, color: Colors.white),
    log: "Build Text Prompts: \nBuild K text prompts using the sampled WordNet pair words\n\n"),
    StepItem(title: "Generate 3D Model", subTitle: "Shape-E Model ----> Offspring Design", icon: const Icon(Icons.view_in_ar, color: Colors.white),
    log: "Generate 3D Model: \nGenerate 𝐾 population of car design candidates using text-to-3D (Shape-E) model, conditioned with the built text prompts.\n\n"),
    StepItem(title: "Evaluation Drag", subTitle: "", icon: const Icon(Icons.drag_indicator, color: Colors.white),
    log: "Evaluation Drag: \nEvaluate aerodynamics property (drag) using OpenFoam simulation and visualize using ParaView. Compute the normalized drag score "
        "for each car design candidates.\n\n"),
    StepItem(title: "Fitness Scores", subTitle: "", icon: const Icon(Icons.wifi_tethering, color: Colors.white),
    log: "Fitness Scores: \nGet the Fitness Scores\n\n"),
  ];
  static List<StepItem> generationSteps = [
    StepItem(title: "Populations Sampling", subTitle: "Sample 10 populations", icon: const Icon(Icons.auto_awesome, color: Colors.white, size: 20,)),
    StepItem(title: "Build Text Prompts", subTitle: "", icon: const Icon(Icons.text_increase, color: Colors.white)),
    StepItem(title: "Generate 3D Model", subTitle: "Shape-E Model ----> Offspring Design", icon: const Icon(Icons.view_in_ar, color: Colors.white)),
    StepItem(title: "Evaluation Drag", subTitle: "", icon: const Icon(Icons.drag_indicator, color: Colors.white)),
    StepItem(title: "Fitness Scores", subTitle: "", icon: const Icon(Icons.wifi_tethering, color: Colors.white)),
  ];

  @override
  void onInit() {
    super.onInit();
    carInfo.forEach((key, value) {
      for(int i=0; i<10; i++){
        value.add(ModelItem(name: "Car $i", path: "car_$i", gen: key));
      }
    });
    initMainSteps();
  }

  void initMainSteps(){
    Random random = Random();
    mainSteps[0].time = 4200+random.nextInt(1200);
    mainSteps[1].time = 4000+random.nextInt(1500);
    mainSteps[2].time = 5500+random.nextInt(2000);
    mainSteps[3].time = 4000+random.nextInt(1500);
    mainSteps[4].time = 2000+random.nextInt(1200);

    // mainSteps[0].time = 800+random.nextInt(1000);
    // for(int i=1; i<mainSteps.length; i++){
    //   mainSteps[i].subSteps = generationSteps.map((e) => StepItem(title: e.title, subTitle: e.subTitle, icon: e.icon)).toList();
    //   mainSteps[i].subSteps![0].time = 500 + random.nextInt(400);
    //   mainSteps[i].subSteps![1].time = 300 + random.nextInt(600);
    //   mainSteps[i].subSteps![2].time = 1200 + random.nextInt(800);
    //   mainSteps[i].subSteps![3].time = 1000 + random.nextInt(400);
    //   mainSteps[i].subSteps![4].time = 800 + random.nextInt(500);
    //   for(int j=0; j<mainSteps[i].subSteps!.length; j++){
    //     mainSteps[i].time += mainSteps[i].subSteps![j].time;
    //   }
    // }
  }

  void resetProgress(){
    for (var element in mainSteps) {
      element.progress.value = 0;
      if(element.subSteps != null){
        for (var e in element.subSteps!){
          e.progress.value = 0;
        }
      }
    }
    for(var e in step){
      e.value = 0;
    }
  }
}