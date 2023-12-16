{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/LIBRARIANLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit ISBN;

INTERFACE

Function ConvertISBN10ToISBN13(ISBN10:String):String;
Function IsValidISBN(S:String):Boolean;
Function To13(ISBN10:String):String;

IMPLEMENTATION

Function IntToStr(Value:Integer):String;
Var
 S:String;
Begin
 Str(Value,S);
 IntToStr:=S;
End;

Function IsValidISBN(S:String):Boolean;
Var
 I,Len,M:Byte;
 CheckSum:Integer;
Begin
 Len:=0;
 For I:=1 to Ord(S[0])do If S[I]in['0'..'9']Then Begin
  Inc(Len);
  S[Len]:=S[I];
 End;
 If S[Ord(S[0])]in['X','x']Then M:=10
                           Else M:=Ord(S[Len])-48;
 S[0]:=Chr(Len);
 CheckSum:=0;
 For I:=1 to Len-1 do Inc(CheckSum,(Ord(S[I])-48)*I);
 If((CheckSum mod 11)=M)Then IsValidISBN:=True
                        Else IsValidISBN:=False;
End;

Function Sum13(ISBN:String):Integer;
Var
 I:Integer;
 S,W,N:Integer;
 Err:Word;
Begin
 Sum13:=-1;
 s:=0;
 w:=1;
 For I:=1 to Length(ISBN)do Begin
  Val(ISBN[I],N,Err);
  If Err>0 Then Exit;
  S:=S+N*W;
  If W=1Then W:=3
        Else W:=1;
 End;
 Sum13:=S;
End;

Function CheckDigit13(Isbn13:String):String;
Var
 S,D:Integer;
Begin
 CheckDigit13:='';
 If(Length(Isbn13)<>12)and(Length(Isbn13) <> 13)Then Exit;
 S:=Sum13(Copy(Isbn13,1,12));
 D:=10-(s mod 10);
 If D=10 Then CheckDigit13:='0'
         Else CheckDigit13:=IntToStr(D);
End;

Function To13(ISBN10:String):String;
Var
 Isbn13:String;
Begin
 To13:='';
 If(Length(Isbn10)<>9)and(Length(isbn10)<>10)Then Exit;
 Isbn13:='978'+Copy(Isbn10,1,9);
 To13:=Isbn13+CheckDigit13(Isbn13);
End;

Function ConvertISBN10ToISBN13(ISBN10:String):String;
Var
 Isbn13:String;
Begin
 ConvertISBN10ToISBN13:='';
 If(Length(Isbn10)<>9)and(Length(isbn10)<>10)Then Exit;
 Isbn13:='978'+Copy(Isbn10,1,9);
 ConvertISBN10ToISBN13:=Isbn13+CheckDigit13(Isbn13);
End;


END.