import 'dart:convert';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';

class SupportedCountriesMap extends StatefulWidget {
  const SupportedCountriesMap({Key? key}) : super(key: key);

  @override
  _SupportedCountriesMapState createState() => _SupportedCountriesMapState();
}

class _SupportedCountriesMapState extends State<SupportedCountriesMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Visitors",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: defaultPadding),
          const Divider(),
          SizedBox(
            height: 200,
            child: InteractiveViewer(
              maxScale: 75.0,
              child: SimpleMap(
                instructions: SMapWorld.instructions,
                defaultColor: Colors.grey,
                // CountryColors takes in 250 different colors that will color each country the color you want. In this example it generates a random color each time SetState({}) is called.
                callback: (id, name, tapdetails) {
                  goToCountry(id);
                },
                countryBorder: const CountryBorder(color: Colors.white),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF39C12),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5.0),
              ),
              const SizedBox(width: 5),
              Text(
                "Visitors",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff00A65A),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5.0),
              ),
              const SizedBox(width: 5),
              Text(
                "Online",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void goToCountry(String country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryPage(country: country),
      ),
    );
  }
}

class CountryPage extends StatefulWidget {
  final String country;

  const CountryPage({required this.country, Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late String state;
  late String instruction;

  late List<Map<String, dynamic>> properties;

  late Map<String, Color?> keyValuesPaires;

  @override
  void initState() {
    instruction = getInstructions(widget.country);
    if (instruction != "NOT SUPPORTED") {
      properties = getProperties(instruction);
      properties.sort((a, b) => a['name'].compareTo(b['name']));
      keyValuesPaires = {};
      properties.forEach((element) {
        keyValuesPaires.addAll({element['id']: element['color']});
      });

      state = 'Tap a state, prefecture or province';
    } else {
      state = 'This country is not supported';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: Text(
          '${widget.country.toUpperCase()} - $state',
          style: GoogleFonts.poppins(color: Colors.blue),
        ),
      ),
      body: instruction == "NOT SUPPORTED"
          ? const Center(child: Text("This country is not supported"))
          : Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                  child: Center(
                      child: SimpleMap(
                        defaultColor: Colors.grey.shade300,
                        key: Key(properties.toString()),
                        colors: keyValuesPaires,
                        instructions: instruction,
                        callback: (id, name, tapDetails) {
                          setState(() {
                            state = name;

                            int i = properties
                                .indexWhere((element) => element['id'] == id);

                            properties[i]['color'] =
                            properties[i]['color'] == Colors.green
                                ? null
                                : Colors.green;
                            keyValuesPaires[properties[i]['id']] =
                            properties[i]['color'];
                          });
                        },
                      ))),
              if (MediaQuery.of(context).size.width > 800)
                SizedBox(
                    width: 320,
                    height: MediaQuery.of(context).size.height,
                    child: Card(
                      margin: const EdgeInsets.all(16),
                      elevation: 8,
                      child: ListView(
                        children: [
                          for (int i = 0; i < properties.length; i++)
                            ListTile(
                              title: Text(properties[i]['name']),
                              leading: Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: 20,
                                height: 20,
                                color: properties[i]['color'] ??
                                    Colors.grey.shade300,
                              ),
                              subtitle: Text(properties[i]['id']),
                              onTap: () {
                                setState(() {
                                  properties[i]['color'] = properties[i]
                                  ['color'] ==
                                      Colors.green
                                      ? null
                                      : Colors.green;
                                  keyValuesPaires[properties[i]['id']] =
                                  properties[i]['color'];
                                });
                              },
                            )
                        ],
                      ),
                    )),
            ]),
          ),
          if (MediaQuery.of(context).size.width < 800)
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 8,
                  child: ListView(
                    children: [
                      for (int i = 0; i < properties.length; i++)
                        ListTile(
                          title: Text(properties[i]['name']),
                          leading: Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: 20,
                            height: 20,
                            color: properties[i]['color'] ??
                                Colors.grey.shade300,
                          ),
                          subtitle: Text(properties[i]['id']),
                          onTap: () {
                            setState(() {
                              properties[i]['color'] =
                              properties[i]['color'] == Colors.green
                                  ? null
                                  : Colors.green;
                              keyValuesPaires[properties[i]['id']] =
                              properties[i]['color'];
                            });
                          },
                        )
                    ],
                  ),
                )),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> getProperties(String input) {
    Map<String, dynamic> instructions = json.decode(input);

    List paths = instructions['i'];

    List<Map<String, dynamic>> properties = [];

    paths.forEach((element) {
      properties.add({
        'name': element['n'],
        'id': element['u'],
        'color': null,
      });
    });

    return properties;
  }

  String getInstructions(String id) {
    switch (id) {
      case 'ar':
        return SMapArgentina.instructions;

      case 'at':
        return SMapAustria.instructions;

      case 'ad':
        return SMapAndorra.instructions;

      case 'ao':
        return SMapAngola.instructions;

      case 'am':
        return SMapArmenia.instructions;

      case 'au':
        return SMapAustralia.instructions;

      case 'az':
        return SMapAzerbaijan.instructions;

      case 'bs':
        return SMapBahamas.instructions;

      case 'bh':
        return SMapBahrain.instructions;

      case 'bd':
        return SMapBangladesh.instructions;

      case 'by':
        return SMapBelarus.instructions;

      case 'be':
        return SMapBelgium.instructions;

      case 'bt':
        return SMapBhutan.instructions;

      case 'bo':
        return SMapBolivia.instructions;

      case 'bw':
        return SMapBotswana.instructions;

      case 'br':
        return SMapBrazil.instructions;

      case 'bn':
        return SMapBrunei.instructions;

      case 'bg':
        return SMapBulgaria.instructions;

      case 'bf':
        return SMapBurkinaFaso.instructions;

      case 'bi':
        return SMapBurundi.instructions;

      case 'ca':
        return SMapCanada.instructions;

      case 'cm':
        return SMapCameroon.instructions;

      case 'cf':
        return SMapCentralAfricanRepublic.instructions;

      case 'cv':
        return SMapCapeVerde.instructions;

      case 'td':
        return SMapChad.instructions;

      case 'cn':
        return SMapChina.instructions;

      case 'ch':
        return SMapSwitzerland.instructions;

      case 'cd':
        return SMapCongoDR.instructions;

      case 'cg':
        return SMapCongoBrazzaville.instructions;

      case 'co':
        return SMapColombia.instructions;

      case 'cr':
        return SMapCostaRica.instructions;

      case 'hr':
        return SMapCroatia.instructions;

      case 'cu':
        return SMapCuba.instructions;

      case 'cl':
        return SMapChile.instructions;

      case 'ci':
        return SMapIvoryCoast.instructions;

      case 'cy':
        return SMapCyprus.instructions;

      case 'cz':
        return SMapCzechRepublic.instructions;

      case 'dk':
        return SMapDenmark.instructions;

      case 'dj':
        return SMapDjibouti.instructions;

      case 'do':
        return SMapDominicanRepublic.instructions;

      case 'ec':
        return SMapEcuador.instructions;

      case 'es':
        return SMapSpain.instructions;

      case 'eg':
        return SMapEgypt.instructions;

      case 'et':
        return SMapEthiopia.instructions;

      case 'sv':
        return SMapElSalvador.instructions;

      case 'ee':
        return SMapEstonia.instructions;

      case 'fo':
        return SMapFaroeIslands.instructions;

      case 'fi':
        return SMapFinland.instructions;

      case 'fr':
        return SMapFrance.instructions;

      case 'gb':
        return SMapUnitedKingdom.instructions;

      case 'ge':
        return SMapGeorgia.instructions;

      case 'de':
        return SMapGermany.instructions;

      case 'gr':
        return SMapGreece.instructions;

      case 'gt':
        return SMapGuatemala.instructions;

      case 'gn':
        return SMapGuinea.instructions;

      case 'hi':
        return SMapHaiti.instructions;

      case 'hk':
        return SMapHongKong.instructions;

      case 'hn':
        return SMapHonduras.instructions;

      case 'hu':
        return SMapHungary.instructions;

      case 'in':
        return SMapIndia.instructions;

      case 'id':
        return SMapIndonesia.instructions;

      case 'il':
        return SMapIsrael.instructions;

      case 'ir':
        return SMapIran.instructions;

      case 'iq':
        return SMapIraq.instructions;

      case 'ie':
        return SMapIreland.instructions;

      case 'it':
        return SMapItaly.instructions;

      case 'jm':
        return SMapJamaica.instructions;

      case 'jp':
        return SMapJapan.instructions;

      case 'kz':
        return SMapKazakhstan.instructions;

      case 'ke':
        return SMapKenya.instructions;

      case 'xk':
        return SMapKosovo.instructions;

      case 'kg':
        return SMapKyrgyzstan.instructions;

      case 'la':
        return SMapLaos.instructions;

      case 'lv':
        return SMapLatvia.instructions;

      case 'li':
        return SMapLiechtenstein.instructions;

      case 'lt':
        return SMapLithuania.instructions;

      case 'lu':
        return SMapLuxembourg.instructions;

      case 'mk':
        return SMapMacedonia.instructions;

      case 'ml':
        return SMapMali.instructions;

      case 'mt':
        return SMapMalta.instructions;

      case 'mz':
        return SMapMozambique.instructions;

      case 'mx':
        return SMapMexico.instructions;

      case 'md':
        return SMapMoldova.instructions;

      case 'me':
        return SMapMontenegro.instructions;

      case 'ma':
        return SMapMorocco.instructions;

      case 'mm':
        return SMapMyanmar.instructions;

      case 'my':
        return SMapMalaysia.instructions;

      case 'na':
        return SMapNamibia.instructions;

      case 'np':
        return SMapNepal.instructions;

      case 'nl':
        return SMapNetherlands.instructions;

      case 'nz':
        return SMapNewZealand.instructions;

      case 'ni':
        return SMapNicaragua.instructions;

      case 'ng':
        return SMapNigeria.instructions;

      case 'no':
        return SMapNorway.instructions;

      case 'om':
        return SMapOman.instructions;

      case 'ps':
        return SMapPalestine.instructions;

      case 'pk':
        return SMapPakistan.instructions;

      case 'ph':
        return SMapPhilippines.instructions;

      case 'pa':
        return SMapPanama.instructions;

      case 'pe':
        return SMapPeru.instructions;

      case 'pr':
        return SMapPuertoRico.instructions;

      case 'py':
        return SMapParaguay.instructions;

      case 'pl':
        return SMapPoland.instructions;

      case 'pt':
        return SMapPortugal.instructions;

      case 'qa':
        return SMapQatar.instructions;

      case 'ro':
        return SMapRomania.instructions;

      case 'ru':
        return SMapRussia.instructions;

      case 'rw':
        return SMapRwanda.instructions;

      case 'sa':
        return SMapSaudiArabia.instructions;

      case 'rs':
        return SMapSerbia.instructions;

      case 'sd':
        return SMapSudan.instructions;

      case 'sg':
        return SMapSingapore.instructions;

      case 'sl':
        return SMapSierraLeone.instructions;

      case 'sk':
        return SMapSlovakia.instructions;

      case 'si':
        return SMapSlovenia.instructions;

      case 'kr':
        return SMapSouthKorea.instructions;

      case 'lk':
        return SMapSriLanka.instructions;

      case 'se':
        return SMapSweden.instructions;

      case 'sy':
        return SMapSyria.instructions;

      case 'tw':
        return SMapTaiwan.instructions;

      case 'tj':
        return SMapTajikistan.instructions;

      case 'th':
        return SMapThailand.instructions;

      case 'tr':
        return SMapTurkey.instructions;

      case 'ug':
        return SMapUganda.instructions;

      case 'ua':
        return SMapUkraine.instructions;

      case 'ae':
        return SMapUnitedArabEmirates.instructions;

      case 'us':
        return SMapUnitedStates.instructions;

      case 'uy':
        return SMapUruguay.instructions;

      case 'uz':
        return SMapUzbekistan.instructions;

      case 've':
        return SMapVenezuela.instructions;

      case 'vn':
        return SMapVietnam.instructions;

      case 'ye':
        return SMapYemen.instructions;

      case 'za':
        return SMapSouthAfrica.instructions;

      case 'zm':
        return SMapZambia.instructions;

      case 'zw':
        return SMapZimbabwe.instructions;

      default:
        return 'NOT SUPPORTED';
    }
  }
}