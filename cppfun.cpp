#include <iostream>

struct structA{int n;};
struct structB{struct structA A;};
struct structC{struct structB B;};
struct structD{struct structC C;};
struct structE{struct structD D;};
struct structF{struct structE E;};
struct structG{struct structF F;};
struct structH{struct structG G;};
struct structI{struct structH H;};
struct structJ{struct structI I;};
struct structK{struct structJ J;};
struct structL{struct structK K;};
struct structM{struct structL L;};
struct structN{struct structM M;};
struct structO{struct structN N;};
struct structP{struct structO O;};
struct structQ{struct structP P;};
struct structR{struct structQ Q;};
struct structS{struct structR R;};
struct structT{struct structS S;};
struct structU{struct structT T;};
struct structV{struct structU U;};
struct structW{struct structV V;};
struct structX{struct structW W;};
struct structY{struct structX X;};
struct structZ{struct structY Y;};

int main(int argc,char **argv)
{
	structZ Z; 
	Z.Y.X.W.V.U.T.S.R.Q.P.O.N.M.L.K.J.I.H.G.F.E.D.C.B.A.n = 10;
	std::cout << "The value of Z.Y.X.W.V.U.T.S.R.Q.P.O.N.M.L.K.J.I.H.G.F.E.D.C.B.A.n is ";
	std::cout << Z.Y.X.W.V.U.T.S.R.Q.P.O.N.M.L.K.J.I.H.G.F.E.D.C.B.A.n << std::endl;
	return 0;
}
