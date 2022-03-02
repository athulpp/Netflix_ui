import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Downloads'),
        actions: [
          Row(
            children: [
              Icon(Icons.search),
              Text('data'),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Smart Downloads'),
            trailing: Icon(Icons.note),
          ),
          ListTile(
            leading: Icon(Icons.double_arrow),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Downloads for You'),
                Wrap(
                  children: [
                    Icon(Icons.refresh_outlined),
                    Text('Updated Just now')
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 400,
            child: Center(
              child: Text('No Downloaded Files Here'),
            ),
          )
        ],
      ),
    );
  }
}
