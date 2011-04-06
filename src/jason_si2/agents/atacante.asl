// Atacante

/* Initial beliefs and rules */

posicaoInicial(5, 8).
time(team_a).
		

/* Initial goals */

// Objetivo inicial: entrar em campo
!posicionar.

/* Plans */

// Objetivo inicial: Se posicionar no campo
+!posicionar : true
    <-  ?posicaoInicial(X,Y); ?time(Z);
       createPlayer(X,Y,Z);
       !atacar.
	   
//Define a estratégia de ataque do agente.
+!atacar : true
	<- !localizarBola;
	   !atacar.
	
	
//Localizar bola e rotacionar para ela (função interna).
+!localizarBola : true
	<- ?posBola(X,Y);
		rotacionaBola(X,Y);
                !buscaBola.
				
		
//Caminha em direção à bola (função interna).
+!buscaBola : true
	<- ?posBola(X,Y);
		irLinhaReta(X,Y).


//Se identifica que está próximo do gol, chuta.


