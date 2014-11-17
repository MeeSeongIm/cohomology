%macaulay2
loadPackage "Dmodules"

R = QQ[x,y,z]

f= (x^3 + y^3 + x*y)*x*y

H = deRhamAll(f);


D=QQ[x,y,z,Dx,Dy,Dz,WeylAlgebra => {x=>Dx, y=>Dy, z=>Dz}];
Delta = ideal(Dx,Dy,Dz);

R = D^1/Delta

H.CohomologyGroups

H.LocalizeMap

H.TransferCycles

H.VResolution


----- Output ------  
Dmodules

Package

R

PolynomialRing

 4       4    2 2
x y + x*y  + x y

R

Ideal of D

cokernel | Dx Dy Dz |

                       1
D-module, quotient of D

                 1
HashTable{0 => QQ }
                 3
          1 => QQ
                 5
          2 => QQ
          3 => 0

HashTable

| x_1^4x_2+x_1x_2^4+x_1^2x_2^2 |

Matrix


HashTable{0 => | -54x_1^4x_2-54x_1x_2^4-54x_1^2x_2^2 |                                    }
          1 => | 3x_1^3x_2+x_1x_2^2 -54x_2^4-36x_1x_2^2    54x_1^3x_2+54x_2^4+54x_1x_2^2 |
               | 3x_1^4+2x_1^2x_2   -54x_1x_2^3-18x_1^2x_2 0                             |
               | 0                  0                      0                             |
          2 => | -x_2^3 1/2 -x_1x_2^2 -x_1^2x_2 -x_1^3 |
               | 0      0   0         0         0      |
               | 0      0   0         0         0      |
          3 => 0

HashTable

                            1                                 8                                 16                                 12                                 3
(QQ[x , x , x , D , D , D ])  <-- (QQ[x , x , x , D , D , D ])  <-- (QQ[x , x , x , D , D , D ])   <-- (QQ[x , x , x , D , D , D ])   <-- (QQ[x , x , x , D , D , D ])
     1   2   3   1   2   3             1   2   3   1   2   3             1   2   3   1   2   3              1   2   3   1   2   3              1   2   3   1   2   3
                                                                                                                                           
0                                 1                                 2                                  3                                  4

ChainComplex


-- gens H_{dR}^0 e = f/f
-- gens H_{dR}^1 a_1 = ((3x_1^2 + x_2)x_1 x_2 dx_1 + (3x_1^2 + 2x_2)x_1^2 dx_2)/f,
                 a_2 = ((3x_2^2 + 2x_1)x_2^2 dx_1 + (3x_2^2 + x_1)x_1 x_2 dx_2)/f,
                 a_3 = (x_1^3 + x_2^3 + x_1x_2)x_2dx_1/f^3,
-- gens H_{dR}^2 t_1 = x_2^3/f,    
                 t_2 = 1/f,
                 t_3 = x_1x_2^2/f, 
                 t_4 = x_1^2x_2/f,
                 t_5 = x_1^3/f
  


