# ATS e portali del mercato italiano

---

## Chi legge davvero il CV in Italia

| Sistema | Dove lo incontri | Note di parsing |
|---|---|---|
| **InRecruiting** (Zucchetti / In Job) | PMI, agenzie per il lavoro, studi di consulenza | molto diffuso in Italia; parsing solido sul testo semplice, si perde su tabelle e colonne |
| **Altamira Recruiting** | aziende medie e grandi italiane | richiede sezioni con titoli riconoscibili |
| **Talentia HCM** | aziende manifatturiere italiane | idem |
| **SAP SuccessFactors** | grandi gruppi e multinazionali | spesso richiede la ricompilazione manuale dei campi dopo l'upload: più il CV è pulito, meno correzioni servono |
| **Workday** | multinazionali | parser buono ma rigido su date e titoli di sezione |
| **Oracle Taleo** | banche, assicurazioni, grandi gruppi | il più severo sui formati: niente colonne, niente grafica |
| **InfoJobs** | portale generalista italiano | ha un proprio parser e un profilo strutturato: il CV caricato alimenta i campi |
| **LinkedIn Recruiter** | ricerca diretta dei selezionatori | non è un ATS classico ma indicizza per keyword: allinea titolo LinkedIn e CV |
| **Indeed / Monster** | portali generalisti | parsing automatico all'upload |
| Parser proprietari di **Randstad, Adecco, Gi Group, Umana, Manpower** | agenzie per il lavoro | quasi tutti indicizzano anche il nome del file |

Implicazione pratica: non esiste «il CV ottimizzato per un ATS specifico». Esiste il CV
**strutturalmente semplice**, che tutti i parser leggono. Ogni elemento grafico in più è un
rischio senza contropartita.

---

## Regole strutturali

### Impaginazione
- **Una sola colonna.** Il layout a due colonne è la causa numero uno dei CV illeggibili:
  molti parser leggono riga per riga da sinistra a destra e mescolano le due colonne.
- **Nessuna tabella**, nemmeno invisibile, nemmeno per allineare le date.
- **Nessuna casella di testo** (`text box`): molti parser le ignorano del tutto.
- **Contatti nel corpo del documento.** Se telefono ed email stanno nell'intestazione
  (header) o nel piè di pagina, diversi parser non li estraggono e la candidatura arriva
  senza recapiti.
- **Nessuna immagine, icona, logo, QR code, barra di competenza, grafico.**
- **Nessun carattere decorativo** come separatore: usa `–` o `|`, non `◆ ✦ ➤ ●`.

### Caratteri e dimensioni
- Font: **Calibri, Arial, Helvetica, Garamond, Georgia, Times New Roman.**
  Niente font scaricati o decorativi: se il PC del recruiter non li ha, il documento si
  ricompone male.
- Corpo del testo: 10–12 pt. Nome: 16–20 pt.
- Margini: tra 1,3 cm e 2,5 cm. Sotto 1,3 cm il documento diventa illeggibile in stampa.
- **Solo nero.** Al massimo un grigio scuro per le date.

### Titoli di sezione
Usa i titoli che i parser riconoscono. Non essere creativo.

✅ `Profilo professionale` · `Esperienza professionale` · `Esperienze lavorative` ·
`Formazione` · `Istruzione e formazione` · `Competenze` · `Competenze tecniche` ·
`Certificazioni` · `Lingue` · `Progetti` · `Pubblicazioni`

❌ `Il mio percorso` · `Dove sono stato` · `Cosa so fare` · `Un po' di me` ·
`Toolbox` · `Il mio superpotere`

### Date
- Formato unico in tutto il documento: **`mmm AAAA`** → `mar 2023 – set 2024`
- Mesi in minuscolo e abbreviati all'italiana:
  `gen feb mar apr mag giu lug ago set ott nov dic`
- In corso: `– oggi` (oppure `– in corso`, purché coerente in tutto il CV)
- **Indica sempre i mesi**, non solo gli anni: omettere i mesi per mascherare i buchi è un
  trucco che i selezionatori riconoscono immediatamente, e alcuni parser calcolano male
  l'anzianità.
- Usa il trattino breve `–` tra le date, con spazi.

### Ordine delle esperienze
Cronologico inverso: la più recente in cima. Il CV funzionale (per competenze, senza date)
viene letto male dai parser e insospettisce i selezionatori italiani.

---

## Il file

- **Formato: PDF**, salvo diversa indicazione. Alcuni portali accettano solo DOCX: leggi
  sempre le istruzioni dell'annuncio.
- **PDF testuale, non immagine.** Esporta da Word o LibreOffice con «Salva come PDF» /
  «Esporta come PDF». Mai stampare e scansionare, mai esportare come immagine.
  *Verifica:* apri il PDF e prova a selezionare il testo con il mouse. Se non si seleziona,
  l'ATS non lo legge.
- **Nome del file:** `Nome_Cognome_CV.pdf`, oppure `Nome_Cognome_CV_Ruolo.pdf` per le
  candidature mirate. Mai `cv.pdf`, `curriculum_definitivo_v3.pdf`,
  `CV aggiornato (1).pdf`.
- Niente spazi né caratteri accentati nel nome del file: alcuni sistemi di upload li
  troncano.
- Niente password né protezioni sul PDF.

---

## Keyword

### Come si inseriscono
- Con **la grafia esatta dell'annuncio.** Se l'annuncio scrive «Power BI», non scrivere
  «PowerBI» né «Power-BI».
- Nel punto in cui hanno senso: nel bullet dell'esperienza dove quello strumento è stato
  davvero usato, non solo nell'elenco competenze.
- Sia la sigla sia la forma estesa, la prima volta:
  `Controllo di gestione (FP&A)`, `Sistema informativo aziendale (ERP)`.
- **Densità ragionevole:** una keyword importante compare 2–3 volte in tutto il CV, non 8.

### Keyword stuffing — da non fare mai
- Elencare tecnologie mai usate
- Nascondere testo bianco su fondo bianco o a corpo 1 pt: **tutti i parser estraggono il
  testo nascosto**, e diversi ATS lo segnalano come tentativo di manipolazione. Alcune
  aziende scartano automaticamente il candidato.
- Ripetere la stessa parola in fondo al documento
- Inserire il testo integrale dell'annuncio

---

## Errori specifici del mercato italiano

1. **Il formato Europass.** Costruito su tabelle annidate: è il formato peggiore per un ATS.
   Tienilo per i concorsi pubblici e i bandi europei che lo richiedono espressamente; per le
   aziende private usa una versione ATS-safe.
2. **La foto.** Prassi diffusa in Italia, ma: l'ATS non la legge, occupa spazio, e molte
   aziende — soprattutto multinazionali e società con policy di selezione anonima — la
   considerano un rischio di discriminazione e scartano i CV che la contengono. Se il
   candidato la vuole comunque, va informato del rischio e poi assecondato.
3. **Il codice fiscale.** Non va mai in un CV inviato via email o caricato su un portale:
   è un dato identificativo che non serve alla selezione e si consegna solo in fase di
   assunzione.
4. **La RAL.** Né quella attuale né quella attesa vanno sul CV. Se l'annuncio la richiede
   espressamente, va nella lettera di presentazione o nel campo apposito del portale.
5. **«Referenze disponibili su richiesta».** Dato per scontato dal 1990.
6. **Il CV in inglese con i titoli italiani tradotti male.** Vedi
   `titoli-e-qualifiche.md`: «Master di I livello» **non** è un «Master's Degree».
7. **Il CV troppo lungo.** In Italia si vedono ancora CV da 5–6 pagine con l'elenco di ogni
   corso di aggiornamento. Fuori dall'ambito accademico e sanitario, oltre le 2 pagine si
   perde il lettore.
