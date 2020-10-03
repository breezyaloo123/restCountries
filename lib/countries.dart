import 'dart:convert';

import 'package:http/http.dart' as htpp;

final url = 'https://restcountries.eu/rest/v2/all';

class Network {
  //On recupere l'ensemble des Noms des differents continents
  Future getAllCountriesName() async {
    try {
      var response = await htpp.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<String> countriesName = [];
        for (var country in jsonData) {
          countriesName.add(country['name']);
        }
        return countriesName;
      }
    } catch (e) {
      print('e => $e');
    }
  }

//On recupere l'ensemble des images des differents continents
  Future getAllCountriesFlag() async {
    try {
      var response = await htpp.get('https://restcountries.eu/rest/v2/all');
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        List<String> countriesFlag = [];
        for (var country in jsonData) {
          countriesFlag.add(country['flag']);
        }
        return countriesFlag;
      } else {
        print('Wrooooooooonnnnnnggggggggggggg');
      }
    } catch (e) {
      print('e => $e');
    }
  }
}
