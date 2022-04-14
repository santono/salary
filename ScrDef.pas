{$WARNINGS OFF}
{$HINTS OFF}
unit ScrDef;
                           
interface                 
   uses Classes,SysUtils;
CONST

         Nmb_Of_Col_Main_Screen    = 8;
         SIZE_OF_IO_BUF            = $FFFF; {Размер буфера для ввода-вывода}
         UP_IO_BUF_PTR             = SIZE_OF_IO_BUF-4096;
         MAX_PERSON                = 400;
{ *}     MAX_GRUPPA                = 50;  {МАКСИМАЛЬНОЕ ЧИСЛО ГРУПП ПЕРСОНАЛА (БЮДЖЕТ, НИС)         * }
{ *}     MAX_KAT                   = 15;  {МАКСИМАЛЬНОЕ ЧИСЛО КАТЕГОРИЯЙ}


         YES_DEJA_COUNTED          = 1;  {Кредит за месяц уже прибавлен     }
         NOT_DEJA_COUNTED          = 0;  {Кредит за месяц еще не прибавлялся}
         JAWKA                     = 1;  {Явка на работу                    }
         OTP_G_DO_GODA             = 2;  {Отпуск женщинам на ребенка до года}
         KOMANDIROWKA              = 3;  {Служебные командировки            }
         NEOPL_NETRUD              = 4;  {Неоплачиваемая нетрудоспособность }
         UCHEBN_OTPUSK             = 5;  {Отпуск в связи с обучением        }
         TARIFN_OTPUSK             = 6;  {Ежегодные отпуска                 }
         OTPUSK_BEZ_OPLATY         = 7;  {Отпуск без сохранения зарплаты    }
         SOKR_RAB_DAY              = 8;  {Сокращенный рабочий день          }
         VYHODN                    = 9;  {Выходные и праздничные дни        }
         WAR_SBORY                 =10;  {Военно-учебные сборы              }
         GOS_OB                    =11;  {Государственные обязанности       }
         BEREM_OTPUSK              =12;  {Отпуска по беременности и родам   }
         ILLNESS                   =13;  {Болезнь                           }
         PROGUL                    =14;  {Прогул                            }
         NEZAPOLN                  =15;  {Пробел                            }
         LEGK_TRUD                 =16;  {Легкий труд                           }
         Donorsk_tabel             =17;  {Легкий труд                           }
         Povkwa_tabel              =18;  {Повышение квалификации }
         Prostoy_tabel             =19;  {Простой (из-за короно вируса 26 04 2020)}
         Tvorch_otp_tabel          =20;  {Творческий отпуск                 }
         Mobili_Tabel              =21;
         Evakuac_Tabel             =22;
         Neizv_Tabel               =23;

         TEACHER_KATEGORIJA        =  1;
         UCH_WCPOM_KATEGORIJA      =  2;
         SCIENTIFIC_WORKER_KATEGORIJA = 3;
         ADM_HOZ_BJUDGET_KATEGORIJA= 4;
         AUP_BJUDGET_KATEGORIJA    = 5;
         ADM_HOZ_NIS_KATEGORIJA    = 6;
         AUP_NIS_KATEGORIJA        = 7;
         PENSIONER_KATEGORIJA      = 8;
         FIVE_DAY                  = 5;
         MAX_ITEM                  = 400;
         OSN_WID_RABOTY            = 1;
         SOWM_WID_RABOTY           = 2;
         GET_OUT                   = 1;
         NOT_GET_OUT               = 0;
         MAX_FIELD                 = 5;
         RABOTA                    = 1;  { Для                              }
         TARIF_OTPUSK              = 2;  {     переменной                   }
         DEKRET_OTPUSK             = 3;  {               STATE              }
         AUTOMATIC_MODE            = 1;  {Пересчитывать в АВТОМАТЕ          }
         MANUAL_MODE               = 2;  {Не пересчитывать в АВТОМАТЕ       }
{ *}     PENSIJA_PODRAZD1           = 81; {ПОДРАЗДЕЛЕНИЕ ПЕНСИОНЕРОВ                               * }
{$IFDEF SVDN}
{ *}     MAXSHIFR                  = 180; {МАКСИМАЛЬНЫЙ ШИФР В КОДОВОЙ ТАБЛИЦЕ                     * }
{$ELSE}
{ *}     MAXSHIFR                  = 176; {МАКСИМАЛЬНЫЙ ШИФР В КОДОВОЙ ТАБЛИЦЕ                     * }
{$ENDIF}
{ *}     LIMIT1_SHIFR              = 49; {ГРАНИЦА ПЕРЕХОДА ИЗ НАЧИСЛЕНИЙ В УДЕРЖАНИЕ               * }

{ *}     VYHODNOE_POSOBIE_SHIFR    = 23; {ВЫХОДНОЕ ПОСОБИЕ                                         * }
{ *}     MAT_POOSHR_SHIFR          = 35; {МАТЕРИАЛЬНОЕЕ ПООЩРЕНИЕ                                  * }
{ *}     KOMPENS_SHIFR             = 36; {КОМПЕНСАЦИЯ                                              * }
{ *}     PODOH_SHIFR               = 50; {ШИФР УДЕРЖАНИЙ ПОДОХОДНОГО НАЛОГА                        * }
{ *}     MALO_SHIFR                =999; {ШИФР УДЕРЖАНИЙ МАЛОСЕМЕЙНОГО НАЛОГА                      * }
{ *}     BETWEEN_SHIFR             = 53; {ШИФР УДЕРЖАНИЙ МАЛОСЕМЕЙНОГО НАЛОГА                      * }
{ *}     OKLAD_SHIFR               = 1;  {ШИФР НАЧИСЛЕНИЯ ДОЛЖНОСТНОГО ОКЛАДА                      * }
{ *}     PREM_SHIFR                = 2;  {ПРЕМИЯ                                                   * }
{ *}     PREM_SOTR_SHIFR           = 3;  {ПРЕМИЯ СОТРУДНИКАМ                                       * }
{ *}     PROC_15_SHIFR             = 4;  {ШИФР НАЧИСЛЕНИЯ ДОЛЖНОСТНОГО ОКЛАДА                      * }
{ *}     HOLIDAY_FLOW_SHIFR        = 5;  {ЗА ДНИ ОТПУСКА ТЕКУЩЕГО МЕСЯЦА                           * }
{ *}     HOLIDAY_FUTURE_SHIFR      = 6;  {ЗА ДНИ ОТПУСКА БУДУЩЕГО МЕСЯЦА                           * }
{ *}     UCH_OTP_SHIFR             = 10; {ОПЛАТА ОТПУСКОВ ПО УЧЕБЕ                                 * }
{ *}     UCH_OTP_PASS_PRD_SHIFR    = 11; {ОПЛАТА ОТПУСКОВ ПО УЧЕБЕ                                 * }
{ *}     NOT_USE_HOLIDAY_SHIFR     = 13; {ЗА ДНИ ОТПУСКА БУДУЩЕГО МЕСЯЦА                           * }
{ *}     VYH_POSOBIE_SHIFR         = 23;
{ *}     BOL_25_SHIFR              = 7;
{ *}     VYSLUGA_SHIFR             = 8;
{ *}     BOL_DOPL_SHIFR            = 19;
{ *}     SOWMESTIT_SHIFR           = 16; {ЗА СОВМЕЩЕНИЕ ДОЛЖНОСТЕЙ                                 * }
//{ *}     ZAMESTIT_SHIFR            = 17; {ЗА ЗАМЕЩЕНИЕ ДОЛЖНОСТИ                                 * }
{ *}     ZA_ZW_ZASL_SHIFR          = 17; {‡Ђ ‡ЂЊ…™…Ќ€… „Ћ‹†ЌЋ‘’€                                   * }
{ *}     DOPLATA_K_ZARPL_SHIFR     = 33; {ШИФР ПОСОбИЯ МАЛООБЕСПЕЧЕННЫМ                            * }
{ *}     POCHAS_SHIFR              = 37; {ШИФР НАЧИСЛЕНИЯ ДЛЯ ПОЧАСОВОЙ ОПЛАТЫ                     * }
{ *}     NADBAWKA_SHIFR            = 24; {ШИФР НАДБАВКИ ДЛЯ ПЕРЕСЧЕТА ОТ КОЛИЧЕСТВА ДНЕЙ           * }
{ *}     NADBAWKA_SHIFR_N          = 26; {ШИФР НАДБАВКИ ПО НИСу                                    * }
{ *}     NADBAWKA_SHIFR_GN         = 47; {ШИФР НАДБАВКИ ПО ГН                                      * }
{ *}     NIGHT_SHIFR               = 40;
{ *}     PRAZDN_SHIFR              = 39;
{ *}     BRIGADIR_SHIFR            = 38;
{ *}     KASSA_SHIFR               = 44; {ШИФР ВНЕСЕНО В КАССУ                                     * }
{ *}     Komandirowki_Shifr        = 138;{ Командировки }
//{ *}     S1BRK_SHIFR                = 61; {ШИФР ПЕРЕЧИСЛЕНИЙ В СБЕРЕГАТЕЛЬНУЮ КАССУ              * }
{ *}     PerechPoIspListamShifr    = 61; {ШИФР ПЕРЕЧИСЛЕНИЙ В СБЕРЕГАТЕЛЬНУЮ КАССУ                 * }
{ *}     AWANS_SHIFR               = 52; {ШИФР АВАНСА                                              * }
{ *}     VYPLATY_SHIFR             = 86; {ШИФР ВНЕПЛАНОВЫХ ВЫПЛАТ                                  * }
{ *}     KREDIT_SHIFR              = 78; {ШИФР ПЕРЕЧИСЛЕНИЙ КРЕДИТОВ                               * }

{ *}     PROF_SHIFR                = 62; {ШИФР УДЕРЖАНИЯ ПРОФСОЮЗНЫХ ВЗНОСОВ                       * }
{ *}     PENS_SHIFR                = 75; {ШИФР ПЕНСИОННОГО НАЛОГА                                  * }
{ *}     BOL_5_SHIFR               = 12; {БОЛЬНИЧНЫЕ ЗА ТЕКУЩИЙ МЕСЯЦ                              * }
{ *}     BOL_TEK_SHIFR             = 14; {БОЛЬНИЧНЫЕ ЗА ТЕКУЩИЙ МЕСЯЦ                              * }
{ *}     BOL_PROSHL_SHIFR          = 15; {БОЛЬНИЧНЫЙ ЗА ПРОШЛЫЙ МЕСЯЦ                              * }
{ *}     BOL_FUTURE_SHIFR          = 16; {БОЛЬНИЧНЫЙ ЗА БУДУЩИЙ МЕСЯЦ                              * }
{ *}     ZA_STEP_SHIFR             = 18; {БОЛЬНИЧНЫЙ ЗА БУДУЩИЙ МЕСЯЦ                              * }
{ *}     ZA_ZWAN_SHIFR             = 22; {БОЛЬНИЧНЫЙ ЗА БУДУЩИЙ МЕСЯЦ                              * }
{ *}     ZA_STRAH_VZNOCY_SHIFR     = 25; {ЗА ПЕРЕЧИСЛЕНИЕ СТРАХОВЫХ ВЗНОСЫ                         * }
{ *}     POSOBIE_CHILDREN_SHIFR    = 31; {ПОСОБИЕ НА ДЕТЕЙ                                         * }
{ *}  {   DONOR_SHIFR               = 30; }{ДОНОРСКИЕ                                              * }

{ *}     NADBAWKA_K_Z_SHIFR        = 30; {НАДБАВКА К ЗАРПЛАТЕ                                      * }
{ *}     DEKRET_SHIFR              = 32; {ДЕКРЕТНЫE                                                * }
{ *}     PENSIJA_SHIFR             = 29; {ПЕНСИЯ                                                   * }
{ *}     DOPL_DO_MIN_SHIFR         = 34; {ДОПЛАТА ДО МИН. ЗАРПЛАТЫ                                 * }
{ *}     ZAW_KAFEDROJ_SHIFR        = 41; {НАДБАВКА ЗА ЗАВЕДЫВАНИЕ КАФЕДРОЙ                         * }
{ *}     ZA_ZAM_DEKANA_SHIFR       = 42; {НАДБАВКА ЗА ЗАМЕЩЕНИЕ ДЕКАНА                             * }
{ *}     INDEX_SHIFR               = 28; {ИНДЕКСАЦИЯ ЗАРАБОТНОЙ ПЛАТЫ                              * }
(*{ *}     INDEX_BOL_SHIFR           = 46; {ИНДЕКСАЦИЯ ЗАРАБОТНОЙ ПЛАТЫ  (БОЛЬНИЧНЫЕ ЛИСТЫ)        * }*)
{ *}     INDEX_SALARY_SHIFR        = 45; {Индексация зарплаты                                      * }
{ *}     INDEX_BOL_SHIFR           = 46; {Индексация больничных листов                             * }
{ *}     INDEX_PODOH_SHIFR         = 85; {Подоходный налог с индексации                            * }
{ *}     ALIMENTY_ABS_SUMMA_SHIFR  = 55; {ШИФР УДЕРЖАНИЯ АЛИМЕНТОВ  (СУММА)                        * }
{ *}     ALIMENTY_SHIFR            = 56; {ШИФР УДЕРЖАНИЯ АЛИМЕНТОВ  (%)                            * }
{ *}     ALIMENTY_M_U_SHIFR        = 54; {ШИФР УДЕРЖАНИЯ МАТ УЩЕРБ  (%)                            * }
{ *}     ALIMENTY_DOLG_SHIFR_S     = 57; {ШИФР УДЕРЖАНИЯ ДОЛГ ПО УПЛАТЕ АЛИМЕНТОВ (СУММА)          * }
{ *}     ALIMENTY_DOLG_SHIFR       = 58; {ШИФР УДЕРЖАНИЯ ДОЛГ ПО УПЛАТЕ АЛИМЕНТОВ                  * }
{ *}     GOSSTRAH1_SHIFR           = MAXSHIFR;{63; ГОССТРАХ 1                                               * }
{ *}     GOSSTRAH2_SHIFR           = MAXSHIFR;{64; ГОССТРАХ 2                                               * }
{ *}     GOSSTRAH3_SHIFR           = MAXSHIFR;{65; ГОССТРАХ 3                                               * }
{ *}     GOSSTRAH4_SHIFR           = MAXSHIFR;{66; ГОССТРАХ 4                                               * }
{ *}     GOSSTRAH5_SHIFR           = MAXSHIFR;{81; ГОССТРАХ 5                                               * }
{ *}     GOSSTRAH6_SHIFR           = MAXSHIFR;{82; ГОССТРАХ 6                                               * }
{ *}     GOSSTRAH7_SHIFR           = MAXSHIFR;{83; ГОССТРАХ 7                                               * }
{ *}     PRINAT_UWOLEN_SHIFR       = 71;  { Пометка основного места работы }
{ *}     OSN_MESTO_RABOTY_SHIFR    = 82;  { Пометка основного места работы }
{ *}     NOM_KAF_SHIFR             = 83;      {83; НОМЕР КАФЕДРЫ ДЛЯ ПЛАТ ВЕДОМОСТЕЙ ПО ГН.                 * }
{ *}     PROC_PODOH_SOWM_SHIFR     = 79; {Процент удержания подоходного налога с совместителей     * }
{ *}     PERECH_PRIVATBANK_SHIFR   = 65; {Процент удержания подоходного налога с совместителей     * }
{ *}     SSUDA_SBRK_SHIFR          = 67; {ССУДА НА СБЕРКАССУ                                       * }
{ *}     SSUDA_FROM_FR_SHIFR       = 68; {ССУДА ИЗ ФОНДА РАЗВИТИЯ                                  * }
{ *}     SSUDA_UKRAINA_SHIFR       = 89; {ССУДА ИЗ БАНКА УКРАИНА                                   * }
{ *}     KWARTPLATA_SHIFR          = 90;
{ *}     FOND_Z_SHIFR              = 88;
(*{ *}     PROCENT_SSUDY_SHIFR       = 91; {ПРОЦЕНТ ССУДЫ ИЗ БАНКА УКРАИНА                           * }*)
{ *}     PART_211_4_SHIFR         = 91; {ПРОЦЕНТ ССУДЫ ИЗ БАНКА УКРАИНА                           * }
{ *}     FUTURE_KOP_SHIFR          = 96; {КОПЕЙКИ, ПЕРЕХОДЯЩИЕ НА БУДУЩИЙ МЕСЯЦ                    * }
{ *}     PROSHL_KOP_SHIFR          = 97; {КОПЕЙКИ, ПЕРЕХОДЯЩИЕ НА БУДУЩИЙ МЕСЯЦ                    * }
{ *}     VYPL_INDEX_SHIFR          = 72; {ВЫПЛАЧЕННАЯ ИНДЕКСАЦИЯ                                   * }
{ *}     SUMMA_FOR_CUPONY_SHIFR    = 45; {СУММА ДЛЯ РАСЧЕТА КУПОНОВ                                * }
{ *}     CUPONY_SHIFR              = 84; {КУПОНЫ                                                   * }
{ *}     DOLG_ZA_RABOCHIM_SHIFR    = 74; {ДОЛГ ЗА РАБОЧИМ С ПРОШЛОГО МЕСЯЦА                        * }
{ *}     PODOH_ERROR_SHIFR         = 76; {ПОДОхОДНЫЙ НАЛОГ ОШИбКАОГО МЕСЯЦА                        * }
{ *}     R_ORDER_SHIFR             = 80; {ВЫДАНО ПО РАСХОДНОМУ ОРДЕРУ                              * }
{ *}     STIPENDIJA_SHIFR          = 93; {СТИПЕНДИЯ ДЛЯ РАСЧЕТА ПОДОХОДНОГО НАЛОГА                 * }
{ *}     P_SBOR_VNE_LUGANSKA_SHIFR = 94; {Почтовый сбор с алиментов вне Луганска                   * }
{ *}     P_SBOR_V_LUGANSK_SHIFR    = 95; {Почтовый сбор с алиментов в Луганск                      * }
{ *}     SOWMESTIT_CN_SHIFR        = 105;
{ *}     S_S_SHIFR                 = 106;
{ *}     S_S_R_SHIFR               = 113;

{ *}     PENSIONER_SHIFR           = 107;
{ *}     ASPIRANT_SHIFR            = 97;
{ *}     MED_STRAH_SHIFR           = 109;
{ *}     OPLATA_ZA_OBUCH_SHIFR     = 111;
{ *}     INVALID_SHIFR             = 112;
{ *}     PENS_PROC_ZAKON_SHIFR     = 114; { ПЕНСИОННЫЙ РАССЧИТЫВАЕТСЯ ПО ЗАКОННОЙ ШКАЛЕ }
{ *}     NeedPensProcSHIFR         = 115; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     NotNeedPensProcSHIFR      = 116; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     LgotyPN2004Shifr          = 117; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     OplataObuchShifr          = 118; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     NalogSOplObuchShifr       = 119; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     OplataKomandirovokShifr   = 121; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     NalogSKomandirovokShifr   = 122; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     RazrjadShifr              = 126; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     KwoDetejOdMateriShifr     = 127; { К-во детей одинокой матери для расчета под налога      * }
{ *}     PorNomerShifr             = 128; { Порядковый номер для сортировки  * }
{ *}     NetLgotyPNShifr           = 129; { Порядковый номер для сортировки  * }
{ *}     ForIndexShifr             = 137; { Для рачета индексации  * }
{ *}     KomandirovkaShifr         = 138; { Для рачета индексации  * }
{ *}     GUIDShifr                 = 140; { Уникальный код строки                 * }
{ *}     MatHelpOblShifr           = 141; { Облагаемая материальная помощь }
{ *}     ECBShifr                  = 142; { Единый соц.внесок (обычный)                 }
{ *}     ECBNShifr                 = 143; { Единый соц.внесок (научн.работники)                 }
{ *}     ECBInvShifr               = 144; { Единый соц.внесок (инвалиды)                 }
{ *}     ECBIllShifr               = 145; { Единый соц.внесок (больничные)                 }
{ *}     ECBDpShifr                = 146; { Единый соц.внесок (больничные)                 }
{ *}     LgotyPN2011Shifr          = 147; { Для действия социальной льготы по под налогу с 2011 года }
{ *}     Prof2Shifr                = 148; { ПЕНСИОННЫЙ НАЛОГ ПО ШКАЛЕ ОТ 1 ДО 5 %       }
{ *}     DataUwShifr               = 149; { Дата увольнения                             }
{ *}     CycleComisShifr           = 150; { Цикловая комиссия для коледжа               }
{ *}     ZawKabinetShifr           = 151; { Зав кабинетом для коледжа                   }
{ *}     ProverkaTetradejShifr     = 152; { Проверка тетрадей для коледжа               }
{ *}     KlassnoeRukowodstwoShifr  = 153; { Классное руководство для коледжа            }
{ *}     ChernobOtpShifr           = 154; { Чернобыльский отпуск            }
{ *}     DopOtpForChildrenShifr    = 155; { Доп отп на детей            }
{ *}     PerersZaProshlPeriody     = 156; { Перерасчет за прошл.периоды для обложения  ЗА м-ц а не В }
{ *}     DataPriShifr              = 157; { Дата приема                                 }
{ *}     DogPodShifr               = 158; { Оплата по договору подряда                  }
{ *}     ZA_ZASL_PROF_SHIFR        = 159; { ЗА ЗВАНИЕ ЗАСЛУЖЕННОГO ПРОФЕССОРА (РЕКТОРУ) }
{ *}     FIXSUMMAIND_SHIFR         = 160; { ИНДЕКСАЦИЯ НА 01_04_2014                    }
{$IFDEF SVDN}
{ *}     NeedToPersSwod            = 166; { Включать в свод по персонофикации без сумм  }
{ *}     INNERSOWM_SHIFR           = 168;
{ *}     DIFFER_SHIFR              = 169;
{ *}     DOG_POD_VNESH_SOWM_SHIFR  = 173;
{ *}     PROSTOY_SHIFR             = 175;
{ *}     REC6CN_SHIFR              = 498;
{ *}     REC5CN_SHIFR              = 497;
{ *}     REC7CN_SHIFR              = 499;
{$ELSE}
{ *}     NeedToPersSwod            = 999; { Включать в свод по персонофикации без сумм  }
{ *}     INNERSOWM_SHIFR           = 999;
{ *}     DIFFER_SHIFR              = 999;
{ *}     PROSTOY_SHIFR             = 999;
{ *}     NOMER_PODR_SHIFR          = 170;
{ *}     GOSOB_SHIFR               = 173;
{ *}     REC6CN_SHIFR              = 998;
{ *}     REC5CN_SHIFR              = 997;
{ *}     REC7CN_SHIFR              = 999;
{$ENDIF}
{ *}     POL_SHIFR                 =  96; { Отметка пола                                             * }
{ *}     NMB_STAW_SHIFR            =  98; { Число ставок                                             * }
{ *}     KOEF_OKLAD_SHIFR          =  99; { Число ставок                                             * }
{ *}     KOD_DOLG_SHIFR            = 100; { Код должности }
{ *}     KOEF_UW_OKLAD_SHIFR       = 101; { Коэффициент повышения оклада  }
{ *}     KOD_VYPL_SHIFR            = 102; { Коэффициент повышения оклада  }
{ *}     WAR_SBOR_SHIFR            = 161; { Военный сбор                  }
{ *}     SALDO_SHIFR               = 162; { Сальдо с прошлого периода     }
{ *}     PROF_STI_1_SHIFR          = 163;
{ *}     PROF_STI_2_SHIFR          = 164;
{ *}     CN156_SHIFR               = 175; { Комментарий к 156 статье      }
{ *}     srd_Cn_shifr              = 176; { Данне по среднедневной оплате труда }
         PERSON_WORK_STATE         = 1;  {Работник находится на работе      }
         PERSON_OTPUSK_STATE       = 2;  {Работник находится в отпуске      }
         PERSON_PENSIJA_STATE      = 3;  {Работник находится на пенсии      }
         PERSON_ILLNESS_STATE      = 4;  {Работник находится на больничном  }
         PERSON_UCHEBN_STATE       = 5;  {Работник находится на уч.отпуске  }
         PERSON_DEKRET_BOLN_STATE  = 6;  {Работник находится в декр.болн.   }
         PERSON_DEKRET_STATE       = 7;  {Работник находится в декрете      }
         PERSON_UWOLEN_STATE       = 8;
         LIMIT_HOLIDAY_DAY         =10;  {Предельное число дней отпуска,    }
                                         {начиная с которого берутся удер-  }
                                         {жания с отпускных                 }
         LIMIT_CN_BASE: INTEGER    =500; {Смещение для постоянной информации}
         SHIFT_SHIFR               =1000; {Смещение для двух кредитов,сберкасс,алиментов}
         AWANS_DAY                 = 20; {День выплаты авнса                }

         LIMIT_KOD_FOR_SHOW_GETPUT  = 40; {Предельное значение, c которого начинается показ заставки чтения/записи }
         FLUSH_SCREEN_TIME          =640; {Время задержки перед потуханием экрана                           180  }
         MOVE_SCREEN_TIME           =  10; {Время задержки шага передвижения этикетки                               }
{ *}     STAWKA_WID_OPLATY         = 1;
{ *}     SDELNO_WID_OPLATY         = 2;
{ *}     POCHAS_WID_OPLATY         = 3;

         MONTH : array[1..12] of string=('Январь',
                                         'Февраль',
                                         'Март',
                                         'Апрель',
                                         'Май',
                                         'Июнь',
                                         'Июль',
                                         'Август',
                                         'Сентябрь',
                                         'Октябрь',
                                         'Ноябрь',
                                         'Декабрь');
         A_MONTH : array[1..12] of string=('junuary',
                                           'FEBRUARY',
                                           'MARCH',
                                           'APRIL',
                                           'MAY',
                                           'JUNE',
                                           'JULY',
                                           'AUGUST',
                                           'SEPTEMBE',
                                           'OCTOBER',
                                           'NOVEMBER',
                                           'DECEMBER');
       MAX_deja = 40;
       ChernobSchet = 36;
       ChernobKindOtp = 2;
       iskraPodr    = 179;

      {$IFDEF SVDN}
        MAX_TABEL_KOD=20;
        SHIFR_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[2]=
         ('Я ','ОЖ','К ','Т ','У ','ОТ','А ','ЛЧ','Е ','Ч ','Г ','Р ','Б ','ПР','  ','ЛТ','До','ПК','П ','ТВ');
      NAME_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[35]=
           ('Явка на роботу                    ',
            'Вiдпуска жiнкам на дитину до року ',
            'Служебовi вiдрядення              ',
            'Неспачувана непрацездатнiсть      ',
            'Вiпустка у звязку з навчанням     ',
            'Щорiчна вiдпустка                 ',
            'Вiпустка без збереження зарплати  ',
            'Зкорочений рабочий день           ',
            'Вихiднi та святковi днi           ',
            'Вiйсково-навчальнi зборы          ',
            'Державнi обов''язки               ',
            'Вiдпуска по вагiтностi та пологам ',
            'Захворювання                      ',
            'Прогул                            ',
            'Пробiл                            ',
            'Легка праця                       ',
            'Донорскi                          ',
            'Подвищення квалiфiкацii           ',
            'Простой                           ',
            'Творча вiдпустка                  ');
      {$ELSE}
        MAX_TABEL_KOD=23;
        SHIFR_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[2]=
         ('Я ','ОЖ','К ','Т ','У ','ОТ','ОБ','ЛЧ','Е ','Ч ','Г ','Р ','Б ','ПР','  ','ЛТ','До','ПК','П ','ТВ','ДН','НЭ','НН');
        NAME_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[35]=
           ('Явка на работу                    ',
            'Отпуск женщинам на ребенка до года',
            'Служебные командировки            ',
            'Неоплачиваемая нетрудоспособность ',
            'Отпуск в связи с обучением        ',
            'Ежегодные отпуска                 ',
            'Отпуск без сохранения зарплаты    ',
            'Сокращенный рабочий день          ',
            'Выходные и праздничные дни        ',
            'Военно-учебные сборы              ',
            'Государственные обязанности       ',
            'Отпуска по беременности и родам   ',
            'Болезнь                           ',
            'Прогул                            ',
            'Пробел                            ',
            'Легкий труд                       ',
            'Донорские                         ',
            'Повышение квалификации            ',
            'Простой                           ',
            'Творческий отпуск                 ',
            'Другое неотработанное время       ',
            'Неявка в связи с эвакуацией       ',
            'Неявка по неизвестным причинам    '
            );
      {$ENDIF}

type
       PERSON_PTR   = ^PERSON;

       TABEL_TYPE   = ARRAY[1..31] OF BYTE;
       HOLIDAY_TYPE = ARRAY[1..4,1..2,1..3] OF BYTE;
       ADD_PTR      = ^ADD;
       UD_PTR       = ^UD;
       CN_PTR       = ^CN;
       SOWM_PTR     = ^SOWM;

       PERSON    = RECORD
                       TABNO            : WORD;
                       FIO              : STRING[50];
                       GRUPPA           : word; {NIS BJDGET,GN,FR}
                       KATEGORIJA       : WORD; {NIS,UWP,PREPOD}
                       DOLG             : STRING[50];
                       OKLAD            : REAL;
                       WID_RABOTY       : word; {SOWM,OSN}
                       N_TEMY           : STRING[10];
                       MESTO_OSN_RABOTY : WORD;
                       WID_OPLATY       : WORD; {STAWKA,SDELNO,POCHASOWO}
                       MODE             : WORD; {5-,6- DAY}
                       FROM             : WORD; {OTKUDA PRIBYL}
                       PODOH            : BYTE;
                       MALO             : BYTE;
                       PROFSOJUZ        : BYTE;
                       DAY              : REAL;
                       MAIN             : WORD; {1 - ДЛЯ НАСТОЯЩЕГО ОСНОВНОГО МЕСТА РАБОТЫ}
                                                   {0 - ДЛЯ ПРОШЛОГО ОСНОВНОГО МНСТА РАБОТЫ}
                       TABEL            : TABEL_TYPE;
                       HOLIDAY          : HOLIDAY_TYPE;
                       STATE            : BYTE;             {Работа отпуск декрет}
                       AUTOMATIC        : BYTE;              {Считать или не считать}
                       START_DAY        : BYTE;              {С этого дня начинать считать табель}
                       PENS             : BYTE;
                       BANK             : BYTE;
                       ID               : LongWord;
                       Reserved         : LongWord;
          //             RESERVED         : ARRAY[1..8] OF BYTE;
                       NAL_CODE         : STRING[10];

                       NEXT             : PERSON_PTR;
                       SOWM             : SOWM_PTR;
                       ADD              : ADD_PTR;
                       UD               : UD_PTR;
                       CN               : CN_PTR;

                  END;
       SOWM      = RECORD
                       WHERE : WORD;
                       NEXT  : SOWM_PTR;

                   END;
       Add       = RECORD
                       SHIFR      : WORD   ;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;   {1991 - 1 и т д}
                       SUMMA      : REAL   ;
                       FMP        : REAL   ;
                       FZP        : REAL   ;
                       OTHER      : REAL   ;
                       VYPLACHENO : WORD   ;
                       WHO        : WORD   ;    {Получена автоматически или вручную}
                       WORK_DAY   : WORD   ;
                       WORK_CLOCK : REAL   ;
                       SHIFR_KAT  : BYTE   ;
                       SHIFR_GRU  : BYTE   ;
                       COUNT      : STRING[8];
                       ZO         : Byte   ;
                       otk        : Byte   ;
                       nrc        : Byte   ;
                       PAY_TP     : Byte   ;
                       CODE_PRIZ_1DF : WORD  ;
                       NEXT       : ADD_PTR;
                  END;
       UD       = RECORD
                       SHIFR      : WORD   ;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;   {1991 - 1 и т д}
                       SUMMA      : REAL ;
                       VYPLACHENO : WORD   ;
                       WHO        : WORD   ;   {Получена автоматически или вручную}
                       COUNT      : STRING[8];
                       NEXT       : UD_PTR;
                  END;
      CN        = RECORD
                       SHIFR        : WORD;
                       KOD          : WORD;
                       SUMMA        : REAL;
                       PRIM         : word;
                       PRIM_1       : STRING[50];
                       DEJA_COUNTED : BYTE;       {Флаг "Уже прибавлена сумма для кредита}
                       FLOW_SUMMA   : REAL;       {Текущая выплаченная сумма кредита}
                       LIMIT_SUMMA  : REAL;       {Требуемая сумма кредита }
                       AUTOMATIC    : BYTE;
                       ID           : WORD;
                       COUNT        : STRING[8];
                       Next         : CN_PTR;
                  END;


       IO_BUF_PTR_TYPE   = ^IO_BUF_TYPE;
       IO_BUF_TYPE = ARRAY[1..SIZE_OF_IO_BUF] OF BYTE;
       TMainScreenRec = record
                         Shifr : integer;
                         Add   : boolean;
                         Summa : double;
                        end;
       TFORMAT_MODE=(NEW_FORMAT_MODE,OLD_FORMAT_MODE);

const
       L_Person_Data=SizeOf(Person)-SizeOf(Add_Ptr)-SizeOf(Ud_Ptr)-SizeOf(Cn_Ptr)-SizeOf(Sowm_Ptr)-SizeOf(Person_Ptr)-
                     SizeOf(TABEL_TYPE)-SizeOf(HOLIDAY_TYPE)-5-8-11;//SizeOf(string[10]);
(*
                       HOLIDAY          : HOLIDAY_TYPE;
                       STATE            : BYTE;             {Работа отпуск декрет}
                       AUTOMATIC        : BYTE;              {Считать или не считать}
                       START_DAY        : BYTE;              {С этого дня начинать считать табель}
                       PENS             : BYTE;
                       BANK             : BYTE;
                       RESERVED         : ARRAY[1..8] OF BYTE;
                       NAL_CODE         : STRING[10];
*)

         hugeWrongYear         = 2030;
{$IFDEF SVDN}
         NIGHT_PROC   = 35.00;
{$ELSE}
         NIGHT_PROC   = 40.00;
{$ENDIF}

   const limitSemaphoreTime=2 * 1000;



var
    HEAD_PERSON,TAIL_PERSON:PERSON_PTR;
    HEAD_PERSON_OLD,TAIL_PERSON_OLD:PERSON_PTR;
    NSRV,NMES,FLOW_MONTH:LongInt;
    NSRVARR:array[1..10] of integer;
    NPDR:LongInt;
    MainDir,
    CDIR,        {Директория для постоянной информации                   }
    DDIR,        {Директория для текущих данных. Файлы с расширением .DAT}
    BDIR,        {Директория для копий. Файлы с расширением .BAK         }
    WDIR,        {Директория для хранения эталона отпускных данных       }
    ADIR,        {Директория для хранения данных по выплаченному авансу  }
    CUDIR,       {Директория для хранения данных по выплаченным купонам  }
    IDIR,        {Директория для хранения реестра больничных листов      }
    FLAG_DIR,    {Директория для сетевых флагов                          }
    tmpDir,      {Директория для сохранения файлов в кажмл месяце        }
    TemplateDIR,
    OTP_DIR,
    CLAR_DIR,
    POD_DIR,
    NET_DIR,
    Bank_Dir,
    Local_Dir,
    CMEM,        { Описание каталога мемориальных ордеров                }
    CDOC:STRING; { Директория для выходных форм                          }
    GL_BUH_DOLG_NAME,DIREKTOR_DOLG_NAME,Org_Name:STRING;
    FNINF:string;
    MUST_FIND_PERSON       : boolean;  {СБРОСИТЬ   ФЛАГ ДЛЯ ПРОГРАММЫ GETINF}
    SEARCH_ONLY_ONE_PERSON : boolean;  {НЕ НАДО ИСКАТЬ ОДНОГО РАБОТНИКА ПО УСЛОВИЮ}
    kz:integer;
{    LIMIT_NET_TIME,Delay_Net:integer;    }

    IO_BUF            : IO_BUF_PTR_TYPE;
    MAX_COUNT_PODRAZD : integer;
    Count_Serv        : integer;
    MAX_COUNT_Dolg    : integer;
    COUNT_DOLG        : integer;
    DAY_KOD:ARRAY[1..31] OF BYTE;
    DAY_KOD_COLEDGE:ARRAY[1..31] OF BYTE;
    STRR,DISK,C_FLOW_MONTH,FLOW_YEAR,WORK_YEAR:STRIng;
    CURRYEAR:WORD;
    HEAD_ARRAY:ARRAY[1..MAX_FIELD] OF PERSON_PTR;
    SELECTED_FIELD:integer;
    Flag_Filter : boolean;
    MUST_SHOW_IO_TABLE: BOOLEAN;
    NET_DRIVE         : BYTE;
    NAME_PODR : array[1..10] of string;
    kat_name  : array[1..max_kat] of string;
    kat_short_name : array[1..max_kat] of string;
    ist_fin_name:ARRAY[1..max_gruppa] OF STRING;
    ist_fin_plt_name:ARRAY[1..max_gruppa] OF STRING;
{ *} home_tema:integer;
{ *} MAX_KATEGORIJA : integer;  {МАКСИМАЛЬНОЕ ЧИСЛО КАТЕГОРИЯЙ (ПРЕПОД.,УЧ.ВСП,Н.СОТР.)   * }
{ *} MAX_ist_fin:integer;       {МАКСИМАЛЬНОЕ ЧИСЛО источников финансирования }
    W_DAY_5:ARRAY[1..12] OF INTEGER;
    W_DAY_6:ARRAY[1..12] OF INTEGER;
    W_DayColedg:ARRAY[1..12] OF INTEGER;
    CLOCKS:ARRAY[1..12] OF REAL;
    CLOCKSColedg:ARRAY[1..12] OF REAL;

    KadryName : string;
    Storonnee_Podr:integer;
    LENGTH_SERV       : INTEGER;                            { МАКСИМАЛЬНАЯ ДЛИНА НАИМЕНОВАНИЯ ПОДРАЗДЕЛЕНИЯ }
    Count_Shifr       : Integer;
    Count_Shifr_add   : Integer;
    Count_Shifr_ud    : Integer;

    MainScreen : array[1..Nmb_Of_Col_Main_Screen] of TMainScreenRec;

    L_Shifr,M_Shifr:integer;
    LENGTH_DOLG:INTEGER;                            { МАКСИМАЛЬНАЯ ДЛИНА НАИМЕНОВАНИЯ ПОДРАЗДЕЛЕНИЯ }

    LIMIT_OPEN_TRY_NET    : REAL=100.;
    DELAY_NET             : WORD=10;
    LIMIT_NET_TIME        : LONGINT=5;     {Пять секунд пытаться открыть флаг}
    SAFE_PUTINF           : BOOLEAN=true;
    WORK_YEAR_VAL         : WORD;
    CURR_PODOH_MONTH      : integer;
    CURR_PODOH_MONTH_2004 : Integer;
    CURR_PODOH_YEAR       : Integer;
    PODOHLGOTA,LIMITPODOHLGOTA,PROCPODOH,PROCADDPODOH:real;
    LIMITFORPENS:real;
    FLAG_NAUD_FOR_OTHER_MONTH:boolean;
    MUST_SHOW_PODOH:boolean;
    MUST_NEW_MODE_RECALC_PODOH:boolean;
    Update:boolean;
    DEPTH_NALOG_RECALCULAYTING :integer;
    PROC_PODOH_SOWM    : real;
    Must_Show_Nalogi   : Boolean;
    CURR_GRUPPA : array[1..MAX_GRUPPA] of boolean;
    CURR_KATEGORIJA : array[1..max_kat] of boolean;
    SWOD_MODE       : (INVALID_SWOD,COMMON_SWOD,PENS_SWOD);
    FORMAT_MODE       : TFORMAT_MODE;
    NEED_NET_FOR_GETINF:boolean;
    Is_Selected:array[1..max_person] of boolean;
    CurrWrk,CurrRight:integer;
    CurrWrkFio:string;
    MONTH_DAY:ARRAY[1..3,1..12,1..31] OF BYTE;
    MONTH_DAY_COLEDGE:ARRAY[1..3,1..12,1..31] OF BYTE;
    Max_Person_Id:integer;
    NeedLogIb:boolean; { Нужен лог Файерберда }
    Curr_Pens_Month : integer;
    Sowm_Swod:boolean;
    parsal1            : array[1..3,1..12] of real;
    Total_Add_Shifr   : integer;
    Total_Ud_Shifr    : integer;
    NeedFileBolnMode  : boolean;
    ECBProc           : real;
    ECBNProc          : real;
    ECBIllProc        : real;
    ECBInvProc        : real;
    ECBDpProc         : real;
    AddPodohFor17     : real;
    Limit_17_Summa    : real;
    CRC32Ori,CRC32New : Cardinal;
    ProgramForRecalcNalogi : integer;
    NeedLogForRecalculateNalogiPerson : boolean;
    NeedDelOtherMonthNalogi : boolean;
    NeedBlockRecalcedNalogi : boolean;
    CalculationPersonInProgress : Boolean;
    CurrentPodrReadedByOperator : Integer;
    SavedPodr                   : Integer;
    HEAD_PERSON_SAVE : PERSON_PTR;
    DefaultAddShifr : Integer; {Последний введеніій руками шифр начислений}
    WantedCharForSummaPltFormat:string[1];
    NmbOfAttempt : Integer;
    TmpFirstMode : Boolean;
    NeedTestAddDuplicates,NeedRepairFindedAddDuplicates : Boolean;
    modeIskra    : Boolean;
    modeKadrySQL : Boolean;
    Block_Program : Boolean;
    NeedTestGetPutInf : Boolean;
    needTestMem : boolean;
    needSwodSQLLogByPerson   : Boolean;
    DebugMemoryCorruption:Boolean;
    needIOSQL:Boolean;
    Data_Pri_Mem : TDateTime; // Дата приказа для ввода отпускных
    ProcWS:Real;
    OkladyRazr:array[1..25] of Real;
    UseIOSQLMonitorLevel:integer; //0-не использовать 1-только запись 2-все и чтение и запись
    isSVDN,isLNR,isGKH:Boolean;
    passwordForChangeMonth:string;
    selectedInteger:Integer; //Для возврата найденного кода
    procDiffSal:real;
    SystemCrash:Boolean;
    manualSave:Boolean;
    canViewProtectedPodr:boolean;
    needRoundNalogiCalculation:boolean;
    wantedRoundNalogiValue:integer;
    bolnLNRMode2016:boolean;
    needAllPodr:boolean;      // Указать в меню все подразд даже резервы для СВДН
    needHideGenerMessages:boolean;
    TYP_PRIKAZA_PEREVOD:Integer;
    needServerAppData:Boolean;
    needUseIOSemaphore:Boolean;
    versionInfo:string;
    instantExeFileSize:integer;

    SVDNfooterRec:record
                       summaAdd         : Real;
                       summa_MP_31      : Real;
                       summa_MP__NE_31  : Real;
                       summa_vyh_pos_23 : Real;
                       summa_pogr_165   : Real;
                       summa_invalidy   : Real;
                       summa_lt_min_sal : Real;
                       summa_gt_max_sal : Real;
                       summa_kompens_1  : Real;
                       dtSummaAdd         : tdateTime;
                       dtSumma_MP_31      : tdateTime;
                       dtsumma_MP__NE_31  : tdateTime;
                       dtsumma_vyh_pos_23 : tdateTime;
                       dtsumma_pogr_165   : tdateTime;
                       dtsumma_invalidy   : tdateTime;
                       dtsumma_lt_min_sal : tdateTime;
                       dtsumma_gt_max_sal : tdateTime;
                       dtsumma_kompens_1  : tdateTime;
                  end;

    personList:TList;
{$IFDEF SVDN}
const LenBlSta=38;
{$ELSE}
const LenBlSta=39;
{$ENDIF}
const BlSta:array[1..LenBlSta] of integer = (PENSIJA_SHIFR, STIPENDIJA_SHIFR      , POL_SHIFR       , OSN_MESTO_RABOTY_SHIFR  , SOWMESTIT_CN_SHIFR    ,
                                      PRINAT_UWOLEN_SHIFR , PROC_PODOH_SOWM_SHIFR , PENSIONER_SHIFR , INVALID_SHIFR           , PENS_PROC_ZAKON_SHIFR ,
                                      NeedPensProcSHIFR   , LgotyPN2004Shifr      , OplataObuchShifr, OplataKomandirovokShifr , NotNeedPensProcSHIFR  ,
                                      ASPIRANT_SHIFR      , NMB_STAW_SHIFR        , KOEF_OKLAD_SHIFR, NOM_KAF_SHIFR           , KOD_DOLG_SHIFR        ,
                                      KOEF_UW_OKLAD_SHIFR , KOD_VYPL_SHIFR        , RazrjadShifr    , KwoDetejOdMateriShifr   , PorNomerShifr         ,
                                      NetLgotyPNShifr     , ForIndexShifr         , GUIDShifr       , LgotyPN2011Shifr        , DataUwShifr           ,
                                      DataPriShifr        , FIXSUMMAIND_SHIFR     , NeedToPersSwod  , INNERSOWM_SHIFR
                                      {$IFNDEF SVDN}
                                       , NOMER_PODR_SHIFR
                                       , CN156_SHIFR
                                      {$ENDIF}
                                      {$IFDEF SVDN}
                                       ,DOG_POD_VNESH_SOWM_SHIFR 
                                      {$ENDIF}
                                       , REC6CN_SHIFR
                                       , REC5CN_SHIFR
                                       , REC7CN_SHIFR
                                      );
{$IFDEF SVDN}
const LenProtectedPodr=2;
const ProtectedPodrList:array[1..LenProtectedPodr] of integer = (76,102);
{$ELSE}
const LenProtectedPodr=1;
const ProtectedPodrList:array[1..LenProtectedPodr] of integer = (81);
{$ENDIF}




implementation
 var iLoc:integer;
begin
    Head_Person         := Nil;
    Tail_Person         := Nil;
    Head_Person_old     := Nil;
    Tail_Person_old     := Nil;
    Direktor_DOLG_Name  := 'Ректор                 Голубенко А.Л.';
    Gl_BUH_DOLG_NAME    := 'Главный бухгалтер      Белоусова Л.И.';
    LIMIT_NET_TIME      := 5;
    DELAY_NET           := 1;
    MAX_COUNT_PODRAZD   := 182;
    SELECTED_FIELD      := 1;
    Flag_Filter         := false;
    MUST_SHOW_IO_TABLE  := false;
    NSrv                := 1;
    Nmes                := 1;
    NPDR                := 1;
    MUST_NEW_MODE_RECALC_PODOH:=false;
    Update              := false;
    DEPTH_NALOG_RECALCULAYTING :=6;
    LIMITFORPENS        := 20706;
    PROC_PODOH_SOWM     := 20;
    Must_Show_Nalogi    := false;
    Must_Show_Podoh     := false;
    SWOD_MODE           := COMMON_SWOD;
    FORMAT_MODE         := NEW_FORMAT_MODE;
    NEED_NET_FOR_GETINF :=true;
    NEW(IO_BUF);
    CurrWrkFIO:='Нет';
    CurrWrk:=0;
    CurrRight     := 1; { Оператор }
    Max_Person_Id := 0;
    NeedLogIb     := false;
    Curr_Pens_Month := 1;
    NeedFileBolnMode := false;
    ECBProc            := -1;
    ECBNProc           := -1;
    ECBIllProc         := -1;
    ECBInvProc         := -1;
    ECBDpProc          := -1;
    AddPodohFor17      := 1411.50;
    Limit_17_Summa     := 9410.00;
    PROCPODOH          := 0.15;
    PROCADDPODOH       := 0.20;
    CRC32Ori           := 0;
    CRC32New           := 0;
    ProgramForRecalcNalogi:=1;
    NeedLogForRecalculateNalogiPerson:=False;
    NeedDelOtherMonthNalogi := true;
    NeedBlockRecalcedNalogi := false;
    CalculationPersonInProgress := False;
    CurrentPodrReadedByOperator := 0;
    HEAD_PERSON_SAVE := Nil;
    SavedPodr := 0;
    DefaultAddShifr := 1; { Изначально - оклад }
    WantedCharForSummaPltFormat := '-';
    NmbOfAttempt          := 5;
    TmpFirstMode          := True;
    NeedTestAddDuplicates := false;
    NeedRepairFindedAddDuplicates:=False;
    modeIskra             := False;
    modeKadrySQL          := True;
    Block_Program         := false;
    NeedTestGetPutInf     := false;
    needTestMem           := false;
    needSwodSQLLogByPerson:= False;
    DebugMemoryCorruption := false;
    needIOSQL             := false;
    Data_Pri_Mem          := Date;
    ProcWS                := 1.5;    { Процент сбора на военный налог }
    UseIOSQLMonitorLevel  := 0;
    selectedInteger       := 0;

    FillChar(OkladyRazr,SizeOf(OkladyRazr),0);
    FillChar(SVDNfooterRec,SizeOf(SVDNfooterRec),0);
    procDiffSal := 2.5;
    SystemCrash := False;
    manualSave  := false;
    passwordForChangeMonth:='';
    canViewProtectedPodr:=false;
    for iLoc:=1 to MAX_FIELD do
        HEAD_ARRAY[iLoc]:=Nil;
    isGKH  := False ;
    needRoundNalogiCalculation := false;
    wantedRoundNalogiValue     := -2;  // До копеек
    bolnLNRMode2016:=false;
    needAllPodr:=false;
    needHideGenerMessages:=false;
    FillChar(NSRVarr,SIZEOF(NSRVARR),0);
    TYP_PRIKAZA_PEREVOD:=7;
    needServerAppData:=False;
    needUseIOSemaphore:=false;
    DDIR:='';
    instantExeFileSize:=10876928;

{$IFDEF SVDN}
    isSVDN := True  ;
    isLNR  := False ;
{$ELSE}
    isSVDN := false;
    isLNR  := true;
{$ENDIF}
    personList:=TList.Create;
end.
