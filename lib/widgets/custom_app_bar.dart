import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSize{
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  right: 16
              ),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.playlist_add_check , color: Colors.white, size: 36,)),
            ),
            const Text("ToDayDo" , style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}