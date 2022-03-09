import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/HomeScreen.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800,
              child: FutureBuilder<List<dynamic>>(
                  future: controller.GetCategories(),
                  builder: (context, item) {
                    if (item.hasData) {
                      List<dynamic> getCategories = item.data!;
                      print(item.data);
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemCount: getCategories.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Center(
                                  child: Text(getCategories[index]['name'])));
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
