import 'package:image_picker/image_picker.dart';

class PickImage {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> pickImageFromGalery() {
    final selectImge = picker.pickImage(source: ImageSource.gallery);
    return selectImge;
  }
}
