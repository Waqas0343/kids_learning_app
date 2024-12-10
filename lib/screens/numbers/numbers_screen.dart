import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_widgets/custom_card_widget.dart';
import '../../routes/app_routes.dart';
import 'controllers/numbers_controller.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersController controller = Get.put(NumbersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Numbers'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.table_view_sharp),
            onPressed: () {
              Get.toNamed(AppRoutes.kidsLearnTableScreen);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Click on a number to learn it!',
                    style: Get.textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    )),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(AppRoutes.drawNumberScreen),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final currentPage = controller.currentPage.value;
              final startNumber = (currentPage - 1) * 100 + 1;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 100,
                itemBuilder: (context, index) {
                  final number = startNumber + index;
                  return GestureDetector(
                    onTap: () => controller.speakNumber(number),
                    child: Obx(() {
                      final isSelected =
                          controller.selectedNumber.value == number;
                      return CustomCard(
                        color:
                            isSelected ? Colors.purple.shade400 : Colors.white,
                        child: Center(
                          child: Text(number.toString(),
                              style: Get.textTheme.titleSmall?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.purple.shade400,
                              )),
                        ),
                      );
                    }),
                  );
                },
              );
            }),
          ),
          // Pagination Controls
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Obx(() {
              final currentPage = controller.currentPage.value;
              final totalPages = (2000 / 100).ceil();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 1
                        ? () => controller.changePage(currentPage - 1)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      disabledBackgroundColor: Colors.grey.shade300,
                    ),
                    child: const Text('Previous'),
                  ),
                  // Current Page Indicator
                  Text('Page $currentPage of $totalPages',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      )),
                  // Next Button
                  ElevatedButton(
                    onPressed: currentPage < totalPages
                        ? () => controller.changePage(currentPage + 1)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      disabledBackgroundColor: Colors.grey.shade300,
                    ),
                    child: const Text('Next'),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
