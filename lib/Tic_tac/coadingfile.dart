import 'package:get/get.dart';

class tic_logic extends GetxController
{

      RxList l=List.filled(9,"").obs;
      RxList m=List.filled(9,false).obs;

      RxBool is_win=false.obs;
      RxString msg="".obs;
      RxInt t=0.obs;
      int s=0;
      get(String a) {
            s=int.parse(a);
            if (t.value % 2 == 0) {
                  l[s] = "X";
            } else if (t.value % 2 == 1) {
                  l[s] = "O";
            }
            m[s]=true;
            t.value++;
            win();
      }
      win(){
            if(l[0]=="X" && l[1]=="X" && l[2]=="X" || l[3]=="X" && l[4]=="X" && l[5]=="X" || l[6]=="X" && l[7]=="X" && l[8]=="X" || l[0]=="X" && l[3]=="X" && l[6]=="X" || l[1]=="X" && l[4]=="X" && l[7]=="X" || l[2]=="X" && l[5]=="X" && l[8]=="X" || l[0]=="X" && l[4]=="X" && l[8]=="X" || l[2]=="X" && l[4]=="X" && l[6]=="X"){
                  msg.value="player X is win";
                  is_win.value=true;
            }else if(l[0]=="O" && l[1]=="O" && l[2]=="O" || l[3]=="O" && l[4]=="O" && l[5]=="O" || l[6]=="O" && l[7]=="O" && l[8]=="O" || l[0]=="O" && l[3]=="O" && l[6]=="O" || l[1]=="O" && l[4]=="O" && l[7]=="O" || l[2]=="O" && l[5]=="O" && l[8]=="O" || l[0]=="O" && l[4]=="O" && l[8]=="O" || l[2]=="O" && l[4]=="O" && l[6]=="O"){
                  msg.value="player O is win";
                  is_win.value=true;
            }else if(l[0]!="" && l[1]!="" && l[2]!="" && l[3]!="" && l[4]!="" && l[5]!="" && l[6]!="" && l[7]!="" && l[8]!=""){
                  msg.value="match drop";
            }
      }
}