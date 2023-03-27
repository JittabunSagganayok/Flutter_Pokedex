import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/model.dart';

class PokePage extends StatefulWidget {
  const PokePage({super.key});

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  List<PokeModel> _pokedexlist = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchapi();
    super.initState();
    //print(pokedexlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Create By Pooh',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: _pokedexlist
                    .map(
                      (e) => InkWell(
                        onTap: () {},
                        child: Card(
                          //color: e.isActive ? Colors.deepPurple : null,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.lightBlue[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                e.img,
                                //width: 50,
                                // color: e.isActive
                                //     ? Colors.white
                                //     : Colors.deepPurple,
                              ),
                              SizedBox(height: 10),
                              Text(
                                e.name,
                                style: TextStyle(
                                    //
                                    color:
                                        // e.isActive
                                        //     ? Colors.white
                                        //     :
                                        Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
      //bottomNavigationBar: AppBottomBar(),
    );
  }

  Future<void> fetchapi() async {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    var response = await http.get(url);

    var pokeResponse = PokeResponse.fromJson(jsonDecode(response.body));
    setState(() {
      _pokedexlist = pokeResponse.pokemon;
    });
  }
}
