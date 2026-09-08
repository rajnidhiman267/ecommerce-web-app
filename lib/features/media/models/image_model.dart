import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/utils/formatters/formatter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class ImageModel {
  String id;
  final String url;
  final String folder;
  final int? sizeBytes;
  String mediaCategory;
  final String filename;
  final String? fullPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? contentType;

  //Not mapped
  final DropzoneFileInterface? file;
  RxBool isSelected = false.obs;
  final Uint8List? localImageToDisplay;
  ImageModel({
    this.id = '',
    required this.url,
    required this.folder,
    this.sizeBytes,
    required this.filename,
    this.fullPath,
    this.createdAt,
    this.updatedAt,
    this.contentType,
    this.file,
    this.localImageToDisplay,
    this.mediaCategory = '',
  });

  static ImageModel empty() => ImageModel(url: '', folder: '', filename: '');

  String get createdAtFormatted => TFormatter.formatDate(createdAt);
  String get updatedAtFormatted => TFormatter.formatDate(updatedAt);

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'folder': folder,
      'sizeBytes': sizeBytes,
      'filename': filename,
      'fullPath': fullPath,
      'createdAt': createdAt,
      'contentType': contentType,
      'mediaCategory': mediaCategory,
    };
  }

  ///convert firestore json and Map on model
  factory ImageModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data();

      //map JSON record to model
      return ImageModel(
        id: document.id,
        url: data?['url'] ?? '',
        folder: data?['folder'] ?? '',
        filename: data?['filename'] ?? '',
        fullPath: data?['fullPath'] ?? '',
        sizeBytes: data?['sizedBytes'] ?? 0,
        createdAt: data!.containsKey('createdAt')
            ? data['createdAt']?.toDate()
            : null,
        updatedAt: data.containsKey('updatedAt')
            ? data['updatedAt']?.toDate()
            : null,
        contentType: data['contentType'] ?? '',
        mediaCategory: data['mediaCategory'],
      );
    } else {
      return ImageModel.empty();
    }
  }

  ///Map firebase storage data
  factory ImageModel.fromFirebaseMetadata(
    FullMetadata metadata,
    String folder,
    String filename,
    String downloadUrl,
  ) {
    return ImageModel(
      url: downloadUrl,
      folder: folder,
      filename: filename,
      sizeBytes: metadata.size,
      updatedAt: metadata.updated,
      fullPath: metadata.fullPath,
      createdAt: metadata.timeCreated,
      contentType: metadata.contentType,
    );
  }
}
