_Facendo riferimento alla logica dei predicati:_

### Definire la relativa sintassi indicando come sia possibile costruire l'insieme delle proposizioni:

Si costruiscono tramite l'applicazione delle seguenti regole di sintassi, per ogni proposizione che si vuole creare.

1. se $t_, t_2, \dots, t_n$ sono termini e p è un simbolo di predicato di arità n allora $p(t_1, t_2, \dots, t_n)$ è una proposizione comunemente detta letterale affermato
2. I simboli $\top$ e $\perp$ sono proposizioni.
3. Se A è una proposizione allora $\lnot (A)$ è una propsizione, se A è un letterale affermato allora $\lnot(A)$ è un letterale negato.
4. se A e B sono proposizioni, allora $(A \wedge B), (A \vee B), (A \Longrightarrow B), (A \iff B)$ sono proposizioni
5. Se A è una proposizione e x è una variabile, allora $\exists x.(A)$ e $\forall x . (A)$

### Definire la funzione di interpretazione

Permette di interpretare costanti, simboli di funzione e simboli di predicato assegnandoci un valore del dominio del linguaggio.


### Descrivere brevement cosa si intende per assegnazione

L'assegnazione è una funzione che prende in input un simbolo di variabile e restituisce un valore del Dominio del linguaggio; permette di effettuare la sostituzione delle varie variabili per testare se una proposizione è vera o no oppure di trovare tutti le assegnazioni che permettono alla proposizione di diventare vera.