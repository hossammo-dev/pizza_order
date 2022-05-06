import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categoriesList = const [
    'All Food',
    'Pizza',
    'Pasta',
    'Drinks',
    'Other',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(EvaIcons.menu2Outline, color: Colors.black),
                    Row(
                      children: const [
                        Icon(EvaIcons.navigation2Outline, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          'Egypt, Damietta, New Damietta',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Icon(EvaIcons.search, color: Colors.black),
                  ],
                ),
                const SizedBox(height: 40),

                //BODY: HEADER
                const Text(
                  'What would you like',
                  style: TextStyle(fontSize: 30),
                ),
                const Text(
                  'to eat?',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                //BODY: MIDDLE
                SizedBox(
                  height: 46,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => _changeCurrentIndex(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: (_currentIndex == index)
                              ? const Color(0xFFFFC56B)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: (_currentIndex == index)
                                  ? const Color(0xFFFFEECB)
                                  : Colors.white10,
                              blurRadius: 15,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                          _categoriesList[index],
                          style: const TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: const TextSpan(
                    text: 'Favorite',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '  dishes',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.39,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.39,
                      // width: MediaQuery.of(context).size.width * 0.6,
                      child: Card(
                        color: Colors.white,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: const Color(0XFFF6F6F6),
                        elevation: 6.5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                        'https://images.phi.content-cdn.io/cdn-cgi/image/height=170,width=180,quality=50/https://martjackamstorage.azureedge.net/am-resources/c3877a59-69f7-40fa-bb17-ae5b9ac37732/Images/ProductImages/Large/Margherita-p1.png'),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(EvaIcons.heartOutline)),
                                ],
                              ),
                              const Text(
                                'Pizza Name',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'EGP 105',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                //FOOTER
                const Text(
                  'Business lunch',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: const Color(0xFFFFEECB),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Dish Name',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'EGP 105',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.network(
                                'https://www.elmohamdy.com/uploads/meals/IMG_345621645508611.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          EvaIcons.shoppingBagOutline,
          color: Colors.black,
        ),
        backgroundColor: const Color(0XFFFFC56A),
      ),
    );
  }

  void _changeCurrentIndex(int index) => setState(() {
        _currentIndex = index;
      });
}
