
![[e4768efdc4b463783ef7aeafe549ff35_MD5.pdf]]

Here’s the **core list** of **special/unique characters** commonly used in **Ubuntu’s terminal (bash shell)**, with brief meanings:

---

| Symbol  | Meaning                                                                                             |
| :-----: | :-------------------------------------------------------------------------------------------------- |
|    `    | `                                                                                                   |
|   `>`   | **Redirect stdout**: output to a file (overwrite)                                                   |
|  `>>`   | **Redirect stdout**: output to a file (append)                                                      |
|   `<`   | **Redirect stdin**: take input from a file                                                          |
|  `<<`   | **Here document**: input multiple lines until a delimiter                                           |
|  `<<<`  | **Here string**: input a single string directly                                                     |
|   `&`   | **Run in background**                                                                               |
|  `&&`   | **Logical AND**: run next command if previous succeeded                                             |
| __\|__  | __Pipe__: takes the command from `stdout` before it and sends it to the command after it as `stdin` |
|   `;`   | **Command separator**: run commands sequentially                                                    |
|   `\`   | **Escape character**: ignore special meaning of next character                                      |
|   `*`   | **Wildcard**: matches any number of characters                                                      |
|   `?`   | **Wildcard**: matches exactly one character                                                         |
| `[...]` | **Character class**: match any character inside brackets                                            |
| `{...}` | **Brace expansion**: create multiple text strings                                                   |
|   `$`   | **Variable expansion**                                                                              |
|  `()`   | **Subshell**: run commands in a new shell instance                                                  |
|  `$()`  | **Command substitution**: run command and replace with its output                                   |
| `$(())` | **Arithmetic expansion**                                                                            |
|   `#`   | **Comment**: everything after is ignored                                                            |
|   `~`   | **Home directory shortcut**                                                                         |
|   `.`   | **Current directory** (also source a script with `.`)                                               |
|  `..`   | **Parent directory**                                                                                |
|   `-`   | **Previous directory** (`cd -`)                                                                     |
|   `!`   | **History expansion** (e.g., `!!` repeats last command)                                             |
|   `:`   | **No-op**: does nothing, always returns success                                                     |
|   `%`   | **Job control** (e.g., `%1` refers to job 1)                                                        |
|   `^`   | **Used in substitutions in history** (rare)                                                         |

---

### A few extra important ones when combined:

- `2>` — redirect **stderr**.
    
- `2>&1` — redirect **stderr to stdout**.
    
- `|&` — **pipe stdout and stderr together** (shortcut for `2>&1 |`).
    

---

### Summary

- **Redirection and piping**: `|`, `>`, `>>`, `<`, `<<`, `<<<`
    
- **Logical operations**: `&&`, `||`, `;`
    
- **Background/Jobs**: `&`, `%`
    
- **Wildcards/Expansions**: `*`, `?`, `[ ]`, `{ }`
    
- **Subshells and substitutions**: `()`, `$()`, `$(())`
    
- **Comments and special markers**: `#`, `~`, `.`, `..`, `-`, `!`, `:`, `^`
    
