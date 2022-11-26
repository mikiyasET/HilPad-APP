import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/SettingsController.dart';
import 'package:hilpad/helper/SettingsHelper.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

class ChangeBatch extends StatelessWidget {
  ChangeBatch({Key? key}) : super(key: key);
  // get arguments getx named route
  final SettingsController settingsController = Get.find<SettingsController>();

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
        future: BatchHelper(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return futureBuilderBase(context, snapshot, body: Builder(
            builder: (BuildContext context) {
              Batch batch = snapshot.data[0];
              var batchs = Batch.baseModelToType(snapshot.data[1]);
              Student student = snapshot.data[2];

              for (var i = 0; i < batchs.length; i++) {
                // check if the batch is already in the list
                if (options
                    .where((element) => element.title == batchs[i].code)
                    .isEmpty) {
                  options.add(S2Choice<String>(
                      value: batchs[i].id.toString(), title: batchs[i].code));
                }
              }

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    SmartSelect<String>.single(
                      title: 'Batch',
                      choiceItems: options,
                      onChange: (state) async {
                        final s = Student();
                        var res = await s.hilpadPatch(
                          data: {
                            "batch": state.value,
                          },
                          id: student.id ?? 0,
                        );
                        if (res.statusCode == 200) {
                          settingsController.setBatch(state.title);
                          settingsController.changeText();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                              content: Text("Batch changed successfully"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text("Batch not changed, try again"),
                            ),
                          );
                        }
                      },
                      selectedValue: batch.id.toString(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmartSelect<String>.single(
                      title: 'Section',
                      choiceItems: sectionOptions,
                      onChange: (state) async {
                        final s = Student();
                        var res = await s.hilpadPatch(
                          data: {
                            "section": state.value,
                          },
                          id: student.id ?? 0,
                        );
                        if (res.statusCode == 200) {
                          settingsController.setSection(state.value);
                          settingsController.changeText();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                              content: Text("Section changed successfully"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text("Section not changed, try again"),
                            ),
                          );
                        }
                      },
                      selectedValue: student.section ?? 'a',
                    ),
                  ],
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
