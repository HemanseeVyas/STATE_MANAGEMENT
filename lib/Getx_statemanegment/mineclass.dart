import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class myclasss extends GetxController
{
  RxList l=List.filled(9, "").obs;
  RxInt cnt=0.obs;
  bool is_win=false;
  RxString msg="".obs;

  get(int i)
  {

     if(!is_win)
       {
         if(l[i]=="")
         {
           if(cnt.value%2==0)
           {
             l[i]='x';
           }
           else
           {
             l[i]='0';
           }
           win();
           cnt.value++;
         }
       }
  }

  win()
  {
    if(l[0]=='x' && l[1]=='x' && l[2]=='x' || l[3]=='x' && l[4]=='x' &&
        l[5]=='x' || l[6]=='x' && l[7]=='x' && l[8]=='x' || l[0]=='x' &&
        l[4]=='x' && l[8]=='x' || l[2]=='x' && l[4]=='x' && l[6]=='x' ||
        l[0]=='x' && l[3]=='x' && l[6]=='x' || l[1]=='x' && l[4]=='x' &&
        l[7]=='x' || l[2]=='x' && l[5]=='x' && l[8]=='x')
      {
        msg.value="X is Win";
        is_win=true;
      }
    else if(l[0]=='0' && l[1]=='0' && l[2]=='0' || l[3]=='0' && l[4]=='0' &&
        l[5]=='0' || l[6]=='0' && l[7]=='0' && l[8]=='0' || l[0]=='0' &&
        l[4]=='0' && l[8]=='0' || l[2]=='0' && l[4]=='0' && l[6]=='0' ||
        l[0]=='0' && l[3]=='0' && l[6]=='0' || l[1]=='0' && l[4]=='0' &&
        l[7]=='0' || l[2]=='0' && l[5]=='0' && l[8]=='0')
      {
        msg.value="0 is Win";
        is_win=true;
      }
  }
  reset()
  {
        for(int i=0; i<l.length; i++)
          {
            l[i]="";
             msg.value="";
             is_win=false;
          }
  }
}