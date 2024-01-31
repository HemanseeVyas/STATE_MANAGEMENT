import 'dart:math';

import 'package:flutter/cupertino.dart';

class controller extends ChangeNotifier
{

    String msg="";
    List l=[1,2,3,4,5,6,"",7,8];
    bool winner=false;

        first()
        {
            if(l[1]=="")
            {
                l[1]=l[0];
                l[0]="";
            }
            else if(l[3]=="")
            {
                l[3]=l[0];
                l[0]="";
            }
            notifyListeners();
        }

        second()
        {
            if(l[0]=="")
            {
                l[0]=l[1];
                l[1]="";
            }
            else if(l[4]=="")
            {
                l[4]=l[1];
                l[1]="";
            }
            else if(l[2]=="")
            {
                l[2]=l[1];
                l[1]="";
            }
            notifyListeners();
        }

        third()
        {
            if(l[1]=="")
            {
                l[1]=l[2];
                l[2]="";
            }
            else if(l[5]=="")
            {
                l[5]=l[2];
                l[2]="";
            }
            notifyListeners();
        }

        four()
        {
            if(l[0]=="")
            {
                l[0]=l[3];
                l[3]="";
            }
            else if(l[4]=="")
            {
                l[4]=l[3];
                l[3]="";
            }
            else if(l[6]=="")
            {
                l[6]=l[3];
                l[3]="";
            }
            notifyListeners();
        }

        five()
        {
            if(l[1]=="")
            {
                l[1]=l[4];
                l[4]="";
            }
            else if(l[3]=="")
            {
                l[3]=l[4];
                l[4]="";
            }
            else if(l[7]=="")
            {
                l[7]=l[4];
                l[4]="";
            }else if(l[5]=="")
            {
                l[5]=l[4];
                l[4]="";
            }
            notifyListeners();
        }

        six()
        {
            if(l[2]=="")
            {
                l[2]=l[5];
                l[5]="";
            }
            else if(l[4]=="")
            {
                l[4]=l[5];
                l[5]="";
            }
            else if(l[8]=="")
            {
                l[8]=l[5];
                l[5]="";
            }
            notifyListeners();
        }

        seven()
        {
            if(l[3]=="")
            {
                l[3]=l[6];
                l[6]="";
            }
            else if(l[7]=="")
            {
                l[7]=l[6];
                l[6]="";
            }
            notifyListeners();
        }

        eight()
        {
            if(l[6]=="")
            {
                l[6]=l[7];
                l[7]="";
            }
            else if(l[4]=="")
            {
                l[4]=l[7];
                l[7]="";
            }
            else if(l[8]=="")
            {
                l[8]=l[7];
                l[7]="";
            }
            notifyListeners();
        }

        nine()
        {
            if(l[5]=="")
            {
                l[5]=l[8];
                l[8]="";
            }
            else if(l[7]=="")
            {
                l[7]=l[8];
                l[8]="";
            }
            notifyListeners();
        }

        win()
        {
            if(l[0]==1 && l[1]==2 && l[2]==3 && l[3]==4 && l[4]==5 && l[5]==6 && l[6]==7 && l[7]==8 && l[8]=="")
            {
                msg="you are win....!";
                winner=true;
            }
        }
}