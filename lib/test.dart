import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:musicplayer/Model/MusicDataResponse.dart';
import 'package:http/http.dart' as http;

class MusicDetailsWidget extends StatelessWidget {
  Future<List<User>> getUserData() async {
  var response = await http.get(Uri.https('api.deezer.com', 'playlists'));
  var jsonData = jsonDecode(response.body);

  if (jsonData.containsKey("data") && jsonData["data"] is List) {
    List<User> users = [];

    for (var playlistData in jsonData["data"]) {
      if (playlistData is Map<String, dynamic>) {
        String title = playlistData["title"];
        String link = playlistData["link"];
        
        // Créez un objet User avec les données extraites et ajoutez-le à la liste.
        User user = User(title, link);
        users.add(user);
      }
    }

    print(users.length);
    return users;
  } else {
    throw Exception("Les données JSON ne sont pas au format attendu.");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la musique'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  List<User> userData = await getUserData();
                  // Faites quelque chose avec userData, par exemple affichez-le dans une liste.
                } catch (e) {
                  // Gérez les erreurs ici, par exemple, affichez un message d'erreur.
                  print("Erreur lors de la récupération des données : $e");
                }
              },
              child: Text("Cliquez ici"),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String title, link;

  User(this.title, this.link);
}
