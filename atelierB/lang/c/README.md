# Sistema de Gerenciamento de Academia - Gym

Este projeto implementa um sistema completo de gerenciamento de academia usando métodos formais (B Method) com interface de usuário em ncurses e testes automatizados.

## Estrutura do Projeto

```
lang/c/
├── Gym.h                 # Header com definições da API
├── Gym_i.c              # Implementação principal do sistema
├── test_gym.c           # Testes automatizados
├── gym_interface.c      # Interface com ncurses
├── Makefile            # Arquivo de compilação
└── README.md           # Este arquivo
```

## Funcionalidades

### Sistema Principal
- Gerenciamento de professores
- Gerenciamento de alunos
- Controle de treinos
- Gerenciamento de exercícios
- Sistema de check-in/check-out
- Consultas e relatórios

### Testes Automatizados
- Testes de operações de professores
- Testes de operações de alunos
- Testes de pagamento
- Testes de check-in/check-out
- Testes de treinos
- Testes de exercícios
- Testes de casos extremos
- Cenários complexos

### Interface com ncurses
- Menu lateral com navegação por setas
- Highlight amarelo para opção selecionada
- **Header superior "GYM - Metodos Formais"**
- Verificação prévia com funções `can*`
- Cobertura de todas as funções do sistema
- Mensagens de status (sucesso/erro)

## Pré-requisitos

### macOS
```bash
brew install ncurses
```

### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install libncurses5-dev libncursesw5-dev
```

## Compilação e Execução

### Verificar dependências
```bash
make check-deps
```

### Compilar tudo
```bash
make all
```

### Executar testes
```bash
make test
```

### Executar interface
```bash
make run
```

### Limpar arquivos compilados
```bash
make clean
```

## Como usar a Interface

1. **Navegação**: Use as setas ↑ e ↓ para navegar pelos menus
2. **Seleção**: Pressione ENTER para selecionar uma opção
3. **Voltar**: Pressione ESC para voltar ao menu anterior
4. **Entrada de dados**: Digite os valores solicitados e pressione ENTER

### Estrutura dos Menus

```
Menu Principal
├── Professores
│   ├── Adicionar Professor
│   ├── Remover Professor
│   ├── Listar Professores
│   └── Voltar
├── Alunos
│   ├── Adicionar Aluno
│   ├── Remover Aluno
│   ├── Listar Alunos
│   ├── Atualizar Professor do Aluno
│   ├── Atualizar Pagamento
│   ├── Tornar Aluno Inativo
│   ├── Check-in
│   ├── Check-out
│   └── Voltar
├── Treinos
│   ├── Adicionar Treino para Professor
│   ├── Adicionar Treino para Aluno
│   ├── Remover Treino do Aluno
│   ├── Listar Treinos
│   ├── Atualizar Dia do Treino
│   └── Voltar
├── Exercícios
│   ├── Adicionar Exercício ao Treino
│   ├── Remover Exercício do Treino
│   ├── Listar Exercícios
│   ├── Atualizar Exercício
│   └── Voltar
├── Consultas
│   ├── Quantidade de Alunos
│   ├── Quantidade de Professores
│   ├── Alunos por Professor
│   ├── Verificar se Aluno é de Professor
│   └── Voltar
└── Sair
```

## Regras de Negócio

### Professores
- ID deve estar entre 0 e 98 (99 é reservado para "sem professor")
- Não pode haver professores duplicados
- Deve haver pelo menos 1 professor no sistema
- Ao deletar professor, alunos e treinos associados são desvinculados

### Alunos
- ID deve estar entre 0 e 98
- Deve estar associado a um professor válido
- Só pode ser deletado se estiver inativo
- Status: ativo ou inativo
- Presença: presente ou ausente

### Treinos
- Associados a um professor
- Podem ser atribuídos a alunos do mesmo professor
- Dias da semana: 0-6 (domingo a sábado)
- Aluno só pode ter treino se estiver ativo

### Exercícios
- Associados a treinos
- Séries: 0-5
- Repetições: 0-20
- Um exercício só pode estar uma vez por treino

## Testes

O sistema inclui testes abrangentes que verificam:

- **Operações básicas**: Adicionar, remover, atualizar
- **Validações**: Verificação de pré-condições
- **Casos extremos**: Valores limites, IDs inválidos
- **Cenários complexos**: Múltiplos relacionamentos
- **Integridade**: Consistência dos dados

### Executar apenas os testes
```bash
make test
```

Os testes mostram:
- Total de testes executados
- Testes aprovados/falharam
- Taxa de sucesso
- Detalhes de cada teste

## Características Técnicas

### Validações
- Todas as operações usam funções `can*` para verificação prévia
- IDs válidos: 0-98 (99 é reservado)
- Limites respeitados para séries e repetições
- Verificação de existência antes de operações

### Interface
- **Header superior** com título "GYM - Metodos Formais"
- Desenvolvida com ncurses para compatibilidade
- Não usa caracteres especiais ou acentuação
- Navegação intuitiva com setas
- Feedback visual claro (cores)
- Tratamento de erros

### Arquitetura
- Separação clara entre lógica e interface
- Funções reutilizáveis
- Código modular e bem documentado
- Conformidade com padrões C99

## Solução de Problemas

### ncurses não encontrado
```bash
# macOS
brew install ncurses

# Linux
sudo apt-get install libncurses5-dev
```

### Erro de compilação
```bash
make clean
make check-deps
make all
```

### Interface com caracteres estranhos
Certifique-se de que o terminal suporta ncurses e tem encoding UTF-8.

## Desenvolvimento

Para modificar o sistema:

1. **Lógica de negócio**: Edite `Gym_i.c`
2. **Interface**: Edite `gym_interface.c`
3. **Testes**: Edite `test_gym.c`
4. **Recompile**: `make clean && make all`

## Licença

Este projeto foi desenvolvido para fins acadêmicos como parte do curso de Métodos Formais.
