{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/LIBRARIANLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit ISBNGRP;

INTERFACE

Type
 GrpType=(English,French,German,Japan,exURSS,Iran,Kazakhstan,Indonesia,
  SaudiArabia,Vietnam,Turkey,Romania,Mexico,NorthMacedonia,Thailand,Peru,
  Lithuania,Mauritius,Lebanon,Hungary,Ukraine,Greece,Bulgaria,Philippines,
  SriLanka,Taiwan,Pakistan,Colombia,Malaysia,Argentina,Brazil,China,
  exCzechoslovakia,India,Norway,Poland,Spain,exYugoslavia,Denmark,
  Italy,Korea,Netherlands,Sweden,NGOAndEU,Inde,Finland,Croatia,
  Chile,Cuba,Slovenia,HongKong,Israel,Portugal,Caribbean,Egypt,
  Nigeria,Venezuela,Singapore,SouthPacific,Bangladesh,Belarus,
  Uzbekistan,Montenegro,Tanzania,Uganda,Kenya,Uruguay,Estonia,Bolivia,
  Malta,Mongolia,Morocco,Kuwait,Iraq,Jordan,Cambodia,Cyprus,
  BosniaAndHerzegovina,Qatar,Albania,Guatemala,CostaRica,Algeria,Lao,
  Syria,Latvia,Iceland,Afghanistan,Nepal,Tunisia,Armenia,Georgia,
  Ecuador,DominicanRepublic,UnitedArabEmirates,Palestine,Kosova,
  Azerbaijan,Cameroon,Libya,Panama,Ghana,KyrgyzRepublic,Moldova,
  PapuaNewGuinea,Zambia,Gambia,Bahrain,ReservedAgency,Curacao,Malawi,
  SierraLeone,Lesotho,Botswana,Andorra,InternationalNGOPublishers,
  Maldives,Namibia,BruneiDarussalam,FaroeIslands,Benin,ElSalvador,
  Nicaragua,Paraguay,Honduras,Seychelles,Haiti,Bhutan,Macau,
  SrpskaRepublicOf,Sudan,Ethiopia,Tajikistan,Eritrea,Mali,Luxembourg,
  Oman,Myanmar,Rwanda,France,USA);

Function GetGroupName(GT:GrpType):String;
Function GetGroupByISBN(ISBN:String):String;

IMPLEMENTATION

Uses Strings;

Type
 ISBNRangRecord=Record
  Prefix:PChar;
  Grp:GrpType;
  MinRange,MaxRange:String[7];
  Data:Byte;
 End;

Const
 ISBNRang:Array[0..1549]of ISBNRangRecord=(
  (Prefix:'978-0';Grp:English;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-0';Grp:English;MinRange:'2000000';MaxRange:'2279999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'2280000';MaxRange:'2289999';Data:4),
  (Prefix:'978-0';Grp:English;MinRange:'2290000';MaxRange:'3689999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'3690000';MaxRange:'3699999';Data:4),
  (Prefix:'978-0';Grp:English;MinRange:'3700000';MaxRange:'6389999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'6390000';MaxRange:'6397999';Data:4),
  (Prefix:'978-0';Grp:English;MinRange:'6398000';MaxRange:'6399999';Data:7),
  (Prefix:'978-0';Grp:English;MinRange:'6400000';MaxRange:'6449999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'6450000';MaxRange:'6459999';Data:7),
  (Prefix:'978-0';Grp:English;MinRange:'6460000';MaxRange:'6479999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'6480000';MaxRange:'6489999';Data:7),
  (Prefix:'978-0';Grp:English;MinRange:'6490000';MaxRange:'6549999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'6550000';MaxRange:'6559999';Data:4),
  (Prefix:'978-0';Grp:English;MinRange:'6560000';MaxRange:'6999999';Data:3),
  (Prefix:'978-0';Grp:English;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-0';Grp:English;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-0';Grp:English;MinRange:'9000000';MaxRange:'9499999';Data:6),
  (Prefix:'978-0';Grp:English;MinRange:'9500000';MaxRange:'9999999';Data:7),

  (Prefix:'978-1';Grp:English;MinRange:'0000000';MaxRange:'0099999';Data:3),
  (Prefix:'978-1';Grp:English;MinRange:'0100000';MaxRange:'0299999';Data:2),
  (Prefix:'978-1';Grp:English;MinRange:'0300000';MaxRange:'0349999';Data:3),
  (Prefix:'978-1';Grp:English;MinRange:'0350000';MaxRange:'0399999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'0400000';MaxRange:'0499999';Data:3),
  (Prefix:'978-1';Grp:English;MinRange:'0500000';MaxRange:'0699999';Data:2),
  (Prefix:'978-1';Grp:English;MinRange:'0700000';MaxRange:'0999999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'1000000';MaxRange:'3979999';Data:3),
  (Prefix:'978-1';Grp:English;MinRange:'3980000';MaxRange:'5499999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'5500000';MaxRange:'6499999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'6500000';MaxRange:'6799999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'6800000';MaxRange:'6859999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'6860000';MaxRange:'7139999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'7140000';MaxRange:'7169999';Data:3),
  (Prefix:'978-1';Grp:English;MinRange:'7170000';MaxRange:'7319999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'7320000';MaxRange:'7399999';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'7400000';MaxRange:'7749999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'7750000';MaxRange:'7753999';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'7754000';MaxRange:'7763999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'7764000';MaxRange:'7764999';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'7765000';MaxRange:'7769999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'7770000';MaxRange:'7782999';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'7783000';MaxRange:'7899999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'7900000';MaxRange:'7999999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'8000000';MaxRange:'8004999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'8005000';MaxRange:'8049999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'8050000';MaxRange:'8379999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'8380000';MaxRange:'8384999';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'8385000';MaxRange:'8671999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'8672000';MaxRange:'8675999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'8676000';MaxRange:'8697999';Data:5),
  (Prefix:'978-1';Grp:English;MinRange:'8698000';MaxRange:'9159999';Data:6),
  (Prefix:'978-1';Grp:English;MinRange:'9160000';MaxRange:'9165059';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'9165060';MaxRange:'9168699';Data:6),
  (Prefix:'978-1';Grp:English;MinRange:'9168700';MaxRange:'9169079';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'9169080';MaxRange:'9195999';Data:6),
  (Prefix:'978-1';Grp:English;MinRange:'9196000';MaxRange:'9196549';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'9196550';MaxRange:'9729999';Data:6),
  (Prefix:'978-1';Grp:English;MinRange:'9730000';MaxRange:'9877999';Data:4),
  (Prefix:'978-1';Grp:English;MinRange:'9878000';MaxRange:'9911499';Data:6),
  (Prefix:'978-1';Grp:English;MinRange:'9911500';MaxRange:'9911999';Data:7),
  (Prefix:'978-1';Grp:English;MinRange:'9912000';MaxRange:'9989899';Data:6),
  (Prefix:'978-1';Grp:English;MinRange:'9989900';MaxRange:'9999999';Data:7),

  (Prefix:'978-2';Grp:French;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-2';Grp:French;MinRange:'2000000';MaxRange:'3499999';Data:3),
  (Prefix:'978-2';Grp:French;MinRange:'3500000';MaxRange:'3999999';Data:5),
  (Prefix:'978-2';Grp:French;MinRange:'4000000';MaxRange:'4869999';Data:3),
  (Prefix:'978-2';Grp:French;MinRange:'4870000';MaxRange:'4949999';Data:6),
  (Prefix:'978-2';Grp:French;MinRange:'4950000';MaxRange:'4959999';Data:3),
  (Prefix:'978-2';Grp:French;MinRange:'4960000';MaxRange:'4966999';Data:4),
  (Prefix:'978-2';Grp:French;MinRange:'4967000';MaxRange:'4969999';Data:5),
  (Prefix:'978-2';Grp:French;MinRange:'4970000';MaxRange:'5279999';Data:3),
  (Prefix:'978-2';Grp:French;MinRange:'5280000';MaxRange:'5299999';Data:4),
  (Prefix:'978-2';Grp:French;MinRange:'5300000';MaxRange:'6999999';Data:3),
  (Prefix:'978-2';Grp:French;MinRange:'7000000';MaxRange:'8399999';Data:4),
  (Prefix:'978-2';Grp:French;MinRange:'8400000';MaxRange:'8999999';Data:5),
  (Prefix:'978-2';Grp:French;MinRange:'9000000';MaxRange:'9197999';Data:6),
  (Prefix:'978-2';Grp:French;MinRange:'9198000';MaxRange:'9198099';Data:5),
  (Prefix:'978-2';Grp:French;MinRange:'9198100';MaxRange:'9199429';Data:6),
  (Prefix:'978-2';Grp:French;MinRange:'9199430';MaxRange:'9199689';Data:7),
  (Prefix:'978-2';Grp:French;MinRange:'9199690';MaxRange:'9499999';Data:6),
  (Prefix:'978-2';Grp:French;MinRange:'9500000';MaxRange:'9999999';Data:7),

  (Prefix:'978-3';Grp:German;MinRange:'0000000';MaxRange:'0299999';Data:2),
  (Prefix:'978-3';Grp:German;MinRange:'0300000';MaxRange:'0339999';Data:3),
  (Prefix:'978-3';Grp:German;MinRange:'0340000';MaxRange:'0369999';Data:4),
  (Prefix:'978-3';Grp:German;MinRange:'0370000';MaxRange:'0399999';Data:5),
  (Prefix:'978-3';Grp:German;MinRange:'0400000';MaxRange:'1999999';Data:2),
  (Prefix:'978-3';Grp:German;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-3';Grp:German;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-3';Grp:German;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-3';Grp:German;MinRange:'9000000';MaxRange:'9499999';Data:6),
  (Prefix:'978-3';Grp:German;MinRange:'9500000';MaxRange:'9539999';Data:7),
  (Prefix:'978-3';Grp:German;MinRange:'9540000';MaxRange:'9699999';Data:5),
  (Prefix:'978-3';Grp:German;MinRange:'9700000';MaxRange:'9849999';Data:7),
  (Prefix:'978-3';Grp:German;MinRange:'9850000';MaxRange:'9999999';Data:5),

  (Prefix:'978-4';Grp:Japan;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-4';Grp:Japan;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-4';Grp:Japan;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-4';Grp:Japan;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-4';Grp:Japan;MinRange:'9000000';MaxRange:'9499999';Data:6),
  (Prefix:'978-4';Grp:Japan;MinRange:'9500000';MaxRange:'9999999';Data:7),

  (Prefix:'978-5';Grp:exURSS;MinRange:'0000000';MaxRange:'0049999';Data:5),
  (Prefix:'978-5';Grp:exURSS;MinRange:'0050000';MaxRange:'0099999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'0100000';MaxRange:'1999999';Data:2),
  (Prefix:'978-5';Grp:exURSS;MinRange:'2000000';MaxRange:'3619999';Data:3),
  (Prefix:'978-5';Grp:exURSS;MinRange:'3620000';MaxRange:'3623999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'3624000';MaxRange:'3629999';Data:5),
  (Prefix:'978-5';Grp:exURSS;MinRange:'3630000';MaxRange:'4209999';Data:3),
  (Prefix:'978-5';Grp:exURSS;MinRange:'4210000';MaxRange:'4299999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'4300000';MaxRange:'4309999';Data:3),
  (Prefix:'978-5';Grp:exURSS;MinRange:'4310000';MaxRange:'4399999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'4400000';MaxRange:'4409999';Data:3),
  (Prefix:'978-5';Grp:exURSS;MinRange:'4410000';MaxRange:'4499999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'4500000';MaxRange:'6039999';Data:3),
  (Prefix:'978-5';Grp:exURSS;MinRange:'6040000';MaxRange:'6049999';Data:7),
  (Prefix:'978-5';Grp:exURSS;MinRange:'6050000';MaxRange:'6999999';Data:3),
  (Prefix:'978-5';Grp:exURSS;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9000000';MaxRange:'9099999';Data:6),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9100000';MaxRange:'9199999';Data:5),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9200000';MaxRange:'9299999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9300000';MaxRange:'9499999';Data:5),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9500000';MaxRange:'9500999';Data:7),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9501000';MaxRange:'9799999';Data:4),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9800000';MaxRange:'9899999';Data:5),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9900000';MaxRange:'9909999';Data:7),
  (Prefix:'978-5';Grp:exURSS;MinRange:'9910000';MaxRange:'9999999';Data:4),

  (Prefix:'978-600';Grp:Iran;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-600';Grp:Iran;MinRange:'1000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-600';Grp:Iran;MinRange:'5000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-600';Grp:Iran;MinRange:'9000000';MaxRange:'9867999';Data:5),
  (Prefix:'978-600';Grp:Iran;MinRange:'9868000';MaxRange:'9929999';Data:4),
  (Prefix:'978-600';Grp:Iran;MinRange:'9930000';MaxRange:'9959999';Data:3),
  (Prefix:'978-600';Grp:Iran;MinRange:'9960000';MaxRange:'9999999';Data:5),

  (Prefix:'978-601';Grp:Kazakhstan;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-601';Grp:Kazakhstan;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-601';Grp:Kazakhstan;MinRange:'7000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-601';Grp:Kazakhstan;MinRange:'8000000';MaxRange:'8499999';Data:5),
  (Prefix:'978-601';Grp:Kazakhstan;MinRange:'8500000';MaxRange:'9999999';Data:2),

  (Prefix:'978-602';Grp:Indonesia;MinRange:'0000000';MaxRange:'0699999';Data:2),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'0700000';MaxRange:'1399999';Data:4),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'1400000';MaxRange:'1499999';Data:5),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'1500000';MaxRange:'1699999';Data:4),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'1700000';MaxRange:'1999999';Data:5),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'2000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'5000000';MaxRange:'5399999';Data:5),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'5400000';MaxRange:'5999999';Data:4),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'6000000';MaxRange:'6199999';Data:5),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'6200000';MaxRange:'6999999';Data:4),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'7000000';MaxRange:'7499999';Data:5),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'7500000';MaxRange:'9499999';Data:4),
  (Prefix:'978-602';Grp:Indonesia;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-603';Grp:SaudiArabia;MinRange:'0000000';MaxRange:'0499999';Data:2),
  (Prefix:'978-603';Grp:SaudiArabia;MinRange:'0500000';MaxRange:'4999999';Data:2),
  (Prefix:'978-603';Grp:SaudiArabia;MinRange:'5000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-603';Grp:SaudiArabia;MinRange:'8000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-603';Grp:SaudiArabia;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-604';Grp:Vietnam;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'4000000';MaxRange:'4699999';Data:2),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'4700000';MaxRange:'4979999';Data:3),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'4980000';MaxRange:'4999999';Data:4),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'5000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'9000000';MaxRange:'9799999';Data:3),
  (Prefix:'978-604';Grp:Vietnam;MinRange:'9800000';MaxRange:'9999999';Data:4),

  (Prefix:'978-605';Grp:Turkey;MinRange:'0000000';MaxRange:'0299999';Data:2),
  (Prefix:'978-605';Grp:Turkey;MinRange:'0300000';MaxRange:'0399999';Data:3),
  (Prefix:'978-605';Grp:Turkey;MinRange:'0400000';MaxRange:'0599999';Data:2),
  (Prefix:'978-605';Grp:Turkey;MinRange:'0600000';MaxRange:'0699999';Data:5),
  (Prefix:'978-605';Grp:Turkey;MinRange:'0700000';MaxRange:'0999999';Data:2),
  (Prefix:'978-605';Grp:Turkey;MinRange:'1000000';MaxRange:'1999999';Data:3),
  (Prefix:'978-605';Grp:Turkey;MinRange:'2000000';MaxRange:'2399999';Data:4),
  (Prefix:'978-605';Grp:Turkey;MinRange:'2400000';MaxRange:'3999999';Data:3),
  (Prefix:'978-605';Grp:Turkey;MinRange:'4000000';MaxRange:'5999999';Data:4),
  (Prefix:'978-605';Grp:Turkey;MinRange:'6000000';MaxRange:'7499999';Data:5),
  (Prefix:'978-605';Grp:Turkey;MinRange:'7500000';MaxRange:'7999999';Data:4),
  (Prefix:'978-605';Grp:Turkey;MinRange:'8000000';MaxRange:'8999999';Data:5),
  (Prefix:'978-605';Grp:Turkey;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-606';Grp:Romania;MinRange:'0000000';MaxRange:'0999999';Data:3),
  (Prefix:'978-606';Grp:Romania;MinRange:'1000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-606';Grp:Romania;MinRange:'5000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-606';Grp:Romania;MinRange:'8000000';MaxRange:'9099999';Data:4),
  (Prefix:'978-606';Grp:Romania;MinRange:'9100000';MaxRange:'9199999';Data:3),
  (Prefix:'978-606';Grp:Romania;MinRange:'9200000';MaxRange:'9599999';Data:5),
  (Prefix:'978-606';Grp:Romania;MinRange:'9600000';MaxRange:'9749999';Data:4),
  (Prefix:'978-606';Grp:Romania;MinRange:'9750000';MaxRange:'9999999';Data:3),

  (Prefix:'978-607';Grp:Mexico;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-607';Grp:Mexico;MinRange:'4000000';MaxRange:'5929999';Data:3),
  (Prefix:'978-607';Grp:Mexico;MinRange:'5930000';MaxRange:'5999999';Data:5),
  (Prefix:'978-607';Grp:Mexico;MinRange:'6000000';MaxRange:'7499999';Data:3),
  (Prefix:'978-607';Grp:Mexico;MinRange:'7500000';MaxRange:'9499999';Data:4),
  (Prefix:'978-607';Grp:Mexico;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-608';Grp:NorthMacedonia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-608';Grp:NorthMacedonia;MinRange:'1000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-608';Grp:NorthMacedonia;MinRange:'2000000';MaxRange:'4499999';Data:3),
  (Prefix:'978-608';Grp:NorthMacedonia;MinRange:'4500000';MaxRange:'6499999';Data:4),
  (Prefix:'978-608';Grp:NorthMacedonia;MinRange:'6500000';MaxRange:'6999999';Data:5),
  (Prefix:'978-608';Grp:NorthMacedonia;MinRange:'7000000';MaxRange:'9999999';Data:1),

  (Prefix:'978-609';Grp:Lithuania;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-609';Grp:Lithuania;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-609';Grp:Lithuania;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-609';Grp:Lithuania;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-611';Grp:Thailand;MinRange:'0000000';MaxRange:'9999999';Data:0),

  (Prefix:'978-612';Grp:Peru;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-612';Grp:Peru;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-612';Grp:Peru;MinRange:'4000000';MaxRange:'4499999';Data:4),
  (Prefix:'978-612';Grp:Peru;MinRange:'4500000';MaxRange:'4999999';Data:5),
  (Prefix:'978-612';Grp:Peru;MinRange:'5000000';MaxRange:'5149999';Data:4),
  (Prefix:'978-612';Grp:Peru;MinRange:'5150000';MaxRange:'9999999';Data:0),

  (Prefix:'978-613';Grp:Mauritius;MinRange:'0000000';MaxRange:'9999999';Data:1),

  (Prefix:'978-614';Grp:Lebanon;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-614';Grp:Lebanon;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-614';Grp:Lebanon;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-614';Grp:Lebanon;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-615';Grp:Hungary;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-615';Grp:Hungary;MinRange:'1000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-615';Grp:Hungary;MinRange:'5000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-615';Grp:Hungary;MinRange:'8000000';MaxRange:'8999999';Data:5),
  (Prefix:'978-615';Grp:Hungary;MinRange:'9000000';MaxRange:'9999999';Data:0),

  (Prefix:'978-616';Grp:Thailand;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-616';Grp:Thailand;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-616';Grp:Thailand;MinRange:'7000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-616';Grp:Thailand;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-617';Grp:Ukraine;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-617';Grp:Ukraine;MinRange:'5000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-617';Grp:Ukraine;MinRange:'7000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-617';Grp:Ukraine;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-618';Grp:Greece;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-618';Grp:Greece;MinRange:'2000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-618';Grp:Greece;MinRange:'5000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-618';Grp:Greece;MinRange:'8000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-619';Grp:Bulgaria;MinRange:'0000000';MaxRange:'1499999';Data:2),
  (Prefix:'978-619';Grp:Bulgaria;MinRange:'1500000';MaxRange:'6999999';Data:3),
  (Prefix:'978-619';Grp:Bulgaria;MinRange:'7000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-619';Grp:Bulgaria;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-620';Grp:Mauritius;MinRange:'0000000';MaxRange:'9999999';Data:1),

  (Prefix:'978-621';Grp:Philippines;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-621';Grp:Philippines;MinRange:'3000000';MaxRange:'3999999';Data:0),
  (Prefix:'978-621';Grp:Philippines;MinRange:'4000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-621';Grp:Philippines;MinRange:'6000000';MaxRange:'7999999';Data:0),
  (Prefix:'978-621';Grp:Philippines;MinRange:'8000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-621';Grp:Philippines;MinRange:'9000000';MaxRange:'9499999';Data:0),
  (Prefix:'978-621';Grp:Philippines;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-622';Grp:Iran;MinRange:'0000000';MaxRange:'1099999';Data:2),
  (Prefix:'978-622';Grp:Iran;MinRange:'1100000';MaxRange:'1999999';Data:0),
  (Prefix:'978-622';Grp:Iran;MinRange:'2000000';MaxRange:'4249999';Data:3),
  (Prefix:'978-622';Grp:Iran;MinRange:'4250000';MaxRange:'5199999';Data:0),
  (Prefix:'978-622';Grp:Iran;MinRange:'5200000';MaxRange:'8499999';Data:4),
  (Prefix:'978-622';Grp:Iran;MinRange:'8500000';MaxRange:'8999999';Data:0),
  (Prefix:'978-622';Grp:Iran;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-623';Grp:Indonesia;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-623';Grp:Indonesia;MinRange:'1000000';MaxRange:'1299999';Data:0),
  (Prefix:'978-623';Grp:Indonesia;MinRange:'1300000';MaxRange:'4999999';Data:3),
  (Prefix:'978-623';Grp:Indonesia;MinRange:'5000000';MaxRange:'5249999';Data:0),
  (Prefix:'978-623';Grp:Indonesia;MinRange:'5250000';MaxRange:'8799999';Data:4),
  (Prefix:'978-623';Grp:Indonesia;MinRange:'8800000';MaxRange:'9999999';Data:5),

  (Prefix:'978-624';Grp:SriLanka;MinRange:'0000000';MaxRange:'0499999';Data:2),
  (Prefix:'978-624';Grp:SriLanka;MinRange:'0500000';MaxRange:'1999999';Data:0),
  (Prefix:'978-624';Grp:SriLanka;MinRange:'2000000';MaxRange:'2499999';Data:3),
  (Prefix:'978-624';Grp:SriLanka;MinRange:'2500000';MaxRange:'4999999';Data:0),
  (Prefix:'978-624';Grp:SriLanka;MinRange:'5000000';MaxRange:'6449999';Data:4),
  (Prefix:'978-624';Grp:SriLanka;MinRange:'6450000';MaxRange:'9449999';Data:0),
  (Prefix:'978-624';Grp:SriLanka;MinRange:'9450000';MaxRange:'9999999';Data:5),

  (Prefix:'978-625';Grp:Turkey;MinRange:'0000000';MaxRange:'0099999';Data:2),
  (Prefix:'978-625';Grp:Turkey;MinRange:'0100000';MaxRange:'3649999';Data:0),
  (Prefix:'978-625';Grp:Turkey;MinRange:'3650000';MaxRange:'4429999';Data:3),
  (Prefix:'978-625';Grp:Turkey;MinRange:'4430000';MaxRange:'4449999';Data:5),
  (Prefix:'978-625';Grp:Turkey;MinRange:'4450000';MaxRange:'4499999';Data:3),
  (Prefix:'978-625';Grp:Turkey;MinRange:'4500000';MaxRange:'6349999';Data:0),
  (Prefix:'978-625';Grp:Turkey;MinRange:'6350000';MaxRange:'7793999';Data:4),
  (Prefix:'978-625';Grp:Turkey;MinRange:'7794000';MaxRange:'7794999';Data:5),
  (Prefix:'978-625';Grp:Turkey;MinRange:'7795000';MaxRange:'8499999';Data:4),
  (Prefix:'978-625';Grp:Turkey;MinRange:'8500000';MaxRange:'9899999';Data:0),
  (Prefix:'978-625';Grp:Turkey;MinRange:'9900000';MaxRange:'9999999';Data:5),

  (Prefix:'978-626';Grp:Taiwan;MinRange:'0000000';MaxRange:'0499999';Data:2),
  (Prefix:'978-626';Grp:Taiwan;MinRange:'0500000';MaxRange:'2999999';Data:0),
  (Prefix:'978-626';Grp:Taiwan;MinRange:'3000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-626';Grp:Taiwan;MinRange:'5000000';MaxRange:'6999999';Data:0),
  (Prefix:'978-626';Grp:Taiwan;MinRange:'7000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-626';Grp:Taiwan;MinRange:'8000000';MaxRange:'9499999';Data:0),
  (Prefix:'978-626';Grp:Taiwan;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-627';Grp:Pakistan;MinRange:'0000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-627';Grp:Pakistan;MinRange:'3000000';MaxRange:'3199999';Data:2),
  (Prefix:'978-627';Grp:Pakistan;MinRange:'3200000';MaxRange:'4999999';Data:0),
  (Prefix:'978-627';Grp:Pakistan;MinRange:'5000000';MaxRange:'5249999';Data:3),
  (Prefix:'978-627';Grp:Pakistan;MinRange:'5250000';MaxRange:'7499999';Data:0),
  (Prefix:'978-627';Grp:Pakistan;MinRange:'7500000';MaxRange:'7999999';Data:4),
  (Prefix:'978-627';Grp:Pakistan;MinRange:'8000000';MaxRange:'9999999';Data:0),

  (Prefix:'978-628';Grp:Colombia;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-628';Grp:Colombia;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-628';Grp:Colombia;MinRange:'5000000';MaxRange:'5499999';Data:3),
  (Prefix:'978-628';Grp:Colombia;MinRange:'5500000';MaxRange:'7499999';Data:0),
  (Prefix:'978-628';Grp:Colombia;MinRange:'7500000';MaxRange:'8499999';Data:4),
  (Prefix:'978-628';Grp:Colombia;MinRange:'8500000';MaxRange:'9499999';Data:0),
  (Prefix:'978-628';Grp:Colombia;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-629';Grp:Malaysia;MinRange:'0000000';MaxRange:'0299999';Data:2),
  (Prefix:'978-629';Grp:Malaysia;MinRange:'0300000';MaxRange:'4699999';Data:0),
  (Prefix:'978-629';Grp:Malaysia;MinRange:'4700000';MaxRange:'4999999';Data:3),
  (Prefix:'978-629';Grp:Malaysia;MinRange:'5000000';MaxRange:'7499999';Data:0),
  (Prefix:'978-629';Grp:Malaysia;MinRange:'7500000';MaxRange:'7999999';Data:4),
  (Prefix:'978-629';Grp:Malaysia;MinRange:'8000000';MaxRange:'9649999';Data:0),
  (Prefix:'978-629';Grp:Malaysia;MinRange:'9650000';MaxRange:'9999999';Data:5),

  (Prefix:'978-630';Grp:Romania;MinRange:'0000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-630';Grp:Romania;MinRange:'3000000';MaxRange:'3499999';Data:3),
  (Prefix:'978-630';Grp:Romania;MinRange:'3500000';MaxRange:'6499999';Data:0),
  (Prefix:'978-630';Grp:Romania;MinRange:'6500000';MaxRange:'6849999';Data:4),
  (Prefix:'978-630';Grp:Romania;MinRange:'6850000';MaxRange:'9999999';Data:0),

  (Prefix:'978-631';Grp:Argentina;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-631';Grp:Argentina;MinRange:'1000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-631';Grp:Argentina;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-631';Grp:Argentina;MinRange:'4000000';MaxRange:'6499999';Data:0),
  (Prefix:'978-631';Grp:Argentina;MinRange:'6500000';MaxRange:'7499999';Data:4),
  (Prefix:'978-631';Grp:Argentina;MinRange:'7500000';MaxRange:'8999999';Data:0),
  (Prefix:'978-631';Grp:Argentina;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-65';Grp:Brazil;MinRange:'0000000';MaxRange:'0199999';Data:2),
  (Prefix:'978-65';Grp:Brazil;MinRange:'0200000';MaxRange:'2499999';Data:0),
  (Prefix:'978-65';Grp:Brazil;MinRange:'2500000';MaxRange:'2999999';Data:3),
  (Prefix:'978-65';Grp:Brazil;MinRange:'3000000';MaxRange:'3029999';Data:3),
  (Prefix:'978-65';Grp:Brazil;MinRange:'3030000';MaxRange:'4999999';Data:0),
  (Prefix:'978-65';Grp:Brazil;MinRange:'5000000';MaxRange:'5129999';Data:4),
  (Prefix:'978-65';Grp:Brazil;MinRange:'5130000';MaxRange:'5349999';Data:0),
  (Prefix:'978-65';Grp:Brazil;MinRange:'5350000';MaxRange:'6149999';Data:4),
  (Prefix:'978-65';Grp:Brazil;MinRange:'6150000';MaxRange:'7999999';Data:0),
  (Prefix:'978-65';Grp:Brazil;MinRange:'8000000';MaxRange:'8182499';Data:5),
  (Prefix:'978-65';Grp:Brazil;MinRange:'8182500';MaxRange:'8449999';Data:0),
  (Prefix:'978-65';Grp:Brazil;MinRange:'8450000';MaxRange:'8999999';Data:5),
  (Prefix:'978-65';Grp:Brazil;MinRange:'9000000';MaxRange:'9024499';Data:6),
  (Prefix:'978-65';Grp:Brazil;MinRange:'9024500';MaxRange:'9799999';Data:0),
  (Prefix:'978-65';Grp:Brazil;MinRange:'9800000';MaxRange:'9999999';Data:6),

  (Prefix:'978-7';Grp:China;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-7';Grp:China;MinRange:'1000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-7';Grp:China;MinRange:'5000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-7';Grp:China;MinRange:'8000000';MaxRange:'8999999';Data:5),
  (Prefix:'978-7';Grp:China;MinRange:'9000000';MaxRange:'9999999';Data:6),

  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'2000000';MaxRange:'5299999';Data:3),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'5300000';MaxRange:'5499999';Data:5),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'5500000';MaxRange:'6899999';Data:3),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'6900000';MaxRange:'6999999';Data:5),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'9000000';MaxRange:'9989999';Data:6),
  (Prefix:'978-80';Grp:exCzechoslovakia;MinRange:'9990000';MaxRange:'9999999';Data:5),

  (Prefix:'978-81';Grp:India;MinRange:'0000000';MaxRange:'1899999';Data:2),
  (Prefix:'978-81';Grp:India;MinRange:'1900000';MaxRange:'1999999';Data:5),
  (Prefix:'978-81';Grp:India;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-81';Grp:India;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-81';Grp:India;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-81';Grp:India;MinRange:'9000000';MaxRange:'9999999';Data:6),

  (Prefix:'978-82';Grp:Norway;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-82';Grp:Norway;MinRange:'2000000';MaxRange:'6899999';Data:3),
  (Prefix:'978-82';Grp:Norway;MinRange:'6900000';MaxRange:'6999999';Data:6),
  (Prefix:'978-82';Grp:Norway;MinRange:'7000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-82';Grp:Norway;MinRange:'9000000';MaxRange:'9899999';Data:5),
  (Prefix:'978-82';Grp:Norway;MinRange:'9900000';MaxRange:'9999999';Data:6),

  (Prefix:'978-83';Grp:Poland;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-83';Grp:Poland;MinRange:'2000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-83';Grp:Poland;MinRange:'6000000';MaxRange:'6999999';Data:5),
  (Prefix:'978-83';Grp:Poland;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-83';Grp:Poland;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-83';Grp:Poland;MinRange:'9000000';MaxRange:'9999999';Data:6),

  (Prefix:'978-84';Grp:Spain;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-83';Grp:Spain;MinRange:'1000000';MaxRange:'1049999';Data:5),
  (Prefix:'978-83';Grp:Spain;MinRange:'1050000';MaxRange:'1199999';Data:4),
  (Prefix:'978-83';Grp:Spain;MinRange:'1200000';MaxRange:'1299999';Data:6),
  (Prefix:'978-83';Grp:Spain;MinRange:'1300000';MaxRange:'1399999';Data:4),
  (Prefix:'978-83';Grp:Spain;MinRange:'1400000';MaxRange:'1499999';Data:3),
  (Prefix:'978-83';Grp:Spain;MinRange:'1500000';MaxRange:'1999999';Data:5),
  (Prefix:'978-83';Grp:Spain;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-83';Grp:Spain;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-83';Grp:Spain;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-83';Grp:Spain;MinRange:'9000000';MaxRange:'9199999';Data:4),
  (Prefix:'978-83';Grp:Spain;MinRange:'9200000';MaxRange:'9239999';Data:6),
  (Prefix:'978-83';Grp:Spain;MinRange:'9240000';MaxRange:'9299999';Data:5),
  (Prefix:'978-83';Grp:Spain;MinRange:'9300000';MaxRange:'9499999';Data:6),
  (Prefix:'978-83';Grp:Spain;MinRange:'9500000';MaxRange:'9699999';Data:5),
  (Prefix:'978-83';Grp:Spain;MinRange:'9700000';MaxRange:'9999999';Data:4),

  (Prefix:'978-85';Grp:Brazil;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-83';Grp:Brazil;MinRange:'2000000';MaxRange:'4549999';Data:3),
  (Prefix:'978-83';Grp:Brazil;MinRange:'4550000';MaxRange:'4552999';Data:6),
  (Prefix:'978-83';Grp:Brazil;MinRange:'4553000';MaxRange:'4559999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'4560000';MaxRange:'5289999';Data:3),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5290000';MaxRange:'5319999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5320000';MaxRange:'5339999';Data:4),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5340000';MaxRange:'5399999';Data:3),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5400000';MaxRange:'5402999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5403000';MaxRange:'5403999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5404000';MaxRange:'5404999';Data:6),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5405000';MaxRange:'5408999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5409000';MaxRange:'5409999';Data:6),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5410000';MaxRange:'5439999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5440000';MaxRange:'5479999';Data:4),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5480000';MaxRange:'5499999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'5500000';MaxRange:'5999999';Data:4),
  (Prefix:'978-83';Grp:Brazil;MinRange:'6000000';MaxRange:'6999999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-83';Grp:Brazil;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'9000000';MaxRange:'9249999';Data:6),
  (Prefix:'978-83';Grp:Brazil;MinRange:'9250000';MaxRange:'9449999';Data:5),
  (Prefix:'978-83';Grp:Brazil;MinRange:'9450000';MaxRange:'9599999';Data:4),
  (Prefix:'978-83';Grp:Brazil;MinRange:'9600000';MaxRange:'9799999';Data:2),
  (Prefix:'978-83';Grp:Brazil;MinRange:'9800000';MaxRange:'9999999';Data:5),

  (Prefix:'978-86';Grp:exYugoslavia;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-83';Grp:exYugoslavia;MinRange:'3000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-83';Grp:exYugoslavia;MinRange:'6000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-83';Grp:exYugoslavia;MinRange:'8000000';MaxRange:'8999999';Data:5),
  (Prefix:'978-83';Grp:exYugoslavia;MinRange:'9000000';MaxRange:'9999999';Data:6),

  (Prefix:'978-87';Grp:Denmark;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-83';Grp:Denmark;MinRange:'3000000';MaxRange:'3999999';Data:0),
  (Prefix:'978-83';Grp:Denmark;MinRange:'4000000';MaxRange:'6499999';Data:3),
  (Prefix:'978-83';Grp:Denmark;MinRange:'6500000';MaxRange:'6999999';Data:0),
  (Prefix:'978-83';Grp:Denmark;MinRange:'7000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-83';Grp:Denmark;MinRange:'8000000';MaxRange:'8499999';Data:0),
  (Prefix:'978-83';Grp:Denmark;MinRange:'8500000';MaxRange:'9499999';Data:5),
  (Prefix:'978-83';Grp:Denmark;MinRange:'9500000';MaxRange:'9699999';Data:0),
  (Prefix:'978-83';Grp:Denmark;MinRange:'9700000';MaxRange:'9999999';Data:6),

  (Prefix:'978-88';Grp:Italy;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-88';Grp:Italy;MinRange:'2000000';MaxRange:'3119999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'3120000';MaxRange:'3149999';Data:5),
  (Prefix:'978-88';Grp:Italy;MinRange:'3150000';MaxRange:'3189999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'3190000';MaxRange:'3229999';Data:5),
  (Prefix:'978-88';Grp:Italy;MinRange:'3230000';MaxRange:'3269999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'3270000';MaxRange:'3389999';Data:4),
  (Prefix:'978-88';Grp:Italy;MinRange:'3390000';MaxRange:'3609999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'3610000';MaxRange:'3629999';Data:4),
  (Prefix:'978-88';Grp:Italy;MinRange:'3630000';MaxRange:'5489999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'5490000';MaxRange:'5549999';Data:4),
  (Prefix:'978-88';Grp:Italy;MinRange:'5550000';MaxRange:'5999999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'6000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-88';Grp:Italy;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-88';Grp:Italy;MinRange:'9000000';MaxRange:'9099999';Data:6),
  (Prefix:'978-88';Grp:Italy;MinRange:'9100000';MaxRange:'9269999';Data:3),
  (Prefix:'978-88';Grp:Italy;MinRange:'9270000';MaxRange:'9399999';Data:4),
  (Prefix:'978-88';Grp:Italy;MinRange:'9400000';MaxRange:'9479999';Data:6),
  (Prefix:'978-88';Grp:Italy;MinRange:'9480000';MaxRange:'9999999';Data:5),

  (Prefix:'978-89';Grp:Korea;MinRange:'0000000';MaxRange:'2499999';Data:2),
  (Prefix:'978-89';Grp:Korea;MinRange:'2500000';MaxRange:'5499999';Data:3),
  (Prefix:'978-89';Grp:Korea;MinRange:'5500000';MaxRange:'8499999';Data:4),
  (Prefix:'978-89';Grp:Korea;MinRange:'8500000';MaxRange:'9499999';Data:5),
  (Prefix:'978-89';Grp:Korea;MinRange:'9500000';MaxRange:'9699999';Data:6),
  (Prefix:'978-89';Grp:Korea;MinRange:'9700000';MaxRange:'9899999';Data:5),
  (Prefix:'978-89';Grp:Korea;MinRange:'9900000';MaxRange:'9999999';Data:3),

  (Prefix:'978-90';Grp:Netherlands;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'2000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'5000000';MaxRange:'6999999';Data:4),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'7000000';MaxRange:'7999999';Data:5),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'8000000';MaxRange:'8499999';Data:6),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'8500000';MaxRange:'8999999';Data:4),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'9000000';MaxRange:'9099999';Data:2),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'9100000';MaxRange:'9399999';Data:0),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'9400000';MaxRange:'9499999';Data:2),
  (Prefix:'978-90';Grp:Netherlands;MinRange:'9500000';MaxRange:'9999999';Data:0),

  (Prefix:'978-91';Grp:Sweden;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-91';Grp:Sweden;MinRange:'2000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-91';Grp:Sweden;MinRange:'5000000';MaxRange:'6499999';Data:3),
  (Prefix:'978-91';Grp:Sweden;MinRange:'6500000';MaxRange:'6999999';Data:0),
  (Prefix:'978-91';Grp:Sweden;MinRange:'7000000';MaxRange:'8199999';Data:4),
  (Prefix:'978-91';Grp:Sweden;MinRange:'8200000';MaxRange:'8499999';Data:0),
  (Prefix:'978-91';Grp:Sweden;MinRange:'8500000';MaxRange:'9499999';Data:5),
  (Prefix:'978-91';Grp:Sweden;MinRange:'9500000';MaxRange:'9699999';Data:0),
  (Prefix:'978-91';Grp:Sweden;MinRange:'9700000';MaxRange:'9999999';Data:6),

  (Prefix:'978-92';Grp:NGOAndEU;MinRange:'0000000';MaxRange:'5999999';Data:1),
  (Prefix:'978-92';Grp:NGOAndEU;MinRange:'6000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-92';Grp:NGOAndEU;MinRange:'8000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-92';Grp:NGOAndEU;MinRange:'9000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-92';Grp:NGOAndEU;MinRange:'9500000';MaxRange:'9899999';Data:5),
  (Prefix:'978-92';Grp:NGOAndEU;MinRange:'9900000';MaxRange:'9999999';Data:6),

  (Prefix:'978-93';Grp:Inde;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-93';Grp:Inde;MinRange:'1000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-93';Grp:Inde;MinRange:'5000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-93';Grp:Inde;MinRange:'8000000';MaxRange:'9599999';Data:5),
  (Prefix:'978-93';Grp:Inde;MinRange:'9600000';MaxRange:'9999999';Data:6),

  (Prefix:'978-94';Grp:Netherlands;MinRange:'0000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-94';Grp:Netherlands;MinRange:'6000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-94';Grp:Netherlands;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-950';Grp:Argentina;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-950';Grp:Argentina;MinRange:'5000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-950';Grp:Argentina;MinRange:'9000000';MaxRange:'9899999';Data:4),
  (Prefix:'978-950';Grp:Argentina;MinRange:'9900000';MaxRange:'9999999';Data:5),

  (Prefix:'978-951';Grp:Finland;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-951';Grp:Finland;MinRange:'2000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-951';Grp:Finland;MinRange:'5500000';MaxRange:'8899999';Data:3),
  (Prefix:'978-951';Grp:Finland;MinRange:'8900000';MaxRange:'9499999';Data:4),
  (Prefix:'978-951';Grp:Finland;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-952';Grp:Finland;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-952';Grp:Finland;MinRange:'2000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-952';Grp:Finland;MinRange:'5000000';MaxRange:'5999999';Data:4),
  (Prefix:'978-952';Grp:Finland;MinRange:'6000000';MaxRange:'6499999';Data:2),
  (Prefix:'978-952';Grp:Finland;MinRange:'6500000';MaxRange:'6599999';Data:5),
  (Prefix:'978-952';Grp:Finland;MinRange:'6600000';MaxRange:'6699999';Data:4),
  (Prefix:'978-952';Grp:Finland;MinRange:'6700000';MaxRange:'6999999';Data:5),
  (Prefix:'978-952';Grp:Finland;MinRange:'7000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-952';Grp:Finland;MinRange:'8000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-952';Grp:Finland;MinRange:'9500000';MaxRange:'9899999';Data:4),
  (Prefix:'978-952';Grp:Finland;MinRange:'9900000';MaxRange:'9999999';Data:5),

  (Prefix:'978-953';Grp:Croatia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-953';Grp:Croatia;MinRange:'1000000';MaxRange:'1499999';Data:2),
  (Prefix:'978-953';Grp:Croatia;MinRange:'1500000';MaxRange:'4799999';Data:3),
  (Prefix:'978-953';Grp:Croatia;MinRange:'4800000';MaxRange:'4999999';Data:5),
  (Prefix:'978-953';Grp:Croatia;MinRange:'5000000';MaxRange:'5009999';Data:3),
  (Prefix:'978-953';Grp:Croatia;MinRange:'5010000';MaxRange:'5099999';Data:5),
  (Prefix:'978-953';Grp:Croatia;MinRange:'5100000';MaxRange:'5499999';Data:2),
  (Prefix:'978-953';Grp:Croatia;MinRange:'5500000';MaxRange:'5999999';Data:5),
  (Prefix:'978-953';Grp:Croatia;MinRange:'6000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-953';Grp:Croatia;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-954';Grp:Bulgaria;MinRange:'0000000';MaxRange:'2899999';Data:2),
  (Prefix:'978-954';Grp:Bulgaria;MinRange:'2900000';MaxRange:'2999999';Data:4),
  (Prefix:'978-954';Grp:Bulgaria;MinRange:'3000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-954';Grp:Bulgaria;MinRange:'8000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-954';Grp:Bulgaria;MinRange:'9000000';MaxRange:'9299999';Data:5),
  (Prefix:'978-954';Grp:Bulgaria;MinRange:'9300000';MaxRange:'9999999';Data:4),

  (Prefix:'978-955';Grp:SriLanka;MinRange:'0000000';MaxRange:'1999999';Data:4),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'2000000';MaxRange:'3399999';Data:2),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'3400000';MaxRange:'3549999';Data:4),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'3550000';MaxRange:'3599999';Data:5),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'3600000';MaxRange:'3799999';Data:4),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'3800000';MaxRange:'3899999';Data:5),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'3900000';MaxRange:'4099999';Data:4),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'4100000';MaxRange:'4499999';Data:5),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'4500000';MaxRange:'4999999';Data:4),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'5000000';MaxRange:'5499999';Data:5),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'5500000';MaxRange:'7109999';Data:3),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'7110000';MaxRange:'7149999';Data:5),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'7150000';MaxRange:'9499999';Data:4),
  (Prefix:'978-955';Grp:SriLanka;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-956';Grp:Chile;MinRange:'0000000';MaxRange:'0899999';Data:2),
  (Prefix:'978-956';Grp:Chile;MinRange:'0900000';MaxRange:'0999999';Data:5),
  (Prefix:'978-956';Grp:Chile;MinRange:'1000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-956';Grp:Chile;MinRange:'2000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-956';Grp:Chile;MinRange:'6000000';MaxRange:'6999999';Data:4),
  (Prefix:'978-956';Grp:Chile;MinRange:'7000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-957';Grp:Taiwan;MinRange:'0000000';MaxRange:'0299999';Data:2),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'0300000';MaxRange:'0499999';Data:4),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'0500000';MaxRange:'1999999';Data:2),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'2000000';MaxRange:'2099999';Data:4),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'2100000';MaxRange:'2799999';Data:2),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'2800000';MaxRange:'3099999';Data:5),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'3100000';MaxRange:'4399999';Data:2),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'4400000';MaxRange:'8199999';Data:3),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'8200000';MaxRange:'9699999';Data:4),
  (Prefix:'978-957';Grp:Taiwan;MinRange:'9700000';MaxRange:'9999999';Data:5),

  (Prefix:'978-958';Grp:Colombia;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-958';Grp:Colombia;MinRange:'5000000';MaxRange:'5099999';Data:3),
  (Prefix:'978-958';Grp:Colombia;MinRange:'5100000';MaxRange:'5199999';Data:4),
  (Prefix:'978-958';Grp:Colombia;MinRange:'5200000';MaxRange:'5399999';Data:5),
  (Prefix:'978-958';Grp:Colombia;MinRange:'5400000';MaxRange:'5599999';Data:4),
  (Prefix:'978-958';Grp:Colombia;MinRange:'5600000';MaxRange:'5999999';Data:5),
  (Prefix:'978-958';Grp:Colombia;MinRange:'6000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-958';Grp:Colombia;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-958';Grp:Colombia;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-959';Grp:Cuba;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-959';Grp:Cuba;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-959';Grp:Cuba;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-959';Grp:Cuba;MinRange:'8500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-960';Grp:Greece;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-960';Grp:Greece;MinRange:'2000000';MaxRange:'6599999';Data:3),
  (Prefix:'978-960';Grp:Greece;MinRange:'6600000';MaxRange:'6899999';Data:4),
  (Prefix:'978-960';Grp:Greece;MinRange:'6900000';MaxRange:'6999999';Data:3),
  (Prefix:'978-960';Grp:Greece;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-960';Grp:Greece;MinRange:'8500000';MaxRange:'9299999';Data:5),
  (Prefix:'978-960';Grp:Greece;MinRange:'9300000';MaxRange:'9399999';Data:2),
  (Prefix:'978-960';Grp:Greece;MinRange:'9400000';MaxRange:'9799999';Data:4),
  (Prefix:'978-960';Grp:Greece;MinRange:'9800000';MaxRange:'9999999';Data:5),

  (Prefix:'978-961';Grp:Slovenia;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-961';Grp:Slovenia;MinRange:'2000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-961';Grp:Slovenia;MinRange:'6000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-961';Grp:Slovenia;MinRange:'9000000';MaxRange:'9799999';Data:5),
  (Prefix:'978-961';Grp:Slovenia;MinRange:'9800000';MaxRange:'9999999';Data:0),

  (Prefix:'978-962';Grp:HongKong;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-962';Grp:HongKong;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-962';Grp:HongKong;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-962';Grp:HongKong;MinRange:'8500000';MaxRange:'8699999';Data:5),
  (Prefix:'978-962';Grp:HongKong;MinRange:'8700000';MaxRange:'8999999';Data:4),
  (Prefix:'978-962';Grp:HongKong;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-963';Grp:Hungary;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-963';Grp:Hungary;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-963';Grp:Hungary;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-963';Grp:Hungary;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-963';Grp:Hungary;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-964';Grp:Iran;MinRange:'0000000';MaxRange:'1499999';Data:2),
  (Prefix:'978-964';Grp:Iran;MinRange:'1500000';MaxRange:'2499999';Data:3),
  (Prefix:'978-964';Grp:Iran;MinRange:'2500000';MaxRange:'2999999';Data:4),
  (Prefix:'978-964';Grp:Iran;MinRange:'3000000';MaxRange:'5499999';Data:3),
  (Prefix:'978-964';Grp:Iran;MinRange:'5500000';MaxRange:'8999999';Data:4),
  (Prefix:'978-964';Grp:Iran;MinRange:'9000000';MaxRange:'9699999';Data:5),
  (Prefix:'978-964';Grp:Iran;MinRange:'9700000';MaxRange:'9899999';Data:3),
  (Prefix:'978-964';Grp:Iran;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-965';Grp:Israel;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-965';Grp:Israel;MinRange:'2000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-965';Grp:Israel;MinRange:'6000000';MaxRange:'6999999';Data:0),
  (Prefix:'978-965';Grp:Israel;MinRange:'7000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-965';Grp:Israel;MinRange:'8000000';MaxRange:'8999999';Data:0),
  (Prefix:'978-965';Grp:Israel;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-966';Grp:Ukraine;MinRange:'0000000';MaxRange:'1299999';Data:2),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'1300000';MaxRange:'1399999';Data:3),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'1400000';MaxRange:'1499999';Data:2),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'1500000';MaxRange:'1699999';Data:4),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'1700000';MaxRange:'1999999';Data:3),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'2000000';MaxRange:'2789999';Data:4),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'2790000';MaxRange:'2899999';Data:3),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'2900000';MaxRange:'2999999';Data:4),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'3000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'7000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'9000000';MaxRange:'9099999';Data:5),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'9100000';MaxRange:'9499999';Data:3),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'9500000';MaxRange:'9799999';Data:5),
  (Prefix:'978-966';Grp:Ukraine;MinRange:'9800000';MaxRange:'9999999';Data:3),

  (Prefix:'978-967';Grp:Malaysia;MinRange:'0000000';MaxRange:'0999999';Data:4),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'1000000';MaxRange:'1999999';Data:5),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'2000000';MaxRange:'2499999';Data:4),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'2500000';MaxRange:'2549999';Data:3),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'2550000';MaxRange:'2699999';Data:5),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'2700000';MaxRange:'2799999';Data:4),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'2800000';MaxRange:'2999999';Data:4),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'3000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'5000000';MaxRange:'5999999';Data:4),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'9000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'9900000';MaxRange:'9989999';Data:4),
  (Prefix:'978-967';Grp:Malaysia;MinRange:'9990000';MaxRange:'9999999';Data:5),

  (Prefix:'978-968';Grp:Mexico;MinRange:'0100000';MaxRange:'3999999';Data:2),
  (Prefix:'978-968';Grp:Mexico;MinRange:'4000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-968';Grp:Mexico;MinRange:'5000000';MaxRange:'7999999';Data:4),
  (Prefix:'978-968';Grp:Mexico;MinRange:'8000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-968';Grp:Mexico;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-969';Grp:Pakistan;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'2000000';MaxRange:'2099999';Data:2),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'2100000';MaxRange:'2199999';Data:3),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'2200000';MaxRange:'2299999';Data:4),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'2300000';MaxRange:'2399999';Data:5),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'2400000';MaxRange:'3999999';Data:2),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'4000000';MaxRange:'7499999';Data:3),
  (Prefix:'978-969';Grp:Pakistan;MinRange:'7500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-970';Grp:Mexico;MinRange:'0100000';MaxRange:'5999999';Data:2),
  (Prefix:'978-970';Grp:Mexico;MinRange:'6000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-970';Grp:Mexico;MinRange:'9000000';MaxRange:'9099999';Data:4),
  (Prefix:'978-970';Grp:Mexico;MinRange:'9100000';MaxRange:'9699999';Data:5),
  (Prefix:'978-970';Grp:Mexico;MinRange:'9700000';MaxRange:'9999999';Data:4),

  (Prefix:'978-971';Grp:Philippines;MinRange:'0000000';MaxRange:'0159999';Data:3),
  (Prefix:'978-971';Grp:Philippines;MinRange:'0160000';MaxRange:'0199999';Data:4),
  (Prefix:'978-971';Grp:Philippines;MinRange:'0200000';MaxRange:'0299999';Data:2),
  (Prefix:'978-971';Grp:Philippines;MinRange:'0300000';MaxRange:'0599999';Data:4),
  (Prefix:'978-971';Grp:Philippines;MinRange:'0600000';MaxRange:'4999999';Data:2),
  (Prefix:'978-971';Grp:Philippines;MinRange:'5000000';MaxRange:'8499999';Data:3),
  (Prefix:'978-971';Grp:Philippines;MinRange:'8500000';MaxRange:'9099999';Data:4),
  (Prefix:'978-971';Grp:Philippines;MinRange:'9100000';MaxRange:'9599999';Data:5),
  (Prefix:'978-971';Grp:Philippines;MinRange:'9600000';MaxRange:'9699999';Data:4),
  (Prefix:'978-971';Grp:Philippines;MinRange:'9700000';MaxRange:'9899999';Data:2),
  (Prefix:'978-971';Grp:Philippines;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-972';Grp:Portugal;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-972';Grp:Portugal;MinRange:'2000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-972';Grp:Portugal;MinRange:'5500000';MaxRange:'7999999';Data:3),
  (Prefix:'978-972';Grp:Portugal;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-972';Grp:Portugal;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-973';Grp:Romania;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-973';Grp:Romania;MinRange:'1000000';MaxRange:'1699999';Data:3),
  (Prefix:'978-973';Grp:Romania;MinRange:'1700000';MaxRange:'1999999';Data:4),
  (Prefix:'978-973';Grp:Romania;MinRange:'2000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-973';Grp:Romania;MinRange:'5500000';MaxRange:'7599999';Data:3),
  (Prefix:'978-973';Grp:Romania;MinRange:'7600000';MaxRange:'8499999';Data:4),
  (Prefix:'978-973';Grp:Romania;MinRange:'8500000';MaxRange:'8899999';Data:5),
  (Prefix:'978-973';Grp:Romania;MinRange:'8900000';MaxRange:'9499999';Data:4),
  (Prefix:'978-973';Grp:Romania;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-974';Grp:Thailand;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-974';Grp:Thailand;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-974';Grp:Thailand;MinRange:'7000000';MaxRange:'8499999';Data:4),
  (Prefix:'978-974';Grp:Thailand;MinRange:'8500000';MaxRange:'8999999';Data:5),
  (Prefix:'978-974';Grp:Thailand;MinRange:'9000000';MaxRange:'9499999';Data:5),
  (Prefix:'978-974';Grp:Thailand;MinRange:'9500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-975';Grp:Turkey;MinRange:'0000000';MaxRange:'0199999';Data:5),
  (Prefix:'978-975';Grp:Turkey;MinRange:'0200000';MaxRange:'2399999';Data:2),
  (Prefix:'978-975';Grp:Turkey;MinRange:'2400000';MaxRange:'2499999';Data:4),
  (Prefix:'978-975';Grp:Turkey;MinRange:'2500000';MaxRange:'5999999';Data:3),
  (Prefix:'978-975';Grp:Turkey;MinRange:'6000000';MaxRange:'9199999';Data:4),
  (Prefix:'978-975';Grp:Turkey;MinRange:'9200000';MaxRange:'9899999';Data:5),
  (Prefix:'978-975';Grp:Turkey;MinRange:'9900000';MaxRange:'9999999';Data:3),

  (Prefix:'978-976';Grp:Caribbean;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-976';Grp:Caribbean;MinRange:'4000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-976';Grp:Caribbean;MinRange:'6000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-976';Grp:Caribbean;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-976';Grp:Caribbean;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-977';Grp:Egypt;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-977';Grp:Egypt;MinRange:'2000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-977';Grp:Egypt;MinRange:'5000000';MaxRange:'6999999';Data:4),
  (Prefix:'978-977';Grp:Egypt;MinRange:'7000000';MaxRange:'8499999';Data:3),
  (Prefix:'978-977';Grp:Egypt;MinRange:'8500000';MaxRange:'8929999';Data:5),
  (Prefix:'978-977';Grp:Egypt;MinRange:'8930000';MaxRange:'8949999';Data:3),
  (Prefix:'978-977';Grp:Egypt;MinRange:'8950000';MaxRange:'8999999';Data:4),
  (Prefix:'978-977';Grp:Egypt;MinRange:'9000000';MaxRange:'9899999';Data:2),
  (Prefix:'978-977';Grp:Egypt;MinRange:'9900000';MaxRange:'9999999';Data:3),

  (Prefix:'978-978';Grp:Nigeria;MinRange:'0000000';MaxRange:'1999999';Data:3),
  (Prefix:'978-978';Grp:Nigeria;MinRange:'2000000';MaxRange:'2999999';Data:4),
  (Prefix:'978-978';Grp:Nigeria;MinRange:'3000000';MaxRange:'7799999';Data:5),
  (Prefix:'978-978';Grp:Nigeria;MinRange:'7800000';MaxRange:'7999999';Data:3),
  (Prefix:'978-978';Grp:Nigeria;MinRange:'8000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-978';Grp:Nigeria;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-979';Grp:Indonesia;MinRange:'0000000';MaxRange:'0999999';Data:3),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'1000000';MaxRange:'1499999';Data:4),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'1500000';MaxRange:'1999999';Data:5),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'2000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'3000000';MaxRange:'3999999';Data:4),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-979';Grp:Indonesia;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-980';Grp:Venezuela;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-980';Grp:Venezuela;MinRange:'2000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-980';Grp:Venezuela;MinRange:'6000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-981';Grp:Singapore;MinRange:'0000000';MaxRange:'1699999';Data:2),
  (Prefix:'978-981';Grp:Singapore;MinRange:'1700000';MaxRange:'1799999';Data:5),
  (Prefix:'978-981';Grp:Singapore;MinRange:'1800000';MaxRange:'1999999';Data:2),
  (Prefix:'978-981';Grp:Singapore;MinRange:'2000000';MaxRange:'2999999';Data:3),
  (Prefix:'978-981';Grp:Singapore;MinRange:'3000000';MaxRange:'3099999';Data:4),
  (Prefix:'978-981';Grp:Singapore;MinRange:'3100000';MaxRange:'3999999';Data:3),
  (Prefix:'978-981';Grp:Singapore;MinRange:'4000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-981';Grp:Singapore;MinRange:'9500000';MaxRange:'9899999';Data:0),
  (Prefix:'978-981';Grp:Singapore;MinRange:'9900000';MaxRange:'9999999';Data:2),

  (Prefix:'978-982';Grp:SouthPacific;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-982';Grp:SouthPacific;MinRange:'1000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-982';Grp:SouthPacific;MinRange:'7000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-982';Grp:SouthPacific;MinRange:'9000000';MaxRange:'9799999';Data:4),
  (Prefix:'978-982';Grp:SouthPacific;MinRange:'9800000';MaxRange:'9999999';Data:5),

  (Prefix:'978-983';Grp:Malaysia;MinRange:'0000000';MaxRange:'0199999';Data:2),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'0200000';MaxRange:'1999999';Data:3),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'2000000';MaxRange:'3999999';Data:4),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'4000000';MaxRange:'4499999';Data:5),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'4500000';MaxRange:'4999999';Data:2),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'8000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'9000000';MaxRange:'9899999';Data:4),
  (Prefix:'978-983';Grp:Malaysia;MinRange:'9900000';MaxRange:'9999999';Data:5),

  (Prefix:'978-984';Grp:Bangladesh;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-984';Grp:Bangladesh;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-984';Grp:Bangladesh;MinRange:'8000000';MaxRange:'8999999';Data:4),
  (Prefix:'978-984';Grp:Bangladesh;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-985';Grp:Belarus;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-985';Grp:Belarus;MinRange:'4000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-985';Grp:Belarus;MinRange:'6000000';MaxRange:'8799999';Data:4),
  (Prefix:'978-985';Grp:Belarus;MinRange:'8800000';MaxRange:'8999999';Data:3),
  (Prefix:'978-985';Grp:Belarus;MinRange:'9000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-986';Grp:Taiwan;MinRange:'0000000';MaxRange:'0599999';Data:2),
  (Prefix:'978-986';Grp:Taiwan;MinRange:'0600000';MaxRange:'0699999';Data:5),
  (Prefix:'978-986';Grp:Taiwan;MinRange:'0700000';MaxRange:'0799999';Data:4),
  (Prefix:'978-986';Grp:Taiwan;MinRange:'0800000';MaxRange:'1199999';Data:2),
  (Prefix:'978-986';Grp:Taiwan;MinRange:'1200000';MaxRange:'5399999';Data:3),
  (Prefix:'978-986';Grp:Taiwan;MinRange:'5400000';MaxRange:'7999999';Data:4),
  (Prefix:'978-986';Grp:Taiwan;MinRange:'8000000';MaxRange:'9999999';Data:5),

  (Prefix:'978-987';Grp:Argentina;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-987';Grp:Argentina;MinRange:'1000000';MaxRange:'1999999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'2000000';MaxRange:'2999999';Data:5),
  (Prefix:'978-987';Grp:Argentina;MinRange:'3000000';MaxRange:'3599999';Data:2),
  (Prefix:'978-987';Grp:Argentina;MinRange:'3600000';MaxRange:'4199999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'4200000';MaxRange:'4399999';Data:2),
  (Prefix:'978-987';Grp:Argentina;MinRange:'4400000';MaxRange:'4499999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'4500000';MaxRange:'4899999';Data:5),
  (Prefix:'978-987';Grp:Argentina;MinRange:'4900000';MaxRange:'4999999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'5000000';MaxRange:'8249999';Data:3),
  (Prefix:'978-987';Grp:Argentina;MinRange:'8250000';MaxRange:'8279999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'8280000';MaxRange:'8299999';Data:5),
  (Prefix:'978-987';Grp:Argentina;MinRange:'8300000';MaxRange:'8499999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'8500000';MaxRange:'8899999';Data:2),
  (Prefix:'978-987';Grp:Argentina;MinRange:'8900000';MaxRange:'9499999';Data:4),
  (Prefix:'978-987';Grp:Argentina;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-988';Grp:HongKong;MinRange:'0000000';MaxRange:'1199999';Data:2),
  (Prefix:'978-988';Grp:HongKong;MinRange:'1200000';MaxRange:'1999999';Data:5),
  (Prefix:'978-988';Grp:HongKong;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-988';Grp:HongKong;MinRange:'7000000';MaxRange:'7999999';Data:5),
  (Prefix:'978-988';Grp:HongKong;MinRange:'8000000';MaxRange:'9699999';Data:4),
  (Prefix:'978-988';Grp:HongKong;MinRange:'9700000';MaxRange:'9999999';Data:5),

  (Prefix:'978-989';Grp:Portugal;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-989';Grp:Portugal;MinRange:'2000000';MaxRange:'3499999';Data:2),
  (Prefix:'978-989';Grp:Portugal;MinRange:'3500000';MaxRange:'3699999';Data:5),
  (Prefix:'978-989';Grp:Portugal;MinRange:'3700000';MaxRange:'5299999';Data:2),
  (Prefix:'978-989';Grp:Portugal;MinRange:'5300000';MaxRange:'5499999';Data:5),
  (Prefix:'978-989';Grp:Portugal;MinRange:'5500000';MaxRange:'7999999';Data:3),
  (Prefix:'978-989';Grp:Portugal;MinRange:'8000000';MaxRange:'9499999';Data:4),
  (Prefix:'978-989';Grp:Portugal;MinRange:'9500000';MaxRange:'9999999';Data:5),

  (Prefix:'978-9910';Grp:Uzbekistan;MinRange:'0000000';MaxRange:'7299999';Data:0),
  (Prefix:'978-9910';Grp:Uzbekistan;MinRange:'7300000';MaxRange:'7499999';Data:3),
  (Prefix:'978-9910';Grp:Uzbekistan;MinRange:'7500000';MaxRange:'9649999';Data:0),
  (Prefix:'978-9910';Grp:Uzbekistan;MinRange:'9650000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9911';Grp:Montenegro;MinRange:'0000000';MaxRange:'1999999';Data:0),
  (Prefix:'978-9911';Grp:Montenegro;MinRange:'2000000';MaxRange:'2499999';Data:2),
  (Prefix:'978-9911';Grp:Montenegro;MinRange:'2500000';MaxRange:'5499999';Data:0),
  (Prefix:'978-9911';Grp:Montenegro;MinRange:'5500000';MaxRange:'7499999';Data:3),
  (Prefix:'978-9911';Grp:Montenegro;MinRange:'7500000';MaxRange:'9999999';Data:0),

  (Prefix:'978-9912';Grp:Tanzania;MinRange:'0000000';MaxRange:'3999999';Data:0),
  (Prefix:'978-9912';Grp:Tanzania;MinRange:'4000000';MaxRange:'4499999';Data:2),
  (Prefix:'978-9912';Grp:Tanzania;MinRange:'4500000';MaxRange:'7499999';Data:0),
  (Prefix:'978-9912';Grp:Tanzania;MinRange:'7500000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9912';Grp:Tanzania;MinRange:'8000000';MaxRange:'9799999';Data:0),
  (Prefix:'978-9912';Grp:Tanzania;MinRange:'9800000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9913';Grp:Uganda;MinRange:'0000000';MaxRange:'0799999';Data:2),
  (Prefix:'978-9913';Grp:Uganda;MinRange:'0800000';MaxRange:'5999999';Data:0),
  (Prefix:'978-9913';Grp:Uganda;MinRange:'6000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-9913';Grp:Uganda;MinRange:'7000000';MaxRange:'9549999';Data:0),
  (Prefix:'978-9913';Grp:Uganda;MinRange:'9550000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9914';Grp:Kenya;MinRange:'0000000';MaxRange:'3999999';Data:0),
  (Prefix:'978-9914';Grp:Kenya;MinRange:'4000000';MaxRange:'5299999';Data:2),
  (Prefix:'978-9914';Grp:Kenya;MinRange:'5300000';MaxRange:'6999999';Data:0),
  (Prefix:'978-9914';Grp:Kenya;MinRange:'7000000';MaxRange:'7749999';Data:3),
  (Prefix:'978-9914';Grp:Kenya;MinRange:'7750000';MaxRange:'9599999';Data:0),
  (Prefix:'978-9914';Grp:Kenya;MinRange:'9600000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9915';Grp:Uruguay;MinRange:'0000000';MaxRange:'3999999';Data:0),
  (Prefix:'978-9915';Grp:Uruguay;MinRange:'4000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9915';Grp:Uruguay;MinRange:'6000000';MaxRange:'6499999';Data:0),
  (Prefix:'978-9915';Grp:Uruguay;MinRange:'6500000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9915';Grp:Uruguay;MinRange:'8000000';MaxRange:'9299999';Data:0),
  (Prefix:'978-9915';Grp:Uruguay;MinRange:'9300000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9916';Grp:Estonia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'4000000';MaxRange:'5999999';Data:1),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'6000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'8000000';MaxRange:'8499999';Data:2),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'8500000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'9000000';MaxRange:'9249999';Data:0),
  (Prefix:'978-9916';Grp:Estonia;MinRange:'9250000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9917';Grp:Bolivia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9917';Grp:Bolivia;MinRange:'1000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-9917';Grp:Bolivia;MinRange:'3000000';MaxRange:'3499999';Data:2),
  (Prefix:'978-9917';Grp:Bolivia;MinRange:'3500000';MaxRange:'5999999';Data:0),
  (Prefix:'978-9917';Grp:Bolivia;MinRange:'6000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-9917';Grp:Bolivia;MinRange:'7000000';MaxRange:'9799999';Data:0),
  (Prefix:'978-9917';Grp:Bolivia;MinRange:'9800000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9918';Grp:Malta;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9918';Grp:Malta;MinRange:'1000000';MaxRange:'1999999';Data:0),
  (Prefix:'978-9918';Grp:Malta;MinRange:'2000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-9918';Grp:Malta;MinRange:'3000000';MaxRange:'5999999';Data:0),
  (Prefix:'978-9918';Grp:Malta;MinRange:'6000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9918';Grp:Malta;MinRange:'8000000';MaxRange:'9499999';Data:0),
  (Prefix:'978-9918';Grp:Malta;MinRange:'9500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9919';Grp:Mongolia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9919';Grp:Mongolia;MinRange:'1000000';MaxRange:'1999999';Data:0),
  (Prefix:'978-9919';Grp:Mongolia;MinRange:'2000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-9919';Grp:Mongolia;MinRange:'3000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-9919';Grp:Mongolia;MinRange:'5000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-9919';Grp:Mongolia;MinRange:'6000000';MaxRange:'8999999';Data:0),
  (Prefix:'978-9919';Grp:Mongolia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9920';Grp:Morocco;MinRange:'0000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-9920';Grp:Morocco;MinRange:'3000000';MaxRange:'4299999';Data:2),
  (Prefix:'978-9920';Grp:Morocco;MinRange:'4300000';MaxRange:'4999999';Data:0),
  (Prefix:'978-9920';Grp:Morocco;MinRange:'5000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9920';Grp:Morocco;MinRange:'8000000';MaxRange:'8749999';Data:0),
  (Prefix:'978-9920';Grp:Morocco;MinRange:'8750000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9921';Grp:Kuwait;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9921';Grp:Kuwait;MinRange:'1000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-9921';Grp:Kuwait;MinRange:'3000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9921';Grp:Kuwait;MinRange:'4000000';MaxRange:'6999999';Data:0),
  (Prefix:'978-9921';Grp:Kuwait;MinRange:'7000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9921';Grp:Kuwait;MinRange:'9000000';MaxRange:'9699999';Data:0),
  (Prefix:'978-9921';Grp:Kuwait;MinRange:'9700000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9922';Grp:Iraq;MinRange:'0000000';MaxRange:'1999999';Data:0),
  (Prefix:'978-9922';Grp:Iraq;MinRange:'2000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-9922';Grp:Iraq;MinRange:'3000000';MaxRange:'5999999';Data:0),
  (Prefix:'978-9922';Grp:Iraq;MinRange:'6000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9922';Grp:Iraq;MinRange:'8000000';MaxRange:'8499999';Data:0),
  (Prefix:'978-9922';Grp:Iraq;MinRange:'8500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9923';Grp:Jordan;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9923';Grp:Jordan;MinRange:'1000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9923';Grp:Jordan;MinRange:'6000000';MaxRange:'6999999';Data:0),
  (Prefix:'978-9923';Grp:Jordan;MinRange:'7000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9923';Grp:Jordan;MinRange:'9000000';MaxRange:'9399999';Data:0),
  (Prefix:'978-9923';Grp:Jordan;MinRange:'9400000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9924';Grp:Cambodia;MinRange:'0000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-9924';Grp:Cambodia;MinRange:'3000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9924';Grp:Cambodia;MinRange:'4000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-9924';Grp:Cambodia;MinRange:'5000000';MaxRange:'6499999';Data:3),
  (Prefix:'978-9924';Grp:Cambodia;MinRange:'6500000';MaxRange:'8999999';Data:0),
  (Prefix:'978-9924';Grp:Cambodia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9925';Grp:Cyprus;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-9925';Grp:Cyprus;MinRange:'3000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-9925';Grp:Cyprus;MinRange:'5500000';MaxRange:'7349999';Data:3),
  (Prefix:'978-9925';Grp:Cyprus;MinRange:'7350000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9926';Grp:BosniaAndHerzegovina;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9926';Grp:BosniaAndHerzegovina;MinRange:'2000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9926';Grp:BosniaAndHerzegovina;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9926';Grp:BosniaAndHerzegovina;MinRange:'8000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9927';Grp:Qatar;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-9927';Grp:Qatar;MinRange:'1000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-9927';Grp:Qatar;MinRange:'4000000';MaxRange:'4999999';Data:4),
  (Prefix:'978-9927';Grp:Qatar;MinRange:'5000000';MaxRange:'9999999';Data:0),

  (Prefix:'978-9928';Grp:Albania;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-9928';Grp:Albania;MinRange:'1000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-9928';Grp:Albania;MinRange:'4000000';MaxRange:'4999999';Data:4),
  (Prefix:'978-9928';Grp:Albania;MinRange:'5000000';MaxRange:'7999999';Data:0),
  (Prefix:'978-9928';Grp:Albania;MinRange:'8000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9928';Grp:Albania;MinRange:'9000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9929';Grp:Guatemala;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-9929';Grp:Guatemala;MinRange:'4000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-9929';Grp:Guatemala;MinRange:'5500000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9929';Grp:Guatemala;MinRange:'8000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9930';Grp:CostaRica;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9930';Grp:CostaRica;MinRange:'5000000';MaxRange:'9399999';Data:3),
  (Prefix:'978-9930';Grp:CostaRica;MinRange:'9400000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9931';Grp:Algeria;MinRange:'0000000';MaxRange:'2399999';Data:2),
  (Prefix:'978-9931';Grp:Algeria;MinRange:'2400000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9931';Grp:Algeria;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9932';Grp:Lao;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9932';Grp:Lao;MinRange:'4000000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9932';Grp:Lao;MinRange:'8500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9933';Grp:Syria;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9933';Grp:Syria;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9933';Grp:Syria;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9933';Grp:Syria;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9934';Grp:Latvia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9934';Grp:Latvia;MinRange:'1000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9934';Grp:Latvia;MinRange:'5000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9934';Grp:Latvia;MinRange:'8000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9935';Grp:Iceland;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9935';Grp:Iceland;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9935';Grp:Iceland;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9935';Grp:Iceland;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9936';Grp:Afghanistan;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9936';Grp:Afghanistan;MinRange:'2000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9936';Grp:Afghanistan;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9936';Grp:Afghanistan;MinRange:'8000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9937';Grp:Nepal;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-9937';Grp:Nepal;MinRange:'3000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9937';Grp:Nepal;MinRange:'5000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9937';Grp:Nepal;MinRange:'8000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9938';Grp:Tunisia;MinRange:'0000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9938';Grp:Tunisia;MinRange:'8000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-9938';Grp:Tunisia;MinRange:'9500000';MaxRange:'9749999';Data:4),
  (Prefix:'978-9938';Grp:Tunisia;MinRange:'9750000';MaxRange:'9909999';Data:3),
  (Prefix:'978-9938';Grp:Tunisia;MinRange:'9910000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9939';Grp:Armenia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-9939';Grp:Armenia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9939';Grp:Armenia;MinRange:'8000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9939';Grp:Armenia;MinRange:'9000000';MaxRange:'9599999';Data:4),
  (Prefix:'978-9939';Grp:Armenia;MinRange:'9600000';MaxRange:'9799999';Data:3),
  (Prefix:'978-9939';Grp:Armenia;MinRange:'9800000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9940';Grp:Montenegro;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9940';Grp:Montenegro;MinRange:'2000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9940';Grp:Montenegro;MinRange:'5000000';MaxRange:'8399999';Data:3),
  (Prefix:'978-9940';Grp:Montenegro;MinRange:'8400000';MaxRange:'8699999';Data:2),
  (Prefix:'978-9940';Grp:Montenegro;MinRange:'8700000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9941';Grp:Georgia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9941';Grp:Georgia;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9941';Grp:Georgia;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9941';Grp:Georgia;MinRange:'8000000';MaxRange:'8999999';Data:1),
  (Prefix:'978-9941';Grp:Georgia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9942';Grp:Ecuador;MinRange:'0000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9942';Grp:Ecuador;MinRange:'6000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-9942';Grp:Ecuador;MinRange:'7000000';MaxRange:'7499999';Data:4),
  (Prefix:'978-9942';Grp:Ecuador;MinRange:'7500000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9942';Grp:Ecuador;MinRange:'8500000';MaxRange:'8999999';Data:4),
  (Prefix:'978-9942';Grp:Ecuador;MinRange:'9000000';MaxRange:'9849999';Data:3),
  (Prefix:'978-9942';Grp:Ecuador;MinRange:'9850000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9943';Grp:Uzbekistan;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-9943';Grp:Uzbekistan;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-9943';Grp:Uzbekistan;MinRange:'4000000';MaxRange:'9749999';Data:4),
  (Prefix:'978-9943';Grp:Uzbekistan;MinRange:'9750000';MaxRange:'9999999';Data:3),

  (Prefix:'978-9944';Grp:Turkey;MinRange:'0000000';MaxRange:'0999999';Data:4),
  (Prefix:'978-9944';Grp:Turkey;MinRange:'1000000';MaxRange:'4999999';Data:3),
  (Prefix:'978-9944';Grp:Turkey;MinRange:'5000000';MaxRange:'5999999';Data:4),
  (Prefix:'978-9944';Grp:Turkey;MinRange:'6000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-9944';Grp:Turkey;MinRange:'7000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9944';Grp:Turkey;MinRange:'8000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9944';Grp:Turkey;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'0000000';MaxRange:'0099999';Data:2),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'0100000';MaxRange:'0799999';Data:3),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'0800000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'4000000';MaxRange:'5699999';Data:3),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'5700000';MaxRange:'5799999';Data:2),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'5800000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'8000000';MaxRange:'8099999';Data:2),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'8100000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9945';Grp:DominicanRepublic;MinRange:'8500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9946';Grp:Korea;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9946';Grp:Korea;MinRange:'2000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9946';Grp:Korea;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9946';Grp:Korea;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9947';Grp:Algeria;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9947';Grp:Algeria;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9947';Grp:Algeria;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-9948';Grp:UnitedArabEmirates;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9948';Grp:UnitedArabEmirates;MinRange:'4000000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9948';Grp:UnitedArabEmirates;MinRange:'8500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9949';Grp:Estonia;MinRange:'0000000';MaxRange:'0899999';Data:2),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'0900000';MaxRange:'0999999';Data:3),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'4000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'7000000';MaxRange:'7199999';Data:2),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'7200000';MaxRange:'7499999';Data:4),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'7500000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9949';Grp:Estonia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9950';Grp:Palestine;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-9950';Grp:Palestine;MinRange:'3000000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9950';Grp:Palestine;MinRange:'8500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9951';Grp:Kosova;MinRange:'0000000';MaxRange:'3899999';Data:2),
  (Prefix:'978-9951';Grp:Kosova;MinRange:'3900000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9951';Grp:Kosova;MinRange:'8500000';MaxRange:'9799999';Data:4),
  (Prefix:'978-9951';Grp:Kosova;MinRange:'9800000';MaxRange:'9999999';Data:3),

  (Prefix:'978-9952';Grp:Azerbaijan;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9952';Grp:Azerbaijan;MinRange:'2000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9952';Grp:Azerbaijan;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9952';Grp:Azerbaijan;MinRange:'8000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9953';Grp:Lebanon;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9953';Grp:Lebanon;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9953';Grp:Lebanon;MinRange:'4000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-9953';Grp:Lebanon;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9953';Grp:Lebanon;MinRange:'9000000';MaxRange:'9299999';Data:4),
  (Prefix:'978-9953';Grp:Lebanon;MinRange:'9300000';MaxRange:'9699999';Data:2),
  (Prefix:'978-9953';Grp:Lebanon;MinRange:'9700000';MaxRange:'9999999';Data:3),

  (Prefix:'978-9954';Grp:Morocco;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9954';Grp:Morocco;MinRange:'2000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9954';Grp:Morocco;MinRange:'4000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-9954';Grp:Morocco;MinRange:'8000000';MaxRange:'9899999';Data:4),
  (Prefix:'978-9954';Grp:Morocco;MinRange:'9900000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9955';Grp:Lithuania;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9955';Grp:Lithuania;MinRange:'4000000';MaxRange:'9299999';Data:3),
  (Prefix:'978-9955';Grp:Lithuania;MinRange:'9300000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9956';Grp:Cameroon;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9956';Grp:Cameroon;MinRange:'1000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9956';Grp:Cameroon;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9956';Grp:Cameroon;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9957';Grp:Jordan;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9957';Grp:Jordan;MinRange:'4000000';MaxRange:'6499999';Data:3),
  (Prefix:'978-9957';Grp:Jordan;MinRange:'6500000';MaxRange:'6799999';Data:2),
  (Prefix:'978-9957';Grp:Jordan;MinRange:'6800000';MaxRange:'6999999';Data:3),
  (Prefix:'978-9957';Grp:Jordan;MinRange:'7000000';MaxRange:'8499999';Data:2),
  (Prefix:'978-9957';Grp:Jordan;MinRange:'8500000';MaxRange:'8799999';Data:4),
  (Prefix:'978-9957';Grp:Jordan;MinRange:'8800000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'0000000';MaxRange:'0199999';Data:2),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'0200000';MaxRange:'0299999';Data:3),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'0300000';MaxRange:'0399999';Data:4),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'0400000';MaxRange:'0899999';Data:3),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'0900000';MaxRange:'0999999';Data:4),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'1000000';MaxRange:'1899999';Data:2),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'1900000';MaxRange:'1999999';Data:4),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'2000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'5000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9958';Grp:BosniaAndHerzegovina;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9959';Grp:Libya;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9959';Grp:Libya;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9959';Grp:Libya;MinRange:'8000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-9959';Grp:Libya;MinRange:'9500000';MaxRange:'9699999';Data:4),
  (Prefix:'978-9959';Grp:Libya;MinRange:'9700000';MaxRange:'9799999';Data:3),
  (Prefix:'978-9959';Grp:Libya;MinRange:'9800000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9960';Grp:SaudiArabia;MinRange:'0000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9960';Grp:SaudiArabia;MinRange:'6000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9960';Grp:SaudiArabia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9961';Grp:Algeria;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-9961';Grp:Algeria;MinRange:'3000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-9961';Grp:Algeria;MinRange:'7000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-9961';Grp:Algeria;MinRange:'9500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9962';Grp:Panama;MinRange:'0000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-9962';Grp:Panama;MinRange:'5500000';MaxRange:'5599999';Data:4),
  (Prefix:'978-9962';Grp:Panama;MinRange:'5600000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9962';Grp:Panama;MinRange:'6000000';MaxRange:'8499999';Data:3),
  (Prefix:'978-9962';Grp:Panama;MinRange:'8500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9963';Grp:Cyprus;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'2000000';MaxRange:'2499999';Data:4),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'2500000';MaxRange:'2799999';Data:3),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'2800000';MaxRange:'2999999';Data:4),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'3000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'5500000';MaxRange:'7349999';Data:3),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'7350000';MaxRange:'7499999';Data:4),
  (Prefix:'978-9963';Grp:Cyprus;MinRange:'7500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9964';Grp:Ghana;MinRange:'0000000';MaxRange:'6999999';Data:1),
  (Prefix:'978-9964';Grp:Ghana;MinRange:'7000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-9964';Grp:Ghana;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-9965';Grp:Kazakhstan;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9965';Grp:Kazakhstan;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9965';Grp:Kazakhstan;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9966';Grp:Kenya;MinRange:'0000000';MaxRange:'1399999';Data:3),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'1400000';MaxRange:'1499999';Data:2),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'1500000';MaxRange:'1999999';Data:4),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'2000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'7000000';MaxRange:'7499999';Data:4),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'7500000';MaxRange:'8209999';Data:3),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'8210000';MaxRange:'8249999';Data:4),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'8250000';MaxRange:'8259999';Data:3),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'8260000';MaxRange:'8289999';Data:4),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'8290000';MaxRange:'9599999';Data:3),
  (Prefix:'978-9966';Grp:Kenya;MinRange:'9600000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9967';Grp:KyrgyzRepublic;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9967';Grp:KyrgyzRepublic;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9967';Grp:KyrgyzRepublic;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9968';Grp:CostaRica;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9968';Grp:CostaRica;MinRange:'5000000';MaxRange:'9399999';Data:3),
  (Prefix:'978-9968';Grp:CostaRica;MinRange:'9400000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9969';Grp:Algeria;MinRange:'0000000';MaxRange:'0699999';Data:2),
  (Prefix:'978-9969';Grp:Algeria;MinRange:'0700000';MaxRange:'4999999';Data:0),
  (Prefix:'978-9969';Grp:Algeria;MinRange:'5000000';MaxRange:'6499999';Data:3),
  (Prefix:'978-9969';Grp:Algeria;MinRange:'6500000';MaxRange:'9699999';Data:0),
  (Prefix:'978-9969';Grp:Algeria;MinRange:'9700000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9970';Grp:Uganda;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9970';Grp:Uganda;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9970';Grp:Uganda;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9971';Grp:Singapore;MinRange:'0000000';MaxRange:'5999999';Data:1),
  (Prefix:'978-9971';Grp:Singapore;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9971';Grp:Singapore;MinRange:'9000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9971';Grp:Singapore;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9972';Grp:Peru;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-9972';Grp:Peru;MinRange:'1000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-9972';Grp:Peru;MinRange:'2000000';MaxRange:'2499999';Data:3),
  (Prefix:'978-9972';Grp:Peru;MinRange:'2500000';MaxRange:'2999999';Data:4),
  (Prefix:'978-9972';Grp:Peru;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9972';Grp:Peru;MinRange:'6000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9972';Grp:Peru;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9973';Grp:Tunisia;MinRange:'0000000';MaxRange:'0599999';Data:2),
  (Prefix:'978-9973';Grp:Tunisia;MinRange:'0600000';MaxRange:'0899999';Data:3),
  (Prefix:'978-9973';Grp:Tunisia;MinRange:'0900000';MaxRange:'0999999';Data:4),
  (Prefix:'978-9973';Grp:Tunisia;MinRange:'1000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-9973';Grp:Tunisia;MinRange:'7000000';MaxRange:'9699999';Data:3),
  (Prefix:'978-9973';Grp:Tunisia;MinRange:'9700000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9974';Grp:Uruguay;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-9974';Grp:Uruguay;MinRange:'3000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-9974';Grp:Uruguay;MinRange:'5500000';MaxRange:'7499999';Data:3),
  (Prefix:'978-9974';Grp:Uruguay;MinRange:'7500000';MaxRange:'8799999';Data:4),
  (Prefix:'978-9974';Grp:Uruguay;MinRange:'8800000';MaxRange:'9099999';Data:3),
  (Prefix:'978-9974';Grp:Uruguay;MinRange:'9100000';MaxRange:'9499999';Data:2),
  (Prefix:'978-9974';Grp:Uruguay;MinRange:'9500000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9975';Grp:Moldova;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9975';Grp:Moldova;MinRange:'1000000';MaxRange:'2999999';Data:3),
  (Prefix:'978-9975';Grp:Moldova;MinRange:'3000000';MaxRange:'3999999';Data:4),
  (Prefix:'978-9975';Grp:Moldova;MinRange:'4000000';MaxRange:'4499999';Data:4),
  (Prefix:'978-9975';Grp:Moldova;MinRange:'4500000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9975';Grp:Moldova;MinRange:'9000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-9975';Grp:Moldova;MinRange:'9500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9976';Grp:Tanzania;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-9976';Grp:Tanzania;MinRange:'5000000';MaxRange:'5799999';Data:4),
  (Prefix:'978-9976';Grp:Tanzania;MinRange:'5800000';MaxRange:'5899999';Data:3),
  (Prefix:'978-9976';Grp:Tanzania;MinRange:'5900000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9976';Grp:Tanzania;MinRange:'9000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9976';Grp:Tanzania;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9977';Grp:CostaRica;MinRange:'0000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9977';Grp:CostaRica;MinRange:'9000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9977';Grp:CostaRica;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9978';Grp:Ecuador;MinRange:'0000000';MaxRange:'2999999';Data:2),
  (Prefix:'978-9978';Grp:Ecuador;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-9978';Grp:Ecuador;MinRange:'4000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-9978';Grp:Ecuador;MinRange:'9500000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9978';Grp:Ecuador;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9979';Grp:Iceland;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-9979';Grp:Iceland;MinRange:'5000000';MaxRange:'6499999';Data:2),
  (Prefix:'978-9979';Grp:Iceland;MinRange:'6500000';MaxRange:'6599999';Data:3),
  (Prefix:'978-9979';Grp:Iceland;MinRange:'6600000';MaxRange:'7599999';Data:2),
  (Prefix:'978-9979';Grp:Iceland;MinRange:'7600000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9979';Grp:Iceland;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9980';Grp:PapuaNewGuinea;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-9980';Grp:PapuaNewGuinea;MinRange:'4000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-9980';Grp:PapuaNewGuinea;MinRange:'9000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9980';Grp:PapuaNewGuinea;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9981';Grp:Morocco;MinRange:'0000000';MaxRange:'0999999';Data:2),
  (Prefix:'978-9981';Grp:Morocco;MinRange:'1000000';MaxRange:'1599999';Data:3),
  (Prefix:'978-9981';Grp:Morocco;MinRange:'1600000';MaxRange:'1999999';Data:4),
  (Prefix:'978-9981';Grp:Morocco;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9981';Grp:Morocco;MinRange:'8000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-9981';Grp:Morocco;MinRange:'9500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9982';Grp:Zambia;MinRange:'0000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9982';Grp:Zambia;MinRange:'8000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9982';Grp:Zambia;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9983';Grp:Gambia;MinRange:'0000000';MaxRange:'7999999';Data:0),
  (Prefix:'978-9983';Grp:Gambia;MinRange:'8000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-9983';Grp:Gambia;MinRange:'9500000';MaxRange:'9899999';Data:3),
  (Prefix:'978-9983';Grp:Gambia;MinRange:'9900000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9984';Grp:Latvia;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-9984';Grp:Latvia;MinRange:'5000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9984';Grp:Latvia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9985';Grp:Estonia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-9985';Grp:Estonia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-9985';Grp:Estonia;MinRange:'8000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9985';Grp:Estonia;MinRange:'9000000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9986';Grp:Lithuania;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9986';Grp:Lithuania;MinRange:'4000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-9986';Grp:Lithuania;MinRange:'9000000';MaxRange:'9399999';Data:4),
  (Prefix:'978-9986';Grp:Lithuania;MinRange:'9400000';MaxRange:'9699999';Data:3),
  (Prefix:'978-9986';Grp:Lithuania;MinRange:'9700000';MaxRange:'9999999';Data:2),

  (Prefix:'978-9987';Grp:Tanzania;MinRange:'0000000';MaxRange:'3999999';Data:2),
  (Prefix:'978-9987';Grp:Tanzania;MinRange:'4000000';MaxRange:'8799999';Data:3),
  (Prefix:'978-9987';Grp:Tanzania;MinRange:'8800000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9988';Grp:Ghana;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-9988';Grp:Ghana;MinRange:'4000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-9988';Grp:Ghana;MinRange:'5500000';MaxRange:'7499999';Data:3),
  (Prefix:'978-9988';Grp:Ghana;MinRange:'7500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-9989';Grp:NorthMacedonia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-9989';Grp:NorthMacedonia;MinRange:'1000000';MaxRange:'1999999';Data:3),
  (Prefix:'978-9989';Grp:NorthMacedonia;MinRange:'2000000';MaxRange:'2999999';Data:4),
  (Prefix:'978-9989';Grp:NorthMacedonia;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-9989';Grp:NorthMacedonia;MinRange:'6000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-9989';Grp:NorthMacedonia;MinRange:'9500000';MaxRange:'9999999';Data:4),

  (Prefix:'978-99901';Grp:Bahrain;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-99901';Grp:Bahrain;MinRange:'5000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-99901';Grp:Bahrain;MinRange:'8000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99902';Grp:ReservedAgency;MinRange:'0000000';MaxRange:'9999999';Data:0),

  (Prefix:'978-99903';Grp:Mauritius;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99903';Grp:Mauritius;MinRange:'2000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99903';Grp:Mauritius;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99904';Grp:Curacao;MinRange:'0000000';MaxRange:'5999999';Data:1),
  (Prefix:'978-99904';Grp:Curacao;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99904';Grp:Curacao;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99905';Grp:Bolivia;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99905';Grp:Bolivia;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99905';Grp:Bolivia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99906';Grp:Kuwait;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99906';Grp:Kuwait;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99906';Grp:Kuwait;MinRange:'6000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-99906';Grp:Kuwait;MinRange:'7000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99906';Grp:Kuwait;MinRange:'9000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-99906';Grp:Kuwait;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99908';Grp:Malawi;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99908';Grp:Malawi;MinRange:'1000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99908';Grp:Malawi;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99909';Grp:Malta;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99909';Grp:Malta;MinRange:'4000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-99909';Grp:Malta;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99910';Grp:SierraLeone;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99910';Grp:SierraLeone;MinRange:'3000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99910';Grp:SierraLeone;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99911';Grp:Lesotho;MinRange:'0000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99911';Grp:Lesotho;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99912';Grp:Botswana;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99912';Grp:Botswana;MinRange:'4000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-99912';Grp:Botswana;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99912';Grp:Botswana;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99913';Grp:Andorra;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99913';Grp:Andorra;MinRange:'3000000';MaxRange:'3599999';Data:2),
  (Prefix:'978-99913';Grp:Andorra;MinRange:'3600000';MaxRange:'5999999';Data:0),
  (Prefix:'978-99913';Grp:Andorra;MinRange:'6000000';MaxRange:'6049999';Data:3),
  (Prefix:'978-99913';Grp:Andorra;MinRange:'6050000';MaxRange:'9999999';Data:0),

  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'5000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'7000000';MaxRange:'7999999';Data:1),
  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'8000000';MaxRange:'8699999';Data:2),
  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'8700000';MaxRange:'8799999';Data:3),
  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'8800000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99914';Grp:InternationalNGOPublishers;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99915';Grp:Maldives;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99915';Grp:Maldives;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99915';Grp:Maldives;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99916';Grp:Namibia;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99916';Grp:Namibia;MinRange:'3000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99916';Grp:Namibia;MinRange:'7000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99917';Grp:BruneiDarussalam;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99917';Grp:BruneiDarussalam;MinRange:'3000000';MaxRange:'8899999';Data:2),
  (Prefix:'978-99917';Grp:BruneiDarussalam;MinRange:'8900000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99918';Grp:FaroeIslands;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99918';Grp:FaroeIslands;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99918';Grp:FaroeIslands;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99919';Grp:Benin;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99919';Grp:Benin;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-99919';Grp:Benin;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99919';Grp:Benin;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99920';Grp:Andorra;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99920';Grp:Andorra;MinRange:'5000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99920';Grp:Andorra;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99921';Grp:Qatar;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99921';Grp:Qatar;MinRange:'2000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99921';Grp:Qatar;MinRange:'7000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-99921';Grp:Qatar;MinRange:'8000000';MaxRange:'8999999';Data:1),
  (Prefix:'978-99921';Grp:Qatar;MinRange:'9000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99922';Grp:Guatemala;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99922';Grp:Guatemala;MinRange:'4000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99922';Grp:Guatemala;MinRange:'7000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99923';Grp:ElSalvador;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99923';Grp:ElSalvador;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99923';Grp:ElSalvador;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99924';Grp:Nicaragua;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99924';Grp:Nicaragua;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99924';Grp:Nicaragua;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99925';Grp:Paraguay;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99925';Grp:Paraguay;MinRange:'1000000';MaxRange:'1999999';Data:2),
  (Prefix:'978-99925';Grp:Paraguay;MinRange:'2000000';MaxRange:'2999999';Data:3),
  (Prefix:'978-99925';Grp:Paraguay;MinRange:'3000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99925';Grp:Paraguay;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99925';Grp:Paraguay;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99926';Grp:Honduras;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99926';Grp:Honduras;MinRange:'1000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99926';Grp:Honduras;MinRange:'6000000';MaxRange:'8699999';Data:3),
  (Prefix:'978-99926';Grp:Honduras;MinRange:'8700000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99926';Grp:Honduras;MinRange:'9000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99927';Grp:Albania;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99927';Grp:Albania;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99927';Grp:Albania;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99928';Grp:Georgia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99928';Grp:Georgia;MinRange:'1000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99928';Grp:Georgia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99929';Grp:Mongolia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99929';Grp:Mongolia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99929';Grp:Mongolia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99930';Grp:Armenia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99930';Grp:Armenia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99930';Grp:Armenia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99931';Grp:Seychelles;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99931';Grp:Seychelles;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99931';Grp:Seychelles;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99932';Grp:Malta;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99932';Grp:Malta;MinRange:'1000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99932';Grp:Malta;MinRange:'6000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-99932';Grp:Malta;MinRange:'7000000';MaxRange:'7999999';Data:1),
  (Prefix:'978-99932';Grp:Malta;MinRange:'8000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99933';Grp:Nepal;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99933';Grp:Nepal;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99933';Grp:Nepal;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99934';Grp:DominicanRepublic;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99934';Grp:DominicanRepublic;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99934';Grp:DominicanRepublic;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99935';Grp:Haiti;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99935';Grp:Haiti;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99935';Grp:Haiti;MinRange:'6000000';MaxRange:'6999999';Data:3),
  (Prefix:'978-99935';Grp:Haiti;MinRange:'7000000';MaxRange:'8999999';Data:1),
  (Prefix:'978-99935';Grp:Haiti;MinRange:'9000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99936';Grp:Bhutan;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99936';Grp:Bhutan;MinRange:'1000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99936';Grp:Bhutan;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99937';Grp:Macau;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99937';Grp:Macau;MinRange:'2000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99937';Grp:Macau;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99938';Grp:SrpskaRepublicOf;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99938';Grp:SrpskaRepublicOf;MinRange:'2000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99938';Grp:SrpskaRepublicOf;MinRange:'6000000';MaxRange:'8999999';Data:3),
  (Prefix:'978-99938';Grp:SrpskaRepublicOf;MinRange:'9000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99939';Grp:Guatemala;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99939';Grp:Guatemala;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99939';Grp:Guatemala;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99939';Grp:Guatemala;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99940';Grp:Georgia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99940';Grp:Georgia;MinRange:'1000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99940';Grp:Georgia;MinRange:'7000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99941';Grp:Armenia;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99941';Grp:Armenia;MinRange:'3000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99941';Grp:Armenia;MinRange:'8000000';MaxRange:'9999999';Data:3),


  (Prefix:'978-99942';Grp:Sudan;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99942';Grp:Sudan;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99942';Grp:Sudan;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99943';Grp:Albania;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99943';Grp:Albania;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99943';Grp:Albania;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99944';Grp:Ethiopia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99944';Grp:Ethiopia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99944';Grp:Ethiopia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99945';Grp:Namibia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99945';Grp:Namibia;MinRange:'5000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99945';Grp:Namibia;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99946';Grp:Nepal;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99946';Grp:Nepal;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99946';Grp:Nepal;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99947';Grp:Tajikistan;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99947';Grp:Tajikistan;MinRange:'3000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99947';Grp:Tajikistan;MinRange:'7000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99948';Grp:Eritrea;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99948';Grp:Eritrea;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99948';Grp:Eritrea;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99949';Grp:Mauritius;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99949';Grp:Mauritius;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99949';Grp:Mauritius;MinRange:'8000000';MaxRange:'8999999';Data:1),
  (Prefix:'978-99949';Grp:Mauritius;MinRange:'9000000';MaxRange:'9899999';Data:3),
  (Prefix:'978-99949';Grp:Mauritius;MinRange:'9900000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99950';Grp:Cambodia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99950';Grp:Cambodia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99950';Grp:Cambodia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99951';Grp:ReservedAgency;MinRange:'0000000';MaxRange:'9999999';Data:0),

  (Prefix:'978-99952';Grp:Mali;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99952';Grp:Mali;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99952';Grp:Mali;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99953';Grp:Paraguay;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99953';Grp:Paraguay;MinRange:'3000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99953';Grp:Paraguay;MinRange:'8000000';MaxRange:'9399999';Data:3),
  (Prefix:'978-99953';Grp:Paraguay;MinRange:'9400000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99954';Grp:Bolivia;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99954';Grp:Bolivia;MinRange:'3000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99954';Grp:Bolivia;MinRange:'7000000';MaxRange:'8799999';Data:3),
  (Prefix:'978-99954';Grp:Bolivia;MinRange:'8800000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99955';Grp:SrpskaRepublicOf;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99955';Grp:SrpskaRepublicOf;MinRange:'2000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99955';Grp:SrpskaRepublicOf;MinRange:'6000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-99955';Grp:SrpskaRepublicOf;MinRange:'8000000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99956';Grp:Albania;MinRange:'0000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99956';Grp:Albania;MinRange:'6000000';MaxRange:'8599999';Data:3),
  (Prefix:'978-99956';Grp:Albania;MinRange:'8600000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99957';Grp:Malta;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99957';Grp:Malta;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99957';Grp:Malta;MinRange:'8000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-99957';Grp:Malta;MinRange:'9500000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99958';Grp:Bahrain;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99958';Grp:Bahrain;MinRange:'5000000';MaxRange:'9399999';Data:2),
  (Prefix:'978-99958';Grp:Bahrain;MinRange:'9400000';MaxRange:'9499999';Data:3),
  (Prefix:'978-99958';Grp:Bahrain;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99959';Grp:Luxembourg;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99959';Grp:Luxembourg;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99959';Grp:Luxembourg;MinRange:'6000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99960';Grp:Malawi;MinRange:'0000000';MaxRange:'0699999';Data:0),
  (Prefix:'978-99960';Grp:Malawi;MinRange:'0700000';MaxRange:'0999999';Data:3),
  (Prefix:'978-99960';Grp:Malawi;MinRange:'1000000';MaxRange:'9499999';Data:2),
  (Prefix:'978-99960';Grp:Malawi;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99961';Grp:ElSalvador;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99961';Grp:ElSalvador;MinRange:'3000000';MaxRange:'3699999';Data:3),
  (Prefix:'978-99961';Grp:ElSalvador;MinRange:'3700000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99961';Grp:ElSalvador;MinRange:'9000000';MaxRange:'9999999';Data:3),


  (Prefix:'978-99962';Grp:Mongolia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99962';Grp:Mongolia;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99962';Grp:Mongolia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99963';Grp:Cambodia;MinRange:'0000000';MaxRange:'4999999';Data:2),
  (Prefix:'978-99963';Grp:Cambodia;MinRange:'5000000';MaxRange:'9199999';Data:3),
  (Prefix:'978-99963';Grp:Cambodia;MinRange:'9200000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99964';Grp:Nicaragua;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99964';Grp:Nicaragua;MinRange:'2000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99964';Grp:Nicaragua;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99965';Grp:Macau;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99965';Grp:Macau;MinRange:'3000000';MaxRange:'3599999';Data:3),
  (Prefix:'978-99965';Grp:Macau;MinRange:'3600000';MaxRange:'6299999';Data:2),
  (Prefix:'978-99965';Grp:Macau;MinRange:'6300000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99966';Grp:Kuwait;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99966';Grp:Kuwait;MinRange:'3000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99966';Grp:Kuwait;MinRange:'7000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-99966';Grp:Kuwait;MinRange:'8000000';MaxRange:'9699999';Data:2),
  (Prefix:'978-99966';Grp:Kuwait;MinRange:'9700000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99967';Grp:Paraguay;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99967';Grp:Paraguay;MinRange:'1000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99967';Grp:Paraguay;MinRange:'6000000';MaxRange:'9999999';Data:3),


  (Prefix:'978-99968';Grp:Botswana;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99968';Grp:Botswana;MinRange:'4000000';MaxRange:'5999999';Data:3),
  (Prefix:'978-99968';Grp:Botswana;MinRange:'6000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99968';Grp:Botswana;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99969';Grp:Oman;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99969';Grp:Oman;MinRange:'5000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99969';Grp:Oman;MinRange:'8000000';MaxRange:'9499999';Data:3),
  (Prefix:'978-99969';Grp:Oman;MinRange:'9500000';MaxRange:'9999999';Data:2),

  (Prefix:'978-99970';Grp:Haiti;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99970';Grp:Haiti;MinRange:'5000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99970';Grp:Haiti;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99971';Grp:Myanmar;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99971';Grp:Myanmar;MinRange:'4000000';MaxRange:'8499999';Data:2),
  (Prefix:'978-99971';Grp:Myanmar;MinRange:'8500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99972';Grp:FaroeIslands;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99972';Grp:FaroeIslands;MinRange:'5000000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99972';Grp:FaroeIslands;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99973';Grp:Mongolia;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99973';Grp:Mongolia;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99973';Grp:Mongolia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99974';Grp:Bolivia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99974';Grp:Bolivia;MinRange:'1000000';MaxRange:'2599999';Data:2),
  (Prefix:'978-99974';Grp:Bolivia;MinRange:'2600000';MaxRange:'3999999';Data:3),
  (Prefix:'978-99974';Grp:Bolivia;MinRange:'4000000';MaxRange:'6399999';Data:2),
  (Prefix:'978-99974';Grp:Bolivia;MinRange:'6400000';MaxRange:'6499999';Data:3),
  (Prefix:'978-99974';Grp:Bolivia;MinRange:'6500000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99974';Grp:Bolivia;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99975';Grp:Tajikistan;MinRange:'0000000';MaxRange:'2999999';Data:1),
  (Prefix:'978-99975';Grp:Tajikistan;MinRange:'3000000';MaxRange:'3999999';Data:3),
  (Prefix:'978-99975';Grp:Tajikistan;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99975';Grp:Tajikistan;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'1000000';MaxRange:'1599999';Data:2),
  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'1600000';MaxRange:'1999999';Data:3),
  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'2000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'6000000';MaxRange:'8199999';Data:3),
  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'8200000';MaxRange:'8999999';Data:2),
  (Prefix:'978-99976';Grp:SrpskaRepublicOf;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99977';Grp:Rwanda;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99977';Grp:Rwanda;MinRange:'2000000';MaxRange:'3999999';Data:0),
  (Prefix:'978-99977';Grp:Rwanda;MinRange:'4000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99977';Grp:Rwanda;MinRange:'7000000';MaxRange:'7999999';Data:3),
  (Prefix:'978-99977';Grp:Rwanda;MinRange:'8000000';MaxRange:'9749999';Data:0),
  (Prefix:'978-99977';Grp:Rwanda;MinRange:'9750000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99978';Grp:Mongolia;MinRange:'0000000';MaxRange:'4999999';Data:1),
  (Prefix:'978-99978';Grp:Mongolia;MinRange:'5000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99978';Grp:Mongolia;MinRange:'7000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99979';Grp:Honduras;MinRange:'0000000';MaxRange:'3999999';Data:1),
  (Prefix:'978-99979';Grp:Honduras;MinRange:'4000000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99979';Grp:Honduras;MinRange:'8000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99980';Grp:Bhutan;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99980';Grp:Bhutan;MinRange:'1000000';MaxRange:'2999999';Data:0),
  (Prefix:'978-99980';Grp:Bhutan;MinRange:'3000000';MaxRange:'5999999';Data:2),
  (Prefix:'978-99980';Grp:Bhutan;MinRange:'6000000';MaxRange:'7499999';Data:0),
  (Prefix:'978-99980';Grp:Bhutan;MinRange:'7500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99981';Grp:Macau;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99981';Grp:Macau;MinRange:'2000000';MaxRange:'2199999';Data:3),
  (Prefix:'978-99981';Grp:Macau;MinRange:'2200000';MaxRange:'2399999';Data:0),
  (Prefix:'978-99981';Grp:Macau;MinRange:'2400000';MaxRange:'7499999';Data:2),
  (Prefix:'978-99981';Grp:Macau;MinRange:'7500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99982';Grp:Benin;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99982';Grp:Benin;MinRange:'2000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99982';Grp:Benin;MinRange:'5000000';MaxRange:'6899999';Data:2),
  (Prefix:'978-99982';Grp:Benin;MinRange:'6900000';MaxRange:'8999999';Data:0),
  (Prefix:'978-99982';Grp:Benin;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99983';Grp:ElSalvador;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99983';Grp:ElSalvador;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99983';Grp:ElSalvador;MinRange:'5000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99983';Grp:ElSalvador;MinRange:'7000000';MaxRange:'9499999';Data:0),
  (Prefix:'978-99983';Grp:ElSalvador;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99984';Grp:BruneiDarussalam;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99984';Grp:BruneiDarussalam;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99984';Grp:BruneiDarussalam;MinRange:'5000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99984';Grp:BruneiDarussalam;MinRange:'7000000';MaxRange:'9499999';Data:0),
  (Prefix:'978-99984';Grp:BruneiDarussalam;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99985';Grp:Tajikistan;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99985';Grp:Tajikistan;MinRange:'2000000';MaxRange:'3499999';Data:0),
  (Prefix:'978-99985';Grp:Tajikistan;MinRange:'3500000';MaxRange:'7999999';Data:2),
  (Prefix:'978-99985';Grp:Tajikistan;MinRange:'8000000';MaxRange:'8499999';Data:0),
  (Prefix:'978-99985';Grp:Tajikistan;MinRange:'8500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99986';Grp:Myanmar;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99986';Grp:Myanmar;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99986';Grp:Myanmar;MinRange:'5000000';MaxRange:'6999999';Data:2),
  (Prefix:'978-99986';Grp:Myanmar;MinRange:'7000000';MaxRange:'9499999';Data:0),
  (Prefix:'978-99986';Grp:Myanmar;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99987';Grp:Luxembourg;MinRange:'0000000';MaxRange:'6999999';Data:0),
  (Prefix:'978-99987';Grp:Luxembourg;MinRange:'7000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99988';Grp:Sudan;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99988';Grp:Sudan;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99988';Grp:Sudan;MinRange:'5000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-99988';Grp:Sudan;MinRange:'5500000';MaxRange:'7999999';Data:0),
  (Prefix:'978-99988';Grp:Sudan;MinRange:'8000000';MaxRange:'8249999';Data:3),
  (Prefix:'978-99988';Grp:Sudan;MinRange:'8250000';MaxRange:'9999999';Data:0),

  (Prefix:'978-99989';Grp:Paraguay;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99989';Grp:Paraguay;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99989';Grp:Paraguay;MinRange:'5000000';MaxRange:'6499999';Data:2),
  (Prefix:'978-99989';Grp:Paraguay;MinRange:'6500000';MaxRange:'8999999';Data:0),
  (Prefix:'978-99989';Grp:Paraguay;MinRange:'9000000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99990';Grp:Ethiopia;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99990';Grp:Ethiopia;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99990';Grp:Ethiopia;MinRange:'5000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-99990';Grp:Ethiopia;MinRange:'5500000';MaxRange:'9749999';Data:0),
  (Prefix:'978-99990';Grp:Ethiopia;MinRange:'9750000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99992';Grp:Oman;MinRange:'0000000';MaxRange:'1999999';Data:1),
  (Prefix:'978-99992';Grp:Oman;MinRange:'2000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99992';Grp:Oman;MinRange:'5000000';MaxRange:'6499999';Data:2),
  (Prefix:'978-99992';Grp:Oman;MinRange:'6500000';MaxRange:'9499999';Data:0),
  (Prefix:'978-99992';Grp:Oman;MinRange:'9500000';MaxRange:'9999999';Data:3),

  (Prefix:'978-99993';Grp:Mauritius;MinRange:'0000000';MaxRange:'0999999';Data:1),
  (Prefix:'978-99993';Grp:Mauritius;MinRange:'1000000';MaxRange:'4999999';Data:0),
  (Prefix:'978-99993';Grp:Mauritius;MinRange:'5000000';MaxRange:'5499999';Data:2),
  (Prefix:'978-99993';Grp:Mauritius;MinRange:'5500000';MaxRange:'9799999';Data:0),
  (Prefix:'978-99993';Grp:Mauritius;MinRange:'9800000';MaxRange:'9999999';Data:3),

  (Prefix:'979-10';Grp:France;MinRange:'0000000';MaxRange:'1999999';Data:2),
  (Prefix:'979-10';Grp:France;MinRange:'2000000';MaxRange:'6999999';Data:3),
  (Prefix:'979-10';Grp:France;MinRange:'7000000';MaxRange:'8999999';Data:4),
  (Prefix:'979-10';Grp:France;MinRange:'9000000';MaxRange:'9759999';Data:5),
  (Prefix:'979-10';Grp:France;MinRange:'9760000';MaxRange:'9999999';Data:6),

  (Prefix:'979-11';Grp:Korea;MinRange:'0000000';MaxRange:'2499999';Data:2),
  (Prefix:'979-11';Grp:Korea;MinRange:'2500000';MaxRange:'5499999';Data:3),
  (Prefix:'979-11';Grp:Korea;MinRange:'5500000';MaxRange:'8499999';Data:4),
  (Prefix:'979-11';Grp:Korea;MinRange:'8500000';MaxRange:'9499999';Data:5),
  (Prefix:'979-11';Grp:Korea;MinRange:'9500000';MaxRange:'9999999';Data:6),

  (Prefix:'979-12';Grp:Italy;MinRange:'0000000';MaxRange:'1999999';Data:0),
  (Prefix:'979-12';Grp:Italy;MinRange:'2000000';MaxRange:'2999999';Data:3),
  (Prefix:'979-12';Grp:Italy;MinRange:'3000000';MaxRange:'5449999';Data:0),
  (Prefix:'979-12';Grp:Italy;MinRange:'5450000';MaxRange:'5999999';Data:4),
  (Prefix:'979-12';Grp:Italy;MinRange:'6000000';MaxRange:'7999999';Data:0),
  (Prefix:'979-12';Grp:Italy;MinRange:'8000000';MaxRange:'8499999';Data:5),
  (Prefix:'979-12';Grp:Italy;MinRange:'8500000';MaxRange:'9999999';Data:0),

  (Prefix:'979-8';Grp:USA;MinRange:'0000000';MaxRange:'1999999';Data:0),
  (Prefix:'979-8';Grp:USA;MinRange:'2000000';MaxRange:'2299999';Data:3),
  (Prefix:'979-8';Grp:USA;MinRange:'2300000';MaxRange:'3499999';Data:0),
  (Prefix:'979-8';Grp:USA;MinRange:'3500000';MaxRange:'3999999';Data:4),
  (Prefix:'979-8';Grp:USA;MinRange:'4000000';MaxRange:'8499999';Data:4),
  (Prefix:'979-8';Grp:USA;MinRange:'8500000';MaxRange:'8849999';Data:4),
  (Prefix:'979-8';Grp:USA;MinRange:'8850000';MaxRange:'8999999';Data:5),
  (Prefix:'979-8';Grp:USA;MinRange:'9000000';MaxRange:'9849999';Data:0),
  (Prefix:'979-8';Grp:USA;MinRange:'9850000';MaxRange:'9899999';Data:7),
  (Prefix:'979-8';Grp:USA;MinRange:'9900000';MaxRange:'9999999';Data:0)

 );

Function GetGroupName(GT:GrpType):String;Begin
 GetGroupName:='';
 Case GT of
  English:GetGroupName:='Anglais';
  French:GetGroupName:='Franáais';
  German:GetGroupName:='Allemand';
  Japan:GetGroupName:='Japon';
  exURSS:GetGroupName:='Ex-URSS';
  Iran:GetGroupName:='Iran';
  Kazakhstan:GetGroupName:='Kazakhstan';
  Indonesia:GetGroupName:='IndonÇsie';
  SaudiArabia:GetGroupName:='Arabie Saoudite';
  Vietnam:GetGroupName:='Vietnam';
  Turkey:GetGroupName:='Turquie';
  Romania:GetGroupName:='Roumanie';
  Mexico:GetGroupName:='Mexique';
  NorthMacedonia:GetGroupName:='MacÇdoine du Nord';
  Thailand:GetGroupName:='Thaãlande';
  Peru:GetGroupName:='PÇrou';
  Lithuania:GetGroupName:='Lituanie';
  Mauritius:GetGroupName:='Maurice';
  Lebanon:GetGroupName:='Liban';
  Hungary:GetGroupName:='Hongrie';
  Ukraine:GetGroupName:='Ukraine';
  Greece:GetGroupName:='Gräce';
  Bulgaria:GetGroupName:='Bulgarie';
  Philippines:GetGroupName:='Philippines';
  SriLanka:GetGroupName:='SriLanka';
  Taiwan:GetGroupName:='Taiwan';
  Pakistan:GetGroupName:='Pakistan';
  Colombia:GetGroupName:='Colombie';
  Malaysia:GetGroupName:='Malaisie';
  Argentina:GetGroupName:='Argentine';
  Brazil:GetGroupName:='BrÇsil';
  China:GetGroupName:='Chine';
  exCzechoslovakia:GetGroupName:='Ex-TchÇcoslovaquie';
  India:GetGroupName:='Inde';
  Norway:GetGroupName:='Norväge';
  Poland:GetGroupName:='Pologne';
  Spain:GetGroupName:='Espagne';
  exYugoslavia:GetGroupName:='Ex-Yougoslavie';
  Denmark:GetGroupName:='Danemark';
  Italy:GetGroupName:='Italie';
  Korea:GetGroupName:='CorÇe';
  Netherlands:GetGroupName:='Pays-Bas';
  Sweden:GetGroupName:='Suäde';
  NGOAndEU:GetGroupName:='êditeurs d''ONG internationales et organisations de l''UE';
  Inde:GetGroupName:='Inde';
  Finland:GetGroupName:='Finlande';
  Croatia:GetGroupName:='Croatie';
  Chile:GetGroupName:='Chili';
  Cuba:GetGroupName:='Cuba';
  Slovenia:GetGroupName:='SlovÇnie';
  HongKong:GetGroupName:='Hong Kong';
  Israel:GetGroupName:='Israâl';
  Portugal:GetGroupName:='Portugal';
  Caribbean:GetGroupName:='Caraãbes';
  Egypt:GetGroupName:='Egypte';
  Nigeria:GetGroupName:='NigÇria';
  Venezuela:GetGroupName:='Venezuela';
  Singapore:GetGroupName:='Singapour';
  SouthPacific:GetGroupName:='Pacifique Sud';
  Bangladesh:GetGroupName:='Bangladesh';
  Belarus:GetGroupName:='BiÇlorussie';
  Uzbekistan:GetGroupName:='OuzbÇkistan';
  Montenegro:GetGroupName:='MontÇnÇgro';
  Tanzania:GetGroupName:='Tanzanie';
  Uganda:GetGroupName:='Ouganda';
  Kenya:GetGroupName:='Kenya';
  Uruguay:GetGroupName:='Uruguay';
  Estonia:GetGroupName:='Estonie';
  Bolivia:GetGroupName:='Bolivie';
  Malta:GetGroupName:='Malte';
  Mongolia:GetGroupName:='Mongolie';
  Morocco:GetGroupName:='Maroc';
  Kuwait:GetGroupName:='Koweãt';
  Iraq:GetGroupName:='Irak';
  Jordan:GetGroupName:='Jordanie';
  Cambodia:GetGroupName:='Cambodge';
  Cyprus:GetGroupName:='Chypre';
  BosniaAndHerzegovina:GetGroupName:='Bosnie-herzÇgovine';
  Qatar:GetGroupName:='Qatar';
  Albania:GetGroupName:='Albanie';
  Guatemala:GetGroupName:='Guatemala';
  CostaRica:GetGroupName:='CostaRica';
  Algeria:GetGroupName:='AlgÇrie';
  Lao:GetGroupName:='Lao';
  Syria:GetGroupName:='Syrie';
  Latvia:GetGroupName:='Lettonie';
  Iceland:GetGroupName:='Islande';
  Afghanistan:GetGroupName:='Afghanistan';
  Nepal:GetGroupName:='NÇpal';
  Tunisia:GetGroupName:='Tunisie';
  Armenia:GetGroupName:='ArmÇnie';
  Georgia:GetGroupName:='GÇorgie';
  Ecuador:GetGroupName:='êquateur';
  DominicanRepublic:GetGroupName:='RÇpublique dominicaine';
  UnitedArabEmirates:GetGroupName:='êmirats arabes unis';
  Palestine:GetGroupName:='Palestine';
  Kosova:GetGroupName:='Kosovo';
  Azerbaijan:GetGroupName:='Azerbaãdjan';
  Cameroon:GetGroupName:='Cameroun';
  Libya:GetGroupName:='Libye';
  Panama:GetGroupName:='Panama';
  Ghana:GetGroupName:='Ghana';
  KyrgyzRepublic:GetGroupName:='RÇpublique kirghize';
  Moldova:GetGroupName:='Moldavie';
  PapuaNewGuinea:GetGroupName:='Papouasie-Nouvelle-GuinÇe';
  Zambia:GetGroupName:='Zambie';
  Gambia:GetGroupName:='Gambie';
  Bahrain:GetGroupName:='Bahreãn';
  ReservedAgency:GetGroupName:='Agence rÇservÇe';
  Curacao:GetGroupName:='Curaáao';
  Malawi:GetGroupName:='Malawi';
  SierraLeone:GetGroupName:='Sierra Leone';
  Lesotho:GetGroupName:='Lesotho';
  Botswana:GetGroupName:='Botswana';
  Andorra:GetGroupName:='Andorre';
  InternationalNGOPublishers:GetGroupName:='êditeurs internationaux d''ONG';
  Maldives:GetGroupName:='Maldives';
  Namibia:GetGroupName:='Namibie';
  BruneiDarussalam:GetGroupName:='Brunei Darussalam';
  FaroeIslands:GetGroupName:='åles FÇroÇ';
  Benin:GetGroupName:='BÇnin';
  ElSalvador:GetGroupName:='El Salvador';
  Nicaragua:GetGroupName:='Nicaragua';
  Paraguay:GetGroupName:='Paraguay';
  Honduras:GetGroupName:='Honduras';
  Seychelles:GetGroupName:='Seychelles';
  Haiti:GetGroupName:='Haãti';
  Bhutan:GetGroupName:='Bhoutan';
  Macau:GetGroupName:='Macao';
  SrpskaRepublicOf:GetGroupName:='RÇpublique Srpska';
  Sudan:GetGroupName:='Soudan';
  Ethiopia:GetGroupName:='êthiopie';
  Tajikistan:GetGroupName:='Tadjikistan';
  Eritrea:GetGroupName:='êrythrÇe';
  Mali:GetGroupName:='Mali';
  Luxembourg:GetGroupName:='Luxembourg';
  Oman:GetGroupName:='Oman';
  Myanmar:GetGroupName:='Myanmar';
  Rwanda:GetGroupName:='Rwanda';
  France:GetGroupName:='France';
  USA:GetGroupName:='êtats-Unis';
 End;
End;

Function GetGroupByISBN(ISBN:String):String;
Var
 I:Integer;
Begin
 GetGroupByISBN:='';
 For I:=Low(ISBNRang)to High(ISBNRang)do Begin
  If StrPas(ISBNRang[I].Prefix)=Copy(ISBN,1,Length(StrPas(ISBNRang[I].Prefix)))Then Begin
   GetGroupByISBN:=GetGroupName(ISBNRang[I].Grp);
   Exit;
  End;
 End;
End;

END.
