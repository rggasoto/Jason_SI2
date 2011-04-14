// Agente: Goleiro

/* Initial beliefs and rules */

posicao(505, 200).
time(team_b).


/* Initial goal */

// Objetivo inicial: entrar em campo 
!entrarEmCampo.

/* Plans */
//Initial Goal
+!entrarEmCampo : true
    <- ?posicao(X, Y); ?time(Z);
       createPlayer(X, Y,Z);//Cria jogador no Tewnta na posi‹o [x,y], no time z
	   !defesa. //inicia estratŽgia de defesa

	   
	   
//Plano de defesa.                                                   

//caso esteja com a bola, chutar

+!defesa : com(bola)
	<- chutar(100);
	!defesa.

//caso padr‹o
+!defesa : true
	<- 	?posBola(XBola,YBola);
		?posicao(XGoleiro, YGoleiro);
		!!verBola;
		defender(XBola, YBola, XGoleiro, YGoleiro); 
		!defesa.
	   
	   
//Resgate a posicao da bola (percepcao) e rotacione olhando pra bola
+!verBola : true
	<- ?posBola(X,Y);
		rotacionePara(X,Y).
		

		
		