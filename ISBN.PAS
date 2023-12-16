{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/LIBRARIANLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit ISBN;

INTERFACE

Function IsValidISBN(S:String):Boolean;

IMPLEMENTATION

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

END.