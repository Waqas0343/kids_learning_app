import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_helpers/app_spacing.dart';
import 'package:kids_learning_app/app_widgets/custom_card_widget.dart';
import '../../app_styles/app_constant_file/app_images.dart';
import 'controllers/character_wise_object_controller.dart';

class CharacterWiseObject extends StatelessWidget {
  const CharacterWiseObject({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharacterWiseObjectController());

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Character Wise Learning",
          style: Get.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white
          )

        ),
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
      ),
      body: Obx(() {
        final characterData = controller.charactersList[controller.currentIndex.value];
        final stage = controller.stage.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widgetSpacerVertically(),
            Text(
              "${characterData.character} For...",
              style: Get.textTheme.titleSmall?.copyWith(
                  fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red
              )
            ),
            if (stage == 'study')
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: characterData.objects.length,
                  itemBuilder: (context, index) {
                    final object = characterData.objects[index];
                    return CustomCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: object['image']!,
                            width: 150,
                            height: 150,
                            placeholder: (_, __) =>  const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (_, __, ___) => Image.asset(MyImages.splash),
                            fit: BoxFit.contain,
                          ),
                          Text(
                            object['name']!,
                            style:  Get.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 16,
                            )
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            if (stage == 'color')
              const Expanded(
                child: Center(
                  child: Text("🎨 Fill colors for A objects!", style: TextStyle(fontSize: 20)),
                ),
              ),
            if (stage == 'match')
              const Expanded(
                child: Center(
                  child: Text("🔠 Match objects with alphabets!", style: TextStyle(fontSize: 20)),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.changeStage('color'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Text("🎨 Color Fill"),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.changeStage('match'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("🔠 Matching"),
                  ),
                  ElevatedButton(
                    onPressed: controller.nextCharacter,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text("Next →"),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
