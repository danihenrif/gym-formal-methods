#ifndef _Gym_h
#define _Gym_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define Gym__ALUNO__max 99
#define Gym__PROF__max 99
#define Gym__TREINO__max 99
#define Gym__EXERCICIO__max 99
/* Clause SETS */
typedef int Gym__ALUNO;
typedef int Gym__PROF;
typedef int Gym__TREINO;
typedef int Gym__EXERCICIO;
typedef enum
{
    Gym__ativo,
    Gym__inativo
    
} Gym__STATUS;
#define Gym__STATUS__max 2
typedef enum
{
    Gym__presente,
    Gym__ausente
    
} Gym__PRESENTE;
#define Gym__PRESENTE__max 2

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
typedef int Gym__DIA;
typedef int Gym__SERIES;
typedef int Gym__REPETICOES;
/* Array and record constants */




/* Clause CONCRETE_VARIABLES */

extern void Gym__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Gym__addProf(Gym__PROF pp);
extern void Gym__addAluno(Gym__ALUNO aa, Gym__PROF pp);
extern void Gym__addTreinoProf(Gym__TREINO tt, Gym__PROF pp);
extern void Gym__addTreinoAluno(Gym__ALUNO aa, Gym__TREINO tt, int32_t dd);
extern void Gym__addExercicioTreino(Gym__EXERCICIO ex, Gym__TREINO tt, int32_t ss, int32_t rp);
extern void Gym__deleteProf(Gym__PROF pp);
extern void Gym__deleteAluno(Gym__ALUNO aa);
extern void Gym__deleteTreinoAluno(Gym__TREINO tt, Gym__ALUNO aa, int32_t dd);
extern void Gym__deleteExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t ss, int32_t rp);
extern void Gym__updateAlunoProf(Gym__ALUNO aa, Gym__PROF pp);
extern void Gym__updatePagamento(Gym__ALUNO aa);
extern void Gym__setAlunoInativo(Gym__ALUNO aa);
extern void Gym__updateDiaTreino(Gym__TREINO tt, Gym__ALUNO aa, int32_t ddAnterior, int32_t ddNovo);
extern void Gym__updateExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t newSs, int32_t newRp);
extern void Gym__checkIn(Gym__ALUNO aa);
extern void Gym__checkOut(Gym__ALUNO aa);
extern void Gym__quantidadeAlunos(int32_t *aa);
extern void Gym__quantidadeProfessores(int32_t *pp);
extern void Gym__alunosPorProf(Gym__PROF pp, int32_t *ap);
extern void Gym__alunoDeProfessor(Gym__ALUNO aa, Gym__PROF pp, bool *resp);
extern void Gym__canAddProf(Gym__PROF pp, bool *canAdd);
extern void Gym__canDeleteProf(Gym__PROF pp, bool *canDel);
extern void Gym__canAddAluno(Gym__ALUNO aa, Gym__PROF pp, bool *canAdd);
extern void Gym__canDeleteAluno(Gym__ALUNO aa, bool *canDel);
extern void Gym__canAddTreinoProf(Gym__TREINO tt, Gym__PROF pp, bool *canAdd);
extern void Gym__canAddTreinoAluno(Gym__ALUNO aa, Gym__TREINO tt, int32_t dd, bool *canAdd);
extern void Gym__canAddExercicioTreino(Gym__EXERCICIO ex, Gym__TREINO tt, int32_t ss, int32_t rp, bool *canAdd);
extern void Gym__canDeleteTreinoAluno(Gym__TREINO tt, Gym__ALUNO aa, int32_t dd, bool *canDel);
extern void Gym__canDeleteExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t ss, int32_t rp, bool *canDel);
extern void Gym__canUpdateAlunoProf(Gym__ALUNO aa, Gym__PROF pp, bool *canUpdate);
extern void Gym__canUpdatePagamento(Gym__ALUNO aa, bool *canUpdate);
extern void Gym__canSetAlunoInativo(Gym__ALUNO aa, bool *canSet);
extern void Gym__canUpdateDiaTreino(Gym__TREINO tt, Gym__ALUNO aa, int32_t ddAnterior, int32_t ddNovo, bool *canUpdate);
extern void Gym__canUpdateExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t newSs, int32_t newRp, bool *canUpdate);
extern void Gym__canCheckIn(Gym__ALUNO aa, bool *canCheck);
extern void Gym__canCheckOut(Gym__ALUNO aa, bool *canCheck);
extern void Gym__canQuantidadeAlunos(bool *canConsult);
extern void Gym__canQuantidadeProfessores(bool *canConsult);
extern void Gym__canAlunosPorProf(Gym__PROF pp, bool *canConsult);
extern void Gym__canAlunoDeProfessor(Gym__ALUNO aa, Gym__PROF pp, bool *canConsult);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Gym_h */
