import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {

// AuthController _authController= Get.put(AuthController());

  // Controllers for email and password fields
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children:  [  
          Padding(
            padding:EdgeInsets.only(top:MediaQuery.of(context).viewInsets.top+48) ,
            child: const Image(
                height: 300,
                width: 300,
                image: AssetImage("assets/drivee.jpg"),
              ),
            
          ),
             Container( 
              margin: const EdgeInsets.only(top: 10,right:15,bottom:35,left:20 ),
              width: MediaQuery.of(context).size.width,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    Text("File Smarter,", style: GoogleFonts.aBeeZee(fontSize: 24),),
     Text("Not Harder",style: GoogleFonts.aBeeZee(fontSize: 24)),
     const SizedBox(height: 18),
      Text("Keep Your Files",style: GoogleFonts.aBeeZee(fontSize:18, color: const Color.fromARGB(221, 98, 89, 89))),
      Text("Organized More Easily",
      
      style: GoogleFonts.aBeeZee(fontSize:18, color: const Color.fromARGB(221, 98, 89, 89))),
            const SizedBox(height: 29),
    
    
      InkWell(
    onTap: ()=> Get.find<AuthController>().login(),
    child: Container(
      width: MediaQuery.of(context).size.width /1.7,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 248, 4, 4)),
      child: Center(child: Text("Get Started", style: GoogleFonts.aBeeZee(fontSize: 17) ,)),
    
    ),
      )
            
            
            ],),   
        )]     
    
        ),
      ),
    );
  }
}
