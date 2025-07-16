# Makefile para o Sistema Gym
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
LDFLAGS = -lncurses

# Diretórios
SRCDIR = .
OBJDIR = obj
BINDIR = bin

# Arquivos fonte
SOURCES = Gym_i.c
TEST_SOURCES = test_gym.c Gym_i.c
INTERFACE_SOURCES = gym_interface.c Gym_i.c

# Arquivos objeto
OBJECTS = $(SOURCES:%.c=$(OBJDIR)/%.o)
TEST_OBJECTS = $(TEST_SOURCES:%.c=$(OBJDIR)/%.o)
INTERFACE_OBJECTS = $(INTERFACE_SOURCES:%.c=$(OBJDIR)/%.o)

# Executáveis
TEST_EXEC = $(BINDIR)/test_gym
INTERFACE_EXEC = $(BINDIR)/gym_interface

# Regra principal
all: directories $(TEST_EXEC) $(INTERFACE_EXEC)

# Criar diretórios
directories:
	@mkdir -p $(OBJDIR) $(BINDIR)

# Compilar testes
$(TEST_EXEC): $(TEST_OBJECTS)
	$(CC) $(TEST_OBJECTS) -o $@

# Compilar interface
$(INTERFACE_EXEC): $(INTERFACE_OBJECTS)
	$(CC) $(INTERFACE_OBJECTS) -o $@ $(LDFLAGS)

# Regra para arquivos objeto
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Executar testes
test: $(TEST_EXEC)
	@echo "=== EXECUTANDO TESTES ==="
	./$(TEST_EXEC)

# Executar interface
run: $(INTERFACE_EXEC)
	@echo "=== INICIANDO INTERFACE ==="
	./$(INTERFACE_EXEC)

# Limpeza
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Verificar se ncurses está instalado
check-deps:
	@echo "Verificando dependências..."
	@which pkg-config >/dev/null || (echo "pkg-config não encontrado!" && exit 1)
	@pkg-config --exists ncurses || (echo "ncurses não encontrado! Instale com: brew install ncurses (macOS) ou apt-get install libncurses5-dev (Linux)" && exit 1)
	@echo "Todas as dependências estão instaladas!"

# Instalar dependências no macOS
install-deps-mac:
	brew install ncurses

# Instalar dependências no Linux
install-deps-linux:
	sudo apt-get update
	sudo apt-get install libncurses5-dev libncursesw5-dev

# Ajuda
help:
	@echo "Comandos disponíveis:"
	@echo "  make all          - Compila tudo"
	@echo "  make test         - Executa os testes"
	@echo "  make run          - Executa a interface"
	@echo "  make clean        - Remove arquivos compilados"
	@echo "  make check-deps   - Verifica dependências"
	@echo "  make install-deps-mac   - Instala dependências no macOS"
	@echo "  make install-deps-linux - Instala dependências no Linux"

.PHONY: all test run clean check-deps install-deps-mac install-deps-linux help directories
