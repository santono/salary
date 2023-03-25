unit UFormSwodMNFR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass;

type
  TFormSwodMNFR = class(TForm)
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Swod_To_FR:boolean;
    procedure FormShow(Sender: TObject);
    procedure frxReport1ManualBuild(Page: TfrxPage);
    procedure frxReport1ClosePreview(Sender: TObject);
  private
    { Private declarations }
  public
     Selected_Mode      : integer;
     TotalMode          : boolean;
     Select_Bay_Mode    : integer;
     SelectedBay        : integer;
     SwodSowmMode       : Integer;
     ModeIllSS          : integer;
     NameBay            : string;
     SummaKVyd          : real;
     SummaDolgOst       : real;
     SummaDolgZaRab     : real;
     S_SUMMA            : Real;
     S_SUMMA_invalidy   : REAL;
     s_summa_MP_31      : REAL;
     s_summa_vyh_pos_23 : REAL;
     s_summa_MP_NE_31   : REAL;
     s_summa_pogr_165   : REAL;
     s_summa_gt_max_sal : Real;
     s_summa_lt_min_sal : Real;
     s_summa_kompens_1  : Real;
     footerStr        : string;

    { Public declarations }
  end;

var
  FormSwodMNFR: TFormSwodMNFR;

implementation
  uses ScrDef,ScrUtil,ScrSwod,ScrLists;

{$R *.dfm}


procedure TFormSwodMNFR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

//----------------------------------------------
function TFormSwodMNFR.Swod_To_FR:boolean;
 var
    I,L_U,L_A,L_M:Integer;
    s:string;
    SummaAddTot,SummaFZPTot,SummaFMPTot,SummaOthTot,SummaUdTot:real;
    nameBan:string;
  procedure PrintHat;
   var S,S1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14:string;
       H1,H2,H3:string;
       I:integer;
   begin
       H1:='';
       H2:='';
       H3:='';
       if TotalMode then
          begin
               if isLNR then
                  s:='���� �� ���� ��������������, ���� ����������� � ���� ����������'
               else
                  s:='���� �� ��� ���������, ��� ������������ � ��� ������������';
               s:=ReplQuot(s);
               H1:=s;
          end
       else
          begin
               case Selected_Mode of
                     2 : begin      { �� ���������� �������������� }
                           if isLNR then
                              s:='��������� �������������� - '
                           else
                              S:='������� ������������ - ';
                           for i:=1 to MAX_GRUPPA do
                               if CURR_GRUPPA[I] then
                                  s:=s+' '+Get_Ist_Name(i)+' ';
                           s:=ReplQuot(s);
                           h1:=s;
                         end;
                     3 : begin      { �� ���������� ����������     }
                           if isLNR then
                              s:='��������� ���������� - '
                           else
                              S:='������� �������� - ';
                           for i:=1 to MAX_KATEGORIJA do
                               if CURR_KATEGORIJA[I] then
                                  S:=S+' '+GET_KAT_NAME(I);
                           s:=ReplQuot(s);
                           h1:=s;
                         end;
                     4 : begin      { �� ���������� ���������� � �� �������}
                           if isLNR then
                              s:='��������� ���������� - '
                           else
                              S:='������� �������� - ';
                           for i:=1 to MAX_KATEGORIJA do
                               if CURR_KATEGORIJA[i] then
                                  S:=S+' '+trim(GET_KAT_NAME(i));
                           s:=ReplQuot(s);
                           h1:=s;
                           if isLNR then
                              s:='��������� �������������� - '
                           else
                              S:='������� ������������ - ';
                           for i:=1 to MAX_GRUPPA do
                               if CURR_GRUPPA[i] then
                                  s:=s+' '+trim(Get_Ist_Name(i));
                           s:=ReplQuot(s);
                           h2:=s;
                         end;
                     5 : begin      { ����������� ������ }
                           if isLNR then
                              s:='��������� ���������� - '
                           else
                           S:=' ������� �������� - ';
                           for i:=1 to MAX_KATEGORIJA do
                               if CURR_KATEGORIJA[i] then
                                  S:=S+' '+trim(GET_KAT_NAME(i));
                           s:=ReplQuot(s);
                           h1:=s;
                           if isLNR then
                              s:='��������� �������������� - '
                           else
                              S:='������� ������������ - ';
                           for i:=1 to MAX_GRUPPA do
                               if CURR_GRUPPA[i] then
                                  s:=s+' '+trim(Get_Ist_Name(i));
                           s:=ReplQuot(s);
                           h2:=s;
                         end;
               end;  { CASE }
               s:='';
               if (swod_mode=invalid_swod) then // s:=' ������� (c ��������)'
                                               if isLNR then
                                                  s:='��������'
                                               else
                                                  s:=' �������'
                                           else
               if (swod_mode=pens_swod) then //s:=' ��������� (� ��������)';
                                             if isLNR then
                                                s:='����������'
                                             else
                                               s:='���������';
               if length(s)>0 then
                  if length(trim(h1))>length(trim(h2)) then
                     h2:=trim(h2)+' '+trim(s)
                  else
                     h1:=trim(h1)+' '+trim(s);
               s:='';
               if Select_Bay_Mode=2 then
                  s:='�� ������� '+NameBay
               else if Select_Bay_Mode=3 then
                  s:=Name_Serv(SelectedBay)
               else if (Selected_mode=5) then
                  s:=trim(NameBay);
               if length(s)>0 then
                  if length(trim(h1))>length(trim(h2)) then
                     h2:=trim(h2)+' '+trim(s)
                  else
                     h1:=trim(h1)+' '+trim(s);
          end;
        if isSVDN then
           begin
                case ModeIllSS of
                 0: h3:='������� �������';
                 1: h3:='������� �� �������';
                 2: h3:='����� ������� ���.������';
                end;
                case SwodSowmMode of
                 1 : h3:=trim(h3)+' ������� ���� ������';
                 2 : h3:=trim(h3)+' �������� �������';
                 3 : h3:=Trim(h3)+' �������� ������';
                else
                     h3:=Trim(h3)+' ������ �� ��������';
                end;
           end
        else
           begin
                case ModeIllSS of
                 0: h3:='���������� ��������';
                 1: h3:='���������� �� ��������';
                 2: h3:='������ ���������� ���.������';
                end;
                case SwodSowmMode of
                 1 : h3:=trim(h3)+' �������� ����� ������';
                 2 : h3:=trim(h3)+' ������������ ����������';
                 3 : h3:=Trim(h3)+' ������������ �������';
                else
                     h3:=Trim(h3)+' �������� � ������������';
                end;
           end;
        frxReport1.Variables['H1']:=''''+h1+'''';
        frxReport1.Variables['H2']:=''''+h2+'''';
        frxReport1.Variables['H3']:=''''+h3+'''';
        s:=trim(MONTH[NMES])+' ';
        s:=s+IntToStr(WORK_YEAR_VAL)+' �.';
        s:=ReplQuot(s);
        frxReport1.Variables['NameData']:=''''+s+'''';
        s1 := '������� ��������� �� ���������� �����';
        s2 := '����������';
        s3 := '���������';
        s4 := '����� ���������';
        s5 := '����� ��������';
        s6 := '� ������';
        s7 := '���� (���)';
        s8 := '���� �� ����������';
        s9 := '����������';
        s10:= '���������';
        s9 := '����������';
        s10:= '���������';
        s11:= '�����';
        s12:= '(���.)';
        s13:= '������';
        s14:= '�� ���';

        if isSVDN then
           begin
                s  :='���������������� ������������ ����������';
                s1 :='������� ������� �� �������� ����';
                s2 :='�����������';
                s3 :='�����������';
                s4 :='����� �����������';
                s5 :='������ �����������';
                s6 :='�� ������';
                s7 :='���� (���)';
                s8 :='���� �� ���������';
                s9 := '����������';
                s10:= '����������';
                s11:= '����';
                s12:= '(���)';
                s13:= '�����';
                s14:= '� ���';
           end
        else
        if isGKH then
           s:='�������� ������������� ����������� � �������-������������� ���������'
        else
        if isLNR then
           s:='��������� ��������������� ����������� �����  �.����';
        s:=ReplQuot(s);
        frxReport1.Variables['nameUni']:=''''+s+'''';
        s1:=ReplQuot(s1);
        frxReport1.Variables['nameTitle']:=''''+s1+'''';
        s2:=ReplQuot(s2);
        frxReport1.Variables['nameHatAdd']:=''''+s2+'''';
        s3:=ReplQuot(s3);
        frxReport1.Variables['nameHatUd']:=''''+s3+'''';
        s4:=ReplQuot(s4);
        frxReport1.Variables['nameFootAdd']:=''''+s4+'''';
        s5:=ReplQuot(s5);
        frxReport1.Variables['nameFootUd']:=''''+s5+'''';
        s6:=ReplQuot(s6);
        frxReport1.Variables['nameFootVyd']:=''''+s6+'''';
        s7:=ReplQuot(s7);
        frxReport1.Variables['nameFootBorgZal']:=''''+s7+'''';
        s8:=ReplQuot(s8);
        frxReport1.Variables['nameFootBorg']:=''''+s8+'''';
        s9:=ReplQuot(s9);
        frxReport1.Variables['nameHatAdd1']:=''''+s9+'''';
        s10:=ReplQuot(s10);
        frxReport1.Variables['nameHatUd1']:=''''+s10+'''';
        s11:=ReplQuot(s11);
        frxReport1.Variables['nameHatSumma']:=''''+s11+'''';
        s12:=ReplQuot(s12);
        frxReport1.Variables['nameHatRub']:=''''+s12+'''';
        s13:=ReplQuot(s13);
        frxReport1.Variables['nameHatPeriod']:=''''+s13+'''';
        s14:=ReplQuot(s14);
        frxReport1.Variables['nameHatIzNih']:=''''+s14+'''';


        frxReport1.Engine.ShowBand(frxReport1.FindObject('MasterData1') as TfrxMasterData);
   end;
  Procedure PrintFooter;
   var S:String;
   begin
        S:=FORMAT('%12.2f',[SummaAddTot]);
        s:=ReplChar(S,',','-');
        if abs(SummaAddTot)<0.01 then
           s:=' ';
        frxReport1.Variables['SummaAdd']:=''''+s+'''';
        S:=FORMAT('%12.2f',[SummaFZPTot]);
        s:=ReplChar(S,',','-');
        if abs(SummaFZPTot)<0.01 then
           s:=' ';
        frxReport1.Variables['SummaFZP']:=''''+s+'''';
        S:=FORMAT('%12.2f',[SummaFMPTot]);
        s:=ReplChar(S,',','-');
        if abs(SummaFMPTot)<0.01 then
           s:=' ';
        frxReport1.Variables['SummaFMP']:=''''+s+'''';
        S:=FORMAT('%12.2f',[SummaOthTot]);
        s:=ReplChar(S,',','-');
        if abs(SummaFMPTot)<0.01 then
           s:=' ';
        frxReport1.Variables['SummaOTH']:=''''+s+'''';
        S:=FORMAT('%12.2f',[SummaUdTot]);
        s:=ReplChar(S,',','-');
        if abs(SummaUdTot)<0.01 then
           s:=' ';
        frxReport1.Variables['SummaUd']:=''''+s+'''';
        S:=' ';
   //     if abs(SummaKVyd)>0.005 then
           begin
                S:=FORMAT('%12.2f',[SummaKVyd]);
                s:=ReplChar(S,',','-');
           end;
        frxReport1.Variables['SummaKVyd']:=''''+s+'''';
        s:=' ';
    //    if abs(SummaDolgOst)>0.005 then
           begin
                S:=FORMAT('%12.2f',[SummaDolgOst]);
                s:=ReplChar(S,',','-');
           end;
        frxReport1.Variables['SummaDolgOst']:=''''+s+'''';
        s:=' ';
     //   if abs(SummaDolgZaRab)>0.005 then
           begin
                S:=FORMAT('%12.2f',[SummaDolgZaRab]);
                s:=ReplChar(S,',','-');
           end;
        frxReport1.Variables['SummaDolgZaRab']:=''''+s+'''';
        frxReport1.Engine.ShowBand(frxReport1.FindObject('MasterData3') as TfrxMasterData);
   end;


  Procedure PrintFooterSVDNALLA;
   var S:String;
   begin
        S:=FORMAT('%12.2f',[FormSwodMNFR.S_SUMMA]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_MP_31]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_mp_31']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_MP_NE_31]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_mp_ne_31']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_vyh_pos_23]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_vyh_pos_23']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_pogr_165]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_pogr_165']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_invalidy]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_invalidy']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_gt_max_sal]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_gt_max_sal']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_lt_min_sal]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_lt_min_sal']:=''''+s+'''';
        S:=FORMAT('%12.2f',[FormSwodMNFR.s_summa_kompens_1]);
        s:=ReplChar(S,',','-');
        frxReport1.Variables['s_summa_kompens_1']:=''''+s+'''';
        S:=Trim(FormSwodMNFR.footerStr);
        frxReport1.Variables['footerstr']:=''''+s+'''';
        frxReport1.Engine.ShowBand(frxReport1.FindObject('MasterData4') as TfrxMasterData);
   end;


 begin
  //     Application.CreateForm(TFormSwodMNFR, FormSwodMNFR);
  //     FormSwodMNFR.Show;

       SummaAddTot := 0;
       SummaFZPTot := 0;
       SummaFMPTot := 0;
       SummaOthTot := 0;
       SummaUdTot  := 0;

       PrintHat;
       L_A:=ItemAddList.Count;
       L_U:=ItemUdList.Count;
       if L_A>L_U then L_M:=L_A else L_M:=L_U;
       for i:=0 to L_M-1 do
         begin
               if I<L_A then
                  begin
                       s:=FORMAT('%3d',[PCell_Rec(ItemAddList.Items[i]).Shifr]);
                       s:=ReplChar(S,',','-');
                       frxReport1.Variables['ShifrAdd']:=''''+s+'''';
                       s:=ShifrList.GetName(PCell_Rec(ItemAddList.Items[i]).Shifr);
                       s:=ReplQuot(s);
                       frxReport1.Variables['NameAdd']:=''''+s+'''';
                       s:=FORMAT('%2d',[PCell_Rec(ItemAddList.Items[i]).Period]);
                       s:=ReplChar(S,',','-');
                       frxReport1.Variables['PeriodAdd']:=''''+s+'''';
                       SummaAddTot:=sum(SummaAddTot)+sum(PCell_Rec(ItemAddList.Items[i]).Summa);
                       s:=FORMAT('%12.2f',[PCell_Rec(ItemAddList.Items[i]).Summa]);
                       s:=ReplChar(S,',','-');
                       if abs(PCell_Rec(ItemAddList.Items[i]).Summa)<0.01 then
                          s:=' ';
                       frxReport1.Variables['SummaAdd']:=''''+s+'''';
                       SummaFZPTot:=sum(SummaFZPTot)+sum(PCell_Rec(ItemAddList.Items[i]).FZP);
                       s:=FORMAT('%12.2f',[PCell_Rec(ItemAddList.Items[i]).FZP]);
                       s:=ReplChar(S,',','-');
                       if abs(PCell_Rec(ItemAddList.Items[i]).FZP)<0.01 then
                          s:=' ';
                       frxReport1.Variables['SummaFZP']:=''''+s+'''';
                       SummaFMPTot:=sum(SummaFMPTot)+sum(PCell_Rec(ItemAddList.Items[i]).FMP);
                       s:=FORMAT('%12.2f',[PCell_Rec(ItemAddList.Items[i]).FMP]);
                       s:=ReplChar(S,',','-');
                       if abs(PCell_Rec(ItemAddList.Items[i]).FMP)<0.01 then
                          s:=' ';
                       frxReport1.Variables['SummaFMP']:=''''+s+'''';
                       SummaOTHTot:=sum(SummaOTHTot)+sum(PCell_Rec(ItemAddList.Items[i]).Other);
                       s:=FORMAT('%12.2f',[PCell_Rec(ItemAddList.Items[i]).Other]);
                       s:=ReplChar(S,',','-');
                       if abs(PCell_Rec(ItemAddList.Items[i]).Other)<0.01 then
                          s:=' ';
                       frxReport1.Variables['SummaOTH']:=''''+s+'''';
                  end
               else
                  begin
                       s:=' ';
                       frxReport1.Variables['ShifrAdd']:=''''+s+'''';
                       frxReport1.Variables['NameAdd']:=''''+s+'''';
                       frxReport1.Variables['PeriodAdd']:=''''+s+'''';
                       frxReport1.Variables['SummaAdd']:=''''+s+'''';
                       frxReport1.Variables['SummaFZP']:=''''+s+'''';
                       frxReport1.Variables['SummaFMP']:=''''+s+'''';
                       frxReport1.Variables['SummaOTH']:=''''+s+'''';
                  end;
               if I<L_U then
                  begin
                       s:=FORMAT('%3d',[PCell_Rec(ItemUdList.Items[i]).Shifr]);
                       s:=ReplChar(S,',','-');
                       frxReport1.Variables['ShifrUd']:=''''+s+'''';
                       s:=ShifrList.GetName(PCell_Rec(ItemUdList.Items[i]).Shifr);
                       s:=ReplQuot(s);
                       if (PCell_Rec(ItemUdList.Items[i]).shifrban>0) then
                          begin
                               nameBan:=Trim(BankiList.getBankName(PCell_Rec(ItemUdList.Items[i]).shifrban));
                               if Length(Trim(nameBan))>0 then
                                  s:=Trim(nameBan+' '+trim(s));
                          end;
                       frxReport1.Variables['NameUd']:=''''+s+'''';
                       s:=FORMAT('%2d',[PCell_Rec(ItemUdList.Items[i]).Period]);
                       s:=ReplChar(S,',','-');
                       frxReport1.Variables['PeriodUd']:=''''+s+'''';
                       SummaUdTot:=sum(SummaUdTot)+sum(PCell_Rec(ItemUdList.Items[i]).Summa);
                       s:=FORMAT('%12.2f',[PCell_Rec(ItemUdList.Items[i]).Summa]);
                       s:=ReplChar(S,',','-');
                       frxReport1.Variables['SummaUd']:=''''+s+'''';
                  end
               else
                  begin
                       s:=' ';
                       frxReport1.Variables['ShifrUd']:=''''+s+'''';
                       frxReport1.Variables['NameUd']:=''''+s+'''';
                       frxReport1.Variables['PeriodUd']:=''''+s+'''';
                       frxReport1.Variables['SummaUd']:=''''+s+'''';
                  end;
               frxReport1.Engine.ShowBand(frxReport1.FindObject('MasterData2') as TfrxMasterData);
          end;
       PrintFooter;
       if (isSVDN and TotalMode and
           (Length(Trim(FormSwodMNFR.footerStr))>10)) then
          PrintFooterSVDNALLA;
    //   FormSwodMNFR.ShowModal;
 end;



procedure TFormSwodMNFR.FormShow(Sender: TObject);
begin
 //    frxReport1.ShowReport;
 //    Self.Close;
 //    ModalResult := mrOK;
 //    Close;
end;

procedure TFormSwodMNFR.frxReport1ManualBuild(Page: TfrxPage);
begin
      Swod_To_FR;
end;

procedure TFormSwodMNFR.frxReport1ClosePreview(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

end.
