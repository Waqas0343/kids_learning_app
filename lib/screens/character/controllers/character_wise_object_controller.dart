import 'package:get/get.dart';

import '../model/character_model.dart';

class CharacterWiseObjectController extends GetxController {

  final charactersList = <CharacterObjectModel>[
    CharacterObjectModel(character: 'A', objects: [
      {'name': 'Apple', 'image': 'https://static.wikia.nocookie.net/the-snack-encyclopedia/images/7/7d/Apple.png/revision/latest?cb=20200706145821'},
      {'name': 'Ant', 'image': 'https://www.adamspetcare.com/-/media/Project/OneWeb/Adams/Images/Photos/Blog/Article/ants.jpg'},
      {'name': 'Aeroplane', 'image': 'https://t4.ftcdn.net/jpg/08/71/56/43/360_F_871564379_dYGGRSxybQq1Z2FHh6iwySw1Xp7AiDNF.jpg'},
      {'name': 'Alligator', 'image': 'https://www.shutterstock.com/image-vector/virtual-reality-alligator-vector-paleontology-600nw-2303842673.jpg'},
      {'name': 'Arrow', 'image': 'https://www.shutterstock.com/image-vector/red-arrow-icon-on-white-600nw-2484198151.jpg'},
      {'name': 'Axe', 'image': 'https://assets.katogroup.eu/i/katogroup/MR703_01_marbles'},
      {'name': 'Apron', 'image': 'https://www.ikea.com/us/en/images/products/sandviva-apron-dark-gray__1329413_pe945160_s5.jpg?f=s'},
      {'name': 'Almond', 'image': 'https://media.istockphoto.com/id/1453155067/photo/close-up-of-delicious-single-almond-on-white.jpg?s=612x612&w=0&k=20&c=OYVbNZUZ-rHaSnUTtTVTyetV0LiOHM2DcqMR_sSlBvw='},
      {'name': 'Anchor', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrTEs-XL6gGc9-aM05d5HTEyRk6dI7iehnnw&s'},
      {'name': 'Avocado', 'image': 'https://cdn.britannica.com/72/170772-050-D52BF8C2/Avocado-fruits.jpg'},
    ]),

    CharacterObjectModel(character: 'B', objects: [
      {'name': 'Ball', 'image': 'https://dmzn2b8hkpq8b.cloudfront.net/images/products/515x515/S284990.jpg'},
      {'name': 'Banana', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ65Yp_7e4roHU7AnEDjkRriZb26JE5jEH9Bw&s'},
      {'name': 'Bat', 'image': 'https://media.umbraco.io/serious-sports-group/gm5ac4ew/12.png?height=0&width=977&quality=100&mode=crop&center=0.5,0.5'},
      {'name': 'Bird', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvdE_IHgM5Feei-LstUWxQVTIc9FgOTG1B1A&s'},
      {'name': 'Butterfly', 'image': 'https://thumbs.dreamstime.com/b/flying-butterfly-orange-shadow-isolated-white-background-illustration-38959015.jpg'},
      {'name': 'Book', 'image': 'https://media.istockphoto.com/id/173015527/photo/a-single-red-book-on-a-white-surface.jpg?s=612x612&w=0&k=20&c=AeKmdZvg2_bRY2Yct7odWhZXav8CgDtLMc_5_pjSItY='},
      {'name': 'Bus', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX20PBCZKxq17ZClmrvT7F9540Qp6DQsAWg7nC5YQwi80Hl9TGD5wtAc7qgY0rP6BQHjk&usqp=CAU'},
      {'name': 'Bell', 'image': 'https://www.shutterstock.com/image-vector/gold-vintage-retro-school-bell-600nw-2556965341.jpg'},
      {'name': 'Boat', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpiNOJBUsS_MgReZB9XnvNdD3lQAtlmKlH5w&s'},
      {'name': 'Balloon', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLvOmpHdV-Pm9F32Kw6_9fTAaNMPUAYipRTA&s'},

    ]),
    CharacterObjectModel(character: 'C', objects: [
      {'name': 'Cat', 'image': 'https://media.istockphoto.com/id/1443562748/photo/cute-ginger-cat.jpg?s=612x612&w=0&k=20&c=vvM97wWz-hMj7DLzfpYRmY2VswTqcFEKkC437hxm3Cg='},
      {'name': 'Car', 'image': 'https://image.made-in-china.com/202f0j00EwtcpBFnkIkJ/New-Exeed-Strerra-Et-4WD-Pure-Electric-Car-EV-Avto.webp'},
      {'name': 'Cake', 'image': 'https://thumbs.dreamstime.com/b/happy-birthday-cake-isolated-transparent-background-happy-birthday-cake-isolated-transparent-white-background-288617154.jpg'},
      {'name': 'Cow', 'image': 'assets/images/banana.png'},
      {'name': 'Cap', 'image': 'assets/images/banana.png'},
      {'name': 'Clock', 'image': 'assets/images/banana.png'},
      {'name': 'Candle', 'image': 'assets/images/banana.png'},
      {'name': 'Cloud', 'image': 'assets/images/banana.png'},
      {'name': 'Corn', 'image': 'assets/images/banana.png'},
      {'name': 'Cup', 'image': 'assets/images/banana.png'},
    ]),
    CharacterObjectModel(character: 'D', objects: [
      {'name': 'Ball', 'image': 'assets/images/ball.png'},
      {'name': 'Bat', 'image': 'assets/images/bat.png'},
      {'name': 'Banana', 'image': 'assets/images/banana.png'},
    ]),
  ].obs;

  RxInt currentIndex = 0.obs;
  RxString stage = 'study'.obs;

  void nextCharacter() {
    if (currentIndex.value < charactersList.length - 1) {
      currentIndex.value++;
      stage.value = 'study';
    }
  }

  void changeStage(String newStage) {
    stage.value = newStage;
  }
}
