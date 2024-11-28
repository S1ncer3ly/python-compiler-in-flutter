import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/home/controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 4),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Run Python Code')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Text input area
              Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  focusNode: controller.focusNode,
                  controller: controller.textController,
                  minLines: 10,
                  maxLines: 20,
                  decoration: InputDecoration(
                    labelText: 'Enter Python Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // Output/Error area
              Expanded(
                flex: 2,
                child: Obx(() => Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Output/Error: ${controller.outputOrError.value}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )),
              ),

              // Action buttons
              Row(
                children: [
                  // Button for adding indentation
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.green,
                        onPressed: () => controller.addIndentation(),
                        child: Icon(
                          Icons.arrow_right_alt,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Button for running the Python code
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 50,
                        color: Colors.green,
                        child: Text(
                          'Run Code',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: controller.runCode,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
