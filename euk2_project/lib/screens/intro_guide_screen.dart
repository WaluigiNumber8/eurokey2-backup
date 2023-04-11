import 'package:euk2_project/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:euk2_project/features/internet_access/allowed_urls.dart';
import 'package:euk2_project/features/internet_access/http_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: 'VÍTEJTE V EUROKLÍČENCE',
                body: 'Díky této aplikace máte možnost najít \nv České Republice všechna eurozámkem osazená sociální zařízení.',
                image: InkWell(
                  onTap: () => openURL(url: aboutEuroKeyURL),
                  child: buildImage('assets/images/logo_key.png', context),
                ),
                decoration: getDecoration()),
            PageViewModel(
                title: 'MAPA',
                body: 'Po spuštění aplikace se zobrazí mapa nejbližšího okolí, na němž jsou vyznačena místa pro Euroklíč.',
                image: buildImage('assets/images/img_guide_map.png', context),
                decoration: getDecoration()),
            PageViewModel(
                title: 'INFORMACE O MÍSTĚ',
                body: 'Po kliknutí na jeden z bodů se zobrazí informační okno s možností navigovat k danému místu.',
                image: buildImage('assets/images/img_guide_popup.png', context),
                decoration: getDecoration()),
            PageViewModel(
              title: 'NEJBLIŽŠÍ MÍSTA',
              body: 'V listu lokací se zobrazí místa, která jsou od aktuální polohy uživatele nejblíže. Volbou položky se dané místo zobrazí na mapě.',
              image: buildImage('assets/images/img_guide_list.png', context),
              decoration: getDecoration(),
            ),
          ],
          animationDuration: 150,
          done: const Text("Start"),
          onDone: () => gotoHome(context),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward),

          // showing skip button
          showSkipButton: true,
          skip: const Text("Skip"),
          onSkip: () => gotoHome(context),
          dotsDecorator: getDotDecoration(context),
          isProgressTap: false,

          nextFlex: 0,
        ),
      );
}

void gotoHome(BuildContext context) => context.read<MainScreenBloc>().add(OnInitFinish());

Widget buildImage(String path, BuildContext context) => Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, width: MediaQuery.of(context).size.width * 0.7),
      ),
    );

DotsDecorator getDotDecoration(BuildContext context) => DotsDecorator(
    size: const Size(10, 10),
    activeSize: const Size(25, 15),
    activeColor: Theme.of(context).colorScheme.secondary,
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));

PageDecoration getDecoration() => const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyTextStyle: TextStyle(fontSize: 18),
    bodyPadding: EdgeInsets.all(5),
    imagePadding: EdgeInsets.all(15),
    pageColor: Colors.white);
