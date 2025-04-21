import 'package:flutter/material.dart';
import 'package:superhero_app/data/models/superhero_detail_response.dart';

class SuperheroDetailScreen extends StatelessWidget {
  final SuperheroDetailResponse superhero;

  const SuperheroDetailScreen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Superhero ${superhero.name}')),
      body: Column(
        children: [
          Image.network(
            superhero.url,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
          ),
          Text(superhero.name, style: TextStyle(fontSize: 28)),
          Text(
            superhero.realName,
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          Text(
            superhero.powerStats.combat,
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            width: double.infinity,
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: double.parse(superhero.powerStats.power),
                      width: 20,
                      color: Colors.red,
                    ),
                    Text('Power'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: double.parse(superhero.powerStats.intelligence),
                      width: 20,
                      color: Colors.blue,
                    ),
                    Text('Intelligence'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: double.parse(superhero.powerStats.strength),
                      width: 20,
                      color: Colors.grey,
                    ),
                    Text('Strength'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: double.parse(superhero.powerStats.speed),
                      width: 20,
                      color: Colors.green,
                    ),
                    Text('Speed'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: double.parse(superhero.powerStats.durability),
                      width: 20,
                      color: Colors.deepOrange,
                    ),
                    Text('Durability'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: double.parse(superhero.powerStats.combat),
                      width: 20,
                      color: Colors.black,
                    ),
                    Text('Combat'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
