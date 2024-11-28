import 'package:chaquopy/chaquopy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  late TextEditingController textController;
  late FocusNode focusNode;


  var outputOrError = ''.obs;


  final count = 0.obs;


  void addIndentation() {
    int currentPosition = textController.selection.start;

    String controllerText = textController.text;
    String updatedText = controllerText.substring(0, currentPosition) +
        "    " + // Adds 4 spaces
        controllerText.substring(currentPosition);


    textController.text = updatedText;
    textController.selection = TextSelection.collapsed(offset: currentPosition + 4);
  }


  Future<void> runCode() async {
    try {
      final result = await Chaquopy.executeCode(textController.text);

      outputOrError.value = result['textOutputOrError'] ?? 'No output or error message';
    } catch (e) {
      outputOrError.value = 'Error executing code: $e';
    }
  }


  @override
  void onInit() {
    textController = TextEditingController();
    focusNode = FocusNode();
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
    }


  @override
  void onClose() {
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }


  void increment() => count.value++;
}
