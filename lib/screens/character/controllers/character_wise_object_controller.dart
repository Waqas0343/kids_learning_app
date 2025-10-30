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
      {'name': 'Cow', 'image': 'https://www.shutterstock.com/image-photo/black-white-dairy-cow-clear-600nw-2628118303.jpg'},
      {'name': 'Cap', 'image': 'https://customlids.ca/cdn/shop/products/21374192_02.jpg?v=1657065319'},
      {'name': 'Clock', 'image': 'https://cdn.pixabay.com/photo/2017/03/26/12/36/alarm-clock-2175382_1280.jpg'},
      {'name': 'Candle', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLfpbwEkZEpmRpgHnYNhisH6UmIyYgqFiq1MSavPro-jPDsO6O2lD07gblf0HRxYdtzsw&usqp=CAU'},
      {'name': 'Cloud', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-vM1xKOynb_jDQ4bw0G7-lkoop8_fUjipmaE0V6WbyW7FYSwQ7OnGq_7bxgh_rLxT91E&usqp=CAU'},
      {'name': 'Corn', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQGFKj29zKM7lIpMgAM4k4f513xlyUyS90cg&s'},
      {'name': 'Cup', 'image': 'https://www.forlifedesignusa.com/cdn/shop/products/550-TRQ.jpg?v=1581640656'},
    ]),
    CharacterObjectModel(character: 'D', objects: [
      {'name': 'Dog', 'image': 'https://thumbs.dreamstime.com/b/side-view-golden-retriever-panting-standing-front-isolated-white-376594274.jpg'},
      {'name': 'Doll', 'image': 'https://t3.ftcdn.net/jpg/00/62/18/54/360_F_62185421_cVM7RxbG5c2GAeJWMDtgyOiEM1iHyTOR.jpg'},
      {'name': 'Duck', 'image': 'https://s3.us-west-2.amazonaws.com/cdn.classful.com/wp-content/uploads/2023/08/64ebef38903ed16070706591693183800413-img-6393.jpeg'},
      {'name': 'Drum', 'image': 'https://www.shutterstock.com/image-vector/snare-drum-vector-isolated-illustration-600nw-2325704019.jpg'},
      {'name': 'Door', 'image': 'https://www.neuffer.de/sites/de/files/img/frontdoors/l/country-house-door-pine-wood.jpg'},
      {'name': 'Donkey', 'image': 'https://cdn.vectorstock.com/i/1000v/20/27/cartoon-donkey-animal-vector-44712027.jpg'},
      {'name': 'Diamond', 'image': 'https://docs.growndiamondcorp.com/blog/types-of-diamonds.png'},
      {'name': 'Desk', 'image': 'https://www.office-furniture-direct.co.uk/Cache/Images/MI003283-1-2048-2048-1500x1500-opaque.jpg'},
      {'name': 'Dolphin', 'image': 'https://sketchok.com/images/articles/07-animals/05-sea-animals/10/10.jpg'},
      {'name': 'Dress', 'image': 'https://img.bestdealplus.com/ae04/kf/S13dda55ab9e34deb87cf2eea49d4ff0bU.jpg'},
    ]),
    CharacterObjectModel(character: 'E', objects: [
      {'name': 'Egg', 'image': 'https://t3.ftcdn.net/jpg/05/49/49/82/360_F_549498276_AFnuz8nRNKBwHEiPDt86NacMrnEn13ib.jpg'},
      {'name': 'Elephant', 'image': 'https://ca.schleich-s.com/cdn/shop/products/14763_main_v16_TP.jpg?v=1691537299'},
      {'name': 'Eagle', 'image': 'https://img.pikbest.com/origin/09/69/99/76xpIkbEsTJzI.png!sw800'},
      {'name': 'Earwig', 'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Earwig_on_white_background.jpg/1200px-Earwig_on_white_background.jpg'},
      {'name': 'Envelope', 'image': 'https://5.imimg.com/data5/BF/UU/NJ/SELLER-83011653/plain-paper-envelope-design-500x500.jpg'},
      {'name': 'Eggplant', 'image': 'https://i.pinimg.com/474x/49/4c/92/494c92c5e909cac6fb80ffc9be0fb8a9.jpg'},
      {'name': 'Ear', 'image': 'https://media.istockphoto.com/id/1394801910/vector/realistic-human-ear-isolated-on-white-background-human-ear-organ-hearing-health-care-closeup.jpg?s=612x612&w=0&k=20&c=Sz7uFiG7-aXja7r7M8qaSuH_7AicbixpuKB87LWKXbA='},
      {'name': 'Earth', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKF2MpLAHv1sM4hl5SuAASLrB7x4893b5fbg&s'},
      {'name': 'Engine', 'image': 'https://static.pakwheels.com/2016/09/corvette-engine.jpg'},
      {'name': 'Emu', 'image': 'https://easydrawingguides.com/wp-content/uploads/2024/05/how-to-draw-an-emu-featured-image-1200.png'},
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
