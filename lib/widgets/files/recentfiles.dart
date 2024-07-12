import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

class Recentfiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(right:13.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent File",
                style: textStyle(20, textColor, FontWeight.bold),
              )),
        ),
        const SizedBox(height: 7),
        Container(
          height: 115,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image(
                            height: 65,
                            width:60,
                            image: NetworkImage(
                                'https://www.thesun.co.uk/wp-content/uploads/2023/05/manchester-united-badge-232356065.jpg?w=620'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(height: 5,),
                    Text("Man U", style: textStyle( 13, textColor, FontWeight.w700),)
                  ],
                );
              }),
        )
      ],
    );
  }
}
