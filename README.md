# Movements

---

### 🔹 Basic Movement (per character/line)

* `h` → left
* `l` → right
* `0` → beginning of line
* `^` → first non-whitespace character
* `$` → end of line

---

### 🔹 Word-Level Movement

* `w` → beginning of next word
* `e` → end of current/next word
* `b` → beginning of current/previous word
* `ge` → end of previous word

---

### 🔹 Paragraph & Sentence

* `{` → beginning of paragraph
* `}` → end of paragraph
* `( )` → move by sentence

---

### 🔹 Screen Movement

* `Ctrl-d` → half-page down
* `Ctrl-u` → half-page up
* `Ctrl-f` → full page forward
* `Ctrl-b` → full page back
* `zz` → center current line on screen
* `zt` → put current line at top
* `zb` → put current line at bottom

---

### 🔹 Searching / Jumping

* `/pattern` → search forward
* `?pattern` → search backward
* `n` / `N` → repeat search forward/back
* `f<char>` → jump to next occurrence of a char on the same line
* `t<char>` → jump **until** before that char
* `;` / `,` → repeat last `f` or `t` forward/backward

---

### 🔹 Marks & Jumps

* `''` → jump back to last cursor position in current file
* `ma` → set mark `a` at current position
* `'a` → jump to beginning of line with mark `a`
* \`\`a`→ jump to exact column with mark`a\`

---

### 🔹 File Navigation

* `gg` → go to beginning of file
* `G` → go to end of file
* `:10` → jump to line 10
* `10G` → same thing
* `H` → top of screen
* `M` → middle of screen
* `L` → bottom of screen

---
