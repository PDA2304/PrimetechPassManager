import 'package:flutter/material.dart';
import 'package:passmanager/constant/colors.dart';
import 'package:passmanager/constant/url.dart';

class Data extends StatelessWidget {
  const Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, showData);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 15, bottom: 15),
              child: Row(
                children: const [
                  Text("Название", style: TextStyle(fontSize: 18)),
                  Expanded(flex: 2, child: SizedBox()),
                  Text("23.01.2022", style: TextStyle(fontSize: 16)),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 1, color: grey)
          ],
        ),
      ),
    );
  }
}
