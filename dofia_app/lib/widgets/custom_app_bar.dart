import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          // height: 60,
          // color: Colors.teal,
          // child: Text("Custom Title"),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          color:
              const Color.fromARGB(255, 139, 228, 255), // Light grey background
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  // Handle menu tap
                },
              ),
              const Text(
                'DofiaTheBook',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications,
                    color: Colors.black, size: 25),
                onPressed: () {
                  // Handle notification tap
                },
              ),
            ],
          ),
        ),
      ],
    ));
    //   return Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    //     color: const Color.fromARGB(255, 139, 228, 255), // Light grey background
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         IconButton(
    //           icon: const Icon(Icons.menu, color: Colors.black),
    //           onPressed: () {
    //             // Handle menu tap
    //           },
    //         ),
    //         const Text(
    //           'DofiaTheBook',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.w900,
    //             color: Colors.black,
    //           ),
    //         ),
    //         IconButton(
    //           icon:
    //               const Icon(Icons.notifications, color: Colors.black, size: 25),
    //           onPressed: () {
    //             // Handle notification tap
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
