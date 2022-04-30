import 'dart:convert';
import 'dart:developer';

import 'package:testing/models/address.model.dart';
import 'package:http/http.dart' as http;
import 'package:testing/models/candidate.model.dart';
import 'package:testing/models/email.model.dart';
import 'package:testing/models/experience.model.dart';
import 'package:testing/utils/api.routes.dart';

import '../models/blog.model.dart';

class ApiRepository {
  static Future<ResultAddressModel> address() async {
    var client = http.Client();
    try{
      http.Response result =
      await client.get(Uri.parse(ApiRoutes.main+"/address"));
      client.close();
      return ResultAddressModel.fromJson(json.decode(result.body));
    }catch(e){
      client.close();
      log(e.toString());
      return ResultAddressModel(status: false, message: "server busy, please wait");
    }
  }

  static Future<ResultBlogModel> blog() async {
    var client = http.Client();
    try{
      http.Response result =
      await client.get(Uri.parse(ApiRoutes.main+"/blogs"));
      client.close();
      return ResultBlogModel.fromJson(json.decode(result.body));
    }catch(e){
      client.close();

      return ResultBlogModel(status: false, message: "server busy, please wait");
    }
  }

  static Future<ResultCandidateModel> candidate() async {
    var client = http.Client();
    try{
      http.Response result =
      await client.get(Uri.parse(ApiRoutes.main+"/candidates"));
      client.close();
      return ResultCandidateModel.fromJson(json.decode(result.body));
    }catch(e){
      client.close();
      log(e.toString());
      return ResultCandidateModel(status: false, message: "server busy, please wait");
    }
  }

  static Future<ResultEmailModel> email() async {
    var client = http.Client();
    try{
      http.Response result =
      await client.get(Uri.parse(ApiRoutes.main+"/emails"));
      client.close();
      return ResultEmailModel.fromJson(json.decode(result.body));
    }catch(e){
      client.close();

      return ResultEmailModel(status: false, message: "server busy, please wait");
    }
  }

  static Future<ResultExperienceModel> experience() async {
    var client = http.Client();
    try{
      http.Response result =
      await client.get(Uri.parse(ApiRoutes.main+"/experiences"));
      client.close();
      return ResultExperienceModel.fromJson(json.decode(result.body));
    }catch(e){
      client.close();

      return ResultExperienceModel(status: false, message: "server busy, please wait");
    }
  }
}