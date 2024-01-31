import 'package:flutter/foundation.dart';

class myclasscontroller extends ChangeNotifier
{
      int amount=10000;

      credit(String text)
      {
            amount=amount+int.parse(text);
            notifyListeners();
      }

      debit(String text)
      {
        amount=amount-int.parse(text);
        notifyListeners();
      }
}