Program CircleStats;
CONST PI=3.1415;

FUNCTION CircleArea(r:Double): Double;

BEGIN
result := PI*r*r;
END;

FUNCTION CircleDiameter(r:Double): Double;

BEGIN
result := 2*r
END;

FUNCTION CircleCircumference(r:Double): Double;

BEGIN
result := PI*r
END;

Procedure main();
Var
Radius: Double;
BEGIN
Write('Enter the radius: ');
Readln(Radius);
Radius := CircleArea(Radius);
Radius := CircleDiameter(Radius);
Radius := CircleCircumference(Radius);
WriteLn('Area is ', CircleArea(Radius):4:2);
WriteLn('Diameter is ', CircleDiameter(Radius):4:2);
WriteLn('Circumference is ', CircleCircumference(Radius):4:2);
END;

BEGIN
main();
END.