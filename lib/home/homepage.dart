import 'package:flutter/material.dart';
import 'package:news/home/controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      controller.newsshow();
    }));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 218, 214, 214),
        title: const Text(
          "News",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<HomeController>(
        builder: (context, value, _) {
          return controller.isloading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.news.length,
                  itemBuilder: ((context, index) {
                    final date = controller.news[index].publishedAt
                        .toString()
                        .split(".")
                        .first;
                    return InkWell(
                      splashColor: Colors.greenAccent,
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              controller.news[index].title.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.network(controller.news[index].urlToImage!),
                            Text(
                              controller.news[index].author.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
        },
      ),
    );
  }
}
