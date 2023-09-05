### Descrivere brevemente cosa si intende per albero di ricerca.

Un albero di ricerca è uno strumento che occorre per risolvere un problema di pianificazione attraverso una ricerca nello spazio degli stati che parta dallo stato iniziale I fini a raggiungere lo stato di goal.

### Descrivere brevemente una delle strategie di ricerca non informate.

Ci sono 3 strategie di ricerca non informata:

1.  **BFS (Breadth-First-Serach)**, anche detta “in ampiezza” → tipo di ricerca non informata nella quale i nodi vengo aggiunti in fondo alla frangia
2. **DFS (Depth-First-Search)**, anche detta “in profondità” → tipo di ricerca non informata nella quale i nodi vengono aggiunti in testa alla frangia.
3. **ID-DFS (ad approfondimenti successivi)**, → tipo di ricerca che cerca di trovare un compromesso tra BFS e DFS, un algoritmo che trova la soluzione a profondità minima come BFS ma che non ha una complessità computazionale asintotica nel caso pessimo di $O(b^d)$, questo è permesso grazie ad una ricerca che è strutturata nello stile di una DFS lavorando su un sottoalbero di quello originale ed espandendo di 1 livello l'albero ogni volta che nel livello precedente non si è trovata una soluzione