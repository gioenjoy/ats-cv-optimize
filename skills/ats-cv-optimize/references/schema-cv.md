# Schema JSON del CV

È il formato che `scripts/render_docx.py` legge per generare il DOCX.
Tutti i campi sono opzionali tranne `intestazione.nome` e `intestazione.cognome`:
le sezioni vuote o assenti non vengono stampate.

---

## Struttura

```json
{
  "meta": {
    "profilo": "mid",
    "pagine": 1,
    "ruolo_target": "Controller di gestione",
    "azienda_target": "Poliplast S.p.A."
  },
  "ordine_sezioni": [
    "profilo", "competenze", "esperienze", "formazione",
    "certificazioni", "lingue", "progetti", "altro"
  ],
  "intestazione": {
    "nome": "Giulia",
    "cognome": "Ferrari",
    "titolo": "Controller di gestione · Analista finanziaria",
    "citta": "Bergamo (BG)",
    "telefono": "+39 340 123 4567",
    "email": "giulia.ferrari@email.it",
    "linkedin": "linkedin.com/in/giuliaferrari",
    "github": "",
    "sito": "",
    "extra": ""
  },
  "profilo": "Controller di gestione con 6 anni di esperienza nel settore manifatturiero...",
  "competenze": [
    { "categoria": "Strumenti", "voci": ["SAP CO", "Excel avanzato (Power Query, VBA)", "Power BI"] },
    { "categoria": "Aree", "voci": ["Budgeting", "Forecasting", "Analisi degli scostamenti"] }
  ],
  "esperienze": [
    {
      "ruolo": "Controller di gestione",
      "azienda": "Poliplast S.p.A.",
      "citta": "Bergamo",
      "dal": "gen 2021",
      "al": "oggi",
      "contesto": "Gruppo manifatturiero, 320 dipendenti, € 74 mln di fatturato",
      "punti": [
        "Ridotto da 12 a 5 giorni lavorativi la chiusura del reporting mensile...",
        "Costruito il modello di budget consolidato su 4 stabilimenti..."
      ]
    }
  ],
  "formazione": [
    {
      "titolo": "Laurea Magistrale in Economia Aziendale (LM-77)",
      "istituto": "Università degli Studi di Bergamo",
      "citta": "Bergamo",
      "dal": "set 2015",
      "al": "lug 2017",
      "votazione": "108/110",
      "note": ["Tesi: Il controllo di gestione nelle PMI manifatturiere lombarde"]
    }
  ],
  "certificazioni": [
    {
      "nome": "Microsoft Certified: Power BI Data Analyst Associate",
      "ente": "Microsoft",
      "data": "mar 2024",
      "scadenza": "mar 2026",
      "codice": ""
    }
  ],
  "lingue": [
    { "lingua": "Italiano", "livello": "madrelingua", "certificazione": "" },
    { "lingua": "Inglese", "livello": "C1 (QCER)", "certificazione": "IELTS 7.5 (2023)" }
  ],
  "progetti": [
    {
      "nome": "Dashboard di controllo scostamenti",
      "contesto": "Progetto interno",
      "dal": "2023",
      "al": "",
      "url": "",
      "punti": ["Realizzato in Power BI un cruscotto..."]
    }
  ],
  "altro": [
    {
      "titolo": "Volontariato",
      "voci": ["Tesoriere dell'associazione culturale X (2019 – oggi), bilancio annuale € 60.000"]
    }
  ],
  "privacy": "Autorizzo il trattamento dei miei dati personali contenuti nel presente curriculum vitae ai sensi del Regolamento (UE) 2016/679 (GDPR) e del D.lgs. 196/2003 come modificato dal D.lgs. 101/2018."
}
```

---

## Note sui campi

| Campo | Regole |
|---|---|
| `meta.profilo` | `neolaureato` · `junior` · `mid` · `senior` · `manageriale` · `cambio_settore`. Guida solo l'ordine di sezioni predefinito |
| `meta.pagine` | `1` o `2`. Il renderer non taglia il contenuto: serve a te per calibrare la quantità di testo |
| `ordine_sezioni` | se assente, il renderer usa l'ordine predefinito per il profilo. Le sezioni non elencate non vengono stampate |
| `intestazione.titolo` | i 2–3 specialismi reali del candidato, separati da `·`. Non slogan |
| `intestazione.citta` | **città e provincia soltanto**, mai via e civico |
| `intestazione.extra` | riga libera per casi specifici (es. disponibilità a trasferte, titolo di soggiorno). Lasciare vuoto di norma |
| `profilo` | 3–4 righe, terza persona implicita |
| `competenze[].voci` | testo semplice. Mai livelli numerici, percentuali o simboli di valutazione |
| `esperienze[].dal` / `al` | formato `mmm AAAA` minuscolo. `al` accetta `oggi` o `in corso` |
| `esperienze[].contesto` | una riga facoltativa che dà la scala dell'azienda quando il nome non è noto. Molto utile per le PMI |
| `esperienze[].punti` | participio passato, un bullet per riga, senza punto elenco nel testo |
| `formazione[].votazione` | inserire solo se ≥ 100/110 o ≥ 80/100 |
| `certificazioni[].scadenza` | solo se la certificazione scade |
| `lingue[].livello` | livello QCER o `madrelingua`. Mai «buono» o «ottimo» |
| `altro` | sezione jolly per volontariato, pubblicazioni, premi, associazioni |
| `privacy` | se omesso, il renderer inserisce la formula standard. Stringa vuota `""` per non stamparla |

---

## Validazione prima del render

Controlla a mano, prima di lanciare lo script:

- [ ] Nessun bullet inizia con `Ho `, `Mi sono `, `Sono stato`
- [ ] Nessun participio accordato (`-a`, `-i`, `-e`) in apertura di bullet
- [ ] Tutte le date sono nel formato `mmm AAAA` con il mese minuscolo e italiano
- [ ] Nessun campo contiene emoji, barre di valutazione o caratteri decorativi
- [ ] `intestazione.citta` non contiene un indirizzo completo
- [ ] Nessun campo contiene codice fiscale, data di nascita o RAL
- [ ] Le keyword dell'annuncio compaiono nei `punti`, non solo in `competenze`
