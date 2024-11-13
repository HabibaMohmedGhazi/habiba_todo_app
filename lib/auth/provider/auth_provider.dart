import 'package:flutter/widgets.dart';
import 'package:my_todo_app/ui/model/user_dm.dart';

import '../../ui/utilities/common/remote/firebase_services.dart';

class TheAuthProvider with ChangeNotifier {
  bool loading =false;
  TheUserDM? userDataModel;
  signUp(TheUserDM userDataModel, String password)async {
    loading = true;
    notifyListeners();
    try {
      userDataModel = await
     FirebaseServices.signUp(
        userDataModel,
          password);
      notifyListeners();
      loading = false;
      notifyListeners();
    } catch (e) {
      print('error happened');
      loading = false;
      notifyListeners();
    }
  }

 Future login(String email, String password) async {
   loading = true;
   notifyListeners();
    try {
      userDataModel = await FirebaseServices.login(email, password);
      notifyListeners();
      loading = false;
      notifyListeners();
    } catch (e) {
      print('error happened');
      loading = false;
      notifyListeners();
    }
  }
}
