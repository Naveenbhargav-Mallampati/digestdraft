import 'package:pocketbase/pocketbase.dart';

class ProfileApi {
  static getProfile(PocketBase pb, String id) async {
    final result = await pb.collection('user').getOne(id);
  }

  static GetSaved(PocketBase pb, String id) async {
    //final result = await p
  }
}
