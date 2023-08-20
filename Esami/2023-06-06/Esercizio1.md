### Elencare e Descrivere brevemente le componenti della descrizione delle azioni secondo STRIPS
Ogni azione A è composta dalle seguenti componenti $\braket{n, R, \tilde R, T, \tilde T}$
1. $n$: Nome dell'azione - Determina univocamente un elemento Azione.
2. $R$: è un sottoinsieme delle Proposizioni del problema di pianificazione: Precondizione asserita $\rightarrow$ Proposizioni che devono essere vere per rendere l'azione fattibile.
3. $\tilde{R}$: è un sottoinsieme delle Proposizioni del problema di pianificazione: Precondizione negata $\rightarrow$ Proposizioni che devono essere false per rendere l'azione fattibile.
4. $T$: è un sottoinsieme delle Prposizioni del problema di pianificazione: Postcondizione asserita $\rightarrow$ L'output dell'azione
5. $\tilde{T}$: sottoinsieme delle Proposizioni del problema di pianificazione: Postcondizione negata $\rightarrow$ le proposizioni che saranno false dopo l'esecuzione dell'azione.
  
### Descrivere brevemente il metodo di _ricerca in ampiezza_, discutendo anche le complessità computazionali temporali e spaziali asintotiche di caso pessimo.

Supponendo A = Insieme delle azioni che l'agente può eseguire

La ricerca in ampiezza dello stato di goal nello spazio di stati permette di trovare il goal raggiungibile con il numero minimo di azioni (lo stato di goal più vicino alla root dell'albero di stati).
Tuttavia la complessità spaziale asintotica è:
$$\mathcal O(b^d) \text{ dove } b=|A|$$
La complessità temporale asintotica invece è $\mathcal O(b)$ ovvero l'applicazione di tutte le azioni nell'insieme di azioni possibili.

### Descrivere brevemente il metodo di _ricerca ad approfondimenti iterativi_, discutendo anche le complessità computazionali temporali e spaziali asintotiche di caso pessimo.

La ricerca ad approfondimenti iterativi è un compromesso tra la ricerca in ampiezza e quella in profondità: Partendo con N = 1, si applica la ricerca in profondità costruendo un albero con massimo N strati, si controlla se si è trovato la soluzione e in caso contrario si aumenta N di 1.
Il metodo combina i vantaggi della ricerca in ampiezza con quella in profondità perché consente di trovare la soluzione con il numero minimo di azioni ma ha complessità temporale asintotica minore della ricerca in ampiezza all'aumentare di N perché la frangia dell'albero si espande esponenzialmente e la ricerca in profondità non necessita il controllo di tutta la frangia prima di passare ad uno strato successivo.
In caso pessimo così come la ricerca in ampiezza si spende $b^d$ però se lo stato non si trova alla fine della frangia si spende molto meno.

