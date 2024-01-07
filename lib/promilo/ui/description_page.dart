import 'package:api_task/constants.dart';
import 'package:api_task/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final List<String> des = [
    Assets.des01,
    Assets.des02,
    Assets.des03,
    Assets.des04,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Description Page',
          style: titleBold,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        height: 400,
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          children: des
                              .map(
                                (imgUrl) => ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    imgUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [0, 1, 2, 3]
                              .map(
                                (index) => Container(
                                  margin: const EdgeInsets.all(4),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: index == currentIndex
                                        ? Colors.blueGrey.shade800
                                        : Colors.blueGrey.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.download,
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.save,
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.heart_broken,
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.fullscreen,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.star_border_outlined,
                          color: Colors.black,
                        ),
                        InkWell(
                          onTap: () async {
                            await Share.share(
                                'check out my website https://example.com');
                          },
                          child: const Icon(Icons.share),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.save),
                      Text('1034'),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.heart_broken),
                      Text('1034'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.blue.shade600,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue.shade600,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue.shade600,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue.shade300,
                      ),
                      const Icon(
                        Icons.star_border_outlined,
                      ),
                    ],
                  ),
                  const Text('3.2'),
                ],
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Actor Name',
                    style: subtitleBold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Indian Actress'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.lock_clock),
                      Text('Duration 20 mins'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.book),
                      Text('Total Average Fees Rs. 9,999'),
                    ],
                  ),
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: subtitleBold,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    paragraph,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
