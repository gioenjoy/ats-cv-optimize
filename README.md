# ats-cv-optimize

**Skill per Claude che scrive e ottimizza curriculum in italiano per superare gli ATS.**

Non è la traduzione di una skill inglese. È costruita sul mercato del lavoro italiano:
i parser che le aziende italiane usano davvero, le frasi fatte che i selezionatori italiani
saltano a vista, i titoli di studio del nostro ordinamento, la formula privacy, i dati che
in Italia è meglio non mettere sul CV.

---

## Il problema

Gran parte delle candidature non viene scartata da una persona: viene scartata da un
parser che non è riuscito a leggere il documento. In Italia il problema è più marcato
che altrove per tre ragioni:

1. **Il formato Europass**, diffusissimo e costruito su tabelle annidate, è il peggior
   formato possibile per un ATS.
2. **Le frasi fatte** — «ottime capacità relazionali», «problem solving», «orientato al
   risultato» — occupano lo spazio che dovrebbe contenere le keyword dell'annuncio.
3. **I template grafici** con due colonne, foto e barre di competenza arrivano al
   selezionatore come campi vuoti o mescolati.

A questo si aggiunge un problema nuovo: i CV scritti da un modello linguistico si
riconoscono, e un CV riconosciuto come tale perde credibilità.

## Cosa fa questa skill

- Ricostruisce un CV esistente da PDF, DOCX, immagine o testo incollato
- Converte un Europass in una versione ATS-safe, spiegando quando conviene tenere l'originale
- Analizza l'annuncio ed estrae le keyword, oppure le cerca sul web se l'annuncio non c'è
- Riscrive i contenuti in italiano corretto: participio passato, niente prima persona,
  numeri e date nel formato italiano
- Blocca le frasi fatte del CV italiano e i pattern di scrittura IA, spiegando il perché
  e proponendo la riscrittura — senza mai decidere al posto tuo
- Non inventa mai un numero. Se un risultato non è quantificato, te lo segnala e ti chiede
  il dato invece di riempirlo
- Produce **due file**: un Markdown modificabile e un **DOCX** ATS-safe generato da uno
  script deterministico
- Ti dice cosa manca: i requisiti dell'annuncio che il tuo profilo non copre

---

## Installazione

### Come skill di Claude Code

```bash
git clone https://github.com/gioenjoy/ats-cv-optimize.git
cp -r ats-cv-optimize/skills/ats-cv-optimize ~/.claude/skills/
pip3 install python-docx
```

Oppure per un singolo progetto, copia la cartella in `.claude/skills/` del progetto.

### Come plugin

```
/plugin marketplace add gioenjoy/ats-cv-optimize
/plugin install ats-cv-optimize
```

### Su Claude.ai

Carica il contenuto di `skills/ats-cv-optimize/` come skill personalizzata.
Il renderer DOCX richiede un ambiente con Python: senza, la skill produce comunque il
Markdown e il JSON.

---

## Uso

Basta chiedere in italiano. La skill si attiva da sola:

```
Sistemami il curriculum per questo annuncio: <incolla l'annuncio>
```
```
Ho un CV in Europass, me lo converti?
```
```
Scrivimi un CV da zero, sono perito meccanico con 4 anni in officina
```
```
Il mio CV non passa mai gli screening, dammi un'occhiata
```

Se hai un CV, allegalo. Se hai l'annuncio, incollalo. Se non hai né l'uno né l'altro,
la skill ti fa le domande giuste — massimo tre per volta.

---

## Come è fatta

```
skills/ats-cv-optimize/
├── SKILL.md                      il flusso in 8 fasi con i cancelli di controllo
├── references/
│   ├── blacklist-it.md           frasi fatte del CV italiano e come riscriverle
│   ├── pattern-ia-it.md          pattern di scrittura IA in italiano
│   ├── verbi-azione-it.md        participi passati per categoria professionale
│   ├── ats-italiani.md           i parser del mercato italiano e le regole di formato
│   ├── privacy-gdpr.md           formula privacy e dati da omettere
│   ├── titoli-e-qualifiche.md    titoli di studio italiani e resa in inglese
│   ├── lingue-qcer.md            livelli QCER e certificazioni
│   ├── keyword-bilingue.md       coppie italiano/inglese e lessico di settore
│   └── schema-cv.md              schema JSON del CV
├── scripts/
│   └── render_docx.py            validatore + generatore DOCX
└── examples/
    ├── cv-esempio.md             CV commentato
    └── cv-esempio.json           lo stesso CV in JSON
```

### Il renderer

```bash
python3 scripts/render_docx.py --input cv.json --check     # solo validazione
python3 scripts/render_docx.py --input cv.json --output Nome_Cognome_CV.docx
```

Il validatore blocca la generazione quando trova:

- bullet in prima persona (`Ho sviluppato…`) o passivi (`Mi sono occupato di…`)
- participi accordati al femminile o al plurale in apertura di bullet
- emoji, barre di valutazione, caratteri decorativi
- quello che sembra un codice fiscale

e segnala come avviso: date non in formato `mmm AAAA`, lo stesso verbo che apre più bullet
nello stesso ruolo, livelli linguistici non QCER, un indirizzo completo al posto della città.

Il DOCX prodotto ha **zero tabelle, zero colonne, zero caselle di testo, zero immagini**,
i contatti nel corpo del documento e non nell'intestazione. È sobrio di proposito: ogni
elemento grafico in più è un punto di rottura per il parser.

---

## Cosa questa skill non fa

- **Non inventa.** Nessun numero, strumento, ruolo o certificazione che tu non abbia
  dichiarato. Se un risultato non ha un dato, te lo chiede; se non ce l'hai, scrive il
  bullet con una dimensione concreta al posto della metrica.
- **Non ti sostituisce.** Ogni segnalazione è una proposta: puoi sempre imporre la tua
  versione. La skill avvisa una volta e poi si adegua.
- **Non fa lettere di presentazione** (a meno che tu non le chieda insieme al CV) né CV
  in altre lingue. Per la versione inglese ti propone di farla a parte, perché non è una
  traduzione parola per parola.
- **Non garantisce nulla.** Un CV leggibile dall'ATS arriva al selezionatore. Quello che
  succede dopo dipende dal contenuto.

---

## Note

Il materiale su privacy, titoli di studio e prassi di selezione descrive gli usi correnti
del mercato del lavoro italiano e non costituisce consulenza legale.

Nessun dato inserito nel CV lascia la tua macchina attraverso questa skill: i file vengono
scritti in locale. Valgono naturalmente le condizioni di trattamento dei dati di Claude per
i contenuti della conversazione.

---

## Debiti

L'impostazione a fasi con cancelli di controllo e l'idea della blacklist con warning
all'utente vengono da due skill inglesi:

- [SankaiAI/ats-optimized-resume-agent-skill](https://github.com/SankaiAI/ats-optimized-resume-agent-skill) — flusso a stadi, cancelli, renderer deterministico
- [NoahMustafa/claude-ats-cv-skill](https://github.com/NoahMustafa/claude-ats-cv-skill) — blacklist di filler word e pattern IA, regola del bullet senza metriche

Tutto il contenuto italiano — lessico, norme, titoli di studio, parser, blacklist, banca
verbi, renderer — è originale.

## Licenza

MIT
