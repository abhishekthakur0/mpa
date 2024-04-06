import 'package:cloud_firestore/cloud_firestore.dart';

// Set up a Firestore instance & Configure Firestore settings to use offline persistence on web & mobile before returning the instance
class FirebaseFirestoreProvider {
  static FirebaseFirestore? _instance;

  static FirebaseFirestore get instance {
    if (_instance == null) {
      _instance = FirebaseFirestore.instance;
      _instance?.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
    }
    return _instance!;
  }
}
