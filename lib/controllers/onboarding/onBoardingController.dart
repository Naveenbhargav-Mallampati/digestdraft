import 'package:pocketbase/pocketbase.dart';

class OnBoardingApi {
  static Signup(PocketBase pb, Map<String, dynamic> data) async {
    final result = await pb.collection('users').create(body: data);
  }

  static Signin(PocketBase pb, Map<String, dynamic> data) async {
    final result = await pb
        .collection('users')
        .authWithPassword(data['email'], data['password']);
  }
}
