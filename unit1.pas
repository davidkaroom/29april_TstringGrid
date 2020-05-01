unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, Grids, my_modul;

type

  { TForm1 }

  TForm1 = class(TForm){это класс формы} {для класса form объектом будет TForm1}
    HELPMENU: TMenuItem;
    TABLE: TStringGrid;
    Vvod:TEdit;
    go: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    FILEINSTYMENT: TMenuItem;
    CLOSEF: TMenuItem;
    OPENF: TMenuItem;
    SAVEF: TMenuItem;
    SAVEFAS: TMenuItem;
    OpenDialog1: TOpenDialog;
    Podskazka2: TLabel;
    Results: TMemo;
    SaveDialog1: TSaveDialog;
    Podskazka: TLabel;
    procedure FormShow(Sender: TObject);
    procedure goClick(Sender: TObject);
    procedure CLOSEFClick(Sender: TObject);
    procedure HELPMENUClick(Sender: TObject);
    procedure OPENFClick(Sender: TObject);
    procedure PodskazkaClick(Sender: TObject);
    procedure ResultsChange(Sender: TObject);
    procedure SAVEFASClick(Sender: TObject);
    procedure SAVEFClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  i: integer;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.FormShow(Sender: TObject);
begin
    Results.Lines.Clear;
    Vvod.Text:=FloatToStr(1);
    i:=1;
end;

procedure TForm1.goClick(Sender: TObject);
begin
 LOGIK(Results,Vvod,i,TABLE);
end;

procedure TForm1.CLOSEFClick(Sender: TObject);
begin
   CLOSE;
end;

procedure TForm1.HELPMENUClick(Sender: TObject);
begin
  ShowMessage('Программа вычисляет площадь и объем куба.Автор: Бурдуковский Давид ');
end;

procedure TForm1.OPENFClick(Sender: TObject);
 var FName,s: string;
f:text;
begin
if OpenDialog1.Execute then
begin
FName := OpenDialog1.FileName;
if FName <> '' then begin
AssignFile(f,FName);
Reset(f);
read(f,s);
Vvod.Text:=s;
closeFile(f);
 end;
end;
enD;

procedure TForm1.PodskazkaClick(Sender: TObject);
begin

end;

procedure TForm1.ResultsChange(Sender: TObject);
begin

end;

procedure TForm1.SAVEFASClick(Sender: TObject);
begin
Results.Lines.SaveToFile( 'результаты.txt' );
end;

procedure TForm1.SAVEFClick(Sender: TObject);
 var FName,s: string;
 f:text;
 begin
 if SaveDialog1.Execute then
 begin
 FName := SaveDialog1.FileName;
 if FName <> '' then begin
 AssignFile(f,FName);
 Append(f);
 s:=Vvod.Text;
 writeln(f,s);
 closeFile(f);
 end;
 end;
 end;




end.

