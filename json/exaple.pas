procedure TForm1.btn1Click(Sender: TObject);
var
  js, s1, s2: TlkJSONobject;
  s: string;
  i: Integer;
  l: TlkJSONlist;
begin
  js := TlkJSONobject.Create;
  try
    js.Add('Name', 'Value');
    l := TlkJSONlist.Create;
    s1 := TlkJSONobject.Create;
    s1.Add('1', '1_2_1');
    s1.Add('2', '1_2_2');
    l.Add(s1);
    s2 := TlkJSONobject.Create;
    s2.Add('x', 'x_x');
    s2.Add('x_y_x', 'x_y_y');
    l.Add(s2);
    js.Add('Array1', l);
    i := 0;
    s := GenerateReadableText(js, i);
    mmo2.Text := s;
  finally
    FreeAndNil(js);
  end;
end;