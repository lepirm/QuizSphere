import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(
        () {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.question.value == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Enter the subject"),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36.0, vertical: 16.0),
                    child: TextField(onChanged: controller.terrain.call)),
                ElevatedButton(
                  onPressed: () => controller.fetchApi(),
                  child: const Text("Fetch me", style: TextStyle(fontSize: 20)),
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(controller.question.value?.question ?? ""),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.isAnsTrue.value != null
                              ? null
                              : () => controller.checkCorrect(
                                  controller.question.value!.answers![0]),
                          child: Text(
                              controller.question.value?.answers?[0] ?? ""),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.isAnsTrue.value != null
                              ? null
                              : () => controller.checkCorrect(
                                  controller.question.value!.answers![1]),
                          child: Text(
                              controller.question.value?.answers?[1] ?? ""),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.isAnsTrue.value != null
                              ? null
                              : () => controller.checkCorrect(
                                  controller.question.value!.answers![2]),
                          child: Text(
                              controller.question.value?.answers?[2] ?? ""),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.isAnsTrue.value != null
                              ? null
                              : () => controller.checkCorrect(
                                  controller.question.value!.answers![3]),
                          child: Text(
                              controller.question.value?.answers?[3] ?? ""),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 48.0),
                  if (controller.isAnsTrue.value != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          if (controller.isAnsTrue.value!)
                            Text(
                              "${controller.question.value!.correctAnswer} is True! Good Job!",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.green),
                            )
                          else ...[
                            const Text(
                              "Wrong!",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              "The correct answer is: ${controller.question.value!.correctAnswer}",
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                          const SizedBox(height: 48.0),
                        ],
                      ),
                    ),
                  ElevatedButton(
                    onPressed: controller.isAnsTrue.value == null
                        ? null
                        : controller.fetchApi,
                    child: const Text("Next"),
                  ),
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
