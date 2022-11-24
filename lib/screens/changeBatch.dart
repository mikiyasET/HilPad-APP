import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

class ChangeBatch extends StatelessWidget {
  ChangeBatch({Key? key}) : super(key: key);
  List<S2Choice<String>> options = [];
  List<S2Choice<String>> sectionOptions = [
    S2Choice<String>(value: 'a', title: 'A'),
    S2Choice<String>(value: 'b', title: 'B'),
    S2Choice<String>(value: 'c', title: 'C'),
    S2Choice<String>(value: 'd', title: 'D'),
    S2Choice<String>(value: 'e', title: 'E'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Batch"),
      ),
      body: FutureBuilder(
          future: runThis(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return futureBuilderBase(context, snapshot,
                body: Builder(builder: (BuildContext context) {
              var batch = Batch.baseModelToType(snapshot.data);
              for (var i = 0; i < batch.length; i++) {
                // check if the batch is already in the list
                if (options
                        .where((element) => element.title == batch[i].code)
                        .length ==
                    0) {
                  options.add(S2Choice<String>(
                      value: batch[i].id.toString(), title: batch[i].code));
                }
              }

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    SmartSelect<String>.single(
                      title: 'Batch',
                      choiceItems: options,
                      onChange: (state) {},
                      selectedValue: '',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmartSelect<String>.single(
                      title: 'Section',
                      choiceItems: sectionOptions,
                      onChange: (state) {},
                      selectedValue: '',
                    ),
                  ],
                ),
              );
            }));
          }),
    );
  }
}

runThis() async {
  var batchs = await getItemList(bm: Batch(), subPath: "/");
  print(batchs);
  return batchs;
}
