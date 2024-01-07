import 'package:api_task/constants.dart';
import 'package:api_task/core/assets.dart';
import 'package:api_task/promilo/ui/description_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeetUpPage extends StatefulWidget {
  const MeetUpPage({super.key});

  @override
  State<MeetUpPage> createState() => _MeetUpPageState();
}

class _MeetUpPageState extends State<MeetUpPage> {
  final List<String> meetupsList = [
    Assets.meet01,
    Assets.meet02,
    Assets.meet03,
  ];
  final List<String> top = [
    Assets.top01,
    Assets.top02,
    Assets.top03,
    Assets.top04,
    Assets.top05,
  ];
  int meetupIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Individual Meetup',
            style: titleBold,
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: PageView(
                            onPageChanged: (index) {
                              setState(() {
                                meetupIndex = index;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                            children: meetupsList
                                .map((imgUrl) => ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        imgUrl,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.darken,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const Positioned(
                          left: 30,
                          bottom: 20,
                          child: Text(
                            'Popular Meetups in India',
                            style: titleBoldWhite,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [0, 1, 2]
                          .map(
                            (index) => Container(
                              margin: const EdgeInsets.all(4),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == meetupIndex
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade300,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Trending Popular People',
                  style: subtitleBold,
                ),
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PopularPeopleWidget(),
                    PopularPeopleWidget(),
                    PopularPeopleWidget(),
                    PopularPeopleWidget(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Top Trending Meetups',
                  style: subtitleBold,
                ),
              ),
              SizedBox(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: top
                      .map(
                        (imgUrl) => TopMeetupsWidget(
                          imgUrl: imgUrl,
                          index: top.indexOf(imgUrl) + 1,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopMeetupsWidget extends StatelessWidget {
  const TopMeetupsWidget({
    super.key,
    required this.imgUrl,
    required this.index,
  });
  final String imgUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const DescriptionPage(),
          ),
        );
      },
      child: SizedBox(
        child: Card(
          elevation: 3,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imgUrl),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                  '0$index',
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularPeopleWidget extends StatelessWidget {
  const PopularPeopleWidget({
    super.key,
    this.fillWidth = false,
  });
  final bool fillWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: fillWidth
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 1.2,
      child: Card(
        elevation: 3,
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              children: [
                ProfilePicWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author',
                      style: titleBold,
                    ),
                    Text(
                      '1,028 Meetups',
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 50),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('See More'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue.shade900,
          width: 2,
          style: BorderStyle.solid,
        ),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person),
    );
  }
}
