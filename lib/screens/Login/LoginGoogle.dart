import 'package:evently_app/core/design/app_images.dart';
import 'package:flutter/material.dart';


class Logingoogle extends StatelessWidget {
  
  const Logingoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(16),
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.google,width: 24,height: 24,),
                  SizedBox(width: 10),
                  Text(
                    "Login with Google",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                
                ],
              ),
            ),
          );
  }
}