Si consideri un single-layer perceptron utilizzato per classificare vettori di $\R^3$ in due classi.
Il single-layer perceptron utilizza la funzione di Heaviside come funzione di attivazione e dispone dei pesi $(w_0, w_1, w_2, w_3)$, dove il peso $w_0$ è il peso di bias associato all'ingresso -1.
Trovare un vettore di pesi $(w_0, w_1, w_2, w_3)$ in grado di rendere il single-layer perceptron utilizzabile per classificare in modo ottimo le due seguenti classi:
1. La classe A. a cui corrisponde il valore 0 in uscita dal single-layer perceptron, è formata da tutti i vettori appartenenti alla palla centrata in (1, 2, 3) avente raggio 4.
2. La classe B. a cui corrsisponde il valore 1 in uscita dal single-layer perceptron, è formata da tutti i vetori appartenenti alla palla centrata in (-2, 2, -1) avente raggio 6.

Si noti che non si può ipotizzare che il vettore dei pesi cercato sia in grado di classificare i vettori senza commettere errori.
Infatti, come discusso a lezione, un vettore dei pesi viene considerato ottimo se rende minimo, ma non necessariamente nullo, l'errore di classificazione.

### Valori iniziali:
$$
\alpha = 0.1\\
w = (-1,1,1,1)\\
g(x) = H(x) = 
\begin{cases}
    0 \text{ se } x < 0\\
    \frac{1}{2} \text{ se } x = 0\\
    1 \text{ se } x > 0 
\end{cases}
$$

---

<!--
### Calcolo Output 
nel centro delle palle per entrambe le classi

$$
o_A(w,x) = g(-1 + 1 \cdot 1 + 1 \cdot 2 + 1 \cdot 3) = g(5) = 1\\
o_B(w,x) = g(-1 + 1 \cdot (-2) + 1 \cdot 2 + 1 \cdot (-1)) = g(-1-2+2-1) = g(-2) = 0
$$
-->