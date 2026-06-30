import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/data/repositories/authentication/authentication_repositoary.dart';
import 'package:ecommerce_admin_panel/features/authentication/model/user_model.dart';
import 'package:ecommerce_admin_panel/utils/exceptions/api_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  static UserRepository get instance {
    // Auto-register if not found
    if (!Get.isRegistered<UserRepository>()) {
      Get.put(UserRepository());
    }
    return Get.find<UserRepository>();
  }

  final _db = FirebaseFirestore.instance;
  //function to save user data to firestore
  Future<void> createUser(UserModel user) async {
    try {
      final json = user.toJson();
      debugPrint("Writing to Firestore: $json"); // <-- add this
      debugPrint("Document ID: ${user.id}");
      await _db.collection('Users').doc(user.id).set(user.toJson());
      debugPrint("Firestore write successful");
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFirebaseAuthException('');
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchAdminDetails() async {
    try {
      final docSnapShot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid ?? '')
          .get();

      return UserModel.fromSnapshot(docSnapShot);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFirebaseAuthException('');
    } on PlatformException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. $e';
    }
  }
}
