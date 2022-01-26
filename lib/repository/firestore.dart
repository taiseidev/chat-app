import 'package:chatapp/api/firestore/firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreRepository = Provider<FirestoreRepository>(
  (_) => FirestoreRepository(),
);

class FirestoreRepository {}
