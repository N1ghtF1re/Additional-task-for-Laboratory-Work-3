program lab3_dop;

{$APPTYPE CONSOLE}

uses
  math;
var x,cosx,sinx,e,realx:Real;
k:Byte;
b:integer;
xstr:string;


function getTeylorSin(x:Real):Real;
var CurrTerm, eps, Prev, Curr: real;
n:Byte;
coef:ShortInt;
begin
  eps:=1;
  CurrTerm:=x;
  Curr:=0;
  n:=1;
  curr:=x;

  while(eps > e) do
  begin
    CurrTerm:=CurrTerm*(-1)*x*x/(2*n*(2*n+1));
    prev:=curr;
    curr:=curr+CurrTerm;
    eps:=Abs(prev-curr);
    Inc(n);
  end;

  coef:=1;
  if (Abs(k) mod 2 = 0) then
  begin
    if((k <> 0) and (Abs(k) mod 4 <> 0)) then
      coef:=-1;
  end
  else
  begin
    if(k>0) then
    begin
      if(k mod 3 = 0) then
        coef:=1
      else
        coef:=-1;
    end
    else
    begin
      if(Abs(k) mod 3 = 0) then
        coef:=-1
      else
        coef:=1;
    end;
  end;

  getTeylorSin:=coef*Curr;
end;

function getTeylorCos(x:Real):Real;
var CurrTerm, eps, Prev, Curr: real;
n:Byte;
coef:ShortInt;
begin
  eps:=1;
  CurrTerm:=1;
  Curr:=0;
  n:=1;
  curr:=1;
  while(eps > e) do
  begin
    CurrTerm:=CurrTerm*(-1)*x*x/(2*n*(2*n-1));
    prev:=curr;
    curr:=curr+CurrTerm;
    eps:=Abs(prev-curr);
    Inc(n);
  end;

  coef:=1;
  if (Abs(k) mod 2 = 0) then
  begin
    if(Abs(k) mod 4 <> 0) then
      coef:=-1;
  end
  else
  begin
    if(k>0) then
    begin
      if(k mod 3 = 0) then
        coef:=-1
      else
        coef:=1;
    end
    else
    begin
      if(Abs(k) mod 3 = 0) then
        coef:=1
      else
        coef:=-1;
    end;
  end;

  getTeylorCos:=coef*Curr;
end;
begin
  repeat
    Writeln('Please, enter value of x. To exit enter "Exit"');
    Readln(xstr);
    Val(xstr,x,b);
    if (b = 0) then
    begin
      realx:=x;
      e:=0.00001;
      k:=0;

      while(Abs(x) > 1) do
      begin
        if(x > 1) then
        begin
          x:= x - pi/2;
          Inc(k);
        end
        else
        begin
          x:=x+pi/2;
          Dec(k);
        end;

      end;

      if ((Abs(k) mod 2 <> 0) and (Abs(realx) > 1)) then
      begin
        cosx:=getTeylorSin(x);
        sinx:=getTeylorCos(x);
      end
      else
      begin
        sinx:=getTeylorSin(x);
        cosx:=getTeylorCos(x);
      end;



      Writeln('Teilor cos = ', cosx:0:8);
      Writeln('Real cos = ', Cos(realx):0:8);
      Writeln('Teilor sin = ', sinx:0:8);
      Writeln('Real sin = ', Sin(realx):0:8);
    end;
  until(b > 0);
end.
