import 'dart:math';
import 'dart:html' as html;

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'app_controller.dart';
import 'package:llm2fea/model_item.dart';
import 'package:llm2fea/step_item.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'app_fonts.dart';

class HomePage extends StatelessWidget {
  final _textController1 = TextEditingController(text: "banana car");
  final _textController2 = TextEditingController(text: "banana airplane");
  final _controller = Get.put(AppController());
  final _processTextController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.all(10.r), child: Image.asset("assets/images/logo.png", fit: BoxFit.fitHeight)),
        title: const Text('LLM2FEA'),
      ),
      body: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.cover),
        ),
        child: Obx(()=>_getBody(context)),
      )
    );
  }

  Widget _getBody(BuildContext context) {
    if(_controller.loading.value == 0){
      return Column(
        children: [
          SizedBox(height: 40.r,),
          Image.asset("assets/images/logo.png", height: 240.r, fit: BoxFit.fitHeight,),
          SizedBox(height: 40.r,),
          Center(child: promptInput(false)),
        ],
      );
    }else {
      return Column(
        children: [
          SizedBox(height: 20.r,),
          promptInput(true),
          SizedBox(height: 10.r,),
          Expanded(child: bodyContent(context))
        ],
      );
    }
  }

  Widget bodyContent(BuildContext context) {
    // return generatedContent();
    if (_controller.loading.value == 1) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(width: 4, color: Colors.blue.shade400),
            borderRadius: BorderRadius.circular(12.r),
          ),
          margin: EdgeInsets.only(left: 30.r, right: 30.r, top: 20.r, bottom: 10.r),
          padding: EdgeInsets.all(10.r),
          child: generating(context)
      );
    } else if (_controller.loading.value == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 4, child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned.fill(child: generatedContent("Car", "car")),
              Positioned(width: 400.r, height: 400.r, top: 240.r,
                  child: Center(child: Text("Banana Car", style: AppFonts.caption,)))
            ],
          )),
          Expanded(flex: 4, child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned.fill(child: generatedContent("Airplane", "airplane")),
              Positioned(width: 400.r, height: 400.r, top: 240.r,
                  child: Center(child: Text("Banana Airplane", style: AppFonts.caption,)))
            ],
          )),
        ],
      );
      // return ListView.separated(
      //   itemBuilder: (BuildContext context, int index) => imageGallery(_controller.carInfo.keys.toList()[index], context),
      //   separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20.r,),
      //   itemCount: _controller.carInfo.length,
      // );
    }
    return const SizedBox();
  }

  Widget generatedContent(String filename, String location) {
    return CircularMenu(
        alignment: Alignment.center,
        radius: 200.r,
        animationDuration: const Duration(milliseconds: 500),
        curve: Curves.bounceOut,
        reverseCurve: Curves.fastOutSlowIn,
        startingAngleInRadian: 0,
        endingAngleInRadian: pi*2,
        toggleButtonColor: Colors.pink,
        toggleButtonBoxShadow: const [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10,
          ),
        ],
        toggleButtonIconColor: Colors.white,
        toggleButtonMargin: 20.0,
        toggleButtonPadding: 20.0,
        toggleButtonSize: 60.0,
        // toggleButtonIcon: icon,
        toggleButtonAnimatedIconData: AnimatedIcons.home_menu,
        items: [
          CircularMenuItem(
              icon: Icons.looks_one,
              onTap: ()=>openCarDialog(location, ModelItem(name: "$filename 1", path: "${location}1", gen: location)),
              iconSize: 50.r,
            margin: 10.r, padding: 10.r, color: Colors.red,
          ),
          CircularMenuItem(
              icon: Icons.looks_two,
              onTap: ()=>openCarDialog(location, ModelItem(name: "$filename 2", path: "${location}2", gen: location)),
            iconSize: 50.r,
            margin: 10.r, padding: 10.r, color: Colors.blue,
          ),
          CircularMenuItem(
              icon: Icons.looks_3,
              onTap: ()=>openCarDialog(location, ModelItem(name: "$filename 3", path: "${location}3", gen: location)),
            iconSize: 50.r,
            margin: 10.r, padding: 10.r, color: Colors.green,
          ),
          CircularMenuItem(
              icon: Icons.looks_4,
              onTap: ()=>openCarDialog(location, ModelItem(name: "$filename 4", path: "${location}4", gen: location)),
            iconSize: 50.r,
            margin: 10.r, padding: 10.r, color: Colors.orange,
          ),
          CircularMenuItem(
              icon: Icons.looks_5,
              onTap: ()=>openCarDialog(location, ModelItem(name: "$filename 5", path: "${location}5", gen: location)),
            iconSize: 50.r,
            margin: 10.r, padding: 10.r, color: Colors.indigo,
          ),
          CircularMenuItem(
              icon: Icons.looks_6,
              onTap: ()=>openCarDialog(location, ModelItem(name: "$filename 6", path: "${location}6", gen: location)),
            iconSize: 50.r,
            margin: 10.r, padding: 10.r, color: Colors.cyan,
          ),
        ]);
  }

  Future openCarDialog(String path, ModelItem item){
    return Get.defaultDialog(
      title: item.name,
      content: getModelItem(path, item, 720.r, false),
    );
  }

  Widget generating(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() =>
                  AnotherStepper(
                    stepperList: getMainSteps(_controller.step[0].value, _controller.mainSteps),
                    stepperDirection: Axis.horizontal,
                    iconWidth: 40,
                    iconHeight: 40,
                    activeIndex: _controller.step[0].value,
                    verticalGap: 60,
                  )),
              SizedBox(height: 60.r,),
              SizedBox(height: size.height - 140.r, width: size.width - 120.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: Center(child: Column(
                      children: [
                        Obx(()=>Text(_controller.currentStep.value, style: AppFonts.blackHeader3)),
                        SizedBox(height: 60.r,),
                        loadingWidget(),
                      ],
                    ))),
                    Flexible(child: TextField(
                      maxLines: 300,
                      style: AppFonts.blackTextH3,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: _processTextController,
                    ))
                  ],
                )
              )
            ],
          )
      ),
    );
  }

  Widget loadingWidget(){
    return LoadingAnimationWidget.discreteCircle(
      color: Colors.blue.shade600,
      size: 180.r,
    );
    // return LoadingAnimationWidget.inkDrop(
    //   color: Colors.blue.shade600,
    //   size: 180.r,
    // );
    // return SizedBox(height: 180.r, width: 180.r,child:
    // Stack(
    //   children: [
    //     Positioned.fill(child: Container(
    //       height: 150.r, width: 150.r,
    //       decoration: const BoxDecoration(
    //           color: Colors.green,
    //           borderRadius: BorderRadius.all(Radius.circular(30))),
    //       child: Obx(()=>Center(child: _controller.mainSteps[_controller.step[0].value].icon)),
    //     )),
    //     Positioned.fill(child: LoadingAnimationWidget.inkDrop(
    //       color: Colors.blue.shade600,
    //       size: 180.r,
    //     ))
    //   ],
    // ));
  }

  Widget promptInput(bool showIcon) {
    return SizedBox(
        height: 120.r,
        width: 1200.r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showIcon)
              Image.asset("assets/images/logo.png", height: 128.r, fit: BoxFit.fitHeight,),
            if(showIcon)
              SizedBox(width: 20.r,),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(),
                    hintText: 'Input the first prompt',
                  ),
                  controller: _textController1,
                ),
                const SizedBox(height: 15,),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(),
                    hintText: 'Input the second Prompt',
                  ),
                  controller: _textController2,
                ),
              ],
            )),
            SizedBox(width: 40.r,),
            FilledButton(onPressed: generate3DModel, child: Padding(padding: EdgeInsets.all(10.r),
                child: Text("Generate 3D Model", style: AppFonts.whiteBoldText, textAlign: TextAlign.center,))
            ),
          ],
        )
    );
  }

  Future<void> generate3DModel() async {
    _controller.loading.value = 1;
    _controller.currentGen = _textController1.text.contains("fast")?"gen-1":"gen-2";

    for(int i=0; i<_controller.mainSteps.length; i++){
      int tTime = 0;
      int j = 0;
      String content = "";
      _controller.currentStep.value = _controller.mainSteps[i].title;
      while(_controller.mainSteps[i].progress.value < 1.0){
        await Future.delayed(const Duration(milliseconds: 15));
        tTime += 15;
        if(j < _controller.mainSteps[i].log!.length) {
          content += _controller.mainSteps[i].log![j];
          j += 1;
          _processTextController.value = TextEditingValue(text: content);
        }
        _controller.mainSteps[i].progress.value = tTime.toDouble() / _controller.mainSteps[i].time;
      }
      if(i<_controller.mainSteps.length-1) {
        _controller.step[0].value = i + 1;
      }
    }
    await Future.delayed(const Duration(seconds: 1));
    _controller.loading.value = 2;
    _controller.resetProgress();

    // for(int i = 0; i<4; i++) {
    //   if (_controller.mainSteps[i].subSteps != null) {
    //     int tTime = 0;
    //     for (int j = 0; j < _controller.mainSteps[i].subSteps!.length; j++) {
    //       int mTime = 0;
    //       while (_controller.mainSteps[i].subSteps![j].progress.value < 1.0) {
    //         await Future.delayed(const Duration(milliseconds: 50));
    //         mTime += 50;
    //         tTime += 50;
    //         _controller.mainSteps[i].subSteps![j].progress.value = mTime.toDouble() / _controller.mainSteps[i].subSteps![j].time;
    //         _controller.mainSteps[i].progress.value = tTime.toDouble() / _controller.mainSteps[i].time;
    //       }
    //       _controller.step[i].value += 1;
    //     }
    //     await Future.delayed(const Duration(milliseconds: 50));
    //     _controller.mainSteps[i].progress.value = 1.0;
    //   } else {
    //     int mTime = 0;
    //     while (_controller.mainSteps[i].progress.value < 1.0) {
    //       await Future.delayed(const Duration(milliseconds: 50));
    //       mTime += 50;
    //       _controller.mainSteps[i].progress.value = mTime.toDouble() / _controller.mainSteps[i].time;
    //     }
    //   }
    //   if(_controller.step[0].value <= 2) {
    //     _controller.step[0].value += 1;
    //   }
    // }
    // await Future.delayed(const Duration(seconds: 1));
    // _controller.loading.value = 2;
    // _controller.resetProgress();
  }

  Widget stepper() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() =>
                  AnotherStepper(
                    stepperList: getMainSteps(_controller.step[0].value, _controller.mainSteps),
                    stepperDirection: Axis.horizontal,
                    iconWidth: 40,
                    iconHeight: 40,
                    activeIndex: _controller.step[0].value,
                  )),
              SizedBox(height: 20.r,),
              Padding(padding: EdgeInsets.only(left: 200.r), child: generationSteppers(_controller.step[0].value)),
            ],
          )
      ),
    );
  }

  Widget generationSteppers(int index){
    return Obx(()=>_controller.step[index].value > 0?AnotherStepper(
      stepperList: getMainSteps(_controller.step[index].value, _controller.mainSteps[index].subSteps!),
      stepperDirection: Axis.vertical,
      iconWidth: 40, // Height that will be applied to all the stepper icons
      iconHeight: 40, // Width that will be applied to all the stepper icons
      activeIndex: _controller.step[index].value,
    ):const SizedBox());
  }

  List<StepperData> getMainSteps(int activeIndex, List<StepItem> steps) {
    List<StepperData> trainingSteps = [];
    for (int i = 0; i < steps.length; i++) {
      if (i <= activeIndex) {
        trainingSteps.add(StepperData(
            title: StepperText(steps[i].title,
              textStyle: AppFonts.blackBoldTextH4,
            ),
            subtitle: StepperText(steps[i].subTitle, textStyle: AppFonts.blackTextH5),
            iconWidget: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(child: steps[i].icon),
                    )),
                Positioned.fill(child: CircularProgressIndicator(
                  value: steps[i].progress.value,
                  color: Colors.red,
                  // backgroundColor: Colors.white,
                  strokeWidth: 3.r,
                )),
              ],
            )
        )
        );
      } else {
        trainingSteps.add(StepperData(
          title: StepperText(steps[i].title,
              textStyle: const TextStyle(
                color: Colors.grey,
              )),
        ));
      }
    }
    return trainingSteps;
  }

  Widget imageGallery(String path, BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final count = (size.width / 330.r).round();
    final rows = (_controller.carInfo[path]!.length.toDouble() / count).ceil();
    return Card(
        elevation: 10,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 60.r,
              decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10)), color: Colors.indigo,),
              child: Stack(
                children: [
                    Center(child: Text(getTitle(path), style: AppFonts.whiteBoldTextH3, textAlign: TextAlign.center,)),
                  Positioned(right: 20.r, top: 10.r, child: IconButton(icon: const Icon(Icons.view_in_ar, color: Colors.white,),
                      onPressed: ()=>setModeForAll(_controller.carInfo[path]!, false))),
                  Positioned(right: 70.r, top: 10.r, child: IconButton(icon: const Icon(Icons.image, color: Colors.white,),
                      onPressed: ()=>setModeForAll(_controller.carInfo[path]!, true))),
                ],
              )
              ),
            Container(
                height: rows * 320.r / 1.4 + 20.r * (rows + 1),
                padding: EdgeInsets.all(20.r),
                child: GridView.count(
                  crossAxisCount: count,
                  mainAxisSpacing: 20.r,
                  crossAxisSpacing: 20.r,
                  childAspectRatio: 1.4,
                  children: modelItems(path, _controller.carInfo[path]!),
                )),
          ],
        )
    );
  }

  String getTitle(String genStr) {
    return genStr.replaceAll("gen", "Generation ");
  }

  void setModeForAll(List<ModelItem> data, bool flag){
    for(var d in data){
      d.openPage(flag);
    }
  }

  List<Widget> modelItems(String path, List<ModelItem> data) {
    List<Widget> res = [];
    for (var v in data) {
      res.add(getModelItem(path, v, 240.r, true));
    }
    return res;
  }

  Widget getModelItem(String path, ModelItem v, double height, bool showTitle){
    final page = PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: v.pageController,
      children: [
        Image.asset("assets/$path/${v.path}.png", fit: BoxFit.cover,),
        // Image.asset("assets/$path/${v.path}.gif", fit: BoxFit.cover,),
        ModelViewer(
          backgroundColor: const Color.fromARGB(255, 82, 87, 110),
          src: "assets/$path/${v.path}.glb",
          alt: 'A 3D model of an astronaut',
          ar: true,
          autoRotate: true,
          disableZoom: false,
          debugLogging: false,
        ),
      ],
    );
    final c = SizedBox(height: height, width: height*1.4, child: Card(
        elevation: 6,
        shadowColor: Colors.green,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                Positioned.fill(child: page),
                Positioned(
                  right: 6.r, top: 10.r,
                  child: IconButton(iconSize: 24.r, icon: Obx(() =>
                  v.imageMode.value ?
                  const Icon(Icons.view_in_ar, color: Colors.white,) : const Icon(Icons.image, color: Colors.white,)),
                      onPressed: v.switchPage),
                ),
                Positioned(
                  right: 6.r, top: 50.r,
                  child: IconButton(iconSize: 24.r, icon: const Icon(Icons.info_outline, color: Colors.white,), onPressed: ()=>showInfoDialog(v)),
                ),
                Positioned(
                  right: 6.r, top: 90.r,
                  child: IconButton(iconSize: 24.r, icon: const Icon(Icons.download, color: Colors.white,), onPressed: ()=>downloadFile(v)),
                ),
                if(showTitle)
                  Positioned(
                      left: 100.r,
                      bottom: 0.r, height: 20.r,
                      child: Text(v.name, style: AppFonts.whiteTextSmall))
              ],
            )
        )
    ));
    return c;
  }

  void downloadFile(ModelItem item) {
    html.window.open("assets/${item.gen}/${item.path}.glb", "${item.path}.glb");
  }

  void showInfoDialog(ModelItem item) async {
    String fileText = await rootBundle.loadString('assets/${item.gen}/${item.path}_info.txt');
    Get.defaultDialog(
      title: item.name,
      content: Text(fileText),
      contentPadding: EdgeInsets.all(20.r),
    );
  }

}