import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
//get in fluuter -g.s
class myclass extends GetxController
{
  int s1=0,s2=0;

  RxInt sum=0.obs; // obs a rx in extention

    fun_sum(String a,String b)
    {
      s1=int.parse(a);
      s2=int.parse(b);

      sum.value=s1+s2;
    }
}