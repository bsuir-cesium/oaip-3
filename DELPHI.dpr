program lab3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils;

var
  i, n, k: Integer;
  x, xk, eps, f1, f2, sum, sumOld: Real;

begin
  x := -0.6;
  writeln(' ______________________________________________________________________________________');
  writeln('|       |              |       e=10^-2      |       e=10^-3      |       e=10^-4      |');
  writeln('|   x   |    f1(x)     |____________________|____________________|____________________| ');
  writeln('|       |              |     f2(x)    |  N  |     f2(x)    |  N  |     f2(x)    |  N  | ');


  for i := 1 to 20 do
  begin
    if (-0.001 < x) and (x < 0.001) then
    begin
        writeln('|_______|______________|______________|_____|______________|_____|______________|_____|');
        writeln('| ', abs(x):5:2, ' | ', 'None':12, ' | ', 'None':12, ' | ', 0:3, ' | ', 'None':12, ' | ', 0:3, ' | ', 'None':12, ' | ', 0:3, ' | ');
        x := x + 0.05;
        continue;    
    end;
    f1 := ((1 - x) / x) * Ln(1 / (1 - x));
    k := 1;
    eps := 1/100;
    sum := 0;
    xk := x;
    writeln('|_______|______________|______________|_____|______________|_____|______________|_____|');
    write('| ', x:5:2, ' | ', f1:12:7, ' | ');
    for n := 1 to 3 do
    begin
      repeat
        sumOld := sum;
        sum := sum + xk / (k * (k + 1)); 
        xk := xk * x;
        Inc(k);   
      until (abs(sum - sumOld) <= eps);
      f2 := 1 - sum;
      write(f2:12:7, ' | ', k-1:3, ' | ');
      eps := eps/10;
    end;
    writeln;
    x := x + 0.05;
  end;
  writeln('|_______|______________|______________|_____|______________|_____|______________|_____|');
  readln;
end.
