unit Clarion;
interface
  type
  TFileHeader = record
                       FileSig  : word;                  { file signature                          }
                       sfatr    : word;                  { file attribute and status               }
                       numbkeys : byte;                  { number of keys in file                  }
                       numrecs  : longint;               { number of records in file               }
                       numdels  : LongInt;               { number of deleted records               }
                       numflds  : word;                  { number of fields                        }
                       numpics  : word;                  { number of pictures                      }
                       numparrs : word;                  { number of array descriptors             }
                       reclen   : word;                  { record length (including record header) }
                       offset   : longint;               { start of data area                      }
                       logeof   : LongInt;               { logical end of file                     }
                       logbof   : LongInt;               { logical begin of file                   }
                       freerec  : LongInt;               { first usable deleted record             }
                       recname  : array[1..12] of char;  { record name without prefix              }
                       memname  : array[1..12] of char;  { memo name without prefix                }
                       filepre  : array[1..3] of char;   { file name prefix                        }
                       recpre   : array[1..3] of char;   { record name prefix                      }
                       memolen  : word;                  { size of memo                            }
                       memowid  : word;                  { column width of memo                    }
                       reserved : LongInt;               { reserved                                }
                       chgtime  : LongInt;               { time of last change                     }
                       chgDate  : LongInt;               { date of last change                     }
                       reserved2: word;                  { reserved                                }
                end;

     TFldDescriptor = record
		       fldtype : byte;                 { type of field             }
           	       fldname : array[1..16] of char; { name of field             }
		       foffset : word;                 { offset into record        }
		       lenfld  : word;	               { length of field           }
		       decsig  : byte;                 { significance for decimals }
		       decdec  : byte;                 { number of decimal places  }
                       arrnum  : word;	               { array number              }
		       picnum  : word;	               { picture number            }
                      end;

     TKeySect = record
		 numcomps : byte;                 { number of components for key }
		 keynams  : array[1..16] of char; { name of this key             }
		 comptype : byte;                 { type of composite            }
		 complen  : byte;                 { length of composite          }
                end;
     TKeyPart = record
		 fldtype  : byte;                 { type of field                 }
		 fldnum   : word;		  { field number                  }
		 elmoff   : word;		  { record offset of this element }
		 elmlen   : byte;                 { length of element             }
                end;

     TRecHeader = record
                   rhd  : byte    ; { record header type and status                     }
                   rprt : LongInt ; { pointer for next deleted record or memo if active }
                  end;

 const

       { Атрибуты файла }

       faLocked     = $0001; { bit 0 - file is locked          }
       faOwned      = $0002; { bit 1 - file is owned           }
       faEncrypted  = $0004; { bit 2 - records are encrypted   }
       faMemoExist  = $0008; { bit 3 - memo file exists        }
       faCompressed = $0010; { bit 4 - file is compressed      }
       faReclaim    = $0020; { bit 5 - reclaim deleted records }
       faReadOnly   = $0040; { bit 6 - file is read only       }
       faCreate     = $0080; { bit 7 - file may be created     }

       { Tип поля }

       ftLong       = $01;    { 1 - LONG                       }
       ftReal       = $02;    {	2 - REAL                       }
       ftString     = $03;    {	3 - STRING                     }
       ftStringPic  = $04;    {	4 - STRING WITH PICTURE TOKEN  }
       ftByte       = $05;    {	5 - BYTE                       }
       ftShort      = $06;    {	6 - SHORT                      }
       ftGroup      = $07;    {	7 - GROUP                      }
       ftDecimal    = $08;    {	8 - DECIMAL                    }

       { Статус записи }

       trNew        = $01;    { bit 0 - new record             }
       trOld        = $02;    {	bit 1 - old record             }
       trRevised    = $04;    {	bit 2 - revised record         }
       trDeleted    = $10;    {	bit 4 - deleted record         }
       trHeld       = $40;    {	bit 6 - record held            }
 implementation
end.
 
