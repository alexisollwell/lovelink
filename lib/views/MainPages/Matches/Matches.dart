import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:lovelink/views/MainPages/Matches/components/LoveLinkCard.dart';
import '../../../models/matchPerson.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {


  void inputLike(MatchPerson data) {
    print("Like a ${data.name}");
  }

  void inputDislike(MatchPerson data) {
    print("Dislike a ${data.name}");
  }

  List<MatchPerson> profiles =[
    MatchPerson(
        id: 1,
        name: "Talia",
        age: 18,
        gender: "Indefinido",
        photo: "assets/images/profile1.png",
        description: "Me llamo Daniel\n\nMe gusta la musica de todo tipo pero sobre todo tranquila y los videojuegos\n\nTengo 2 perros y si tienes 1 gato podemos conocermos 😊\n\n¡Espero conocerte pronto!"
    ),
    MatchPerson(
        id: 2,
        name: "Diana",
        age: 16,
        gender: "Mujer",
        photo: "assets/images/logo.png",
        description: "Me llamo Daniel\n\nMe gusta la musica de todo tipo pero sobre todo tranquila y los videojuegos\n\nTengo 2 perros y si tienes 1 gato podemos conocermos 😊\n\n¡Espero conocerte pronto!"
    ),
    MatchPerson(
        id: 3,
        name: "Enrique",
        age: 25,
        gender: "Hombre",
        photo: "assets/icons/Corazon.png",
        description: "Me llamo Daniel\n\nMe gusta la musica de todo tipo pero sobre todo tranquila y los videojuegos\n\nTengo 2 perros y si tienes 1 gato podemos conocermos 😊\n\n¡Espero conocerte pronto!"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff292929),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xff292929),
        body:CardSwiper(
          isLoop: false,
          allowedSwipeDirection: const AllowedSwipeDirection.symmetric(horizontal: true,vertical: false),
          onSwipe:(value1,value2,value3){
            if(value3==CardSwiperDirection.right){
              inputLike(profiles[value1]);
            }
            else{
              inputDislike(profiles[value1]);
            }
            return true;
          },
          cardsCount: profiles.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              LoveLinkCard(
                like: ()=>inputLike(profiles[index]),
                dislike: ()=>inputDislike(profiles[index]),
                matchData: profiles[index],
              ),
        ),
      )
    );
  }
}


/*
ExpandableCarousel(
          options: CarouselOptions(
            autoPlay: false,
            showIndicator: false,
            autoPlayInterval: const Duration(seconds: 2),
          ),
          items: profiles.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LoveLinkCard(
                    like: ()=>inputLike(i),
                    dislike: ()=>inputDislike(i),
                    matchData: i,
                  )
                );
              },
            );
          }).toList(),
        )
* */