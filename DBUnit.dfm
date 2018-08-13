object DataModule1: TDataModule1
  OldCreateOrder = False
  Top = 737
  Height = 34
  Width = 160
  object dbSalary: TDatabase
    AliasName = 'Salary1'
    DatabaseName = 'Salarydb'
    Params.Strings = (
      ''
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object tblShifr: TTable
    DatabaseName = 'Salarydb'
    TableName = 'SHIFR'
    Left = 88
    Top = 16
  end
  object tblPodr: TTable
    DatabaseName = 'Salarydb'
    TableName = 'PODR'
    Left = 144
    Top = 16
  end
  object tblPerson: TTable
    DatabaseName = 'Salarydb'
    TableName = 'PERSON'
    Left = 200
    Top = 16
  end
  object tblCN: TTable
    DatabaseName = 'Salarydb'
    TableName = 'CN'
    Left = 256
    Top = 16
  end
  object tblADD: TTable
    DatabaseName = 'Salarydb'
    TableName = 'FADD'
    Left = 24
    Top = 80
  end
  object tblSowm: TTable
    DatabaseName = 'Salarydb'
    TableName = 'SOWM'
    Left = 88
    Top = 80
  end
  object tblUD: TTable
    DatabaseName = 'Salarydb'
    TableName = 'UD'
    Left = 152
    Top = 80
  end
  object tblTabel: TTable
    DatabaseName = 'Salarydb'
    TableName = 'TABEL'
    Left = 216
    Top = 80
  end
  object tblCKADRY: TTable
    DatabaseName = 'Salarydb'
    TableName = 'CKADRY'
    Left = 312
    Top = 16
  end
end
