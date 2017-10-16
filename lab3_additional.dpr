program lab3_dop;

{$APPTYPE CONSOLE}

uses
  math;
var x,u,cosx,sinx,e,realx,s,denominator,coscoef,sincoef:Real;
b,k:integer;
xstr:string;
coef:ShortInt;


function getTeylorSin(x:Real):Real;
var CurrTerm, eps, Prev, Curr: real;
n:Byte;
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


  getTeylorSin:=Curr;
end;

function getTeylorCos(x:Real):Real;
var CurrTerm, eps, Prev, Curr: real;
n:Byte;
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

  getTeylorCos:=Curr;
end;
begin
  repeat
    Writeln('Please, enter value of x. To exit enter "Exit"');
    Readln(xstr);
    Val(xstr,u,b);
    if (b = 0) then
    begin
      if(u >= 0) then
        coef:=1
      else
        coef:=-1;
      x:=Pi*u*u/2;
      realx:=x;
      e:=0.000001;
      k:=0;

      while(Abs(x) > 2*pi) do
      begin
        if(x > 0) then
          x:= x - 2*pi
        else
          x:=x + 2*pi;

      end;

      sinx:=getTeylorSin(x);
      cosx:=getTeylorCos(x);

      // ----- Integral Sin ------ //
      denominator:=Sqrt(2*pi*x);
      s:=coef*1/2-cosx*coscoef/denominator - sinx*sincoef/denominator;

      Writeln('k = ', k);
      Writeln('Teilor cos = ', cosx:0:4);
      Writeln('Real cos = ', Cos(realx):0:4);
      Writeln('Teilor sin = ', sinx:0:4);
      Writeln('Real sin = ', Sin(realx):0:4);
    end;
  until(b > 0);
end.
