import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.search,
    CupertinoIcons.settings,
    CupertinoIcons.person,
    CupertinoIcons.bell,
    CupertinoIcons.mail,
    CupertinoIcons.phone,
    CupertinoIcons.music_note,
    CupertinoIcons.book,
    CupertinoIcons.battery_charging,
    CupertinoIcons.battery_empty,
    CupertinoIcons.battery_full,
  ];
  List<String> names = [
    "Home",
    "Search",
    "Settings",
    "Profile",
    "Notifications",
    "Messages",
    "Call",
    "Music",
    "Books",
    "Battery Charging",
    "Battery Empty",
    "Battery Full",
  ];
  bool isDrawerOpen = false;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (isDrawerOpen) {
                setState(() {
                  isDrawerOpen = !isDrawerOpen;
                });
              }
            },
            child: Container(
              color: Colors.white,
              child: Center(
                  child: iconData != null
                      ? Icon(
                          iconData,
                          size: 50,
                        )
                      : const Text('')),
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDrawerOpen = !isDrawerOpen;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: double.infinity,
                width: isDrawerOpen ? 180 : 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: icons.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isDrawerOpen) {
                                      iconData = icons[index];
                                    }

                                    isDrawerOpen = !isDrawerOpen;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 10),
                                    AnimatedRotation(
                                      turns: isDrawerOpen ? 0.1 : 0.0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Icon(
                                        icons[index],
                                        color: Colors.orange,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: AnimatedOpacity(
                                        opacity: isDrawerOpen ? 1.0 : 0.0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Text(
                                          names[index],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
