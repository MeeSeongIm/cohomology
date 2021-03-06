-- Run this on sage (with %macaulay2) or on M2 (without %macaulay2)
-- 
-- compute local cohomology of I in A = QQ[x,y,z,u,v,w], where 
-- I is generated by the 2x2 minors of the 2 x 3 matrix 
-- [x y z] 
-- [u v w].
-- H_I^0(A) =  0 
-- H_I^1(A) =  0 
-- H_I^2(A) != 0 since I is a height 2 prime ideal
-- H_I^3(A) != 0 because of the computation below (the Groebner basis of the ideal JH3 of this module does not contain 1)
-- H_I^k(A) =  0 for k > 3 because I has 3 generators.

-- in prime characteristic, H_I^3(A) = 0 due to the following: 
-- suppose if A/I is Cohen-Macaulay. Then H_I^k(A) !=0 only if k = codim I.

%macaulay2

loadPackage "Dmodules"

D = QQ[x,y,z,u,v,w,Dx,Dy,Dz,Du,Dv,Dw,WeylAlgebra => {x=> Dx, y=>Dy, z=> Dz, u => Du, v=> Dv, w=> Dw}];

Delta = ideal(Dx,Dy,Dz,Du,Dv,Dw);

R = D^1/Delta;

f = x*v - u*y;

g = x*w -u*z;

h = y*w -v*z;

Rf = DlocalizeAll(R,f,Strategy => Oaku)

Rfg = DlocalizeAll(Rf.LocModule, g, Strategy => Oaku)

Rfgh = DlocalizeAll(Rfg.LocModule, h, Strategy => Oaku)

Rf.GeneratorPower

Jfgh = ideal relations Rfgh.LocModule;

JH3= Jfgh+ ideal(f^2,g,h);

JH3gb=gb JH3

gens JH3gb

