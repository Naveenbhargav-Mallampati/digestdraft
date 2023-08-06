import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final clientprovider = Provider((ref) {
  final client = PocketBase('https://digestdraft.pockethost.io');
  return client;
});
