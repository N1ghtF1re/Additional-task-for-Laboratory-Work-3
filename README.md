Lab №3. Iterative cycles - an additional task
--------------------
***
#### Task:
![The task](https://i.imgur.com/A7F4otB.png)

>The program calculates the integral Fresnel sin for large cases of the argument, using the asymptotic expansion

**Language**: Delphi

**Code:**
```
program lab3_dop_experimental;

{$APPTYPE CONSOLE}

uses
  math;
var x,u,e,RealX,s,CoefCos,CoefSin:Real;
b:integer;
UStr:string;
Coef:ShortInt;

function getTeylorSin(x:Real):Real;
var CurrTerm, eps, Prev, Curr: real;
n:Byte;
begin
  eps:=1;
  CurrTerm:=x;
  n:=1;
  Curr:=x;
  while(eps > e) do
  begin
    CurrTerm:=CurrTerm*(-1)*x*x/(2*n*(2*n+1));
    Prev:=Curr;
    Curr:=Curr+CurrTerm;
    eps:=Abs(Prev-Curr);
    Inc(n);
  end;


  getTeylorSin:=Curr;
end;

function getTeylorCos(x:Real):Real;
var CurrTerm, eps, Prev, Curr: real;
n:Byte;
begin
  eps:=1;
  CurrTerm:=1;
  n:=1;
  curr:=1;
  while(eps > e) do
  begin
    CurrTerm:=CurrTerm*(-1)*x*x/(2*n*(2*n-1));
    Prev:=Curr;
    Curr:=Curr+CurrTerm;
    eps:=Abs(Prev-Curr);
    Inc(n);
  end;
  getTeylorCos:=Curr;
end;

procedure getRows(x:Real);
var CurrTerm, epsSin,epsCos, CCoefPrev,SCoefPrev, TwoX: real;
n:Integer;
isEndCos, isEndSin:Boolean;
begin
  epsSin:=1;
  epsCos:=1;
  CurrTerm:=1;
  coefsin:=1;
  coefcos:=1;
  n:=1;
  TwoX:=4*x*x;
  isEndCos:= false;
  isEndSin:=false;
  while(isEndCos and isEndSin) do begin
    CCoefPrev:= CoefCos;
    SCoefPrev:= CoefSin;
    CurrTerm:=CurrTerm*(-1)*n*(n+2)/TwoX;
    if (isEndCos = false) then
    begin
      CoefCos:=CoefCos+Currterm;
      epsCos:= Abs(abs(CoefCos)-abs(CCoefPrev));
    end;
    if (isEndSin = False) then
    begin
      CoefSin:=CoefSin+CurrTerm*(n+4);
      epsSin:= Abs(CoefSin-SCoefPrev);
    end;
    if(epsSin >= e) then
      isEndSin:=true;

    if (epsCos >= e)  then
      isEndCos:=true;

    inc(n,4);
  end;
end;

begin
  repeat
    Writeln('Please, enter the desired accuracy (e < 1)');
    write('e = ');
    Readln(e);
  until(e < 1);
  repeat
    Writeln(#10#13,'Please, enter value of u (u > 3). To exit enter "Exit"',#10#13);
    write('u = ');
    Readln(UStr);
    Val(UStr,u,b);
    if (Abs(u) < 3) then
      Writeln(#10#13#10#13,'The entered value of x is too small',#10#13);
    if ((b = 0) and (Abs(Trunc(u*100)/100) > 3)) then
    begin
      if(u >= 0) then
        Coef:=1
      else
        Coef:=-1;

      x:=Pi*u*u/2;
      RealX:=x;
      x:= x - Trunc(x/(2*pi))*2*pi; // reduce x to the first quarter
      // ----- Integral Sin ------ //
      getRows(RealX);
      s:=coef*1/2-getTeylorCos(x)*CoefCos/Sqrt(2*pi*RealX) - getTeylorSin(x)*CoefSin/(Sqrt(2*pi*RealX)*2*x);
      Writeln('S(u) = ', s:0:4);
    end;
  until(b > 0);
end.

```

