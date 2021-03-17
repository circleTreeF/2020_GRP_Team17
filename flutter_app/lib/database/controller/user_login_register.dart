

// class UserLoginRegister{
//
//   void checkUser() {
//     print(_nameController.text);
//     print(_passwordController.text);
//     createPost1(new Post1(username:_nameController.text,password:_passwordController.text)).then((response) {
//       if (response.statusCode >= 200) {
//         var _content = response.body;
//
//         Map<String, dynamic> enter = json.decode(_content);
//         print('${enter['result']}');
//         if(enter['result']==true){
//           UserAccount().user_id=int.parse(_nameController.text);
//           print(UserAccount().user_id);
//           Navigator.of(context).push(
//               MaterialPageRoute(
//                   builder: (context)=>NavigationHomeScreen()
//               )
//           );
//         }
//         else {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) => PopUpPageForRegisterFail()
//           );
//         }
//
//       }
//       else
//         print(response.statusCode);
//     }
//     ).catchError((error){
//       print('error : $error');
//     });
//   }
//
// }