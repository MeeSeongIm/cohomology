-- compute the de Rham cohomology of $C^3 - Var(f)$, where f = x^3 + y^3 + z^3.
-- h^0 = h^1 = 1, 
-- h^2 = h^3 = 2, 
-- h^k = 0 otherwise.


%macaulay2
loadPackage "Dmodules"

R = QQ[x,y,z]

f=x^3 + y^3 + z^3

H = deRhamAll(f);


D=QQ[x,y,z,Dx,Dy,Dz,WeylAlgebra => {x=>Dx, y=>Dy, z=>Dz}];
Delta = ideal(Dx,Dy,Dz);

R = D^1/Delta

H.CohomologyGroups

H.LocalizeMap          -- computes the generator of QQ[x,y,z][f^{-1}], which is f^{-2}. 

H.TransferCycles

H.VResolution

f*f





