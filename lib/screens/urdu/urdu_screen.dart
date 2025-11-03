import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/urdu_controller.dart';

class UrduScreen extends StatelessWidget {
  const UrduScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UrduController controller = Get.put(UrduController());

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "اردو حروفِ تہجی سیکھیں",
          style: Get.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          )
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              " کسی حرف پر کلک کریں اور اس کا تلفظ سنیے!",
              textAlign: TextAlign.right,
              style: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Obx(
                  () => GridView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.urduAlphabets.length,
                itemBuilder: (context, index) {
                  final letter = controller.urduAlphabets[index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectLetter(letter);
                      controller.speakLetter(letter);
                    },
                    child: Obx(
                          () {
                        final selected = controller.selectedLetter.value == letter;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: selected
                                ? Colors.purple.shade500
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected
                                  ? Colors.purple
                                  : Colors.grey.shade400,
                              width: 2,
                            ),
                            boxShadow: selected
                                ? [
                              BoxShadow(
                                color: Colors.purple.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              letter,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: selected
                                    ? Colors.white
                                    : Colors.red.shade700,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade400, Colors.red.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withValues(alpha: 0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/2_das.jpg',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.snackbar(
                      "جلد آرہا ہے!",
                      "الف سے یے تک تصویری الفاظ شامل کیے جائیں گے۔",
                      backgroundColor: Colors.white,
                      colorText: Colors.black,
                    );
                  },
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  label: const Text(
                    "شروع کریں — الف سے یے تک",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade600,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
