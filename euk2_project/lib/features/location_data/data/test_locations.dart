import 'package:euk2_project/features/location_data/data/euk_location_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

int _idCounter = 0;

/// A list of destinations used for testing
final List<EUKLocationData> testLocations = [
  EUKLocationData.latLng(
      id: '0',
      latLng: const LatLng(49.8701600, 17.8791761),
      address: 'U železniční stanice',
      region: '',
      city: 'Hradec nad Moravicí',
      info: '',
      ZIP: '747 41',
      type: EUKLocationType.platform,),
  EUKLocationData.latLng(
      id: '1',
      latLng: const LatLng(49.9337922, 17.8793431),
      address: 'Slezská nemocnice Opava',
      region: '',
      city: 'Opava',
      info: '',
      ZIP: '746 01',
      type: EUKLocationType.hospital,),
  EUKLocationData.latLng(
      id: '2',
      latLng: const LatLng(49.8758258, 17.8759750),
      address: 'Státní zámek',
      region: 'Moravskoslezský kraj',
      city: 'Hradec nad Moravicí',
      info: 'Městečko 2 hlavní vstup čp. 2, Červený zámek, Bílý zámek',
      ZIP: '747 41',
      type: EUKLocationType.wc,),

  EUKLocationData.latLng(
      id: '3',
      latLng: const LatLng(50.079149, 14.425749),
      address: 'Finanční úřad pro Prahu 1, Štěpánská 619/28',
      region: 'Hlavní město Praha',
      city: 'Praha 1',
      info: 'přízemí',
      ZIP: '112 33',
      type: EUKLocationType.wc,),

    EUKLocationData.latLng(
        id: '4',
        latLng: const LatLng(50.087109, 14.417829),
        address: 'Magistrát hl. m. Prahy, Nová radnice, Mariánské náměstí 2',
        region: 'Hlavní město Praha',
        city: 'Praha 1',
        info: 'přízemí',
        ZIP: '110 00',
        type: EUKLocationType.wc,),

    EUKLocationData.latLng(
        id: '5'),
        latLng: const LatLng(50.086856, 14.420197),
        address: 'Magistrát hl. m. Prahy, Staroměstská radnice s orlojem, Staroměstské náměstí 1/3',
        region: 'Hlavní město Praha',
        city: 'Praha 1',
        info: 'přízemí',
        ZIP: '110 00',
        type: EUKLocationType.wc,),

    EUKLocationData.latLng(
        id: '6',
        latLng: const LatLng(50.081966, 14.422250),
        address: 'Magistrát hl. m. Prahy, Škodův palác, Jungmannova 35/29',
        region: 'Hlavní město Praha',
        city: 'Praha 1',
        info: 'přízemí',
        ZIP: '110 00',
        type: EUKLocationType.wc,),
    EUKLocationData.latLng(
        id: '7',
        latLng: const LatLng(50.086554, 14.417819),
        address: 'Ministerstvo dopravy ČR, nábř. L. Svobody 1222/12',
        region: 'Hlavní město Praha',
        city: 'Praha 1',
        info: 'plošina',
        ZIP: '110 15',
        type: EUKLocationType.wc,),

    EUKLocationData.latLng(
        id: '8',
        latLng: const LatLng(50.085743, 14.425213),
        address: 'Nákupní galerie Myslbek, Na Příkopě 19, Ovocný trh 8',
        region: 'Hlavní město Praha',
        city: 'Praha 1',
        info: 'přízemí',
        ZIP: '110 00',
        type: EUKLocationType.platform,),

    EUKLocationData.latLng(
        id: '9',
        latLng: const LatLng(49.223209, 16.537533),
        address: 'Čerpací stanice Benzina Brno - Komín, Bystrcká 1276/36b',
        region: 'Jihomoravský kraj',
        city: 'Brno',
        info: 'přízemí',
        ZIP: '624 00',
        type: EUKLocationType.wc,),
    EUKLocationData.latLng(
        id: '10',
        latLng: const LatLng(49.218956, 16.575459),
        address: 'Čerpací stanice Benzina, Královopolská 3197/90',
        region: 'Jihomoravský kraj',
        city: 'Brno',
        info: 'přízemí',
        ZIP: '616 00',
        type: EUKLocationType.wc,),
    EUKLocationData.latLng(
        id: '11',
        latLng: const LatLng(49.196248, 16.604157),
        address: 'Filharmonie Brno, Komenského náměstí 534/8',
        region: 'Jihomoravský kraj',
        city: 'Brno',
        info: '',
        ZIP: '602 00',
        type: EUKLocationType.platform,),
    EUKLocationData.latLng(
        id: '12',
        latLng: const LatLng(49.166098, 16.627510),
        address: 'Hobby market OBI Brno, Sokolova 622/1',
        region: 'Jihomoravský kraj',
        city: 'Brno',
        info: 'přízemí',
        ZIP: '619 00',
        type: EUKLocationType.wc,),
    EUKLocationData.latLng(
        id: '13',
        latLng: const LatLng(49.8, 17.87),
        address: 'Clam - Gallasův palác, Husova 158/20, 110 00 Praha 1',
        region: 'Hlavní město Praha',
        city: 'Praha 1',
        info: 'přízemí',
        ZIP: '110 00',
        type: EUKLocationType.wc,),
];