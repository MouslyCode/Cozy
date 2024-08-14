import 'dart:convert';

import 'package:bwa_cozy/models/space_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future<List<SpaceModel>> getRecomendedSpaces() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces'));

    print(result.statusCode);
    print(result.body);

    // try {
    //   if (result.statusCode == 200) {
    //     List data = jsonDecode(result.body); //convert String ke Objek List
    //     List<SpaceModel> spaces =
    //         data.map((item) => SpaceModel.fromJson(item)).toList();
    //     return spaces;
    //   }
    // } catch (e) {
    //   print('exevception@@@@');
    //   print(e);
    // }

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body); //convert String ke Objek List
      List<SpaceModel> spaces =
          data.map((item) => SpaceModel.fromJson(item)).toList();
      return spaces;
    } else {
      return <SpaceModel>[];
    }
  }
}
