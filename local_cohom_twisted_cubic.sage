-- let A = QQ[x,y,z,w] and I is the ideal that describes the twisted cubic. 
-- H_I^3(A) = 0 since the Groebner basis of the ideal IH3 contains 1. 
-- so one cannot use local cohomology techniques to determine whether or not the twisted cubic is a complete intersection
-- due to the following fact: if V has codim c in the affine variety X and H_{I(V)}^{c+k}(CC[X]) != 0 for any positive k, 
-- then V is not a set-theoretic complete intersection. 

-- Second vanishing theorem of Hartshorne: 
-- if I is a homogeneous ideal in A_n corresponding to a geometrically connected projective variety of dim > 0,
-- then H_I^{n-1}(A_n) = H_I^n(A_n) = 0, where A_n = QQ[x_1,...,x_n].




%macaulay2
loadPackage "Dmodules"

D=QQ[x,y,z,w,Dx,Dy,Dz,Dw,WeylAlgebra => {x=>Dx, y=>Dy, z=>Dz, w=>Dw}];
Delta = ideal(Dx,Dy,Dz,Dw);
R = D^1/Delta;
f = x*z - y*y;
g = y*w -z*z;
h = x*w -y*z;
Rf = DlocalizeAll(R,f,Strategy => Oaku)
Rfg = DlocalizeAll(Rf.LocModule, g, Strategy => Oaku)
Rfgh = DlocalizeAll(Rfg.LocModule, h, Strategy => Oaku)
Rf.GeneratorPower
Ifgh = ideal relations Rfgh.LocModule;
IH3= Ifgh+ ideal(f,g,h);
IH3gb=gb IH3
gens IH3gb



