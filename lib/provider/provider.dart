import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/firestore_repository.dart';

final firestoreRepository = Provider<FirestoreRepository>(
  (_) => FirestoreRepository(),
);
