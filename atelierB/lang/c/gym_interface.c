#include <ncurses.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "Gym.h"

// Definicoes de cores
#define COLOR_NORMAL 1
#define COLOR_HIGHLIGHT 2
#define COLOR_ERROR 3
#define COLOR_SUCCESS 4
#define COLOR_HEADER 5

// Estrutura para menu
typedef struct {
    char *name;
    void (*function)();
} MenuItem;

// Variaveis globais para interface
WINDOW *header_win, *menu_win, *content_win, *status_win;
int highlight = 0;
int choice = 0;
int n_choices = 0;

// Prototipos das funcoes
void init_interface();
void cleanup_interface();
void draw_menu();
void draw_content();
void draw_status(const char *message, int is_error);
void handle_input();
void clear_content();

// Funcoes do menu
void menu_professores();
void menu_alunos();
void menu_treinos();
void menu_exercicios();
void menu_consultas();
void menu_sair();

// Submenu professores
void submenu_add_professor();
void submenu_del_professor();
void submenu_list_professores();

// Submenu alunos
void submenu_add_aluno();
void submenu_del_aluno();
void submenu_list_alunos();
void submenu_update_aluno_prof();
void submenu_update_pagamento();
void submenu_set_aluno_inativo();
void submenu_checkin();
void submenu_checkout();

// Submenu treinos
void submenu_add_treino_prof();
void submenu_add_treino_aluno();
void submenu_del_treino_aluno();
void submenu_list_treinos();
void submenu_update_dia_treino();

// Submenu exercicios
void submenu_add_exercicio();
void submenu_del_exercicio();
void submenu_list_exercicios();
void submenu_update_exercicio();

// Submenu consultas
void submenu_qtd_alunos();
void submenu_qtd_professores();
void submenu_alunos_por_prof();
void submenu_aluno_de_professor();

// Utilitarios
int get_number_input(const char *prompt, int min, int max);
void show_message(const char *message, int is_error);
void wait_for_key();

// Menu principal
MenuItem main_menu[] = {
    {"Professores", menu_professores},
    {"Alunos", menu_alunos},
    {"Treinos", menu_treinos},
    {"Exercicios", menu_exercicios},
    {"Consultas", menu_consultas},
    {"Sair", menu_sair}
};

// Submenus
MenuItem prof_menu[] = {
    {"Adicionar Professor", submenu_add_professor},
    {"Remover Professor", submenu_del_professor},
    {"Listar Professores", submenu_list_professores},
    {"Voltar", NULL}
};

MenuItem aluno_menu[] = {
    {"Adicionar Aluno", submenu_add_aluno},
    {"Remover Aluno", submenu_del_aluno},
    {"Listar Alunos", submenu_list_alunos},
    {"Atualizar Professor do Aluno", submenu_update_aluno_prof},
    {"Atualizar Pagamento", submenu_update_pagamento},
    {"Tornar Aluno Inativo", submenu_set_aluno_inativo},
    {"Check-in", submenu_checkin},
    {"Check-out", submenu_checkout},
    {"Voltar", NULL}
};

MenuItem treino_menu[] = {
    {"Adicionar Treino para Professor", submenu_add_treino_prof},
    {"Adicionar Treino para Aluno", submenu_add_treino_aluno},
    {"Remover Treino do Aluno", submenu_del_treino_aluno},
    {"Listar Treinos", submenu_list_treinos},
    {"Atualizar Dia do Treino", submenu_update_dia_treino},
    {"Voltar", NULL}
};

MenuItem exercicio_menu[] = {
    {"Adicionar Exercicio ao Treino", submenu_add_exercicio},
    {"Remover Exercicio do Treino", submenu_del_exercicio},
    {"Listar Exercicios", submenu_list_exercicios},
    {"Atualizar Exercicio", submenu_update_exercicio},
    {"Voltar", NULL}
};

MenuItem consulta_menu[] = {
    {"Quantidade de Alunos", submenu_qtd_alunos},
    {"Quantidade de Professores", submenu_qtd_professores},
    {"Alunos por Professor", submenu_alunos_por_prof},
    {"Verificar se Aluno eh de Professor", submenu_aluno_de_professor},
    {"Voltar", NULL}
};

void init_interface() {
    initscr();
    clear();
    noecho();
    cbreak();
    keypad(stdscr, TRUE);
    curs_set(0);
    
    // Inicializar cores
    start_color();
    init_pair(COLOR_NORMAL, COLOR_WHITE, COLOR_BLACK);
    init_pair(COLOR_HIGHLIGHT, COLOR_BLACK, COLOR_YELLOW);
    init_pair(COLOR_ERROR, COLOR_RED, COLOR_BLACK);
    init_pair(COLOR_SUCCESS, COLOR_GREEN, COLOR_BLACK);
    init_pair(COLOR_HEADER, COLOR_BLACK, COLOR_RED);
    
    // Criar janelas - menu mais largo (45 caracteres)
    int height, width;
    getmaxyx(stdscr, height, width);
    
    // Header ocupa 3 linhas no topo
    header_win = newwin(3, width, 0, 0);
    menu_win = newwin(height - 6, 45, 3, 0);
    content_win = newwin(height - 6, width - 45, 3, 45);
    status_win = newwin(3, width, height - 3, 0);
    
    // Configurar bordas
    box(header_win, 0, 0);
    box(menu_win, 0, 0);
    box(content_win, 0, 0);
    box(status_win, 0, 0);
    
    // Header com background vermelho e texto preto
    wattron(header_win, COLOR_PAIR(COLOR_HEADER));
    mvwprintw(header_win, 1, (width - 22) / 2, "GYM - Metodos Formais");
    wattroff(header_win, COLOR_PAIR(COLOR_HEADER));
    
    // Titulos
    mvwprintw(menu_win, 0, 2, " MENU ");
    mvwprintw(content_win, 0, 2, " SISTEMA GYM ");
    mvwprintw(status_win, 0, 2, " STATUS ");
    
    refresh();
    wrefresh(header_win);
    wrefresh(menu_win);
    wrefresh(content_win);
    wrefresh(status_win);
}

void cleanup_interface() {
    delwin(header_win);
    delwin(menu_win);
    delwin(content_win);
    delwin(status_win);
    endwin();
}

void draw_menu_items(MenuItem items[], int count) {
    wclear(menu_win);
    box(menu_win, 0, 0);
    mvwprintw(menu_win, 0, 2, " MENU ");
    
    for (int i = 0; i < count; i++) {
        if (highlight == i) {
            wattron(menu_win, COLOR_PAIR(COLOR_HIGHLIGHT));
            mvwprintw(menu_win, i + 2, 2, " %s ", items[i].name);
            wattroff(menu_win, COLOR_PAIR(COLOR_HIGHLIGHT));
        } else {
            mvwprintw(menu_win, i + 2, 2, " %s ", items[i].name);
        }
    }
    
    wrefresh(menu_win);
}

void clear_content() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " SISTEMA GYM ");
    wrefresh(content_win);
}

void show_message(const char *message, int is_error) {
    wclear(status_win);
    box(status_win, 0, 0);
    mvwprintw(status_win, 0, 2, " STATUS ");
    
    if (is_error) {
        wattron(status_win, COLOR_PAIR(COLOR_ERROR));
    } else {
        wattron(status_win, COLOR_PAIR(COLOR_SUCCESS));
    }
    
    mvwprintw(status_win, 1, 2, "%s", message);
    
    if (is_error) {
        wattroff(status_win, COLOR_PAIR(COLOR_ERROR));
    } else {
        wattroff(status_win, COLOR_PAIR(COLOR_SUCCESS));
    }
    
    wrefresh(status_win);
}

int get_number_input(const char *prompt, int min, int max) {
    char buffer[20];
    int value;
    
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " ENTRADA DE DADOS ");
    
    mvwprintw(content_win, 2, 2, "%s (%d-%d): ", prompt, min, max);
    wrefresh(content_win);
    
    echo();
    curs_set(1);
    wgetstr(content_win, buffer);
    noecho();
    curs_set(0);
    
    value = atoi(buffer);
    if (value < min || value > max) {
        show_message("Valor invalido!", 1);
        wait_for_key();
        return -1;
    }
    
    return value;
}

void wait_for_key() {
    mvwprintw(status_win, 2, 2, "Pressione qualquer tecla para continuar...");
    wrefresh(status_win);
    getch();
}

// Implementacao dos menus principais
void menu_professores() {
    int local_highlight = 0;
    int key;
    int count = sizeof(prof_menu) / sizeof(MenuItem);
    
    while (1) {
        highlight = local_highlight;
        draw_menu_items(prof_menu, count);
        
        key = getch();
        switch (key) {
            case KEY_UP:
                local_highlight = (local_highlight == 0) ? count - 1 : local_highlight - 1;
                break;
            case KEY_DOWN:
                local_highlight = (local_highlight == count - 1) ? 0 : local_highlight + 1;
                break;
            case 10: // Enter
                if (prof_menu[local_highlight].function) {
                    prof_menu[local_highlight].function();
                } else {
                    return; // Voltar
                }
                break;
            case 27: // ESC
                return;
        }
    }
}

void menu_alunos() {
    int local_highlight = 0;
    int key;
    int count = sizeof(aluno_menu) / sizeof(MenuItem);
    
    while (1) {
        highlight = local_highlight;
        draw_menu_items(aluno_menu, count);
        
        key = getch();
        switch (key) {
            case KEY_UP:
                local_highlight = (local_highlight == 0) ? count - 1 : local_highlight - 1;
                break;
            case KEY_DOWN:
                local_highlight = (local_highlight == count - 1) ? 0 : local_highlight + 1;
                break;
            case 10: // Enter
                if (aluno_menu[local_highlight].function) {
                    aluno_menu[local_highlight].function();
                } else {
                    return; // Voltar
                }
                break;
            case 27: // ESC
                return;
        }
    }
}

void menu_treinos() {
    int local_highlight = 0;
    int key;
    int count = sizeof(treino_menu) / sizeof(MenuItem);
    
    while (1) {
        highlight = local_highlight;
        draw_menu_items(treino_menu, count);
        
        key = getch();
        switch (key) {
            case KEY_UP:
                local_highlight = (local_highlight == 0) ? count - 1 : local_highlight - 1;
                break;
            case KEY_DOWN:
                local_highlight = (local_highlight == count - 1) ? 0 : local_highlight + 1;
                break;
            case 10: // Enter
                if (treino_menu[local_highlight].function) {
                    treino_menu[local_highlight].function();
                } else {
                    return; // Voltar
                }
                break;
            case 27: // ESC
                return;
        }
    }
}

void menu_exercicios() {
    int local_highlight = 0;
    int key;
    int count = sizeof(exercicio_menu) / sizeof(MenuItem);
    
    while (1) {
        highlight = local_highlight;
        draw_menu_items(exercicio_menu, count);
        
        key = getch();
        switch (key) {
            case KEY_UP:
                local_highlight = (local_highlight == 0) ? count - 1 : local_highlight - 1;
                break;
            case KEY_DOWN:
                local_highlight = (local_highlight == count - 1) ? 0 : local_highlight + 1;
                break;
            case 10: // Enter
                if (exercicio_menu[local_highlight].function) {
                    exercicio_menu[local_highlight].function();
                } else {
                    return; // Voltar
                }
                break;
            case 27: // ESC
                return;
        }
    }
}

void menu_consultas() {
    int local_highlight = 0;
    int key;
    int count = sizeof(consulta_menu) / sizeof(MenuItem);
    
    while (1) {
        highlight = local_highlight;
        draw_menu_items(consulta_menu, count);
        
        key = getch();
        switch (key) {
            case KEY_UP:
                local_highlight = (local_highlight == 0) ? count - 1 : local_highlight - 1;
                break;
            case KEY_DOWN:
                local_highlight = (local_highlight == count - 1) ? 0 : local_highlight + 1;
                break;
            case 10: // Enter
                if (consulta_menu[local_highlight].function) {
                    consulta_menu[local_highlight].function();
                } else {
                    return; // Voltar
                }
                break;
            case 27: // ESC
                return;
        }
    }
}

void menu_sair() {
    cleanup_interface();
    printf("Obrigado por usar o Sistema Gym!\n");
    exit(0);
}

// Implementacao dos submenus de professor
void submenu_add_professor() {
    int prof_id = get_number_input("ID do Professor", 0, 98);
    if (prof_id == -1) return;
    
    bool canAdd;
    Gym__canAddProf(prof_id, &canAdd);
    
    if (canAdd) {
        Gym__addProf(prof_id);
        show_message("Professor adicionado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel adicionar este professor!", 1);
    }
    wait_for_key();
}

void submenu_del_professor() {
    int prof_id = get_number_input("ID do Professor para remover", 0, 98);
    if (prof_id == -1) return;
    
    bool canDel;
    Gym__canDeleteProf(prof_id, &canDel);
    
    if (canDel) {
        Gym__deleteProf(prof_id);
        show_message("Professor removido com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel remover este professor!", 1);
    }
    wait_for_key();
}

void submenu_list_professores() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " LISTA DE PROFESSORES ");
    
    int32_t count;
    bool canConsult;
    Gym__canQuantidadeProfessores(&canConsult);
    
    if (canConsult) {
        Gym__quantidadeProfessores(&count);
        mvwprintw(content_win, 2, 2, "Total de professores: %d", count);
        
        mvwprintw(content_win, 4, 2, "Professores cadastrados:");
        mvwprintw(content_win, 5, 2, "ID | Status");
        mvwprintw(content_win, 6, 2, "---+--------");
        
        int line = 7;
        int displayed = 0;
        
        // Percorrer todos os IDs possíveis e verificar quais professores existem
        for (int i = 0; i < 99 && line < 20 && displayed < count; i++) {
            bool canAdd;
            Gym__canAddProf(i, &canAdd);
            // Se não pode adicionar, é porque já existe
            if (!canAdd) {
                mvwprintw(content_win, line, 2, "%2d | Ativo", i);
                line++;
                displayed++;
            }
        }
        
        if (displayed < count) {
            mvwprintw(content_win, line, 2, "... e mais %d professor(es)", count - displayed);
        }
    } else {
        mvwprintw(content_win, 2, 2, "Nenhum professor cadastrado.");
    }
    
    wrefresh(content_win);
    wait_for_key();
}

// Implementacao dos submenus de aluno
void submenu_add_aluno() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    int prof_id = get_number_input("ID do Professor", 0, 98);
    if (prof_id == -1) return;
    
    bool canAdd;
    Gym__canAddAluno(aluno_id, prof_id, &canAdd);
    
    if (canAdd) {
        Gym__addAluno(aluno_id, prof_id);
        show_message("Aluno adicionado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel adicionar este aluno!", 1);
    }
    wait_for_key();
}

void submenu_del_aluno() {
    int aluno_id = get_number_input("ID do Aluno para remover", 0, 98);
    if (aluno_id == -1) return;
    
    bool canDel;
    Gym__canDeleteAluno(aluno_id, &canDel);
    
    if (canDel) {
        Gym__deleteAluno(aluno_id);
        show_message("Aluno removido com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel remover este aluno!", 1);
    }
    wait_for_key();
}

void submenu_list_alunos() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " LISTA DE ALUNOS ");
    
    int32_t count;
    bool canConsult;
    Gym__canQuantidadeAlunos(&canConsult);
    
    if (canConsult) {
        Gym__quantidadeAlunos(&count);
        mvwprintw(content_win, 2, 2, "Total de alunos: %d", count);
        
        mvwprintw(content_win, 4, 2, "Alunos cadastrados:");
        mvwprintw(content_win, 5, 2, "ID | Professor | Status    | Presenca");
        mvwprintw(content_win, 6, 2, "---+----------+-----------+---------");
        
        int line = 7;
        int displayed = 0;
        
        // Percorrer todos os IDs possíveis e verificar quais alunos existem
        for (int i = 0; i < 99 && line < 18 && displayed < count; i++) {
            bool canAdd;
            Gym__canAddAluno(i, 1, &canAdd); // Tenta com professor 1
            
            // Se não pode adicionar com nenhum professor, é porque aluno já existe
            bool alunoExiste = false;
            for (int p = 0; p < 99 && !alunoExiste; p++) {
                Gym__canAddAluno(i, p, &canAdd);
                if (!canAdd) {
                    // Verificar se é porque aluno já existe ou professor não existe
                    bool profExiste;
                    Gym__canAddProf(p, &profExiste);
                    if (!profExiste) { // Professor existe
                        alunoExiste = true;
                        
                        // Descobrir o professor do aluno
                        bool ehDoProf;
                        int profDoAluno = 99;
                        for (int pp = 0; pp < 99; pp++) {
                            Gym__alunoDeProfessor(i, pp, &ehDoProf);
                            if (ehDoProf) {
                                profDoAluno = pp;
                                break;
                            }
                        }
                        
                        // Verificar status (tentando operações que só funcionam com ativo/inativo)
                        bool canCheckIn, canSetInativo;
                        Gym__canCheckIn(i, &canCheckIn);
                        Gym__canSetAlunoInativo(i, &canSetInativo);
                        
                        const char* status = "Inativo";
                        const char* presenca = "Ausente";
                        
                        if (canSetInativo) {
                            status = "Ativo";
                            if (!canCheckIn) {
                                presenca = "Presente";
                            }
                        }
                        
                        if (profDoAluno == 99) {
                            mvwprintw(content_win, line, 2, "%2d | Sem Prof | %s | %s", 
                                     i, status, presenca);
                        } else {
                            mvwprintw(content_win, line, 2, "%2d |    %2d    | %s | %s", 
                                     i, profDoAluno, status, presenca);
                        }
                        line++;
                        displayed++;
                    }
                }
            }
        }
        
        if (displayed < count) {
            mvwprintw(content_win, line, 2, "... e mais %d aluno(s)", count - displayed);
        }
    } else {
        mvwprintw(content_win, 2, 2, "Nenhum aluno cadastrado.");
    }
    
    wrefresh(content_win);
    wait_for_key();
}

void submenu_update_aluno_prof() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    int prof_id = get_number_input("Novo ID do Professor", 0, 98);
    if (prof_id == -1) return;
    
    bool canUpdate;
    Gym__canUpdateAlunoProf(aluno_id, prof_id, &canUpdate);
    
    if (canUpdate) {
        Gym__updateAlunoProf(aluno_id, prof_id);
        show_message("Professor do aluno atualizado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel atualizar o professor!", 1);
    }
    wait_for_key();
}

void submenu_update_pagamento() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    bool canUpdate;
    Gym__canUpdatePagamento(aluno_id, &canUpdate);
    
    if (canUpdate) {
        Gym__updatePagamento(aluno_id);
        show_message("Pagamento atualizado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel atualizar o pagamento!", 1);
    }
    wait_for_key();
}

void submenu_set_aluno_inativo() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    bool canSet;
    Gym__canSetAlunoInativo(aluno_id, &canSet);
    
    if (canSet) {
        Gym__setAlunoInativo(aluno_id);
        show_message("Aluno marcado como inativo!", 0);
    } else {
        show_message("Erro: Nao eh possivel tornar o aluno inativo!", 1);
    }
    wait_for_key();
}

void submenu_checkin() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    bool canCheck;
    Gym__canCheckIn(aluno_id, &canCheck);
    
    if (canCheck) {
        Gym__checkIn(aluno_id);
        show_message("Check-in realizado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel fazer check-in!", 1);
    }
    wait_for_key();
}

void submenu_checkout() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    bool canCheck;
    Gym__canCheckOut(aluno_id, &canCheck);
    
    if (canCheck) {
        Gym__checkOut(aluno_id);
        show_message("Check-out realizado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel fazer check-out!", 1);
    }
    wait_for_key();
}

// Implementacao dos submenus de treino
void submenu_add_treino_prof() {
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int prof_id = get_number_input("ID do Professor", 0, 98);
    if (prof_id == -1) return;
    
    bool canAdd;
    Gym__canAddTreinoProf(treino_id, prof_id, &canAdd);
    
    if (canAdd) {
        Gym__addTreinoProf(treino_id, prof_id);
        show_message("Treino adicionado ao professor com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel adicionar treino ao professor!", 1);
    }
    wait_for_key();
}

void submenu_add_treino_aluno() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int dia = get_number_input("Dia da semana (0-6)", 0, 6);
    if (dia == -1) return;
    
    bool canAdd;
    Gym__canAddTreinoAluno(aluno_id, treino_id, dia, &canAdd);
    
    if (canAdd) {
        Gym__addTreinoAluno(aluno_id, treino_id, dia);
        show_message("Treino adicionado ao aluno com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel adicionar treino ao aluno!", 1);
    }
    wait_for_key();
}

void submenu_del_treino_aluno() {
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    int dia = get_number_input("Dia da semana (0-6)", 0, 6);
    if (dia == -1) return;
    
    bool canDel;
    Gym__canDeleteTreinoAluno(treino_id, aluno_id, dia, &canDel);
    
    if (canDel) {
        Gym__deleteTreinoAluno(treino_id, aluno_id, dia);
        show_message("Treino removido do aluno com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel remover treino do aluno!", 1);
    }
    wait_for_key();
}

void submenu_list_treinos() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " LISTA DE TREINOS ");
    
    mvwprintw(content_win, 2, 2, "Treinos cadastrados:");
    mvwprintw(content_win, 3, 2, "ID | Professor | Alunos Associados");
    mvwprintw(content_win, 4, 2, "---+----------+------------------");
    
    int line = 5;
    int treinosEncontrados = 0;
    
    // Percorrer todos os IDs possíveis de treinos
    for (int t = 0; t < 99 && line < 18; t++) {
        bool canAdd;
        Gym__canAddTreinoProf(t, 1, &canAdd); // Tenta com professor 1
        
        // Se não pode adicionar com nenhum professor, é porque treino já existe
        bool treinoExiste = false;
        int profDoTreino = 99;
        
        for (int p = 0; p < 99 && !treinoExiste; p++) {
            Gym__canAddTreinoProf(t, p, &canAdd);
            if (!canAdd) {
                // Verificar se é porque treino já existe ou professor não existe
                bool profExiste;
                Gym__canAddProf(p, &profExiste);
                if (!profExiste) { // Professor existe, então treino também existe
                    treinoExiste = true;
                    profDoTreino = p;
                }
            }
        }
        
        if (treinoExiste) {
            treinosEncontrados++;
            
            // Contar quantos alunos têm este treino
            int alunosComTreino = 0;
            for (int a = 0; a < 99; a++) {
                for (int d = 0; d < 7; d++) {
                    bool canDel;
                    Gym__canDeleteTreinoAluno(t, a, d, &canDel);
                    if (canDel) { // Se pode deletar, é porque existe
                        alunosComTreino++;
                        break; // Contar aluno apenas uma vez
                    }
                }
            }
            
            mvwprintw(content_win, line, 2, "%2d |    %2d    | %d aluno(s)", 
                     t, profDoTreino, alunosComTreino);
            line++;
        }
    }
    
    if (treinosEncontrados == 0) {
        mvwprintw(content_win, 5, 2, "Nenhum treino cadastrado.");
    } else {
        mvwprintw(content_win, line + 1, 2, "Total de treinos: %d", treinosEncontrados);
    }
    
    wrefresh(content_win);
    wait_for_key();
}

void submenu_update_dia_treino() {
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    int dia_anterior = get_number_input("Dia anterior (0-6)", 0, 6);
    if (dia_anterior == -1) return;
    
    int dia_novo = get_number_input("Novo dia (0-6)", 0, 6);
    if (dia_novo == -1) return;
    
    bool canUpdate;
    Gym__canUpdateDiaTreino(treino_id, aluno_id, dia_anterior, dia_novo, &canUpdate);
    
    if (canUpdate) {
        Gym__updateDiaTreino(treino_id, aluno_id, dia_anterior, dia_novo);
        show_message("Dia do treino atualizado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel atualizar dia do treino!", 1);
    }
    wait_for_key();
}

// Implementacao dos submenus de exercicio
void submenu_add_exercicio() {
    int exercicio_id = get_number_input("ID do Exercicio", 0, 98);
    if (exercicio_id == -1) return;
    
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int series = get_number_input("Numero de series", 0, 5);
    if (series == -1) return;
    
    int repeticoes = get_number_input("Numero de repeticoes", 0, 20);
    if (repeticoes == -1) return;
    
    bool canAdd;
    Gym__canAddExercicioTreino(exercicio_id, treino_id, series, repeticoes, &canAdd);
    
    if (canAdd) {
        Gym__addExercicioTreino(exercicio_id, treino_id, series, repeticoes);
        show_message("Exercicio adicionado ao treino com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel adicionar exercicio ao treino!", 1);
    }
    wait_for_key();
}

void submenu_del_exercicio() {
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int exercicio_id = get_number_input("ID do Exercicio", 0, 98);
    if (exercicio_id == -1) return;
    
    int series = get_number_input("Numero de series", 0, 5);
    if (series == -1) return;
    
    int repeticoes = get_number_input("Numero de repeticoes", 0, 20);
    if (repeticoes == -1) return;
    
    bool canDel;
    Gym__canDeleteExercicioTreino(treino_id, exercicio_id, series, repeticoes, &canDel);
    
    if (canDel) {
        Gym__deleteExercicioTreino(treino_id, exercicio_id, series, repeticoes);
        show_message("Exercicio removido do treino com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel remover exercicio do treino!", 1);
    }
    wait_for_key();
}

void submenu_list_exercicios() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " LISTA DE EXERCICIOS ");
    
    mvwprintw(content_win, 2, 2, "Exercicios cadastrados:");
    mvwprintw(content_win, 3, 2, "ID | Treino | Series | Repeticoes");
    mvwprintw(content_win, 4, 2, "---+--------+--------+-----------");
    
    int line = 5;
    int exerciciosEncontrados = 0;
    
    // Percorrer todos os exercícios, treinos, séries e repetições possíveis
    for (int e = 0; e < 99 && line < 16; e++) {
        for (int t = 0; t < 99 && line < 16; t++) {
            for (int s = 0; s <= 5 && line < 16; s++) {
                for (int r = 0; r <= 20 && line < 16; r++) {
                    bool canDel;
                    Gym__canDeleteExercicioTreino(t, e, s, r, &canDel);
                    if (canDel) { // Se pode deletar, é porque existe
                        mvwprintw(content_win, line, 2, "%2d |   %2d   |   %d    |    %2d", 
                                 e, t, s, r);
                        line++;
                        exerciciosEncontrados++;
                    }
                }
            }
        }
    }
    
    if (exerciciosEncontrados == 0) {
        mvwprintw(content_win, 5, 2, "Nenhum exercicio cadastrado.");
    } else {
        mvwprintw(content_win, line + 1, 2, "Total de exercicios: %d", exerciciosEncontrados);
        
        if (line >= 16 && exerciciosEncontrados > (line - 5)) {
            mvwprintw(content_win, line, 2, "... (lista truncada, muitos exercicios)");
        }
    }
    
    wrefresh(content_win);
    wait_for_key();
}

void submenu_update_exercicio() {
    int treino_id = get_number_input("ID do Treino", 0, 98);
    if (treino_id == -1) return;
    
    int exercicio_id = get_number_input("ID do Exercicio", 0, 98);
    if (exercicio_id == -1) return;
    
    int novas_series = get_number_input("Novas series", 0, 5);
    if (novas_series == -1) return;
    
    int novas_repeticoes = get_number_input("Novas repeticoes", 0, 20);
    if (novas_repeticoes == -1) return;
    
    bool canUpdate;
    Gym__canUpdateExercicioTreino(treino_id, exercicio_id, novas_series, novas_repeticoes, &canUpdate);
    
    if (canUpdate) {
        Gym__updateExercicioTreino(treino_id, exercicio_id, novas_series, novas_repeticoes);
        show_message("Exercicio atualizado com sucesso!", 0);
    } else {
        show_message("Erro: Nao eh possivel atualizar exercicio!", 1);
    }
    wait_for_key();
}

// Implementacao dos submenus de consulta
void submenu_qtd_alunos() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " QUANTIDADE DE ALUNOS ");
    
    bool canConsult;
    Gym__canQuantidadeAlunos(&canConsult);
    
    if (canConsult) {
        int32_t count;
        Gym__quantidadeAlunos(&count);
        mvwprintw(content_win, 2, 2, "Total de alunos cadastrados: %d", count);
    } else {
        mvwprintw(content_win, 2, 2, "Nenhum aluno cadastrado no sistema.");
    }
    
    wrefresh(content_win);
    wait_for_key();
}

void submenu_qtd_professores() {
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " QUANTIDADE DE PROFESSORES ");
    
    bool canConsult;
    Gym__canQuantidadeProfessores(&canConsult);
    
    if (canConsult) {
        int32_t count;
        Gym__quantidadeProfessores(&count);
        mvwprintw(content_win, 2, 2, "Total de professores cadastrados: %d", count);
    } else {
        mvwprintw(content_win, 2, 2, "Nenhum professor cadastrado no sistema.");
    }
    
    wrefresh(content_win);
    wait_for_key();
}

void submenu_alunos_por_prof() {
    int prof_id = get_number_input("ID do Professor", 0, 98);
    if (prof_id == -1) return;
    
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " ALUNOS POR PROFESSOR ");
    
    bool canConsult;
    Gym__canAlunosPorProf(prof_id, &canConsult);
    
    if (canConsult) {
        int32_t count;
        Gym__alunosPorProf(prof_id, &count);
        mvwprintw(content_win, 2, 2, "Professor %d tem %d alunos.", prof_id, count);
    } else {
        mvwprintw(content_win, 2, 2, "Professor nao encontrado ou sem alunos.");
    }
    
    wrefresh(content_win);
    wait_for_key();
}

void submenu_aluno_de_professor() {
    int aluno_id = get_number_input("ID do Aluno", 0, 98);
    if (aluno_id == -1) return;
    
    int prof_id = get_number_input("ID do Professor", 0, 98);
    if (prof_id == -1) return;
    
    wclear(content_win);
    box(content_win, 0, 0);
    mvwprintw(content_win, 0, 2, " VERIFICAR ALUNO-PROFESSOR ");
    
    bool canConsult;
    Gym__canAlunoDeProfessor(aluno_id, prof_id, &canConsult);
    
    if (canConsult) {
        bool resultado;
        Gym__alunoDeProfessor(aluno_id, prof_id, &resultado);
        if (resultado) {
            mvwprintw(content_win, 2, 2, "Sim, aluno %d pertence ao professor %d.", aluno_id, prof_id);
        } else {
            mvwprintw(content_win, 2, 2, "Nao, aluno %d nao pertence ao professor %d.", aluno_id, prof_id);
        }
    } else {
        mvwprintw(content_win, 2, 2, "Aluno ou professor nao encontrado.");
    }
    
    wrefresh(content_win);
    wait_for_key();
}

int main() {
    // Inicializar sistema
    Gym__INITIALISATION();
    
    // Inicializar interface
    init_interface();
    
    // Menu principal
    int key;
    int main_highlight = 0;  // Variável local para o menu principal
    n_choices = sizeof(main_menu) / sizeof(MenuItem);
    
    // Mostrar instrucoes iniciais
    clear_content();
    mvwprintw(content_win, 2, 2, "Bem-vindo ao Sistema de Gerenciamento de Academia!");
    mvwprintw(content_win, 4, 2, "Use as setas para navegar");
    mvwprintw(content_win, 5, 2, "Pressione ENTER para selecionar");
    mvwprintw(content_win, 6, 2, "Pressione ESC para voltar");
    wrefresh(content_win);
    
    while (1) {
        highlight = main_highlight;  // Definir highlight global
        draw_menu_items(main_menu, n_choices);
        
        key = getch();
        switch (key) {
            case KEY_UP:
                main_highlight = (main_highlight == 0) ? n_choices - 1 : main_highlight - 1;
                break;
            case KEY_DOWN:
                main_highlight = (main_highlight == n_choices - 1) ? 0 : main_highlight + 1;
                break;
            case 10: // Enter
                if (main_menu[main_highlight].function) {
                    main_menu[main_highlight].function();
                    // Após retornar do submenu, redesenhar o menu principal
                    highlight = main_highlight;
                    draw_menu_items(main_menu, n_choices);
                    // Limpar área de conteúdo e mostrar instruções novamente
                    clear_content();
                    mvwprintw(content_win, 2, 2, "Bem-vindo ao Sistema de Gerenciamento de Academia!");
                    mvwprintw(content_win, 4, 2, "Use as setas para navegar");
                    mvwprintw(content_win, 5, 2, "Pressione ENTER para selecionar");
                    mvwprintw(content_win, 6, 2, "Pressione ESC para voltar");
                    wrefresh(content_win);
                }
                break;
            case 27: // ESC
                menu_sair();
                break;
        }
    }
    
    cleanup_interface();
    return 0;
}
