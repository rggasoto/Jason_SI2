// Goleiro

/* Initial beliefs and rules */

posicaoInicial(24, 8).
time(team_b).

/* Initial goal */

// Objetivo inicial: Se posicionar no campo
!posicionar.

/* Plans */

// Posicionamento inicial do goleiro no campo. Identifica tbm o time do goleiro.
+!posicionar : true
    <- ?posicaoInicial(X,Y); ?time(Z);
       createPlayer(X,Y,Z);
	   !defender.
	   
//Iniciar a estratégia de defesa.
+!defender : true
	<- !localizarBola;
           !defender.
	   
//Localizar bola e rotacionar para ela (função interna).
+!localizarBola : true
	<- ?posBola(X,Y);
		rotacionaBola(X,Y).
		
		