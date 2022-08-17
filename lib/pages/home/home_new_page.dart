import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project3y21/data/data.dart';
import 'package:project3y21/domain/model/devices_model.dart';
import 'package:project3y21/gen/gen.dart';
import 'package:project3y21/pages/home/home.dart';
import 'package:project3y21/utils/utils.dart';

class HomeNewPage extends StatefulWidget {
  static const path = "HomeNewPage";
  const HomeNewPage({Key? key}) : super(key: key);

  @override
  State<HomeNewPage> createState() => _HomeNewPageState();
}

class _HomeNewPageState extends State<HomeNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách các thiết bị',
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: FutureBuilder<List<DevicesModel>>(
            future: BaseRepositoryImpl().getListDevices(),
            builder: (context, snap) {
              if (!snap.hasData) {
                if (snap.hasError) {
                  return Center(
                    child: Text(snap.error.toString()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              log("ListDeviceLog ${(snap.error)}");
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HomeV1Page.path)
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 128,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorConstants.primaryColor),
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: AssetImage(
                                        Assets.images.eSP32New.path))),
                          ),
                          kSpacingHeight4,
                          Text(
                              '${snap.data![index].nameDevice} (${snap.data![index].macAddress})')
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kSpacingHeight12;
                  },
                  itemCount: snap.data!.length);
            },
          ),
        ),
      ),
    );
  }
}
