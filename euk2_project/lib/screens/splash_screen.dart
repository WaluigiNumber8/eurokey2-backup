import 'package:eurokey2/blocs/location_management_bloc/location_management_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the EUK2 Splash screen.
class EUKSplashScreen extends StatelessWidget {
  const EUKSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    int taps = 0;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (MediaQuery.of(context).size.height > 310) const SplashImage(),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'EuroKlíčenka',
                textScaleFactor: 2,
              ),
              SizedBox(height: screenHeight * 0.1),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              BlocBuilder<LocationManagementBloc, LocationManagementState>(
                builder: (context, state) {
                  if (state is LocationManagementUpdatingDatabaseState) {
                    return (context.read<LocationManagementBloc>().checkForDataOnline)
                        ? const Text('Stahování lokací z internetu')
                        : const Text('Načítání lokací z úložiště');
                  } else if (state is LocationManagementLoadingPositionState) {
                    return const Text('Příprava polohy');
                  } else {
                    return const Text('Načítání');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///The image used for teh Splash Screen.
class SplashImage extends StatefulWidget {
  const SplashImage({super.key});

  @override
  State<SplashImage> createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage> {
  int _taps = 0;

  @override
  void initState() {
    super.initState();
    _taps = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_taps <=3 )_taps++;
        });
      },
      child: (_taps > 3)
          ? Image.asset('assets/images/logo_key_alt.png', height: MediaQuery.of(context).size.height * 0.25)
          : Image.asset('assets/images/logo_key.png', height: MediaQuery.of(context).size.height * 0.25),
    );
  }
}
