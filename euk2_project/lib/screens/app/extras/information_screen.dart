import 'package:euk2_project/version_label.dart';
import 'package:euk2_project/widgets/information_tile.dart';
import 'package:flutter/material.dart';

///The information screen, that shows general info about the app as well as
///it's version.
class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informace'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 56),
              Image.asset('assets/images/logo_key.png',
                  width: screenSize.width * 0.25),
              const SizedBox(height: 12),
              const Text(
                'EuroKlíčenka $appVersion',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          InfoTile(
                            screenSize: screenSize,
                            title: 'Za vývojem nové podoby EuroKlíčenky stojí tým studentů OU, do kterého patří Jan Sonnek, Jan Kunetka, Ondřej Sládek a Ondřej Zeman.',
                            imageFilePath: 'assets/images/logo_ou.png',
                          ),
                          const Divider(),
                          InfoTile(
                            screenSize: screenSize,
                            title: 'EuroKlíčenka je majetkem přírodověděcké fakulty Ostravské univerzity v Ostravě, Česká Republika.',
                            imageFilePath: 'assets/images/logo_prf.png',
                          ),
                          const Divider(),
                          InfoTile(
                            screenSize: screenSize,
                            title: 'Data o místech, osazena Euroklíčem poskytují oficiální stránky Euroklíče, \nkde jsou také volně dostupné veřejnosti.',
                            imageFilePath: 'assets/images/logo_eurokey.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
