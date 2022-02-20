import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(
      () => ChatRepositoryFirebase(FirebaseFirestore.instance));
}
