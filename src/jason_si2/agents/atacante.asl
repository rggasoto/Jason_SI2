// Agente: Atacante

/* Initial goals */

// Objetivo inicial: entrar em campo
!entrarEmCampo.

/* Plans */

+!entrarEmCampo : true
    <-  ?posicaoIni(X,Y); ?time(Z); //Obtem a posicao inicial e o time no qual vai jogar(do initial belief)
       createPlayer(X, Y, Z);// criar o jogador no tewnta
       !ataque. //começa estrategia de ataque.
	   
//caso o atacante seja o jogador mais proximo da bola, então domine a bola
+!ataque: maisPerto(bola) & not com(bola)
	<-	!!verBola;
		?posBola(X,Y);
		irLinhaReta(X,Y);
		!ataque.
	
//se sem bola e longe do gol, vá para perto do gol
+!ataque: not com(bola) & not perto(gol)
	<- 	!!verBola;
		?posicao(X,Y);
		?posicaoIni(A,B);
		posicionaAtaque(420,B);
		!ataque.
		
//se sem bola e perto do gol, posição de ataque	
+!ataque: not com(bola) & perto(gol)
	<-  !!verBola;
		?posicao(X,Y);
		?posicaoIni(A,B);
		posicionaAtaque(420,B);
		!ataque.
		

//se com a bola e perto do gol, ache melhor posição para chute
+!ataque: com(bola) & perto(gol)	
	<- 	posicaoChute; 
		!ataque.



//se com a bola e longe do gol, passar para o companheiro mais próximo.
+!ataque: com(bola) & not perto(gol)
	<-	!olharCompanheiro;
		passar;
		!ataque.
	

//caso contrário reposiciona
+!ataque: true
	<- 	?posicaoIni(X,Y);
		irLinhaReta(X,Y);
		!ataque.
	   
//Resgate a posicao da bola (percepcao) e rotacione olhando pra bola
+!verBola : true
	<- 	?posBola(X,Y);
		rotacionePara(X,Y).
		


+!olharCompanheiro:true
	<- 	?companheiroMaisProximo(X,Y);
		rotacionePara(X,Y).
	


