object FIB: TFIB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 234
  Top = 264
  Height = 490
  Width = 697
  object pFIBDatabaseSal: TpFIBDatabase
    DBName = 'E:\Projects\ZARPLATA\VUGU\IB\SAL_29_09_2023.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = pFIBTransactionSAL
    DefaultUpdateTransaction = pFIBTransactionSAL
    SQLDialect = 3
    Timeout = 0
    UseLoginPrompt = True
    OnTimeout = pFIBDatabaseSalTimeout
    AfterDisconnect = pFIBDatabaseSalAfterDisconnect
    DesignDBOptions = [ddoIsDefaultDatabase]
    SQLLogger = FIBSQLLoggerSal
    AliasName = 'FIBSalDatabase'
    WaitForRestoreConnect = 0
    BeforeConnect = pFIBDatabaseSalBeforeConnect
    AfterConnect = pFIBDatabaseSalAfterConnect
    OnLostConnect = pFIBDatabaseSalLostConnect
    OnErrorRestoreConnect = pFIBDatabaseSalErrorRestoreConnect
    BeforeStartTransaction = pFIBDatabaseSalBeforeStartTransaction
    AfterStartTransaction = pFIBDatabaseSalAfterStartTransaction
    AfterEndTransaction = pFIBDatabaseSalAfterEndTransaction
    Left = 24
    Top = 8
  end
  object pFIBTransactionSAL: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 24
    Top = 72
  end
  object pFIBQuery: TpFIBQuery
    Transaction = pFIBTransactionSAL
    Database = pFIBDatabaseSal
    Left = 328
    Top = 16
  end
  object FibErrMain: TpFibErrorHandler
    OnFIBErrorEvent = FibErrMainFIBErrorEvent
    Options = [oeException, oeForeignKey, oeLostConnect, oeCheck, oeUniqueViolation]
    Left = 104
    Top = 72
  end
  object pFIBStoredProcPick: TpFIBStoredProc
    Transaction = pFIBTransactionSAL
    Database = pFIBDatabaseSal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE PR_SETPICK (?SHIFRWRK, ?SHIFRPOD, ?TABNO, ?W_R' +
        ')')
    StoredProcName = 'PR_SETPICK'
    Left = 120
    Top = 8
  end
  object pFIBStoredProcCom: TpFIBStoredProc
    Transaction = pFIBTransactionSAL
    Database = pFIBDatabaseSal
    SQL.Strings = (
      'EXECUTE PROCEDURE INSERT_PODR (?SHIFRPOD, ?NAMEPOD)')
    StoredProcName = 'INSERT_PODR'
    Left = 232
    Top = 8
  end
  object pFIBDatabaseArc: TpFIBDatabase
    DBName = 'E:\Projects\ZARPLATA\VUGU\IB\SALARC.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'lc_ctype=WIN1251'
      'password=masterkey')
    DefaultTransaction = pFIBTransactionArc
    DefaultUpdateTransaction = pFIBTransactionArcWrite
    SQLDialect = 3
    Timeout = 0
    UseLoginPrompt = True
    SQLLogger = FIBSQLLoggerArc
    AliasName = 'FIBSalDatabaseArc'
    WaitForRestoreConnect = 0
    AfterConnect = pFIBDatabaseArcAfterConnect
    OnLostConnect = pFIBDatabaseArcLostConnect
    AfterStartTransaction = pFIBDatabaseArcAfterStartTransaction
    AfterEndTransaction = pFIBDatabaseArcAfterEndTransaction
    Left = 24
    Top = 160
  end
  object pFIBTransactionArcWrite: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 104
    Top = 160
  end
  object pFIBQueryArc: TpFIBQuery
    Transaction = pFIBTransactionArc
    Database = pFIBDatabaseArc
    Left = 16
    Top = 216
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object pFIBTransactionArc: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 104
    Top = 224
  end
  object pFIBStoredProcComArc: TpFIBStoredProc
    Transaction = pFIBTransactionArc
    Database = pFIBDatabaseArc
    SQL.Strings = (
      'EXECUTE PROCEDURE INSERT_PODR (?SHIFRPOD, ?NAMEPOD)')
    StoredProcName = 'INSERT_PODR'
    Left = 232
    Top = 160
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 200
    Top = 80
  end
  object pFIBQuerySecond: TpFIBQuery
    Transaction = pFIBTransactionSAL
    Database = pFIBDatabaseSal
    Left = 328
    Top = 80
  end
  object pFIBDataSetDynamic: TpFIBDataSet
    Transaction = pFIBTransactionRead
    Database = pFIBDatabaseSal
    Left = 216
    Top = 224
  end
  object pFIBClientDataSet1: TpFIBClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 288
  end
  object FIBSQLLoggerSal: TFIBSQLLogger
    LogFileName = 'Sal.log'
    ForceSaveLog = False
    Left = 24
    Top = 280
  end
  object FIBSQLLoggerArc: TFIBSQLLogger
    LogFileName = 'logarc.txt'
    ApplicationID = 'ASwod'
    ForceSaveLog = False
    Left = 232
    Top = 296
  end
end
