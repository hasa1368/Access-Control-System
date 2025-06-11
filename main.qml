import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import BppTable 0.1
import BppFa 1.0
import QtQuick.Dialogs
import "Person"
import "Management"
import "User"

Window {
  id:loginwind
  visible: true

     function getRandomInt(min, max) {
       min = Math.ceil(min);
       max = Math.floor(max);
       return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
     }
     function update_captcha() {
         var parameters = [];
        var sqlQuery;
         sqlQuery  =" Update login set  captcha_code='"+getRandomInt(1000, 9999)+"' where pnumber='"+forgetusernamein.text+"' "
        bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
     }
    function change_password_status() {
        var parameters = [];
       var sqlQuery;
        sqlQuery  =" Update login set  pass_change=Concat('Password Changed at ' ,'"+ Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")+"')      where pnumber='"+currusernameinput.text+"' "
       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
    }
    function change_password_status2() {
        var parameters = [];
       var sqlQuery;
        sqlQuery  =" Update login set  pass_change=Concat('Password Changed at ' ,'"+ Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")+"')       where pnumber='"+currusernameinput2.text+"' "
       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
    }
    title: qsTr("Login")
     property date currentDate: new Date()
      width: Screen.width
      height:  Screen.width

  Image {
         id: img1
         source:"img/jeremy-bishop-8xznAGy4HcY-unsplash.jpg"
         anchors.fill: parent
         opacity:1

     }
  Window {
      id:confirmpasswind
      width: 500
      height: 350
      visible: false
      title: "Confirm Passsword Page"
      color:"#00BCD4"
      flags:Qt.MSWindowsFixedSizeDialogHint

      TextField {
          id:currusernameinput
          x:150
          y:10
          focus: true
          width: 200
          placeholderText: "Username"
          color:"black"
      }
      TextField {
          id:currpassinput
          x:150
          y:60
          focus: true
          width: 200
          placeholderText: "Current Password"
          color:"black"
           echoMode: TextInput.Password

      }

      TextField {
          id:newpassinput
          x:150
          y:110
          focus: true
          width: 200
          placeholderText: "New Password"
          color:"black"
           echoMode: TextInput.Password
      }
      TextField {
          id:confnewpassinput
          x:150
          y:160
          focus: true
          width: 200
          placeholderText: "Confirm New Password"
          color:"black"
           echoMode: TextInput.Password
      }
        Label{
          id:confirmlabel
          x:170
          y:280
        }
        Button {
        text: "Confirm"
        x:240
        y:230
        onClicked: {
        if (  newpassinput.text===confnewpassinput.text )
             {
                if(newpassinput.text!==''|| confnewpassinput.text!=='')
                {
                    if(newpassinput.text.length>3 && confnewpassinput.text.length>3)
                    {
                                         log_write3()
                                         confirmlabel.text="Password Changed!"
                                         canbtn.text="Exit"
                                         lbllogin.text=''
                                         inputText2.text=''
                                         change_password_status()

                    }
                    else
                    {
                          confirmlabel.text="Password must be at least 4 character!!!"
                    }
                }
                     else
                      {
                      confirmlabel.text="Password fields must be fill"
                        }
              }
                else
             {
                 confirmlabel.text="Password not match"

            }
        }
        }
        Button {
        id:canbtn
        text: "Cancel"
        x:140
        y:230
        onClicked:

            confirmpasswind.visible=false
        }
  }


  Window {
      id:confirmpasswind2
      width: 500
      height: 350
      visible: false
      title: "New passsword page"
      color:"yellow"
      flags:Qt.MSWindowsFixedSizeDialogHint

      TextField {
          id:currusernameinput2
          x:150
          y:10
          focus: true
          width: 200
          placeholderText: "Username"
          color:"black"
      }


  TextField {
      id:newpassinput2
      x:150
      y:60
      focus: true
      width: 200
      placeholderText: "New Password"
      color:"black"
       echoMode: TextInput.Password
        }
  TextField {
      id:confnewpassinput2
      x:150
      y:110
      focus: true
      width: 200
      placeholderText: "Confirm New Password"
      color:"black"
       echoMode: TextInput.Password
  }
        Label{
          id:confirmlabel2
          x:170
          y:230
        }
        Button {
        text: "Confirm"
        x:240
        y:180
        onClicked: {
        if (  newpassinput2.text===confnewpassinput2.text )
             {
                if(newpassinput2.text!==''|| confnewpassinput2.text!=='')
                {
                    if(newpassinput2.text.length>3 && confnewpassinput2.text.length>3)
                                  {
                                         log_write4()
                                         confirmlabel2.text="Password Changed!"
                                         canbtn2.text="Exit"
                                         lbllogin.text=''
                                         inputText2.text=''
                                         change_password_status2()
                                 }
                            else
                            {
                                  confirmlabel2.text="Password must be at least 4 character!!!"
                            }
                }
                     else
                      {
                      confirmlabel2.text="Password fields must be fill"
                        }
              }
                else
             {
                 confirmlabel2.text="Password not match"

            }
        }
        }
        Button {
        id:canbtn2
        text: "Cancel"
        x:140
        y:180
        onClicked:

            confirmpasswind2.visible=false
        }
  }


          Rectangle {
              x:155
              y:200
              height:600
              width: 1000
              anchors.centerIn: parent
              color:"#26344D"
              radius: 10
              Canvas {
                  anchors.fill: parent
                  width: 200; height: 200
              onPaint: {
                    var ctx = getContext("2d")
                     ctx.strokeStyle = "#7CA3B9"
                     ctx.beginPath()
                     ctx.moveTo(500,50)
                     ctx.lineTo(500,550)
                     ctx.lineWidth =3
                     ctx.stroke()

                }
              }
          Image {
              id: logoimage
              source: "qrc:/img/unnamed-removebg-preview.png"
              x:100
              y:150
              height:350
              width: 450
          }
          Text {
          id:lblpnumber
          visible: false
          }
          Label {
          id:lblname
          visible: false
          }
          Text {
          id:lblfamily
          visible: false
          }

      Text {
          id:lblusertype
          visible: false
      }
      MessageDialog{
      id:dlgpass
      title:"Please Fill Username or Password"
      visible: false
      buttons: MessageDialog.Ok
      }
      MessageDialog{
      id:dlgperiod

      visible: false
      buttons: MessageDialog.Ok
      }
      Rectangle {
          id:rectloginbox
          x:550
          y:50
          height:500
          width:400
         // anchors.centerIn: parent
          color:"#446677"
          radius: 10
        }
      Button {
          id: btnlogin
          text: "Login"
          enabled: true
          highlighted :true
          x:800
          y:450
          width:100
          Material.background: "#648EC0"
           onClicked: {
              if(inputText1.text==='' || inputText2.text==='') {
                  dlgpass.visible=true ; return}
                lbllogin.text=period_search()

              if(lbllogin.text==='0')
                    {
                  period_date()
                dlgperiod.title='From '+bGrid5.cellValue(0,1) +' To '+ bGrid5.cellValue(0,2)+' '
                dlgperiod.text="                Can enter into the system!
                Your access time limited !!! "

                  dlgperiod.open()
                  lbllogin.text=''
                  return}


              lbllogin.text= login_search()

                if(lbllogin.text==='1') {
                  lbllogin.text="Wellcome"
                    lbllogin2.text= first_use_search()
                   if(lbllogin2.text !=='1')
                   { confirmpasswind.visible=true
                       currusernameinput.text=inputText1.text
                       currpassinput.text=inputText2.text
                   //currpassinput.text=inputText2.text
                   lbllogin.text="Confirm new password
       for first use!!!"}
                   else{log_write()
                       mainwind.visible=true
                       user_type()}
                }
                 else {
                   log_write2()
                    lbllogin.text=pass_try_search()
                    if (lbllogin.text==='1')
                        lbllogin.text="Password Expired"
                        else
                           lbllogin.text="Wrong Password!!!"
                }
                find_users()
                 lblpnumber.text=bGrid8.cellValue(0,0)
                lblname.text=bGrid8.cellValue(0,1)
                lblfamily.text=bGrid8.cellValue(0,2)
                lblusertype.text=bGrid8.cellValue(0,5)

           }
      }
      Text{
      text:"Login"
      x:700
      y:100
      font.pixelSize: 36
      color:"white"
      }

      TextField  {
          id:  inputText1
          Layout.fillWidth: true
          focus: true
            placeholderText: "Username         "
           x:650
           y:200
           width:200
           leftPadding: 33
           color: "black"
           Material.background:"#7CA3B9"
           background: Rectangle {
                      radius: 10
                      implicitWidth: 100
                      implicitHeight: 24
                      border.color: "#333"
                      border.width: 1

                  }
           Image {
               source:"qrc:/img/username2.png"
                anchors.left: parent.left
                anchors.leftMargin:8
                anchors.verticalCenter: parent.verticalCenter
                height:40
                width: 20
                opacity: 1
                fillMode: Image.PreserveAspectFit
           }

      }
      TextField {
          id:  inputText2
          Layout.fillWidth: true
          focus: true
           placeholderText: "Password         "
           x:650
           y:300
           width:200
           echoMode: TextInput.Password
           leftPadding: 33
           color: "black"
           Material.background:"#7CA3B9"
           background: Rectangle {
                      radius: 10
                      implicitWidth: 100
                      implicitHeight: 24
                      border.color: "#333"
                      border.width: 1
                  }
           Image {
               source:"img/Password.png"
                anchors.left: parent.left
                anchors.leftMargin:5
                anchors.verticalCenter: parent.verticalCenter
                height:40
                width: 25
                opacity: 1
                fillMode: Image.PreserveAspectFit
           }

      }
      Window{
          id:forgetcodewin
          visible: false
          width: 500
          height: 250
          title: "Enter Code"
           color: "#26344D"
           TextField {
               id:sentcode
               width: 150
               height: 50
               x:100
               y:100
               Layout.fillWidth: true
               focus: true
                placeholderText: "Code         "
                anchors.centerIn: parent
                color: "white"
            }
            Label {
            id:lblsentcode
            width: 160
            height: 50
            x:165
            y:220
            visible: false
            }
        MessageDialog {
            id:dlgsnetcode
            title: "Please enter code"
            buttons: MessageDialog.Ok
        }
       Button
       {
           id:entercode
           width: 160
           height: 50
           x:165
           y:150
           text:"Enter Code"
           onClicked: {
            console.log(bGrid5.selectedRow)
          if(sentcode.text==='') {dlgsnetcode.open()}
         else {
               code_check()

           if(bGrid5.cellValue(0,0)===sentcode.text)
           {
                         confirmpasswind2.visible=true
                         currusernameinput2.text= forgetusernamein.text
                         forgetpasswin.visible=false
                         forgetcodewin.visible=false
           }
               else  {
                    lblsentcode.visible=true
                    lblsentcode.text="Entered code doesn't match"
                  }

           }
           }

       }

      }
      Window{
      id:forgetpasswin
      visible: false
      width: 500
      height: 250
      title: "Password Recovery"
       color: "#23344D"
       property date currentDate: new Date()
      flags:Qt.MSWindowsFixedSizeDialogHint
      MessageDialog {
          id:dlgusername
          title: "Please enter username"
          buttons: MessageDialog.Ok
      }

      Item  {
          id: root2
          width: 200; height: 230

          property double startTime2: 0
          property int  secondsElapsed2: 0

          function restartCounter()  {

             root2.startTime2 = 0;

              }

          function timeChanged2()  {
              if(root2.startTime2==0)
              {
                  root2.startTime2 = new Date().getTime();
              }
              var currentTime = new Date().getTime();
              root2.secondsElapsed2 = (currentTime-startTime2)/1000;
          }

          Timer  {
              id: elapsedTimer2
              interval: 1000;
              running: true;
              repeat: true;
              onTriggered:{


                  root2.timeChanged2(); if(lblcode.text>29) {  lblcode.text=0;passcode.visible=true;lblcode.visible=false}}
          }
      }
      Label{
      id:lblcode
      width: 160
      height: 50
      x:220
      y:175
      text:root2.secondsElapsed2
      visible: false
      font.pixelSize: 20
      }
      TextField {
          id:forgetusernamein
          width: 150
          height: 50
          x:100
          y:100
          Layout.fillWidth: true
          focus: true
           placeholderText: "Username         "
           anchors.centerIn: parent
           text: inputText1.text
            color: "white"
      }

      Button
      {
          id:passcode
          width: 160
          height: 50
          x:165
          y:150
          text:"Send Code"
          onClicked: {
              if (forgetusernamein.text==='') {dlgusername.open()}
              else {
              root2.restartCounter();visible=false;lblcode.visible=true;
              elapsedTimer2.restart()
              update_captcha()
              forgetcodewin.visible=true
            }
          }
      }
      Button
      {
          width: 100
          height: 50
          x:50
          y:150
          text:"Cancel"
          onClicked:  forgetpasswin.visible=false

        }

      }
      ToolButton {

        x:620
        y:465
        width: 150
        Text{
             anchors.fill: parent
             text:"Forget password"
            font.pixelSize: 18
            color:"white"
        }
        onClicked:{ root2.restartCounter();
            forgetpasswin.visible=true;
             passcode.visible=true
        }

      }
      }

        Text {
            x:890
            y:470
            id:lbllogin
            color: "white"
            font.pixelSize: 20
        }

      Label {
       id:lbllogin2
       visible: false
        x:100
        y:260
      }
      Label {
       id:lbllogin3
        x:100
        y:260
      }

    CompGrid {
       id: bGrid5
       visible: false
       anchors.fill:  parent
       y:100
       width: 400
       height: 700
       anchors.rightMargin: 400
       dataHeight: 30

       Component {
          id: cellItem5
            Rectangle {

              implicitHeight: bGrid5.dataHeight
              color: bGrid5.getCellBk(row, highlight)

              CellText {
                  text: bGrid5.formatDisplay(display, dataType, 2)
                  horizontalAlignment: bGrid5.getAlign(dataType)
              }


          }
      }

      cellDelegate: cellItem5

      fromArray: [
          {width: 150, title: "Row id" ,dataType: BTColumn.Str },
          {width: 150, title: "start_date" ,dataType: BTColumn.Str },
          {width: 150, title: "end_date" ,dataType: BTColumn.Str },

       ]
  }


      CompGrid {
           id: bGrid7
            visible: false
           Component {
              id: cellItem7
                Rectangle {

                  implicitHeight: bGrid7.dataHeight
                  color: bGrid7.getCellBk(row, highlight)

                  CellText {
                      text:bGrid7.formatDisplay(display, dataType, 2)
                      horizontalAlignment: bGrid7.getAlign(dataType)
                  }
              }
          }

          cellDelegate: cellItem7

          fromArray: [
              {width: 100, title: "user type" ,dataType: BTColumn.Str },


           ]
      }
  CompGrid {
       id: bGrid8
      dataHeight: 30
      visible: false
       Component {
          id: cellItem8
            Rectangle {

              implicitHeight: bGrid8.dataHeight
              color: bGrid8.getCellBk(row, highlight)

              CellText {
                  text: bGrid8.formatDisplay(display, dataType, 2)
                  horizontalAlignment: bGrid8.getAlign(dataType)
              }
          }
      }

      cellDelegate: cellItem8

      fromArray: [
           {width: 100, title: "Person ID" ,dataType: BTColumn.Str },
           {width: 100, title: "Name",dataType:BTColumn.Str },
           { width: 100,title: "Family", dataType: BTColumn.Str},
           { width: 150,title: "Login Date", dataType: BTColumn.Str},
           { width: 120,title: "Login Status", dataType: BTColumn.Str},
           { width: 100,title: "User Type", dataType: BTColumn.Str},
           { width: 80,title: "City", dataType: BTColumn.Str},
           { width: 100,title: "Phone", dataType: BTColumn.Str},


       ]
  }

  function login_search() {

      var parameters = [];
     var sqlQuery;
       sqlQuery  ="SELECT pnumber,w_start_date,w_end_date FROM login WHERE pnumber='"+inputText1.text+"' AND( password='"+PRINT.hash_pass(inputText2.text)+"' or password='"+inputText2.text+"'   ) and pass_try<3      "

       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
       return bGrid5.rows()
   }
  function period_search() {

      var parameters = [];
     var sqlQuery;
       sqlQuery  ="SELECT pnumber,w_start_date,w_end_date FROM login WHERE pnumber='"+inputText1.text+"'  and ( ( DATE_FORMAT('"+Qt.formatDateTime(new Date(), "yyMMdd")+"','%Y-%m-%d %T')  >w_start_date or w_start_date is null )and  (w_end_date>DATE_FORMAT('"+Qt.formatDateTime(new Date(), "yyMMdd")+"','%Y-%m-%d %T') or w_end_date is null ))    "

       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
       return bGrid5.rows()
   }

  function period_date() {

      var parameters = [];
     var sqlQuery;
       sqlQuery  ="SELECT pnumber,DATE_FORMAT(w_start_date,'%Y-%m-%d'),DATE_FORMAT(w_end_date,'%Y-%m-%d') FROM login WHERE pnumber='"+inputText1.text+"'     "

       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
  }
  function code_check() {

      var parameters = [];
     var sqlQuery;
       sqlQuery  ="SELECT  captcha_code FROM login WHERE pnumber='"+forgetusernamein.text+"'     "

       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
  }

  function first_use_search() {
      var parameters = [];
     var sqlQuery;
       sqlQuery  ="SELECT pnumber FROM login WHERE pnumber='"+inputText1.text+"' AND( password='"+PRINT.hash_pass(inputText2.text)+"' or password='"+inputText2.text+"'   ) and pass_try<3 and first_use=1 "

       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
       return bGrid5.rows()
   }
  function pass_try_search() {
      var parameters = [];
     var sqlQuery;
       sqlQuery  ="SELECT pnumber FROM login WHERE pnumber='"+inputText1.text+"' and pass_try>2 "

       bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters )
       return bGrid5.rows()
   }
  function fill_table()
  {
      var parameters = [];
      var sqlQuery = "SELECT  Type,DATE_FORMAT(Start_Time,'%m/%d/%Y %T'),Coordx,Coordy,operator_number op_number,Action FROM supervision_table  "

   if(srchInputText2.text.length>0|| srchInputText3.text.length>0 ||  comb1.currentIndex>-1 ||myCheck.checked===true || myCheck1.checked===true || myCheck2.checked===true || myCheck3.checked===true  ){

        sqlQuery += " WHERE "   ;
      }


       if ((myCheck.checked===true|| myCheck1.checked===true || myCheck2.checked===true || myCheck3.checked===true)  && (srchInputText2.text.length===0 && srchInputText3.text.length===0) && (comb1.currentIndex===0 ))

    {
              sqlQuery +="  Type LIKE ? OR Type LIKE ? OR Type LIKE ? OR Type LIKE ?   "
        if (myCheck.checked===true)         parameters.push(myCheck.text);   else   parameters.push("");
        if (myCheck1.checked===true)        parameters.push(myCheck1.text);  else   parameters.push("");
        if (myCheck2.checked===true)        parameters.push(myCheck2.text);  else   parameters.push("");
        if (myCheck3.checked===true)        parameters.push(myCheck3.text);  else   parameters.push("");


        }
       else     if (  (myCheck.checked===true|| myCheck1.checked===true || myCheck2.checked===true || myCheck3.checked===true) && (srchInputText2.text.length>0 && srchInputText3.text.length>0) && (comb1.currentIndex===0 ) )

            {     sqlQuery +="   Start_Time between  ? AND ? AND (Type like ? OR Type like ? OR Type like ? OR Type like ? ) "
                 parameters.push(srchInputText2.text)
                 parameters.push(srchInputText3.text)
            if (myCheck.checked===true)         parameters.push(myCheck.text);   else   parameters.push("");
            if (myCheck1.checked===true)        parameters.push(myCheck1.text);  else   parameters.push("");
            if (myCheck2.checked===true)        parameters.push(myCheck2.text);  else   parameters.push("");
            if (myCheck3.checked===true)        parameters.push(myCheck3.text);  else   parameters.push("");

              }

       else    if ((myCheck.checked===true|| myCheck1.checked===true || myCheck2.checked===true || myCheck3.checked===true)  && (srchInputText2.text.length===0 && srchInputText3.text.length===0) && (comb1.currentIndex>0 && comb1.currentIndex!==5 ) )
          {
          sqlQuery +="  Type LIKE ? OR Type LIKE ? OR Type LIKE ? OR Type LIKE ?  OR Type LIKE ? "

              if (myCheck.checked===true)         parameters.push(myCheck.text);   else   parameters.push("");
              if (myCheck1.checked===true)        parameters.push(myCheck1.text);  else   parameters.push("");
             if (myCheck2.checked===true)        parameters.push(myCheck2.text);  else   parameters.push("");
              if (myCheck3.checked===true)        parameters.push(myCheck3.text);  else   parameters.push("");
             if (comb1.currentIndex!==0 && comb1.currentIndex!==5)       parameters.push(comb1.currentText); else if (comb1.currentIndex===5 && comb1.currentIndex!==0)  parameters.push("%"); else if(comb1.currentIndex!==5 && comb1.currentIndex===0) parameters.push("");


          }

       else     if ((myCheck.checked===true|| myCheck1.checked===true || myCheck2.checked===true || myCheck3.checked===true)  && (srchInputText2.text.length!==0 && srchInputText3.text.length!==0) && (comb1.currentIndex>0 && comb1.currentIndex!==5 ) )


             {
                  sqlQuery +="   Start_Time between  ? AND ? AND (Type like ? OR Type like ? OR Type like ? OR Type like ? OR Type like ? ) "
                                   parameters.push(srchInputText2.text)
                                   parameters.push(srchInputText3.text)
                             if (myCheck.checked===true)         parameters.push(myCheck.text);   else   parameters.push("");
                              if (myCheck1.checked===true)        parameters.push(myCheck1.text);  else   parameters.push("");
                              if (myCheck2.checked===true)        parameters.push(myCheck2.text);  else   parameters.push("");
                              if (myCheck3.checked===true)        parameters.push(myCheck3.text);  else   parameters.push("");
                              parameters.push(comb1.currentText);

              }

          if (( comb1.currentIndex===5 )  && (srchInputText2.text.length!==0 && srchInputText3.text.length!==0))
            {

                sqlQuery +="   Start_Time between  ? AND ? AND Type like ? "
               parameters.push(srchInputText2.text)
               parameters.push(srchInputText3.text)
                parameters.push("%");

              }
           else if (( comb1.currentIndex===5 || comb1.currentIndex>0 )  && (srchInputText2.text.length===0 && srchInputText3.text.length===0))
           {
               sqlQuery +=" Type like ? "
            if (comb1.currentIndex===5)  parameters.push("%"); else    parameters.push(comb1.currentText);
           }


        else  if (( comb1.currentIndex!==5 )  && (srchInputText2.text.length!==0 && srchInputText3.text.length!==0))
           {

                sqlQuery +="   Start_Time between  ? AND ? AND Type like ? "
               parameters.push(srchInputText2.text)
               parameters.push(srchInputText3.text)
                parameters.push(comb1.currentText);

              }



              bGrid.fillFromQuery(MysqlModel,sqlQuery,parameters );
      }


  function fill_table3(){
      var parameters = [];
      var sqlQuery = "SELECT  ID,Phone_number  FROM Phone_numbers   "

   bGrid3.fillFromQuery(MysqlModel,sqlQuery,parameters );
}




function  log_write() {
    var parameters = [];
   var sqlQuery;
    sqlQuery  =" Update login set password='"+PRINT.hash_pass(inputText2.text)+"',pass_try=0,first_use=1,l_status='Successful',l_date='"+/*Qt.formatDateTime(new Date(), "yyyy/MM/dd HH:MM:SS")*/currentDate.toLocaleDateString(Qt.locale(), "dddd MMMM d yyyy")+" "+currentDate.toTimeString().substring(0, 5)+"'  Where pnumber='"+bGrid5.cellValue(0,0)+"' "
 bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters );
}
function  log_write2() {
    var parameters = [];
   var sqlQuery;
    sqlQuery  =" Update login  set pnumber='"+inputText1.text+"',l_status='UnSuccessful',l_date='"+/*Qt.formatDateTime(new Date(), "yyyy/MM/dd HH:MM:SS")*/currentDate.toLocaleDateString(Qt.locale(), "dddd MMMM d yyyy")+" "+currentDate.toTimeString().substring(0, 5)+"',pass_try=pass_try+1   Where pnumber='"+inputText1.text+"' "
 bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters );
}
function  log_write3() {
    var parameters = [];
   var sqlQuery;
    sqlQuery  =" Update login set password='"+PRINT.hash_pass(newpassinput.text)+"',pass_try=0,first_use=1,l_status='Successful',l_date='"+/*Qt.formatDateTime(new Date(), "yyyy/MM/dd HH:MM:SS")*/currentDate.toLocaleDateString(Qt.locale(), "dddd MMMM d yyyy")+" "+currentDate.toTimeString().substring(0, 5)+"'  Where pnumber='"+inputText1.text+"' "
   bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters );
}

function  log_write4() {
    var parameters = [];
   var sqlQuery;
    sqlQuery  =" Update login set password='"+PRINT.hash_pass(newpassinput2.text)+"',pass_try=0,first_use=1,l_status='Successful',l_date='"+/*Qt.formatDateTime(new Date(), "yyyy/MM/dd HH:MM:SS")*/currentDate.toLocaleDateString(Qt.locale(), "dddd MMMM d yyyy")+" "+currentDate.toTimeString().substring(0, 5)+"'  Where pnumber='"+currusernameinput2.text+"' "
   bGrid5.fillFromQuery(MysqlModel,sqlQuery,parameters );
}

 function show_users() {
     var parameters = [];
    var sqlQuery;
     sqlQuery  =" SELECT pnumber,pname,pfamily,l_date,l_status,user_type,pcity,pphone_number FROM users "
  bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters );
 }
function  search_users()
{
    var parameters = [];
   var sqlQuery;
   if(mngsrchname.text!=='' && mngsrchfamily.text==='') {
     sqlQuery  =" SELECT  *    FROM users WHERE Pname LIKE '%"+mngsrchname.text+"%' "

   }
  else if(mngsrchname.text==='' && mngsrchfamily.text!=='') {
     sqlQuery  =" SELECT  *    FROM users WHERE Pfamily LIKE '%"+mngsrchfamily.text+"%' "

   }
  else if(mngsrchname.text!=='' && mngsrchfamily.text!=='') {
     sqlQuery  =" SELECT  *     FROM users  WHERE Pname LIKE '%"+mngsrchname.text+"%' AND Pfamily LIKE'%"+mngsrchfamily.text+"%' "

   }
   else if (mngsrchname.text==='' && mngsrchfamily.text==='')
   {
     sqlQuery  =" SELECT  * FROM users   "
   }
   bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters );
}


function delete_users(rowid) {
    var parameters = [];
  var sqlQuery = "DELETE   FROM   person WHERE pnumber="+rowid+"";
   bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters );
}

function insert_search() {
    var parameters = [];
   var sqlQuery;
     sqlQuery  ="SELECT * FROM users WHERE pnumber='"+mnginsusername.text+"'  "

     bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )
     return bGrid8.rows()
 }

function create_search() {
    var parameters = [];
   var sqlQuery;
     sqlQuery  ="SELECT * FROM person WHERE pnumber='"+mnginadmin.text+"'  "

     bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )
     return bGrid8.rows()
 }
 function insert_person(username,pname,pfamily,pphone_number,pcity) {

     var parameters = [];
    var sqlQuery;
      sqlQuery  =" INSERT INTO person (Pnumber,Pname,Pfamily,pphone_number,pcity) VALUES ("+username+",'"+pname+"','"+pfamily+"','"+pphone_number+"','"+pcity+"' ); "
    bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )

 }
 function create_user(username,password,user_type) {

     var parameters = [];
    var sqlQuery;
      sqlQuery  ="INSERT INTO login(pnumber,password,user_type) VALUES('"+username+"','"+password+"','"+user_type+"'); "
      bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )

 }

 function delete_search(pnumber) {
     var parameters = [];
    var sqlQuery;
      sqlQuery  ="SELECT  pnumber FROM users WHERE pnumber='"+pnumber+"' and password !=''   "

      bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )
      return bGrid8.rows()

 }
  function delete_user2(pnumber) {

      var parameters = [];
     var sqlQuery;
       sqlQuery  ="Delete FROM login WHERE pnumber='"+pnumber+"'  "

      bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )

  }


  function print_pdf()
  {

      var stat = bGrid.grabToImage(function(result) {
      //  result.saveToFile("/Users/Ha_Sa/Desktop/Output.png");
          PRINT.print(result.image);

       });

  console.log("Success: ", stat);
  }


    function user_type()
   {
        var parameters = [];
       var sqlQuery;
       sqlQuery  ="SELECT  user_type FROM login WHERE pnumber='"+inputText1.text+"'   "
       bGrid7.fillFromQuery(MysqlModel,sqlQuery,parameters )


    }
   function find_users(){
       var parameters = [];
       var sqlQuery  ="SELECT  pnumber,pname,pfamily,l_date,l_status,user_type,pcity,pphone_number FROM users WHERE pnumber='"+inputText1.text+"'   "
       bGrid8.fillFromQuery(MysqlModel,sqlQuery,parameters )
    }


   MessageDialog {
   id:msgdlg
    text: "The User Exist Or is Null"
      informativeText: "Please Change Username and Insert"
          }
   Window {

     id:mngwind
    visible: false
    width: 1500
    height: 1000
    title:"Manage Users"
     Rectangle {
     anchors.fill: parent
     color: "#446677"

     }

    Loader{
    id:myloader
      anchors.fill: parent
    }
    Component{
    id:mycom1
      PerList{
          }

    }
    Component{
    id:mycom2
      EditInfo{

         }
    }

    Component{
    id:mycom3
      Update{
          Text {
              x:600
              y:50
              text: currentDate.toLocaleDateString(Qt.locale(), "dddd MMMM d yyyy")+" "+currentDate.toTimeString().substring(0, 5)
              color: "white"
              font.pixelSize: 26
          }

              Text {
                  x:300
                  y:500
                  text:   "     Fullname:"
                  color: "white"
                  font.pixelSize: 26
              }


          Text {
              x:450
              y:500
              text: lblname.text+" "+lblfamily.text
              color: "white"
              font.pixelSize: 26
          }

//          Text {
//              x:420
//              y:500
//               text: lblfamily.text
//              color: "white"
//              font.pixelSize: 26
//              horizontalAlignment: TextInput.AlignHCenter
//          }

        Text {
        text:"Username: "
        x:900
        y:500
        color: "white"
        font.pixelSize: 26
            }
          Text {
           text: lblpnumber.text
           x:1050
           y:500
           color: "white"
           font.pixelSize: 26
          }



              Text {
                  text:lblusertype.text
                  x:750
                  y:290
                  color: "white"
                  font.pixelSize: 100
                  font.bold: true

              }


        Button {
            text: "Log out"
            x:1250
            y:0
            onClicked: { mainwind.visible=false }
        }
         }
    }

    Component{
    id:mycom4
      Delete{
          }
    }
    Component{
    id:mycom5
      Create{
      onMClicked:mngwind.visible=false
         }
    }
    Component{
    id:mycom6
      Edit{
          }
    }
    Component{
    id:mycom7
      Remove{
          }
    }
    Component{
    id:mycom8
      Schedule{
       onMClicked:mngwind.visible=false
         }
    }
    Component{
    id:mycom12
      PerList{
          onMClicked:mngwind.visible=false

         }
    }




}
   Window {
     id:mainwind
    visible: false
    width: 1500
    height: 1000
     title: qsTr("Gate Access Project")
     Material.theme: BppStyleMaterial.whatTheme
     Material.accent: BppMetrics.accentColor
     Material.primary: BppMetrics.buttonBackground
     Material.foreground: BppMetrics.textColor
     Material.background: BppMetrics.windowBackground






     MessageDialog {
         id: dialog
         visible: false
         text: qsTr("                                   ")
        informativeText: qsTr("Need to higher permission!")
         buttons: MessageDialog.Ok

     }


     Loader {
     id:myloader1
     anchors.fill: parent

     }

     Component{
     id:mycom10
       SMSPanel{

          }
     }

     Component{
     id:mycom11
     Report
     {
     }

     }
     Image {
         id: treeimg
         source: "img/Menu.png"
         anchors.leftMargin: parent
         width: 50
         height: 50
         x:10
         y:20
         MouseArea {
                anchors.fill: parent
                onClicked: {
                 tree2.visible=true
                }
            }
     }

     TreeWidget{
         id: tree2
         visible: false
         anchors.leftMargin: parent
         width: 300
         color: "#446677"
         onShowClicked:{

                      if (bGrid7.cellValue(0,0)==='B' || bGrid7.cellValue(0,0)==='C')
                       {
                           console.log("You Can't Enter to Report Page")
                           dialog.visible=true

                      }
                      else
                      myloader1.sourceComponent=mycom12
                      show_users()
                   }
         onSmspanelClicked:

         if (bGrid7.cellValue(0,0)==='C')
          {
              console.log("You Can't Enter to Report Page")
              dialog.visible=true

         }
         else
             myloader1.sourceComponent=mycom10
         onExitClicked:{ myloader1.sourceComponent=mycom3
         tree2.visible=false
         }
         onMnguserClicked:
           //  myloader1.sourceComponent=mycom11
         {
               if (bGrid7.cellValue(0,0)==='C' || bGrid7.cellValue(0,0)==='B')
                   dialog.visible=true
             }
         onReportClicked:{
             if (bGrid7.cellValue(0,0)==='C')
              {
                  console.log("You Can't Enter to Report Page")
                  dialog.visible=true

             }
             else
             myloader1.sourceComponent=mycom11
          }
         onManagmentClicked: myloader1.sourceComponent=mycom3


         onInsClicked:{
             if (bGrid7.cellValue(0,0)==='B' || bGrid7.cellValue(0,0)==='C')
                           {
                               console.log("You Can't Enter to Report Page")
                               dialog.visible=true

                          } else
             myloader1.sourceComponent=mycom2}
         onUpdClicked:
         {
                      if (bGrid7.cellValue(0,0)==='B' ||bGrid7.cellValue(0,0)==='C')
                                    {
                                        console.log("You Can't Enter to Report Page")
                                        dialog.visible=true

                                   } else
           myloader1.sourceComponent=mycom3 }
         onDelClicked:myloader1.sourceComponent=mycom4
         onCreClicked:{
             if (bGrid7.cellValue(0,0)==='B' ||bGrid7.cellValue(0,0)==='C')
                           {
                               console.log("You Can't Enter to Report Page")
                               dialog.visible=true

                          } else
             myloader1.sourceComponent=mycom5 }
         onEditClicked:{
             if (bGrid7.cellValue(0,0)==='B' ||bGrid7.cellValue(0,0)==='C')
                           {
                               console.log("You Can't Enter to Report Page")
                               dialog.visible=true

                          } else
                 myloader1.sourceComponent=mycom6}
         onRmvClicked:{
             if (bGrid7.cellValue(0,0)==='B' ||bGrid7.cellValue(0,0)==='C')
                           {
                               console.log("You Can't Enter to Report Page")
                               dialog.visible=true

                          } else
                 myloader1.sourceComponent=mycom7}
         onScheduleClicked:{
             if (bGrid7.cellValue(0,0)==='B' ||bGrid7.cellValue(0,0)==='C')
                           {
                               console.log("You Can't Enter to Report Page")
                               dialog.visible=true

                          } else
                 myloader1.sourceComponent=mycom8}
         onLogoutClicked:mngwind.visible=false

         Component.onCompleted: {
             myloader1.sourceComponent=mycom3
            // iconSize = (Qt.size(30, 30));
             font.family = "Monaco";
             font.pointSize = 22;
             var topItem11 = createItem(" ",''/* "qrc:/img/Folder.png" */);
             var topItem12 = createItem(" ",''/* "qrc:/img/Folder.png" */);

             var topItem1 = createItem("Management",''/* "qrc:/img/Folder.png" */);

             addTopLevelItem(topItem1);
            var topItem2 =  createItem("User Setting", ''/*"qrc:/img/UserSetting.png"*/,topItem1) ;
            var topItem3 =   createItem("Personnel", ''/*"qrc:/img/Folder.png"*/,topItem2);
              createItem("Personnel List", ''/*"qrc:/img/List.png"*/,topItem3);
              createItem("Edit Information",'' /*"qrc:/img/Edit.png"*/,topItem3);
             var topItem4 = createItem("Operator",'' /*"qrc:/img/Folder.png"*/,topItem2);

              createItem("Add/Remove",'' /*"qrc:/img/AddRemove.png"*/,topItem4) ;
              createItem("Schedule",'' /*"qrc:/img/Schedule.png"*/,topItem4) ;


             topItem1.appendChild(createItem("Event Report"/*"qrc:/img/Report.png"*/));
             topItem1.appendChild(createItem("SMS Panel" /*"qrc:/img/SMSPanel.png"*/));
             topItem1.appendChild(createItem("Exit", ''/*"qrc:/img/exit.png"*/));

         }

         onCurrentItemChanged: {
             var item = getCurrentItem();

         }

     }
}
    Window {
   id:reportwind
  visible: false
  width: 1500
  height: 1000
   title: qsTr("Report")

   Button {
       text: "Log out"
       x:1250
       y:0
       onClicked: { reportwind.visible=false }
   }
    Frame {
     width:500
     height:100
     x:110
     y:200
    }
    Label {
        text:"<b> Types: </b>"
        x:10
        y:280
        }
     ComboBox {
        id:comb1
        model: ["","Car", "Walking", "Man.Digging","Mec.Digging","All"]
        x:120
        y:300
        width:200

       }
     CheckBox {
         id: myCheck
         checked: false
         text:    comb1.model[1];
         x:120
         y:200
     }
     CheckBox {
         id: myCheck1
         checked: false
         text:  comb1.model[2];
         x:190
         y:200
     }
     CheckBox {
         id: myCheck2
         checked: false
         text:  comb1.model[3];
         x:280
         y:200
     }

     CheckBox {
         id: myCheck3
         checked: false
         text:   comb1.model[4];
         x:400
         y:200
     }


     BppTextDate{
         id: txtDate3;
         x:250
         y:350
         Layout.fillWidth: true
         onDateChanged : {
        srchInputText2.text = qsTr("%2").arg(txtDate3.toText());
        }
        }
     BppTextDate{
         id: txtDate4;
         x:250
         y:400
         Layout.fillWidth: true
         onDateChanged : {
        srchInputText3.text = qsTr("%2").arg(txtDate4.toText());
        }
        }
    TextField {
        id: srchInputText2
        focus: true
        placeholderText: "Start Date"
         x:120
         y:350
         width:200
         wrapMode: Text.WordWrap
         selectByMouse: true

    }
    TextField {
         id: srchInputText3
         focus: true
         placeholderText: "End Date"
         x:120
         y:400
         width:200
         wrapMode: Text.WordWrap
         selectByMouse: true
    }

     Button {
        id: mButtonUpdate
        text: "Search"
        enabled: true
        x:10
        y:350
        focus: true
        Keys.onPressed:   {
                    if (event.key === Qt.Key_Return)
                            fill_table()
                            tblewin.visible=true
                            mainwind.visible=false
        }



       Keys.onDownPressed:
        {
            console.log("Enter Pressed")
            fill_table()
           tblewin.visible=true
        }
        onClicked: {
            console.log("button click event")
             fill_table()
            fill_table2()
            fill_table3()
            tblewin.visible=true
           // tblsms.visible=true

            }

    }
     Button {
        id: btnuseroptn
        text: "Manage Users"
        enabled: true
        x:700
        y:350
        focus: true
        visible: false
        onClicked: {

            mngwind.visible=true

            }

   // }
 }
    Window {
        id:tblewin
        visible: false
        width: 1400
        height: 700
        title: qsTr("Search Output")
        Rectangle {
        color: "#FFEB3B"
        anchors.fill: parent
        Button {
            x:1000
            y:10
            height: 30
            width: 100
            text: "<b>Log out </b>"
            onClicked:tblewin.visible=false
        }
          Button {
              id:printbtn
              x:1250
              y:10
              height: 30
              width: 100
              text: "<b>Print </b>"
              onClicked:
                   {
                    print_pdf();
               }
          }
          Button {
              id:backbtn
              x:1100
              y:10
              height: 30
              width: 100
              text: "<b>Back </b>"
              onClicked:
                   {
                   tblewin.visible=false
                  mainwind.visible=true
               }
          }


          ColumnLayout
              {
                  id:collay
                  anchors.fill:  parent


              }
          Keys.onEscapePressed: {
          tblewin.close()
           }
        CompGrid {
            id: bGrid
            width: 820
            height: 800
            // anchors.fill:    parent
            x:1
            y:1
            anchors.margins: 50
            dataHeight: 30
             withMultiselection: true

             Component {
                id: cellItem
                  Rectangle {
                    id:itemrec
                     implicitHeight: bGrid.dataHeight
                    color: bGrid.getCellBk(row, highlight)

                    CellText {
                        text: bGrid.formatDisplay(display, dataType, 2)
                        horizontalAlignment: bGrid.getAlign(dataType)
                    }

                  CellClicker {
                     grid: bGrid
                     onClicked: {

                     if(bGrid.selectedRow===-1) return;
                 map.visible=true
                 map.center=QtPositioning.coordinate(bGrid.cellValue(bGrid.selectedRow,2), bGrid.cellValue(bGrid.selectedRow,3))


                     }

                     }
                }
            }

            cellDelegate: cellItem

            fromArray: [
                {width: 140, title: "Type" ,dataType: BTColumn.Str },
                {width: 150, title: "Start Time",dataType:BTColumn.Str },
                { width: 110,title: "Latitude", dataType: BTColumn.Str},
                { width: 110,title: "Longitude", dataType: BTColumn.Str},
                {width: 160, title: "Operator ID", dataType: BTColumn.Int},
                { width: 140,title: "Action", dataType: BTColumn.Str},

             ]
        }
    }


}


 }
    Window {
     id:tblsms
     visible: false
     width: 1400
     height: 700
     title: qsTr("SMS Panel")

     Rectangle {
      color:"#26344D"
      anchors.fill: parent
      Rectangle {
          width: 1100
          height: 100
          y:50
          x:100
          radius: 80
          anchors.rightMargin: 400
     CompGrid {
         id: bGrid2
          y:50
          x:100
          width: 800
          height: 50
         anchors.margins: 50
         dataHeight: 30

          Component {
             id: cellItem2
               Rectangle {

                 implicitHeight: bGrid2.dataHeight
                 color: bGrid2.getCellBk(row, highlight)

                 CellText {
                     text: bGrid2.formatDisplay(display, dataType, 2)
                     horizontalAlignment: bGrid2.getAlign(dataType)

                 }

               CellClicker {
                  grid: bGrid2
                onClicked: console.log("true")
                }
             }
         }

         cellDelegate: cellItem2

         fromArray: [
             {width: 100, title: "Type" ,dataType: BTColumn.Str },
             {width: 195, title: "Start Time",dataType:BTColumn.Str },
             { width: 150,title: "Location", dataType: BTColumn.Str},
              { width: 130,title: "IDs", dataType: BTColumn.Str},
             { width: 100,title: "Sent", dataType: BTColumn.Str},
             { width: 100,title: "Received", dataType: BTColumn.Str},
             { width: 180,title: "Response Action", dataType: BTColumn.Str},


          ]
     }
    }

     Frame {
      width:300
      height:500
      x:1025
      y:190

     }


     Rectangle{
         x:1020
         y:200
          width: 300
         height: 500
         radius: 50
     CompGrid {
         id: bGrid3
         x:1050
         y:200
         width: 250
         height: 450
         anchors.margins: 50
         dataHeight: 30

            Component {
             id: cellItem3

               Rectangle {

                 id:itemrec3
                  implicitHeight: bGrid3.dataHeight
                 color: bGrid3.getCellBk(row, highlight)

                 CellText {
                     text: bGrid3.formatDisplay(display, dataType, 2)
                     horizontalAlignment: bGrid3.getAlign(dataType)
                 }
               CellClicker {
                  grid: bGrid3
                }
             }
         }

         cellDelegate: cellItem3

         fromArray: [
             {width: 100, title: "ID" ,dataType: BTColumn.Int },
             {width: 150, title: "Phone_Number",dataType:BTColumn.Str },


          ]
     }
     }
     Button {

         id: showusers
         text: qsTr("Show Numbers")
         x:1200
         y:10
          height: 30
          width: 150
          onClicked:
               {
         fill_table3()
          }

     }

     Button {

         id: showevent
         text: qsTr("Show Events")
         x:500
         y:10
          height: 30
          width: 150
          onClicked:
               {

         fill_table2()
           }

     }
     Button {
         text: "Log out"
         x:1
         y:1
         onClicked: { tblsms.visible=false }
     }
     Button {

         id: addusers
         text: qsTr("Add Number")
         x:1200
         y:50
          height: 30
          width: 150
          onClicked:
               {
              tbladdnumber.visible=true
              fill_table4();
              txtname.text=''
              txtfamily.text=''

           }

     }
     MessageDialog {
         id:delmsg
         text: "Delete ID"
         informativeText: "Are you sure?"
         buttons: MessageDialog.Ok | MessageDialog.Cancel

         onAccepted:

             delete_table3(bGrid3.cellValue(bGrid3.selectedRow,0))

     }

     Button {

         id: deletenumber
         text: qsTr("Delete Number")
         x:1200
         y:100
          height: 30
          width: 150
          onClicked:
               {
             if(bGrid3.selectedRow>-1){
              delmsg.open()
             }


           }

     }
     Button {

         id: addlist
         text: qsTr("Update IDs")
         x:1020
         y:100
          height: 30
          width: 150
          onClicked:
               {

         add_list()

          }
    }
     }


}
     }
