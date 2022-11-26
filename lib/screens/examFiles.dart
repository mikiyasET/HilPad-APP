import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../components/search_bar.dart';

class ExamFilesPage extends StatelessWidget {
  ExamFilesPage({Key? key}) : super(key: key);

  var _values = SfRangeValues(2010, 2022).obs;
  List<dynamic> _list = ["Mid", "Final", "Quiz"].obs;
  List<dynamic> _list2 = ["AUT", "WIN", "SPR"].obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*FutureBuilder(
            future: getList(Course()),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }

              //print(snapshot.data);
              if(snapshot.data != null){
                List<Course> data = snapshot.data as List<Course>;
                return Column(
                  children: data.map((e) =>
                      ListTile(
                        leading: Icon(Icons.folder),
                        trailing: Icon(Icons.more_horiz),
                        title: Text("${e.name} ${e.code}"),
                      )).toList(),
                );
              }else{
                return const Text("NO Data To Display");
              }
            },
          ),*/
          Row(
            children: [
              Expanded(
                child: SearchBar(),
                flex: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50.0),
                            ),
                          ),
                          context: context,
                          builder: (context) => Container(
                            height: MediaQuery.of(context).size.height / 2,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Obx(
                              () => SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text("Filters",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Exam Year",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SfRangeSlider(
                                      numberFormat: NumberFormat(""),
                                      min: 2010,
                                      max: 2022,
                                      values: _values.value,
                                      interval: 4,
                                      // showTicks: true,
                                      enableTooltip: true,
                                      minorTicksPerInterval: 1,
                                      onChanged: (SfRangeValues values) {
                                        _values.value = values;
                                      },
                                      activeColor: Colors.red,
                                      inactiveColor: Colors.red.shade200,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Exam Type",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    MultiSelectChipField(
                                      items: _list
                                          .map((e) => MultiSelectItem(e, e))
                                          .toList(),
                                      title: const Text("Exam Type"),
                                      showHeader: false,
                                      chipColor: Colors.black12,
                                      headerColor: Colors.black,
                                      decoration: BoxDecoration(
                                        // no border
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      chipShape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 5,
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Exam Session",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    MultiSelectChipField(
                                      items: _list2
                                          .map((e) => MultiSelectItem(e, e))
                                          .toList(),
                                      title: const Text("Exam Type"),
                                      showHeader: false,
                                      chipColor: Colors.black12,
                                      headerColor: Colors.black,
                                      decoration: BoxDecoration(
                                        // no border
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      chipShape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 5,
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const FaIcon(FontAwesomeIcons.sliders)),
                ),
                flex: 0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
