#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "Gym.h"

// Contador de testes
int tests_passed = 0;
int tests_total = 0;

// Macros para facilitar os testes
#define TEST_START(name) \
    printf("Executando teste: %s\n", name);

#define TEST_ASSERT(condition, message) \
    tests_total++; \
    if (condition) { \
        printf("  PASSOU: %s\n", message); \
        tests_passed++; \
    } else { \
        printf("  FALHOU: %s\n", message); \
    }

#define TEST_END() printf("\n");

void reset_system() {
    Gym__INITIALISATION();
}

void test_professor_operations() {
    reset_system();
    TEST_START("Operacoes de Professor");
    
    bool canAdd, canDel;
    int32_t profCount;
    
    // Teste 1: Verificar se pode adicionar professor valido
    Gym__canAddProf(1, &canAdd);
    TEST_ASSERT(canAdd == true, "Pode adicionar professor 1");
    
    // Teste 2: Adicionar professor
    Gym__addProf(1);
    Gym__canAddProf(1, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar professor 1 novamente");
    
    // Teste 3: Verificar quantidade de professores
    Gym__quantidadeProfessores(&profCount);
    TEST_ASSERT(profCount == 1, "Quantidade de professores eh 1");
    
    // Teste 4: Tentar adicionar professor invalido (99)
    Gym__canAddProf(99, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar professor 99 (invalido)");
    
    // Teste 5: Adicionar segundo professor
    Gym__addProf(2);
    Gym__quantidadeProfessores(&profCount);
    TEST_ASSERT(profCount == 2, "Quantidade de professores eh 2");
    
    // Teste 6: Verificar se pode deletar professor (deve ter mais de 1)
    Gym__canDeleteProf(1, &canDel);
    TEST_ASSERT(canDel == true, "Pode deletar professor 1");
    
    // Teste 7: Deletar um professor
    Gym__deleteProf(2);
    Gym__quantidadeProfessores(&profCount);
    TEST_ASSERT(profCount == 1, "Quantidade de professores eh 1 apos delecao");
    
    // Teste 8: Nao pode deletar ultimo professor
    Gym__canDeleteProf(1, &canDel);
    TEST_ASSERT(canDel == false, "Nao pode deletar ultimo professor");
    
    TEST_END();
}

void test_aluno_operations() {
    reset_system();
    TEST_START("Operacoes de Aluno");
    
    bool canAdd, canDel, canUpdate;
    int32_t alunoCount, alunosPorProf;
    bool resposta;
    
    // Setup: adicionar professores
    Gym__addProf(1);
    Gym__addProf(2);
    
    // Teste 1: Verificar se pode adicionar aluno
    Gym__canAddAluno(10, 1, &canAdd);
    TEST_ASSERT(canAdd == true, "Pode adicionar aluno 10 ao professor 1");
    
    // Teste 2: Adicionar aluno
    Gym__addAluno(10, 1);
    Gym__quantidadeAlunos(&alunoCount);
    TEST_ASSERT(alunoCount == 1, "Quantidade de alunos eh 1");
    
    // Teste 3: Verificar alunos por professor
    Gym__alunosPorProf(1, &alunosPorProf);
    TEST_ASSERT(alunosPorProf == 1, "Professor 1 tem 1 aluno");
    
    // Teste 4: Verificar se aluno pertence ao professor
    Gym__alunoDeProfessor(10, 1, &resposta);
    TEST_ASSERT(resposta == true, "Aluno 10 pertence ao professor 1");
    
    Gym__alunoDeProfessor(10, 2, &resposta);
    TEST_ASSERT(resposta == false, "Aluno 10 nao pertence ao professor 2");
    
    // Teste 5: Nao pode adicionar aluno novamente
    Gym__canAddAluno(10, 1, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar aluno 10 novamente");
    
    // Teste 6: Nao pode adicionar aluno a professor inexistente
    Gym__canAddAluno(11, 99, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar aluno a professor inexistente");
    
    // Teste 7: Atualizar professor do aluno
    Gym__canUpdateAlunoProf(10, 2, &canUpdate);
    TEST_ASSERT(canUpdate == true, "Pode atualizar professor do aluno 10");
    
    Gym__updateAlunoProf(10, 2);
    Gym__alunoDeProfessor(10, 2, &resposta);
    TEST_ASSERT(resposta == true, "Aluno 10 agora pertence ao professor 2");
    
    // Teste 8: Tornar aluno inativo
    Gym__setAlunoInativo(10);
    Gym__canDeleteAluno(10, &canDel);
    TEST_ASSERT(canDel == true, "Pode deletar aluno inativo");
    
    // Teste 9: Deletar aluno
    Gym__deleteAluno(10);
    Gym__quantidadeAlunos(&alunoCount);
    TEST_ASSERT(alunoCount == 0, "Quantidade de alunos eh 0 apos delecao");
    
    TEST_END();
}

void test_pagamento_operations() {
    reset_system();
    TEST_START("Operacoes de Pagamento");
    
    bool canUpdate;
    
    // Setup
    Gym__addProf(1);
    Gym__addAluno(10, 1);
    
    // Teste 1: Tornar aluno inativo
    Gym__setAlunoInativo(10);
    
    // Teste 2: Verificar se pode atualizar pagamento
    Gym__canUpdatePagamento(10, &canUpdate);
    TEST_ASSERT(canUpdate == true, "Pode atualizar pagamento de aluno inativo");
    
    // Teste 3: Atualizar pagamento
    Gym__updatePagamento(10);
    Gym__canUpdatePagamento(10, &canUpdate);
    TEST_ASSERT(canUpdate == false, "Nao pode atualizar pagamento de aluno ativo");
    
    TEST_END();
}

void test_checkin_checkout() {
    reset_system();
    TEST_START("Operacoes de Check-in/Check-out");
    
    bool canCheck;
    
    // Setup
    Gym__addProf(1);
    Gym__addAluno(10, 1);
    
    // Teste 1: Check-in de aluno ativo
    Gym__canCheckIn(10, &canCheck);
    TEST_ASSERT(canCheck == true, "Pode fazer check-in de aluno ativo");
    
    Gym__checkIn(10);
    Gym__canCheckIn(10, &canCheck);
    TEST_ASSERT(canCheck == false, "Nao pode fazer check-in de aluno presente");
    
    // Teste 2: Check-out de aluno presente
    Gym__canCheckOut(10, &canCheck);
    TEST_ASSERT(canCheck == true, "Pode fazer check-out de aluno presente");
    
    Gym__checkOut(10);
    Gym__canCheckOut(10, &canCheck);
    TEST_ASSERT(canCheck == false, "Nao pode fazer check-out de aluno ausente");
    
    // Teste 3: Aluno inativo nao pode fazer check-in
    Gym__setAlunoInativo(10);
    Gym__canCheckIn(10, &canCheck);
    TEST_ASSERT(canCheck == false, "Aluno inativo nao pode fazer check-in");
    
    TEST_END();
}

void test_treino_operations() {
    reset_system();
    TEST_START("Operacoes de Treino");
    
    bool canAdd, canDel, canUpdate;
    
    // Setup
    Gym__addProf(1);
    Gym__addAluno(10, 1);
    
    // Teste 1: Adicionar treino para professor
    Gym__canAddTreinoProf(1, 1, &canAdd);
    TEST_ASSERT(canAdd == true, "Pode adicionar treino 1 para professor 1");
    
    Gym__addTreinoProf(1, 1);
    Gym__canAddTreinoProf(1, 1, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar treino 1 novamente");
    
    // Teste 2: Adicionar treino para aluno
    Gym__canAddTreinoAluno(10, 1, 1, &canAdd); // dia 1 (segunda)
    TEST_ASSERT(canAdd == true, "Pode adicionar treino 1 para aluno 10 no dia 1");
    
    Gym__addTreinoAluno(10, 1, 1);
    Gym__canAddTreinoAluno(10, 1, 1, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar mesmo treino no mesmo dia");
    
    // Teste 3: Deletar treino do aluno
    Gym__canDeleteTreinoAluno(1, 10, 1, &canDel);
    TEST_ASSERT(canDel == true, "Pode deletar treino 1 do aluno 10 no dia 1");
    
    Gym__deleteTreinoAluno(1, 10, 1);
    Gym__canDeleteTreinoAluno(1, 10, 1, &canDel);
    TEST_ASSERT(canDel == false, "Nao pode deletar treino inexistente");
    
    // Teste 4: Atualizar dia do treino
    Gym__addTreinoAluno(10, 1, 1);
    Gym__canUpdateDiaTreino(1, 10, 1, 2, &canUpdate);
    TEST_ASSERT(canUpdate == true, "Pode atualizar dia do treino");
    
    Gym__updateDiaTreino(1, 10, 1, 2);
    Gym__canDeleteTreinoAluno(1, 10, 2, &canDel);
    TEST_ASSERT(canDel == true, "Treino foi movido para dia 2");
    
    TEST_END();
}

void test_exercicio_operations() {
    reset_system();
    TEST_START("Operacoes de Exercicio");
    
    bool canAdd, canDel, canUpdate;
    
    // Setup
    Gym__addProf(1);
    Gym__addTreinoProf(1, 1);
    
    // Teste 1: Adicionar exercicio ao treino
    Gym__canAddExercicioTreino(1, 1, 3, 10, &canAdd); // 3 series, 10 repeticoes
    TEST_ASSERT(canAdd == true, "Pode adicionar exercicio 1 ao treino 1");
    
    Gym__addExercicioTreino(1, 1, 3, 10);
    Gym__canAddExercicioTreino(1, 1, 4, 12, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar mesmo exercicio com parametros diferentes");
    
    // Teste 2: Deletar exercicio do treino
    Gym__canDeleteExercicioTreino(1, 1, 3, 10, &canDel);
    TEST_ASSERT(canDel == true, "Pode deletar exercicio 1 do treino 1");
    
    Gym__deleteExercicioTreino(1, 1, 3, 10);
    Gym__canDeleteExercicioTreino(1, 1, 3, 10, &canDel);
    TEST_ASSERT(canDel == false, "Nao pode deletar exercicio inexistente");
    
    // Teste 3: Atualizar exercicio no treino
    Gym__addExercicioTreino(1, 1, 3, 10);
    Gym__canUpdateExercicioTreino(1, 1, 4, 12, &canUpdate);
    TEST_ASSERT(canUpdate == true, "Pode atualizar exercicio existente");
    
    Gym__updateExercicioTreino(1, 1, 4, 12);
    Gym__canDeleteExercicioTreino(1, 1, 4, 12, &canDel);
    TEST_ASSERT(canDel == true, "Exercicio foi atualizado");
    
    TEST_END();
}

void test_edge_cases() {
    reset_system();
    TEST_START("Casos Extremos e Validacoes");
    
    bool canAdd, canConsult;
    int32_t count;
    
    // Teste 1: Operacoes com IDs invalidos (99)
    Gym__canAddProf(99, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar professor com ID 99");
    
    Gym__canAddAluno(99, 1, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar aluno com ID 99");
    
    // Teste 2: Consultas sem dados
    Gym__canQuantidadeAlunos(&canConsult);
    TEST_ASSERT(canConsult == false, "Nao pode consultar quantidade sem alunos");
    
    Gym__canQuantidadeProfessores(&canConsult);
    TEST_ASSERT(canConsult == false, "Nao pode consultar quantidade sem professores");
    
    // Teste 3: Adicionar dados e testar consultas
    Gym__addProf(1);
    Gym__addAluno(10, 1);
    
    Gym__canQuantidadeAlunos(&canConsult);
    TEST_ASSERT(canConsult == true, "Pode consultar quantidade com alunos");
    
    Gym__canQuantidadeProfessores(&canConsult);
    TEST_ASSERT(canConsult == true, "Pode consultar quantidade com professores");
    
    Gym__canAlunosPorProf(1, &canConsult);
    TEST_ASSERT(canConsult == true, "Pode consultar alunos por professor");
    
    // Teste 4: Limites de arrays
    Gym__canAddExercicioTreino(1, 1, 6, 21, &canAdd); // Limites maximos
    TEST_ASSERT(canAdd == false, "Nao pode adicionar exercicio com series/repeticoes no limite");
    
    Gym__canAddExercicioTreino(1, 1, 5, 20, &canAdd); // Valores validos
    Gym__addTreinoProf(1, 1);
    Gym__canAddExercicioTreino(1, 1, 5, 20, &canAdd);
    TEST_ASSERT(canAdd == true, "Pode adicionar exercicio com valores validos");
    
    TEST_END();
}

void test_complex_scenarios() {
    reset_system();
    TEST_START("Cenarios Complexos");
    
    bool canAdd, canDel, canUpdate;
    int32_t count;
    bool resposta;
    
    // Cenario 1: Professor com multiplos alunos e treinos
    Gym__addProf(1);
    Gym__addProf(2);
    
    // Adicionar alunos
    Gym__addAluno(10, 1);
    Gym__addAluno(11, 1);
    Gym__addAluno(12, 2);
    
    Gym__alunosPorProf(1, &count);
    TEST_ASSERT(count == 2, "Professor 1 tem 2 alunos");
    
    Gym__alunosPorProf(2, &count);
    TEST_ASSERT(count == 1, "Professor 2 tem 1 aluno");
    
    // Cenario 2: Treino com multiplos exercicios
    Gym__addTreinoProf(1, 1);
    Gym__addExercicioTreino(1, 1, 3, 10); // Exercicio 1
    Gym__addExercicioTreino(2, 1, 4, 12); // Exercicio 2
    Gym__addExercicioTreino(3, 1, 5, 8);  // Exercicio 3
    
    // Verificar se nao pode adicionar exercicio ja existente
    Gym__canAddExercicioTreino(1, 1, 2, 15, &canAdd);
    TEST_ASSERT(canAdd == false, "Nao pode adicionar exercicio 1 novamente no treino");
    
    // Cenario 3: Deletar professor com alunos e treinos
    Gym__deleteProf(1);
    
    // Verificar se alunos ficaram sem professor
    Gym__alunoDeProfessor(10, 99, &resposta); // 99 = sem professor
    TEST_ASSERT(resposta == true, "Aluno 10 ficou sem professor apos delecao");
    
    TEST_END();
}

int main() {
    printf("=== INICIANDO TESTES AUTOMATIZADOS DO SISTEMA GYM ===\n\n");
    
    // Executar todos os testes
    test_professor_operations();
    test_aluno_operations();
    test_pagamento_operations();
    test_checkin_checkout();
    test_treino_operations();
    test_exercicio_operations();
    test_edge_cases();
    test_complex_scenarios();
    
    // Relatorio final
    printf("=== RELATORIO FINAL DOS TESTES ===\n");
    printf("Testes executados: %d\n", tests_total);
    printf("Testes aprovados: %d\n", tests_passed);
    printf("Testes falharam: %d\n", tests_total - tests_passed);
    printf("Taxa de sucesso: %.2f%%\n", (float)tests_passed / tests_total * 100);
    
    if (tests_passed == tests_total) {
        printf("\nTODOS OS TESTES PASSARAM! Sistema funcionando corretamente.\n");
        return 0;
    } else {
        printf("\nALGUNS TESTES FALHARAM! Verifique o codigo.\n");
        return 1;
    }
}
