unit Main_Form;

interface

uses
 Windows, SysUtils, Classes, Controls, Forms, StdCtrls,
 Gauges, ExtCtrls;

 type
   TMainForm = class(TForm)
    Timer1: TTimer;
    Gauge1: TGauge;
    procedure Timer1Timer(Sender: TObject);
   private
     { Déclarations Privées }
   public
     { Déclarations Publiques}
   end;

var
 MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Timer1Timer(Sender: TObject);
var
 Mem: TMemoryStatus;
begin
 Mem.dwLength:=SizeOf(Mem);
 GlobalMemoryStatus(Mem);
 Gauge1.MaxValue:=Mem.dwTotalPhys;
 Gauge1.Progress:=Mem.dwTotalPhys-Mem.dwAvailPhys;
end;

end.
