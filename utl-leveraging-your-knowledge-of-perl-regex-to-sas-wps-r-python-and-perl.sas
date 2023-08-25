%let pgm=utl-leveraging-your-knowledge-of-perl-regex-to-sas-wps-r-python-and-perl;

Leveraging your knowledge of perl regex to sas wps r python and perl

github
https://tinyurl.com/mve4d29w
https://github.com/rogerjdeangelis/utl-leveraging-your-knowledge-of-perl-regex-to-sas-wps-r-python-and-perl

PROBLEM

   Given string 'Geeksforgeeks' change the string to 'Booksforgeeks' using PERL like regex.

     1. R code  (see below for details strInp='Geeksforgeeks')
        gsub('^gee', 'Boo', strInp, ignore.case = TRUE, perl=TRUE);

     2. WPS/SAS
        prxchange = prxchange('s/^gee/Boo/i', -1,strInp);

     3. Python
        prxchange=re.sub(r"^gee", "Boo", strInp,flags=re.IGNORECASE);

     4. PERL (Batch scripts are the domain of PERL?, Not R or Python?)
        $str =~ s/$find/$replace/i;`

   Other languages support PERL regex LIKE syntax ie Javascript, Java, Ruby?

   NOTE: When you drop down to another  parent address space is shared the child.
         However if you change the system variable in the child it is not reflected in the parent?
         System variables maintain there values.
         The exceptopn is dosubl, which work both ways?

Macros on end
     R       utl_rbeginx % utlrendx
     PERL    utl_submit_pl64x
     PYTHON  utl_pybeginx % utlpyendx

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options set=SCRATCH "Geeksforgeeks";

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Input is contents of the system enviroment variable SCRATCH.                                                           */
/*                                                                                                                        */
/* You need to setup a SCRATCH system enviroment variable ahad of time                                                    */
/*                                                                                                                        */
/* To set up SCRATCH                                                                                                      */
/* Type env in win 10 search box then create system variable SCRATCH                                                      */
/*                                                                                                                        */
/* SCRATCH will be common text area shared among a single shared address area                                             */
/*                                                                                                                        */
/* This SAS option places the string  Geeksforgeeks into the system area                                                  */
/*                                                                                                                        */
/* options set=SCRATCH "Geeksforgeeks";                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Data passed as meta macro variable back to the parent language (mainline) program.                                     */
/*                                                                                                                        */
/* Changed text as a WPS/SAS meta macro variaable which is VERY EASY TO EXPORT TO ANY LANGUAGE                            */
/*                                                                                                                        */
/*                                                                                                                        */
/* %put modified string &=prxchange;                                                                                      */
/*                                                                                                                        */
/* %put modified string PRXCHANGE=Booksforgeeks                                                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*   ____
/ | |  _ \
| | | |_) |
| | |  _ <
|_| |_| \_\

*/

/*---- SETUP                                                             ----*/
/*---- clear system enviroment variable SCRATCH                          ----*/
options set=SCRATCH " ";
%put --%sysfunc(sysget(SCRATCH))--;

/*---- set   system enviroment variable SCRATCH = Geeksforgeeks          ----*/
options set=SCRATCH "Geeksforgeeks";
%put -- %sysfunc(sysget(SCRATCH)) --;

/*----  clear meta data area                                             ----*/
%symdel prxchange / nowarn;

/*---- Drop down to R                                                    ----*/
%utl_rbeginx;
parmcards4;
strInp<-Sys.getenv("SCRATCH");
prxchange<-gsub('^gee', 'Boo', strInp, ignore.case = TRUE, perl=TRUE);
str(prxchange);
prxchange;
writeClipboard(prxchange);
;;;;
%utl_rendx(return=prxchange);

%put modified string &=prxchange;

/*___                          __
|___ \  __      ___ __  ___   / /__  __ _ ___
  __) | \ \ /\ / / `_ \/ __| / / __|/ _` / __|
 / __/   \ V  V /| |_) \__ \/ /\__ \ (_| \__ \
|_____|   \_/\_/ | .__/|___/_/ |___/\__,_|___/
                 |_|
*/

%utl_wpsbeginx;

/*---- SETUP                                                             ----*/
/*---- clear system enviroment variable SCRATCH                          ----*/
options set=SCRATCH " ";
%put --%sysfunc(sysget(SCRATCH))--;

/*---- set   system enviroment variable SCRATCH = Geeksforgeeks          ----*/
options set=SCRATCH "Geeksforgeeks";
%put -- %sysfunc(sysget(SCRATCH)) --;

/*----  clear meta data area                                             ----*/
%symdel prxchange / nowarn;
parmcards4;
options set=SCRATCH "Geeksforgeeks";
data _null_;
  strInp=sysget('SCRATCH');
  prxchange = prxchange('s/^gee/Boo/i', -1,strInp);
  put prxchange=;
  call symputx("prxchange",prxchange);
run;quit;
%put modified string &=prxchange;
;;;;
%utl_wpsendx;

/*____               _   _
|___ /   _ __  _   _| |_| |__   ___  _ __
  |_ \  | `_ \| | | | __| `_ \ / _ \| `_ \
 ___) | | |_) | |_| | |_| | | | (_) | | | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_|
        |_|    |___/
*/


/*---- SETUP                                                             ----*/
/*---- clear system enviroment variable SCRATCH                          ----*/
options set=SCRATCH " ";
%put --%sysfunc(sysget(SCRATCH))--;

/*---- set   system enviroment variable SCRATCH = Geeksforgeeks          ----*/
options set=SCRATCH "Geeksforgeeks";
%put -- %sysfunc(sysget(SCRATCH)) --;

%symdel prxchange / nowarn;

%utl_pybeginx;
parmcards4;
import re;
import os;
import pyperclip;
strInp = os.environ["SCRATCH"];
prxchange=re.sub(r"^gee", "Boo", strInp,flags=re.IGNORECASE);
print(prxchange);
pyperclip.copy(prxchange);
;;;;
%utl_pyendx(return=prxchange);

%put modified string &=prxchange;

/*  _                     _
| || |    _ __   ___ _ __| |
| || |_  | `_ \ / _ \ `__| |
|__   _| | |_) |  __/ |  | |
   |_|   | .__/ \___|_|  |_|
         |_|
*/


/*---- SETUP                                                             ----*/
/*---- clear system enviroment variable SCRATCH                          ----*/
options set=SCRATCH " ";
%put --%sysfunc(sysget(SCRATCH))--;

/*---- set   system enviroment variable SCRATCH = Geeksforgeeks          ----*/
options set=SCRATCH "Geeksforgeeks";
%put -- %sysfunc(sysget(SCRATCH)) --;

%symdel prxchange / nowarn;

%utl_submit_pl64x('
use Win32::Clipboard;`
$str =  $ENV{SCRATCH};`
$find = "^Gee";`
$replace = "Boo";`
$str =~ s/$find/$replace/i;`
print $str;`;
$clip = Win32::Clipboard->new();`
$clip->Set($str);`
',return=prxchange);

%put modified string &=prxchange;

/*
 _ __ ___   __ _  ___ _ __ ___  ___
| `_ ` _ \ / _` |/ __| `__/ _ \/ __|
| | | | | | (_| | (__| | | (_) \__ \
|_| |_| |_|\__,_|\___|_|  \___/|___/
       _   _               _               _ _         _  __   _  _
 _   _| |_| |    ___ _   _| |__  _ __ ___ (_) |_ _ __ | |/ /_ | || |
| | | | __| |   / __| | | | `_ \| `_ ` _ \| | __| `_ \| | `_ \| || |_
| |_| | |_| |   \__ \ |_| | |_) | | | | | | | |_| |_) | | (_) |__   _|
 \__,_|\__|_|___|___/\__,_|_.__/|_| |_| |_|_|\__| .__/|_|\___/   |_|
           |_____|                              |_|
*/
filename ft15f001 "c:/oto/utl_submit_pl64x.sas";
parmcards4;
%macro utl_submit_pl64x(pgm,return=)/des="bactic separated set of py commands";
  * write the program to a temporary file;
  filename pl_pgm "%sysfunc(pathname(work))/pl_pgm.pl" lrecl=32766 recfm=v;
  data _null_;
    length pgm  $32755 cmd $255;
    file pl_pgm ;
    pgm=&pgm;
    semi=countc(pgm,'`');
      do idx=1 to semi;
        cmd=cats(scan(pgm,idx,'`'));
        put cmd $char96.;
        putlog cmd $char96.;
      end;
  run;
  run;quit;
  %let _loc=%sysfunc(pathname(pl_pgm));
  %put &_loc;
  filename rut pipe "d:\strawberry\perl\bin\perl &_loc > d:/log/__log.txt";
  data _null_;
    file print;
    infile rut;
    input;
    put _infile_;
  run;quit;
  filename rut clear;
  filename pl_pgm clear;
  data _null_;
    infile "d:/log/__log.txt";
    input;
    put _infile_;
  run;quit;
 %if "&return" ne ""  %then %do;
   filename clp clipbrd ;
   data _null_;
    infile clp;
    input;
    putlog "xxxxxx  " _infile_;
    call symputx("&return.",_infile_,"G");
   run;quit;
  %end;
%mend utl_submit_pl64x;
;;;;


/*     _   _          _                _                __     _   _                          _
 _   _| |_| |    _ __| |__   ___  __ _(_)_ __ __  __   / /   _| |_| |    _ __   ___ _ __   __| |_  __
| | | | __| |   | `__| `_ \ / _ \/ _` | | `_ \\ \/ /  / / | | | __| |   | `__| / _ \ `_ \ / _` \ \/ /
| |_| | |_| |   | |  | |_) |  __/ (_| | | | | |>  <  / /| |_| | |_| |   | |   |  __/ | | | (_| |>  <
 \__,_|\__|_|___|_|  |_.__/ \___|\__, |_|_| |_/_/\_\/_/  \__,_|\__|_|___|_|    \___|_| |_|\__,_/_/\_\
           |_____|               |___/                             |_____|
*/

%macro utl_rbeginx(return=)/des="utl_rbeginx uses parmcards and must end with utl_rendx macro";
%utlfkil(c:/temp/py_pgm.py);
%utlfkil(c:/temp/py_pgm.log);
filename ft15f001 "c:/temp/r_pgm";
%mend utl_rbeginx;

%macro utl_rendx(return=)/des="utl_rbeginx uses parmcards and must end with utl_rendx macro";
* EXECUTE R PROGRAM;
options noxwait noxsync;
filename rut pipe "D:\r412\R\R-4.1.2\bin\r.exe --vanilla --quiet --no-save < c:/temp/r_pgm";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/r_pgm";
  input;
  putlog _infile_;
run;quit;
%if "&return" ne ""  %then %do;
  filename clp clipbrd ;
  data _null_;
   infile clp;
   input;
   putlog "xxxxxx  " _infile_;
   call symputx("&return.",_infile_,"G");
  run;quit;
  %end;
%mend utl_rendx;

                                                                                                            _
/*     _   _                  _                _                __     _   _     _ __  _   _  ___ _ __   __| |_  __
 _   _| |_| |     _ __  _   _| |__   ___  __ _(_)_ __ __  __   / /   _| |_| |   | `_ \| | | |/ _ \ `_ \ / _` \ \/ /
| | | | __| |    | `_ \| | | | `_ \ / _ \/ _` | | `_ \\ \/ /  / / | | | __| |   | |_) | |_| |  __/ | | | (_| |>  <
| |_| | |_| |    | |_) | |_| | |_) |  __/ (_| | | | | |>  <  / /| |_| | |_| | __| .__/ \__, |\___|_| |_|\__,_/_/\_\
 \__,_|\__|_|____| .__/ \__, |_.__/ \___|\__, |_|_| |_/_/\_\/_/  \__,_|\__|_||__|_|    |___/
           |_____|_|    |___/            |___/

*/

%macro utl_pybeginx;
%utlfkil(c:/temp/py_pgm.py);
%utlfkil(c:/temp/py_pgm.log);
filename ft15f001 "c:/temp/py_pgm.py";
%mend utl_pybeginx;
%macro utl_pyendx(return=);
* EXECUTE THE PYTHON PROGRAM;
options noxwait noxsync;
filename rut pipe  "d:\Python310\python.exe c:/temp/py_pgm.py 2> c:/temp/py_pgm.log";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/py_pgm.log";
  input;
  putlog _infile_;
run;quit;
%if "&return" ne ""  %then %do;
  filename clp clipbrd ;
  data _null_;
   infile clp;
   input;
   putlog "xxxxxx  " _infile_;
   call symputx("&return.",_infile_,"G");
  run;quit;
  %end;
%mend utl_pyendx;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
