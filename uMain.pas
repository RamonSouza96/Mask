unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, System.Skia, FMX.Skia, FMX.Objects,
  FMX.Effects, FMX.Layouts;

type
  TFormMask = class(TForm)
    RectBackground: TRectangle;
    Rectangle6: TRectangle;
    EdtTelefone: TEdit;
    SkSvg6: TSkSvg;
    StyleBook1: TStyleBook;
    Rectangle1: TRectangle;
    EdtCPF: TEdit;
    SkSvg1: TSkSvg;
    Rectangle2: TRectangle;
    EdtCNPJ: TEdit;
    SkSvg2: TSkSvg;
    Rectangle3: TRectangle;
    EdtDataNascimento: TEdit;
    SkSvg3: TSkSvg;
    SvgCard: TSkSvg;
    SkSvg5: TSkSvg;
    SkSvg7: TSkSvg;
    ShadowEffect1: TShadowEffect;
    EdtNomeCard: TEdit;
    Layout1: TLayout;
    EdtNumberCard: TEdit;
    Layout2: TLayout;
    EdtValidade: TEdit;
    procedure EdtCPFTyping(Sender: TObject);
    procedure EdtCNPJTyping(Sender: TObject);
    procedure EdtDataNascimentoTyping(Sender: TObject);
    procedure EdtValidadeTyping(Sender: TObject);
    procedure EdtNumberCardTyping(Sender: TObject);
    procedure EdtTelefoneTyping(Sender: TObject);
  private
    { Private declarations }
  public
    function ApplyMask(aMask, aValue: string): string;
  end;

var
  FormMask: TFormMask;

implementation

{$R *.fmx}

uses MobileBars.Android, MobileBars.iOS, MobileBars;

{ TForm1 }

function TFormMask.ApplyMask(aMask, aValue: string): string;
var
  M, V: Integer;
  Texto: String;
begin
  Result := '';
  Texto := '';
  //aMask := aMask.ToUpper;

  // Remove caracteres não numéricos do valor
  for V := 0 to aValue.Length - 1 do
  begin
    if aValue.Chars[V] In ['0' .. '9'] then
      Texto := Texto + aValue.Chars[V];
  end;

  M := 0;
  V := 0;
  // Loop para aplicar a máscara ao valor
  while (V < Texto.Length) and (M < aMask.Length) do
  begin
    // Enquanto o caractere na máscara não for '#', adicione-o ao resultado
    while aMask.Chars[M] <> '#' do
    begin
      Result := Result + aMask.Chars[M];
      Inc(M);
    end;

    // Adicione o caractere do valor ao resultado
    Result := Result + Texto.Chars[V];

    // Avance para o próximo caractere na máscara e no valor
    Inc(M);
    Inc(V);
  end;
end;

procedure TFormMask.EdtCNPJTyping(Sender: TObject);
begin
  TThread.Queue(nil,
    Procedure
    begin
      TEdit(Sender).Text := ApplyMask('##.###.###/####-##', TEdit(Sender).Text);
      TEdit(Sender).CaretPosition := TEdit(Sender).Text.Length;
    end);
end;

procedure TFormMask.EdtCPFTyping(Sender: TObject);
begin
  TThread.Queue(nil,
    Procedure
    begin
      TEdit(Sender).Text := ApplyMask('###.###.###-##', TEdit(Sender).Text);
      TEdit(Sender).CaretPosition := TEdit(Sender).Text.Length;
    end);
end;

procedure TFormMask.EdtDataNascimentoTyping(Sender: TObject);
begin
  TThread.Queue(nil,
    Procedure
    begin
      TEdit(Sender).Text := ApplyMask('##/##/####', TEdit(Sender).Text);
      TEdit(Sender).CaretPosition := TEdit(Sender).Text.Length;
    end);
end;

procedure TFormMask.EdtNumberCardTyping(Sender: TObject);
begin
  TThread.Queue(nil,
    Procedure
    begin
      TEdit(Sender).Text := ApplyMask('#### #### #### ####', TEdit(Sender).Text);
      TEdit(Sender).CaretPosition := TEdit(Sender).Text.Length;
    end);
end;

procedure TFormMask.EdtTelefoneTyping(Sender: TObject);
begin
  TThread.Queue(nil,
    Procedure
    begin
      TEdit(Sender).Text := ApplyMask('(##) #####-####', TEdit(Sender).Text);
      TEdit(Sender).CaretPosition := TEdit(Sender).Text.Length;
    end);
end;

procedure TFormMask.EdtValidadeTyping(Sender: TObject);
begin
  TThread.Queue(nil,
    Procedure
    begin
      TEdit(Sender).Text := ApplyMask('##/##', TEdit(Sender).Text);
      TEdit(Sender).CaretPosition := TEdit(Sender).Text.Length;
    end);
end;

end.
