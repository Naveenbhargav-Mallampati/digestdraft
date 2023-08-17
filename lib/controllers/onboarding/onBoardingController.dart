import 'package:digestdraft/controllers/accountController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final signupprovider =
    FutureProviderFamily<String, Map<String, dynamic>>((ref, data) {
  final pb = ref.read(clientprovider);
  return OnBoardingApi.Signup(pb, data);
});

final loginrovider =
    FutureProviderFamily<String, Map<String, dynamic>>((ref, data) {
  final pb = ref.read(clientprovider);
  return OnBoardingApi.Signin(pb, data);
});

class OnBoardingApi {
  static Future<String> Signup(PocketBase pb, Map<String, dynamic> data) async {
    final result = await pb
        .collection('users')
        .create(body: data, headers: {'client': 'flutter'});
    return result.toString();
  }

  static Signin(PocketBase pb, Map<String, dynamic> data) async {
    final result = await pb.collection('users').authWithPassword(
        data['email'], data['password'],
        headers: {'client': 'flutter'});
    return result.token;
  }
}
