unit my_modul;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, Grids;

// Запись - «Расчёт»
type Calculation = record
 A: real; // исходные данные
 V,S: real; // результат
end;

{ПРОЦЕДУРА ЛОГИКИ ПРОГРАММЫ}
procedure LOGIK(var Results1:TMemo; var Vvod1:TEdit; var c:integer; TABLE1:TStringGrid);






var
 calculations: array[1..128] of Calculation;


implementation
procedure LOGIK(var Results1:TMemo; var Vvod1:TEdit; var c:integer; TABLE1:TStringGrid);
VAR A1,V1,S1:real;
begin
A1:=StrToFloat(Vvod1.Text);
 if TryStrToFloat(Vvod1.Text, A1) = false then
  ShowMessage('Неправильно введён параметр')
  else
 begin
 A1:=StrToFloat(Vvod1.Text);
 V1:=A1*A1*A1;
 S1:=A1*A1*6;
 Results1.Lines.Add('Объём куба со стороной '+ FloatToStr(A1) +' равен '+ FloatToStr (V1));
 Results1.Lines.Add('Площадь боковой поверхности куба стороной '+ FloatToStr(A1) + ' равна '+ FloatToStr(S1));
 calculations[c].A:=A1;
 calculations[c].V:=V1;
 calculations[c].S:=S1;
 TABLE1.RowCount:=TABLE1.RowCount+1;
 TABLE1.celLs[0,c]:=FloatToStr(A1);
 TABLE1.celLs[1,c]:=FloatToStr(V1);
 TABLE1.celLs[2,c]:=FloatToStr(S1);


 end;
 inc(c);
 end;



end.

