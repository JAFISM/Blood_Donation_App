import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  String? selectedGroup;

  CollectionReference<Map<String, dynamic>> collectionRef =
      FirebaseFirestore.instance.collection('Donor');

  void deleteDonor(docId) {
    collectionRef.doc(docId).delete();
  }

  Future<void> searchDonorsByGroup(String bloodGroup) async {
    setState(() {
      selectedGroup = bloodGroup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Life Share",
          style: TextStyle(color: Colors.red),
        ),
        bottom: AppBar(
          leading: Container(),
          actions: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red.withOpacity(0.1)),
                child: DropdownButtonFormField(
                  hint: const Text("Search Blood Group"),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10)),
                  padding: const EdgeInsets.all(5),
                  isExpanded: false,
                  focusColor: Colors.white,
                  icon: const Icon(
                    Icons.bloodtype,
                    color: Colors.red,
                  ),
                  items: bloodGroups
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    searchDonorsByGroup(val.toString());
                  },
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Member",
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pushNamed(context, "add");
        },
        child: const Icon(
          Icons.person_add_alt_1_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: collectionRef.orderBy('group').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                snapshot.data!.docs;

            if (selectedGroup != null) {
              docs =
                  docs.where((doc) => doc['group'] == selectedGroup).toList();
            }

            return Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot<Map<String, dynamic>> donorSnap =
                      docs[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: ListTile(
                      tileColor: Colors.redAccent.withOpacity(0.05),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          donorSnap['group'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      title: Text(
                        donorSnap['name'],
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(donorSnap['phone'].toString()),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'update',
                                    arguments: {
                                      'name': donorSnap['name'],
                                      'phone': donorSnap['phone'].toString(),
                                      'group': donorSnap['group'],
                                      'id': donorSnap.id
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                deleteDonor(donorSnap.id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: LinearProgressIndicator(
              minHeight: 30,
            ),
          ));
        },
      ),
    );
  }
}
