import 'package:flutter/material.dart';
import 'package:quiz/core/data/reposotories/post_repository.dart';
import 'package:quiz/main.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
   TextEditingController tilteController=TextEditingController();
   TextEditingController bodyController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: 
        ListView(
          children: [
              Center(
            // ignore: avoid_unnecessary_containers
            child: Container(padding: EdgeInsets.symmetric(vertical: 40),
              child: 
            Image.asset("images/social.png")
            ,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Add new post",
              style: TextStyle(fontSize: 35),
            ),
          ),
          20.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: tilteController,
              maxLines: 3,
          cursorHeight: 30,
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          20.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller:bodyController ,
                maxLines: 22,
              cursorHeight: 30,
                decoration: InputDecoration(
                  hintText: "Body",
                  // ignore: prefer_const_constructors
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
          ),
          100.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: (){
PostRepository().CreatePost(
title:tilteController.text,
body:bodyController.text,
userId: 1
);




              },
             // ignore: prefer_const_constructors, sort_child_properties_last
             child: Text("Save",style: TextStyle(fontSize: 25)),
               style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Color.fromRGBO(19, 180, 147, 1)
                ),
                
                backgroundColor: Color.fromRGBO(48, 64, 77, 1),
      fixedSize: Size(320,60)),
      
             ),
          )
          ],
        )
        ,
      ),
    );
  }
}