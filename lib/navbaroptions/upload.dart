import 'package:beautyfinder/models/user.dart';
import 'package:beautyfinder/providers/user_provider.dart';
import 'package:beautyfinder/resources/firestore_methods.dart';
import 'package:beautyfinder/util/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(
    String uid,
    String username
  ) async {
    try {
      String result = await FireStoreMethods().uploadPost(
        _descriptionController.text,
         _file!, 
         uid, 
         username
         );
         if(result == 'success') {
          showSnackBar('Posted!', context);
         } else {
          showSnackBar(result, context);
         }

    }catch(e) {
      showSnackBar(e.toString(), context);

    }
    
  }

/* 
  void postImage(
    String uid,
    String username,
    //String profImage,
  ) async {
    try {
      String result = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
      );
      if (result == "success") {
        showSnackBar('Posted', context);
      } else {
        showSnackBar(result, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  */

 _selectImage(BuildContext context) async {

    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Upload'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //below causes error
    //final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Center(
            child: IconButton(
            icon: Icon(Icons.upload),
            onPressed: () => _selectImage(context),
          ))
        : 
        
        Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              title: const Text('Post to'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/564x/1c/43/4d/1c434d1640f9572e2ac7be5c6bac9348.jpg'),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText:
                              'Name the product. Then write what you liked or disliked about it...',
                          border: InputBorder.none,
                        ),
                        maxLines: 10,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487/451,
                        child: Container(
                          decoration: BoxDecoration(
                            image:DecorationImage(
                              image: MemoryImage(_file!),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                )
              ],
            )
            );
  }
}