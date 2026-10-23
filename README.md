# Neovim / LazyVim

Configuração pessoal do Neovim baseada em [LazyVim](https://www.lazyvim.org/),
com os atalhos organizados para acompanhar o `~/.ideavimrc` fornecido.

## Instalação

Execute `./install.sh` em macOS ou Linux e abra o Neovim. O Lazy.nvim instalará
os plugins na primeira execução. No macOS, instale o iTerm2/Terminal com
Option configurado como tecla Meta para que `<A-h/j/k/l>` funcione.

O instalador também registra este repositório como a configuração ativa em
`~/.config/nvim` (ou `$XDG_CONFIG_HOME/nvim`). Se já existir uma configuração,
ela será preservada em um diretório `.backup.<data>` antes da criação do link.

O clipboard usa `unnamedplus`: macOS usa `pbcopy/pbpaste`; Linux usa `xclip` ou
`wl-clipboard`.

## Linguagens e ferramentas

Há extras do LazyVim para TypeScript/JavaScript, Java, C#, SQL, Markdown, YAML,
Docker e LaTeX. Treesitter inclui React/TSX, Mermaid, CSS/SCSS, XML, TOML e os
formatos de configuração mais comuns. Mason/LSP cobre TypeScript, ESLint,
Java, OmniSharp, SQL, LaTeX, Markdown, YAML, JSON e Python.

## Guia de atalhos

`<leader>` é a tecla Espaço. A tabela abaixo lista os atalhos definidos neste
repositório; os atalhos padrão do LazyVim continuam disponíveis quando não há
um conflito.

### Configuração, busca e edição

| Atalho | Ação |
|---|---|
| `<leader>cc` | Editar `lua/config/keymaps.lua` |
| `<leader>cs` | Recarregar os atalhos |
| `<Esc>` | Limpar destaque da busca |
| `<C-j>` / `<C-k>` | Mover linha para baixo / cima |
| `<leader>d` / `<leader>u` | Rolar para baixo / cima |
| `p` no modo visual | Colar sem substituir o registrador |
| `<S-k>` | Duplicar linha |
| `<C-[>` no modo insert | Completar declaração |
| `<leader>sw` | Envolver palavra/seleção com `nvim-surround` |
| `zc` / `zo` | Fechar / abrir fold |

### Navegação, arquivos e abas

| Atalho | Ação |
|---|---|
| `<leader>e` | Alternar Neo-tree |
| `<leader>[` / `<leader>]` | Aba anterior / próxima |
| `<leader>q` | Fechar editor atual |
| `<leader>;a` | Fechar todos os editores |
| `<leader>;q` | Fechar os demais editores |
| `<leader>h` | Arquivos recentes |
| `<leader>ll` | Locais recentes |
| `<leader>sf` | Encontrar arquivo |
| `<leader>sc` / `<leader>oo` | Símbolos/estrutura do arquivo |
| `<leader>sa` | Comandos/ações |
| `<leader>f` / `<leader>F` | Leap no editor atual |
| `<leader>L` | Leap entre janelas |
| `<leader>w` | Próxima janela |

### Janelas e tmux

| Atalho | Ação |
|---|---|
| `<leader>wh` / `<leader>wv` | Split horizontal / vertical |
| `<leader>ww` | Fechar split atual |
| `<leader>wa` | Manter apenas a janela atual |
| `<leader>-` | Trocar posição do split |
| `<A-h/j/k/l>` | Navegar entre janelas |
| `<S-h>` / `<S-l>` | Janela esquerda / direita |
| `<C-h>` / `<C-l>` | Navegar para tmux à esquerda / direita |

`<C-j>` e `<C-k>` foram deliberadamente reservados para mover linhas, conforme
o IdeaVim aprovado; por isso não navegam para baixo/cima no tmux.

### Código, LSP, diagnóstico e Git

| Atalho | Ação |
|---|---|
| `<leader>gd` / `<leader>gi` | Declaração / implementação |
| `<leader>ug` / `<leader>uu` | Usos/referências / símbolos do documento |
| `<leader>vs` | Ir para a implementação/origem |
| `<leader>im` / `<leader>td` | Implementações / definição de tipo |
| `<leader>ti` / `<leader>sh` | Tipo/hover |
| `<leader>rn` | Renomear elemento |
| `<leader>aa` | Ações de código/intenção |
| `<leader>rm/rv/rf/rs/rr` | Refatoração LSP (método/variável/campo/assinatura/lista) |
| `<leader>a` | Visão de arquivos/projeto |
| `<S-space>` | Gerar/ação de código |
| `<leader>en` / `<leader>ep` | Próximo / diagnóstico anterior |
| `<leader>/` | Descrição do erro |
| `<leader>p` | Toggle de breakpoint DAP, quando DAP estiver instalado |
| `<leader>P` | Avaliar expressão no DAP, quando DAP estiver instalado |
| `<leader>m` | LazyGit |
| `<leader>s` | Escolher esquema de cores |
| `<leader>ff` / `<leader>fr` | Buscar / substituir no projeto |
| `<S-f>` / `<S-r>` | Buscar no buffer / busca global |
| `<leader>lc` | Última alteração |
| `<A-[>` / `<A-]>` | Método anterior / próximo |

## Decisões de compatibilidade

- Neo-tree permanece no `<leader>e`, como equivalente existente ao NERDTree.
- `nvim-surround` é o equivalente Neovim de `vim-surround`.
- Leap é usado como equivalente ativo do EasyMotion já presente no projeto.
- `version = false` mantém plugins no commit mais recente; o lockfile continua
  sendo a fonte de reprodutibilidade e pode ser atualizado com `:Lazy update`.
