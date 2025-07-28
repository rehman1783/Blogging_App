// import 'dart:io';
// import 'package:blogging_app/app/app_colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   String? email;
//   String? imageUrl;
//   File? imageFile;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final snapshot =
//           await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//       final data = snapshot.data();
//       if (data != null) {
//         setState(() {
//           _nameController.text = data['name'] ?? '';
//           email = data['email'];
//           imageUrl = data.containsKey('imageUrl') ? data['imageUrl'] : null;
//         });
//       }
//     }
//   }

//   Future<void> _pickImage() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         imageFile = File(picked.path);
//       });
//     }
//   }

//   Future<String?> _uploadImage(File image) async {
//     final user = FirebaseAuth.instance.currentUser;
//     final ref = FirebaseStorage.instance
//         .ref()
//         .child('profile_images/${user!.uid}.jpg');
//     await ref.putFile(image);
//     return await ref.getDownloadURL();
//   }

//   Future<void> _saveChanges() async {
//     if (!_formKey.currentState!.validate()) return;

//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       String? uploadedImageUrl = imageUrl;

//       if (imageFile != null) {
//         uploadedImageUrl = await _uploadImage(imageFile!);
//       }

//       await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
//         'name': _nameController.text.trim(),
//         'imageUrl': uploadedImageUrl,
//       });

//       Navigator.pop(context); // Go back to profile screen
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Edit Profile"),
//         backgroundColor: AppColors.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: email == null
//             ? const Center(child: CircularProgressIndicator())
//             : Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: _pickImage,
//                         child: Stack(
//                           alignment: Alignment.bottomRight,
//                           children: [
//                             CircleAvatar(
//                               radius: 50,
//                               backgroundImage: imageFile != null
//                                   ? FileImage(imageFile!)
//                                   : (imageUrl != null
//                                       ? NetworkImage(imageUrl!)
//                                       : const AssetImage("assets/default_user.png"))
//                                           as ImageProvider,
//                             ),
//                             const CircleAvatar(
//                               radius: 15,
//                               backgroundColor: Colors.white,
//                               child: Icon(Icons.edit, size: 18),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: const InputDecoration(
//                           labelText: "Name",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (val) =>
//                             val!.isEmpty ? "Name is required" : null,
//                       ),
//                       const SizedBox(height: 24),
//                       ElevatedButton(
//                         onPressed: _saveChanges,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 32,
//                             vertical: 14,
//                           ),
//                         ),
//                         child: const Text("Save Changes",
//                             style: TextStyle(fontSize: 16)),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
