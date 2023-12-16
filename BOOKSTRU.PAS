{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/LIBRARIANLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit BOOKSTRU;

INTERFACE

Uses Strings;

Type
 Book=Record
  ISBN:String[13];
  Title:PChar;
  Author:PChar;
  Language:PChar;
  NumberPage:LongInt;
  Year:LongInt;
  Subject:PChar;
  ClassType:Integer;
  ClassSubject:Integer;
  ClassCode:Integer;
  ClassPostion:Integer;
  Description:PChar;
  Tome:String[10];
  DureeSecond:LongInt;
 End;

 Location=Record
  Name:PChar;
  Responsable:PChar;
  Phone:String[15];
  Fax:String[15];
  Email:PChar;
  Address:PChar;
  City:PChar;
  Region:PChar;
  Country:PChar;
  PostalOrZip:String[10];
  MonOpen,MonClose:String[5];
  TueOpen,TueClose:String[5];
  WedOpen,WedClose:String[5];
  ThuOpen,ThuClose:String[5];
  FriOpen,FriClose:String[5];
  SatOpen,SatClose:String[5];
  SunOpen,SunClose:String[5];
 End;

IMPLEMENTATION

END.