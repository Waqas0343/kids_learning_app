import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_widgets/custom_card_widget.dart';
import 'package:kids_learning_app/routes/app_routes.dart';
import 'controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'A-Z Learning',
          style: Get.textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24
          )
        ),
        backgroundColor: Colors.purple.shade400,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          children: [
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.drawingScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://st5.depositphotos.com/72257490/62421/v/450/depositphotos_624215136-stock-illustration-cute-boy-painting-cutting-colorful.jpg',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Drawing',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.graphicsScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://static.vecteezy.com/system/resources/previews/002/399/947/non_2x/happy-kids-studying-and-learning-vector.jpg',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Graphic',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.characterScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVqqQ631TPR7cUIan8OOkx1d0Dns9nGGs3w&s',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Character',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.numbersScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://img.freepik.com/premium-vector/vector-illustration-kids-learning-math-with-colorful-numbersconcept-multi-colored-numbers_723224-1779.jpg',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Numeric',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.colorsScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://www.shutterstock.com/image-photo/set-colorful-hand-prints-rainbow-600nw-62824108.jpg',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Colours',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.shapesScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://i5.walmartimages.com/seo/Wooden-Math-Blocks-Learning-Shapes-for-Kids-16-pcs_4e58195a-d29c-4ae2-819a-6a3de7ccbdd3.996aab967284d6a1f1d0a972001cfe51.jpeg?odnHeight=320&odnWidth=320&odnBg=FFFFFF',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Shapes',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.animalScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://www.shutterstock.com/image-vector/cartoon-happy-lion-isolated-on-600nw-675125593.jpg',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Animal',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CustomCard(
                  onPressed: (){
                    Get.toNamed(AppRoutes.birdsScreen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://www.shutterstock.com/image-vector/littel-bird-waving-cute-young-600nw-1683344230.jpg',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      'Birds',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
