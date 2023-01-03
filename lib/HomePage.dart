import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AbsorbPointer(
        absorbing: false,
        child: GestureDetector(
            onTap: () {
              showToast('你好啊');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('点击文案'),
                RawChip(
                  label: Text('刘彪'),
                  onDeleted: (){
                    debugPrint('删除');
                  },
                  avatar: CircleAvatar(
                    child: Text('刘'),
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                  child: FractionallySizedBox(
                    widthFactor: .8,
                    heightFactor: .3,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
