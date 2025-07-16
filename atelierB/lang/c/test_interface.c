#include <ncurses.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "Gym.h"

// Teste rápido da interface para verificar se o header está funcionando
int main() {
    // Inicializar sistema
    Gym__INITIALISATION();
    
    // Inicializar ncurses
    initscr();
    clear();
    noecho();
    cbreak();
    curs_set(0);
    
    // Inicializar cores
    start_color();
    init_pair(1, COLOR_WHITE, COLOR_BLACK);
    init_pair(2, COLOR_BLACK, COLOR_YELLOW);
    
    // Criar janelas
    int height, width;
    getmaxyx(stdscr, height, width);
    
    // Header ocupa 3 linhas no topo
    WINDOW *header_win = newwin(3, width, 0, 0);
    WINDOW *menu_win = newwin(height - 6, 25, 3, 0);
    WINDOW *content_win = newwin(height - 6, width - 25, 3, 25);
    WINDOW *status_win = newwin(3, width, height - 3, 0);
    
    // Configurar bordas
    box(header_win, 0, 0);
    box(menu_win, 0, 0);
    box(content_win, 0, 0);
    box(status_win, 0, 0);
    
    // Header com destaque
    wattron(header_win, COLOR_PAIR(2));
    mvwprintw(header_win, 1, (width - 22) / 2, "GYM - Metodos Formais");
    wattroff(header_win, COLOR_PAIR(2));
    
    // Titulos
    mvwprintw(menu_win, 0, 2, " MENU ");
    mvwprintw(content_win, 0, 2, " SISTEMA GYM ");
    mvwprintw(status_win, 0, 2, " STATUS ");
    
    // Mensagem de teste
    mvwprintw(content_win, 2, 2, "Interface inicializada com sucesso!");
    mvwprintw(content_win, 3, 2, "Header 'GYM - Metodos Formais' adicionado.");
    mvwprintw(content_win, 4, 2, "Pressione qualquer tecla para sair...");
    
    refresh();
    wrefresh(header_win);
    wrefresh(menu_win);
    wrefresh(content_win);
    wrefresh(status_win);
    
    // Aguardar tecla
    getch();
    
    // Limpar
    delwin(header_win);
    delwin(menu_win);
    delwin(content_win);
    delwin(status_win);
    endwin();
    
    printf("Teste da interface concluido com sucesso!\n");
    printf("Header 'GYM - Metodos Formais' funcionando corretamente.\n");
    
    return 0;
}
