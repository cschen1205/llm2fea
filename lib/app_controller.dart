import 'dart:math';

import 'model_item.dart';
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
    StepItem(title: "Initialize", subTitle: "LLM generate initial prompts for multiple tasks", icon: const Icon(Icons.flag, color: Colors.white),
    log: "Initialize: \nBased on various input prompts, utilize a Language Learning Model (LLM) to expand and create initial detailed prompts for "
        "multiple tasks.\nTask 1: banana car\nTask 2: banana airplane\n\n"),
    StepItem(title: "Reflect", subTitle: "Embed Prompts into LLM", icon: const Icon(Icons.tips_and_updates, color: Colors.white),
    log: "Reflect: \nEmbed all prompts for various tasks into LLM\n\n"),
    StepItem(title: "Crossover & Mutate", subTitle: "LLM generate new prompts", icon: const Icon(Icons.shuffle, color: Colors.white),
    log: "Self-Mating: \nsingle parent prompt -> offspring prompt; \n\n"
        "Inter-Tasks Mating (parent prompts from different tasks): \n"
        "task 1 parent prompt + task 2 parent prompt => task 1 offspring prompt\n"
        "task 2 parent prompt + task 1 parent prompt => task 2 offspring prompt\n\n"
        "Intra-Task Mating: \ntwo parent prompts form same task -> offspring prompt.\n\n"),
    StepItem(title: "Evaluate", subTitle: "Generate 3D model & Evaluation", icon: const Icon(Icons.track_changes, color: Colors.white),
    log: "Text to 3D: \nGenerate 3D models for variable tasks from the prompts.\n\nEvaluation Drag: \nEvaluate aerodynamics property (drag) using OpenFoam "
        "simulation and visualize using ParaView. Compute the normalized drag score for each design candidates.\n\n"),
    StepItem(title: "Select", subTitle: "Tournament Selection", icon: const Icon(Icons.select_all, color: Colors.white),
    log: "Fitness Scores: Get the Fitness Scores\n\nMerge Prompts:Union of parent and offspring prompts dataset;\n\n"
        "Tournament Selection:Select the appropriate prompts\n\n"),
  ];
  static List<StepItem> generationSteps = [
    StepItem(title: "Populations Sampling", subTitle: "Sample 10 populations", icon: const Icon(Icons.flag, color: Colors.white, size: 20,)),
    StepItem(title: "Build Text Prompts", subTitle: "", icon: const Icon(Icons.tips_and_updates, color: Colors.white)),
    StepItem(title: "Generate 3D Model", subTitle: "Shape-E Model ----> Offspring Design", icon: const Icon(Icons.shuffle, color: Colors.white)),
    StepItem(title: "Evaluation Drag", subTitle: "", icon: const Icon(Icons.track_changes, color: Colors.white)),
    StepItem(title: "Select", subTitle: "", icon: const Icon(Icons.select_all, color: Colors.white)),
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
    mainSteps[0].time = 3600+random.nextInt(1000);
    mainSteps[1].time = 1800+random.nextInt(500);
    mainSteps[2].time = 8000+random.nextInt(1500);
    mainSteps[3].time = 4300+random.nextInt(1500);
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