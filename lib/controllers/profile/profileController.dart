import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final SavedProvider = FutureProviderFamily((ref, arg) {
  return '';
});

class ProfileApi {
  static getProfile(PocketBase pb, String id) async {
    final result = await pb.collection('user').getOne(id);
  }

  static GetSaved(PocketBase pb, String id) async {
    //final result = await p
  }
}
