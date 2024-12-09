import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_widgets/custom_card_widget.dart';
import 'controllers/kids_learn_table_controller.dart';

class KidsLearnTable extends StatelessWidget {
  const KidsLearnTable({super.key});

  @override
  Widget build(BuildContext context) {
    final KidsLearnTableController controller = Get.put(KidsLearnTableController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Tables"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Obx(() {
        if (controller.tables.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: controller.tables.length,
            itemBuilder: (context, index) {
              final List<Color> cardColors = [
                Colors.blueAccent.shade200,
                Colors.red.shade200,
                Colors.pinkAccent.shade200,
                Colors.purple.shade200,
                Colors.tealAccent.shade200,
                Colors.orangeAccent.shade200,
              ];
              final Color cardColor = cardColors[Random().nextInt(cardColors.length)];

              return GestureDetector(
                onTap: () {
                  controller.speakTable(controller.tables[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: CustomCard(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side: Table Text Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Table of ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orangeAccent,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 4,
                                          color: Colors.black.withOpacity(0.3),
                                          offset: const Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Table content lines
                                ...controller.tables[index].split("\n").map((line) {
                                  int lineIndex = controller.tables[index].split("\n").indexOf(line);
                                  return Obx(() => Text(
                                    line,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: lineIndex == controller.currentLineIndex.value
                                          ? Colors.purple
                                          : Colors.black,
                                      letterSpacing: 1.2,
                                      wordSpacing: 2.0,
                                    ),
                                  ));
                                }).toList(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 100),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/splash.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
