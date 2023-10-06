import 'dart:convert';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:meta/meta.dart';

class AttachScreenshotOnPassStepHook extends Hook {
  @override
  Future<void> onAfterStep(
      World world, String step, StepResult stepResult) async {
    final screenshotData = await takeScreenshot(world);
    world.attach(screenshotData, 'image/png', step);
  }

  @protected
  Future<String> takeScreenshot(World world) async {
    final bytes = await (world as FlutterWorld).driver?.screenshot();

    return base64Encode(bytes!);
  }
}
