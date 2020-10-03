import 'package:countries_name/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> countriesName = [];
  List<String> countriesFlag = [];
  Network network = Network();
  @override
  void initState() {
    super.initState();
    setState(() {
      getNetwork();
    });
  }

  Future getNetwork() async {
    countriesName = await network.getAllCountriesName();
    countriesFlag = await network.getAllCountriesFlag();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Countries",
          style: TextStyle(color: Colors.brown),
        ),
      ),
      body: ListView.builder(
          itemCount: countriesName.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${countriesName[index]}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              subtitle: Hero(
                  tag: 'flag $index',
                  child: SvgPicture.network(
                    '${countriesFlag[index]}',
                    width: 30,
                    height: 120,
                    fit: BoxFit.fitWidth,
                  )),
            );
          }),
    );
  }
}
