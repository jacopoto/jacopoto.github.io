# MEMORY.md — jacopoto.github.io

## Project Overview
Personal academic website for Jacopo Mazza, Associate Professor at Utrecht University School of Economics. Jekyll site hosted on GitHub Pages via the `gaalcaras/academic` remote theme.

---

## Key Files

| File | Purpose |
|------|---------|
| `index.markdown` | Main page bio text |
| `02_research.markdown` | Research page (working papers + journal publications) |
| `_config.yml` | Site title, description (shows in footer), social links |
| `_includes/author.html` | Sidebar under profile picture (name + title + institution) |
| `cv/jacopo-mazza_cv.tex` | CV LaTeX source |
| `cv/my_pubs.bib` | BibTeX database for CV publications |
| `cv/jacopo-mazza_cv.pdf` | Compiled CV (must be recompiled and committed after any change) |
| `assets/img/` | Journal cover images (e.g. `jode.jpg`, `econ_edu_rev.jpg`) |
| `assets/bibtex_cite/` | Standalone `.bib` files for download buttons on research page |
| `assets/*.pdf` | Paper preprints hosted on the site |

---

## Title / Rank
Current title: **Associate Professor** (promoted 2026).
Appears in three places — update all three together:
1. `index.markdown` — bio paragraph
2. `_config.yml` — `description:` field
3. `_includes/author.html` — `<div>` under name

---

## Promoting a Paper from Working Papers to Journal Publications

### Research page (`02_research.markdown`)
1. Delete the full working paper block (title, authors, R&R label, buttons, abstract, `<p> </p>`)
2. Renumber remaining working papers
3. Add new entry at the **top** of Journal Publications (highest number), using format:
   ```markdown
   N) <img src="https://jacopoto.github.io/assets/img/JOURNAL.jpg" width="120">{: .image-left}**[Title](PREPRINT_URL){:target="_blank"}** \
   (joint with [Author](URL){:target="_blank"} and Author) \
   *Journal Name*, forthcoming \
   [Download preprint](URL){: .button}{:target="_blank"}
   [Download bibtex citation](https://jacopoto.github.io/assets/bibtex_cite/KEY.bib){:.button}
   <details>
     <summary>Abstract</summary>
   ...
   </details>
   <p> </p>
   ```
4. When volume/pages are known, add them and a "Link to published version" button

### CV (`cv/jacopo-mazza_cv.tex`)
1. Remove item from `\begin{itemize}` Working Papers block
2. Add `\nocite{KEY}` at the **top** of the `\nocite` block (most recent first)

### BibTeX (`cv/my_pubs.bib`)
- Add entry at top (after preamble), using `year = {\noop{3001}forthcoming}` for forthcoming papers
- The `\noop` preamble is already in the file — required for the `ecta_YEAR` style to sort forthcoming papers first

### Bibtex download file
- Create `assets/bibtex_cite/KEY.bib` with plain `year = {forthcoming}` (no `\noop`)

### Recompile CV
```
pdflatex -interaction=batchmode jacopo-mazza_cv.tex
bibtex jacopo-mazza_cv
pdflatex -interaction=batchmode jacopo-mazza_cv.tex
pdflatex -interaction=batchmode jacopo-mazza_cv.tex
```
Then `git add cv/jacopo-mazza_cv.pdf` — the PDF must be committed.

---

## CV Layout Notes
- Bibliography was previously wrapped in a `\begin{minipage}` — this made it an **unbreakable block**, always pushing to page 2. The minipage was removed (2026-06). Bibliography now flows naturally across pages.
- Journal publications section starts on page 1.
- CV compiles to **4 pages** as of mid-2026.
- BibTeX style: `ecta_YEAR` (custom style, sorts by year descending).

---

## Journal Cover Images
Stored in `assets/img/`. Current images:

| File | Journal |
|------|---------|
| `jei.jpg` | Journal of Economic Inequality |
| `emp_econ.jpg` | Empirical Economics |
| `ilrr.jpg` | ILR Review |
| `le.jpg` | Labour Economics |
| `jepp.jpg` | Journal of European Public Policy |
| `fs.cover.jpg` | Fiscal Studies |
| `ej.jpeg` | The Economic Journal |
| `rssa.jpg` | Journal of the Royal Statistical Society: Series A |
| `jode.jpg` | Journal of Demographic Economics |
| `econ_edu_rev.jpg` | Economics of Education Review |

Add new images here as papers are accepted.

---

## Co-author Links

| Author | URL |
|--------|-----|
| Francesco Fasani | https://sites.google.com/site/fasani2010/ |
| Hans van Ophem | https://www.uva.nl/en/profile/o/p/j.c.m.vanophem/j.c.m.van-ophem.html |
| Mariapia Mendola | https://sites.google.com/site/mariapiamendola/ |
| Alena Bicáková | http://home.cerge-ei.cz/Alena/ |
| Matias Cortes | https://www.sites.google.com/site/gmatiascortes/home |
| Kelly Foley | https://www.kellyfoley.org/ |
| Peter McHenry | https://www.wm.edu/as/economics/faculty-directory/mchenry_p.php |
| Michael Christl | https://sites.google.com/view/michael-christl/about-me |
| Marco Scipioni | https://scholar.google.com/citations?user=WuJGLH0AAAAJ&hl=en |
| Joep Keuzenkamp | https://www.uu.nl/medewerkers/JWHKeuzenkamp |
| Bob Rijkers | https://www.worldbank.org/en/about/people/b/bob-rijkers |
| Katherine Stapleton | https://www.katherinestapleton.co/ |

---

## Workflow Reminder
After every change: `git add [files] && git commit && git push`.
The CV PDF must always be recompiled before committing `.tex` changes.
