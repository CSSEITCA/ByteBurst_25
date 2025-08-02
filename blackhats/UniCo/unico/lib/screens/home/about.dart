import 'package:flutter/material.dart';

class FoundersPage extends StatelessWidget {
  const FoundersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Founders')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                Container(
                   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: 170,
                  width: 170,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/akash.jpg' ),
                  ),
                ),
                SizedBox(height: 8),
                Text('Akash Sikarwar',style: TextStyle(fontSize: 20),),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                Container(
                   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: 170,
                  width: 170,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/adhrav.jpg'),
                  ),
                ),
                SizedBox(height: 8),
                Text('Adhrav Rai',style: TextStyle(fontSize: 20),),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                   height: 170,
                  width: 170,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/priyansh.jpg'),
                  ),
                ),
                SizedBox(height: 8),
                Text('Priyansh Dua',style: TextStyle(fontSize: 20),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
