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


-- Output -- 

o1000000014 = R

o1000000014 : PolynomialRing

               3    3    3
o1000000015 = x  + y  + z

o1000000015 : R



o1000000018 : Ideal of D

o1000000019 = cokernel | Dx Dy Dz |

                                     1
o1000000019 : D-module, quotient of D

                               1
o1000000020 = HashTable{0 => QQ }
                               1
                        1 => QQ
                               2
                        2 => QQ
                               2
                        3 => QQ

o1000000020 : HashTable

o1000000021 = | x_1^6+2x_1^3x_2^3+x_2^6+2x_1^3x_3^3+2x_2^3x_3^3+x_3^6 |

o1000000021 : Matrix

o1000000022 = HashTable{0 => | 4/3x_1^6+8/3x_1^3x_2^3+4/3x_2^6+8/3x_1^3x_3^3+8/3x_2^3x_3^3+4/3x_3^6 |}
                        1 => | 20x_1^5+20x_1^2x_2^3+20x_1^2x_3^3  |
                             | -20x_1^3x_2^2-20x_2^5-20x_2^2x_3^3 |
                             | 20x_1^3x_3^2+20x_2^3x_3^2+20x_3^5  |
                        2 => | 48x_1x_2x_3^2 600x_3^4    |
                             | 48x_1x_2^2x_3 600x_2x_3^3 |
                             | 48x_1^2x_2x_3 600x_1x_3^3 |
                        3 => | -x_1x_2x_3 -x_3^3 |

o1000000022 : HashTable

                                          1                                 12                                 27                                 23                                 8
o1000000023 = (QQ[x , x , x , D , D , D ])  <-- (QQ[x , x , x , D , D , D ])   <-- (QQ[x , x , x , D , D , D ])   <-- (QQ[x , x , x , D , D , D ])   <-- (QQ[x , x , x , D , D , D ])
                   1   2   3   1   2   3             1   2   3   1   2   3              1   2   3   1   2   3              1   2   3   1   2   3              1   2   3   1   2   3
                                                                                                                                                          
              0                                 1                                  2                                  3                                  4

o1000000023 : ChainComplex

               6     3 3    6     3 3     3 3    6
o1000000024 = x  + 2x y  + y  + 2x z  + 2y z  + z

o1000000024 : QQ[x, y, z]


-- two forms in H_{dR}^2(C^3 - Var(f), C): 


-- gens H_{dR}^0  e = f^2/f^2
-- gens H_{dR}^1  o = ((x^2 dx -y^2dy + z^2 dz)f)/f^2
-- gens H_{dR}^2  t_1 = xyz(zdxdy + ydzdx + xdydz)/f^2,     t_2 = (zdxdy + ydzdx + xdydz)z^3/f^2
-- gens H_{dR}^3  d_1 = xyz dxdydz/f^2,                     d_2 = z^3 dxdydz/f^2



