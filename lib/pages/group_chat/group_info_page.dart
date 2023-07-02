// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GroupInfoPage extends StatefulWidget {
  final String groupId, groupName;
  const GroupInfoPage({
    Key? key,
    required this.groupName,
    required this.groupId,
  }) : super(key: key);

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  //  List membersList = [];
  // bool isLoading = true;

  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // FirebaseAuth _auth = FirebaseAuth.instance;

  // @override
  // void initState() {
  //   super.initState();

  //   getGroupDetails();
  // }

  // Future getGroupDetails() async {
  //   await _firestore
  //       .collection('groups')
  //       .doc(widget.groupId)
  //       .get()
  //       .then((chatMap) {
  //     membersList = chatMap['members'];
  //     print(membersList);
  //     isLoading = false;
  //     setState(() {});
  //   });
  // }

  // bool checkAdmin() {
  //   bool isAdmin = false;

  //   membersList.forEach((element) {
  //     if (element['uid'] == _auth.currentUser!.uid) {
  //       isAdmin = element['isAdmin'];
  //     }
  //   });
  //   return isAdmin;
  // }

  // Future removeMembers(int index) async {
  //   String uid = membersList[index]['uid'];

  //   setState(() {
  //     isLoading = true;
  //     membersList.removeAt(index);
  //   });

  //   await _firestore.collection('groups').doc(widget.groupId).update({
  //     "members": membersList,
  //   }).then((value) async {
  //     await _firestore
  //         .collection('users')
  //         .doc(uid)
  //         .collection('groups')
  //         .doc(widget.groupId)
  //         .delete();

  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  // void showDialogBox(int index) {
  //   if (checkAdmin()) {
  //     if (_auth.currentUser!.uid != membersList[index]['uid']) {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               content: ListTile(
  //                 onTap: () => removeMembers(index),
  //                 title: Text("Remove This Member"),
  //               ),
  //             );
  //           });
  //     }
  //   }
  // }

  // Future onLeaveGroup() async {
  //   if (!checkAdmin()) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     for (int i = 0; i < membersList.length; i++) {
  //       if (membersList[i]['uid'] == _auth.currentUser!.uid) {
  //         membersList.removeAt(i);
  //       }
  //     }

  //     await _firestore.collection('groups').doc(widget.groupId).update({
  //       "members": membersList,
  //     });

  //     await _firestore
  //         .collection('users')
  //         .doc(_auth.currentUser!.uid)
  //         .collection('groups')
  //         .doc(widget.groupId)
  //         .delete();

  //     Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (_) => HomeScreen()),
  //       (route) => false,
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: BackButton(),
            ),
            Container(
              height: size.height / 8,
              width: size.width / 1.1,
              child: Row(
                children: [
                  Container(
                    height: size.height / 11,
                    width: size.height / 11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                      size: size.width / 10,
                    ),
                  ),
                  SizedBox(
                    width: size.width / 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        widget.groupName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: size.width / 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //

            SizedBox(
              height: size.height / 20,
            ),

            Container(
              width: size.width / 1.1,
              child: Text(
                "1 Members",
                style: TextStyle(
                  fontSize: size.width / 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(
              height: size.height / 20,
            ),

            ListTile(
              onTap: () {},
              // onTap: () => Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => AddMembersINGroup(
              //       groupChatId: widget.groupId,
              //       name: widget.groupName,
              //       membersList: membersList,
              //     ),
              //   ),
              // ),
              leading: const Icon(
                Icons.add,
              ),
              title: Text(
                "Add Members",
                style: TextStyle(
                  fontSize: size.width / 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                // itemCount: membersList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    // onTap: () => showDialogBox(index),
                    onTap: () {},
                    leading: const Icon(Icons.account_circle),
                    title: Text(
                      'name',
                      // membersList[index]['name'],
                      style: TextStyle(
                        fontSize: size.width / 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      'email',
                      // membersList[index]['email'],
                    ),
                    trailing: const Text("Admin"),
                    // Text(membersList[index]['isAdmin'] ? "Admin" : ""),
                  );
                },
              ),
            ),

            ListTile(
              onTap: () {},
              // onTap: onLeaveGroup,
              leading: const Icon(
                Icons.logout,
                color: Colors.redAccent,
              ),
              title: Text(
                "Leave Group",
                style: TextStyle(
                  fontSize: size.width / 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
