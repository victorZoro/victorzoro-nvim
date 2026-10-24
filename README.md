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

### Itens que exigem instalação local

Para compilar LaTeX com VimTeX, instale o MacTeX (ou BasicTeX) no macOS:

```bash
brew install --cask basictex
sudo tlmgr install latexmk biber
```

Se `basictex` já estiver instalado, não instale `mactex-no-gui`: os dois
casks são conflitantes. O MacTeX completo é uma alternativa, não um
complemento do BasicTeX.

Depois reinicie o terminal para que `latexmk` e `biber` entrem no `PATH`.
Python, Perl e Ruby são providers opcionais do Neovim e podem permanecer
desativados se nenhum plugin local depender deles.

Após atualizar o Neovim para uma versão nova, atualize os parsers e plugins:

```vim
:Lazy update nvim-treesitter
:TSUpdate
```

Isso é necessário no Neovim 0.12 quando o healthcheck indicar erro de query
`vimdoc`, pois o parser precisa acompanhar a ABI e a sintaxe de queries da
versão instalada.

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

## Bancos de dados

O projeto inclui `vim-dadbod`, `vim-dadbod-ui` e `vim-dadbod-completion` para
abrir conexões, navegar por schemas e executar SQL dentro do Neovim. Os
plugins não armazenam credenciais no repositório.

### Atalhos

| Atalho | Ação |
|---|---|
| `<leader>db` | Abrir/fechar a interface do banco |
| `<leader>dq` | Abrir a interface do banco |
| `<leader>df` | Encontrar buffer de banco |
| `<leader>dr` | Renomear buffer de banco |

### Primeira conexão

Depois de atualizar os plugins, execute `:DBUI`. Na janela do DBUI, pressione
`A` para adicionar uma conexão. Exemplos de URLs:

```text
postgresql://user:password@localhost:5432/my_database
mysql://user:password@localhost:3306/my_database
sqlserver://user:password@localhost:1433?database=my_database
```

Prefira variáveis de ambiente ou arquivos de conexão locais para não salvar
senhas em texto puro. Em um buffer SQL, o completion aparece automaticamente;
use `:DB` para executar a consulta atual.

Os clientes do banco ainda precisam estar instalados no sistema:

```bash
brew install libpq mysql-client
```

Para SQL Server, instale o `sqlcmd` pelo pacote oficial da Microsoft.

## HTTP dentro do Neovim

O projeto também inclui Kulala, um cliente HTTP semelhante ao Postman para
arquivos `.http`. Crie, por exemplo, `requests.http`:

```http
### Listar pets
GET http://localhost:3000/pets
Accept: application/json

### Criar pet
POST http://localhost:3000/pets
Content-Type: application/json

{
  "name": "Rex"
}
```

Abra o arquivo no Neovim e use:

| Atalho | Ação |
|---|---|
| `<leader>hr` | Executar a requisição atual |
| `<leader>ha` | Executar todas as requisições |
| `<leader>hi` | Inspecionar a requisição |
| `<leader>hx` | Abrir scratchpad HTTP |

O resultado aparece dentro do Neovim. Variáveis de ambiente podem ser
mantidas em arquivos locais `.env`/`.http` e não devem conter credenciais
commitadas no repositório.

## Decisões de compatibilidade

- Neo-tree permanece no `<leader>e`, como equivalente existente ao NERDTree.
- `nvim-surround` é o equivalente Neovim de `vim-surround`.
- Leap é usado como equivalente ativo do EasyMotion já presente no projeto.
- `version = false` mantém plugins no commit mais recente; o lockfile continua
  sendo a fonte de reprodutibilidade e pode ser atualizado com `:Lazy update`.
