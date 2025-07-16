/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Gym.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool Gym__aluno_i[100];
static bool Gym__prof_i[100];
static bool Gym__treino_i[100];
static bool Gym__exercicio_i[100];
static int32_t Gym__alunoProf_i[100];
static int32_t Gym__treinoProf_i[100];
static bool Gym__treinoAluno_i[100][100][7];
static bool Gym__treinoExercicio_i[100][100][6][21];
static Gym__STATUS Gym__alunoStatus_i[100];
static Gym__PRESENTE Gym__alunoPresente_i[100];
/* Clause INITIALISATION */
void Gym__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= 99;i++)
    {
        Gym__aluno_i[i] = false;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__prof_i[i] = false;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__treino_i[i] = false;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__exercicio_i[i] = false;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__alunoProf_i[i] = 99;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__treinoProf_i[i] = 99;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__alunoStatus_i[i] = Gym__inativo;
    }
    for(i = 0; i <= 99;i++)
    {
        Gym__alunoPresente_i[i] = Gym__ausente;
    }
    {
        int32_t ii;
        int32_t jj;
        int32_t kk;
        
        ii = 0;
        while((ii) < (100))
        {
            jj = 0;
            while((jj) < (100))
            {
                kk = 0;
                while((kk) < (7))
                {
                    Gym__treinoAluno_i[ii][jj][kk] = false;
                    kk = kk+1;
                }
                jj = jj+1;
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        int32_t jj;
        int32_t kk;
        int32_t ll;
        
        ii = 0;
        while((ii) < (100))
        {
            jj = 0;
            while((jj) < (100))
            {
                kk = 0;
                while((kk) < (6))
                {
                    ll = 0;
                    while((ll) < (21))
                    {
                        Gym__treinoExercicio_i[ii][jj][kk][ll] = false;
                        ll = ll+1;
                    }
                    kk = kk+1;
                }
                jj = jj+1;
            }
            ii = ii+1;
        }
    }
}

/* Clause OPERATIONS */

void Gym__addProf(Gym__PROF pp)
{
    Gym__prof_i[pp] = true;
}

void Gym__addAluno(Gym__ALUNO aa, Gym__PROF pp)
{
    Gym__aluno_i[aa] = true;
    Gym__alunoProf_i[aa] = pp;
    Gym__alunoStatus_i[aa] = Gym__ativo;
    Gym__alunoPresente_i[aa] = Gym__ausente;
}

void Gym__addTreinoProf(Gym__TREINO tt, Gym__PROF pp)
{
    Gym__treino_i[tt] = true;
    Gym__treinoProf_i[tt] = pp;
}

void Gym__addTreinoAluno(Gym__ALUNO aa, Gym__TREINO tt, int32_t dd)
{
    Gym__treinoAluno_i[tt][aa][dd] = true;
}

void Gym__addExercicioTreino(Gym__EXERCICIO ex, Gym__TREINO tt, int32_t ss, int32_t rp)
{
    Gym__treinoExercicio_i[tt][ex][ss][rp] = true;
    Gym__exercicio_i[ex] = true;
}

void Gym__deleteProf(Gym__PROF pp)
{
    {
        int32_t alunoTemp;
        int32_t profAtual;
        int32_t treinoTemp;
        
        alunoTemp = 0;
        while((alunoTemp) < (100))
        {
            profAtual = Gym__alunoProf_i[alunoTemp];
            if(profAtual == pp)
            {
                Gym__alunoProf_i[alunoTemp] = 99;
            }
            else
            {
                ;
            }
            alunoTemp = alunoTemp+1;
        }
        treinoTemp = 0;
        while((treinoTemp) < (100))
        {
            profAtual = Gym__treinoProf_i[treinoTemp];
            if(profAtual == pp)
            {
                Gym__treinoProf_i[treinoTemp] = 99;
            }
            else
            {
                ;
            }
            treinoTemp = treinoTemp+1;
        }
    }
    Gym__prof_i[pp] = false;
}

void Gym__deleteAluno(Gym__ALUNO aa)
{
    {
        int32_t treinoTemp;
        int32_t diaTemp;
        
        treinoTemp = 0;
        while((treinoTemp) < (100))
        {
            diaTemp = 0;
            while((diaTemp) < (7))
            {
                Gym__treinoAluno_i[treinoTemp][aa][diaTemp] = false;
                diaTemp = diaTemp+1;
            }
            treinoTemp = treinoTemp+1;
        }
    }
    Gym__alunoStatus_i[aa] = Gym__inativo;
    Gym__alunoPresente_i[aa] = Gym__ausente;
    Gym__alunoProf_i[aa] = 99;
    Gym__aluno_i[aa] = false;
}

void Gym__deleteTreinoAluno(Gym__TREINO tt, Gym__ALUNO aa, int32_t dd)
{
    Gym__treinoAluno_i[tt][aa][dd] = false;
}

void Gym__deleteExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t ss, int32_t rp)
{
    Gym__treinoExercicio_i[tt][ex][ss][rp] = false;
}

void Gym__updateAlunoProf(Gym__ALUNO aa, Gym__PROF pp)
{
    {
        int32_t treinoTemp;
        int32_t diaTemp;
        
        treinoTemp = 0;
        while((treinoTemp) < (100))
        {
            diaTemp = 0;
            while((diaTemp) < (7))
            {
                Gym__treinoAluno_i[treinoTemp][aa][diaTemp] = false;
                diaTemp = diaTemp+1;
            }
            treinoTemp = treinoTemp+1;
        }
    }
    Gym__alunoProf_i[aa] = pp;
}

void Gym__updatePagamento(Gym__ALUNO aa)
{
    Gym__alunoStatus_i[aa] = Gym__ativo;
}

void Gym__setAlunoInativo(Gym__ALUNO aa)
{
    Gym__alunoStatus_i[aa] = Gym__inativo;
}

void Gym__updateDiaTreino(Gym__TREINO tt, Gym__ALUNO aa, int32_t ddAnterior, int32_t ddNovo)
{
    Gym__treinoAluno_i[tt][aa][ddAnterior] = false;
    Gym__treinoAluno_i[tt][aa][ddNovo] = true;
}

void Gym__updateExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t newSs, int32_t newRp)
{
    {
        int32_t ss;
        int32_t rp;
        bool tempTreinoExercicio;
        
        ss = 0;
        while((ss) <= (5))
        {
            rp = 0;
            while((rp) <= (20))
            {
                tempTreinoExercicio = Gym__treinoExercicio_i[tt][ex][ss][rp];
                if(tempTreinoExercicio == true)
                {
                    Gym__treinoExercicio_i[tt][ex][ss][rp] = false;
                }
                else
                {
                    ;
                }
                rp = rp+1;
            }
            ss = ss+1;
        }
    }
    Gym__treinoExercicio_i[tt][ex][newSs][newRp] = true;
}

void Gym__checkIn(Gym__ALUNO aa)
{
    Gym__alunoPresente_i[aa] = Gym__presente;
}

void Gym__checkOut(Gym__ALUNO aa)
{
    Gym__alunoPresente_i[aa] = Gym__ausente;
}

void Gym__quantidadeAlunos(int32_t *aa)
{
    {
        int32_t alunoCount;
        int32_t ii;
        bool alunoAtual;
        
        alunoCount = 0;
        ii = 0;
        while((ii) < (99))
        {
            alunoAtual = Gym__aluno_i[ii];
            if(alunoAtual == true)
            {
                alunoCount = alunoCount+1;
            }
            ii = ii+1;
        }
        (*aa) = alunoCount;
    }
}

void Gym__quantidadeProfessores(int32_t *pp)
{
    {
        int32_t ii;
        bool professorAtual;
        int32_t professorCount;
        
        ii = 0;
        professorCount = 0;
        while((ii) < (99))
        {
            professorAtual = Gym__prof_i[ii];
            if(professorAtual == true)
            {
                professorCount = professorCount+1;
            }
            ii = ii+1;
        }
        (*pp) = professorCount;
    }
}

void Gym__alunosPorProf(Gym__PROF pp, int32_t *ap)
{
    {
        int32_t ii;
        int32_t alunoCount;
        int32_t profAtual;
        
        ii = 0;
        alunoCount = 0;
        while((ii) < (99))
        {
            profAtual = Gym__alunoProf_i[ii];
            if(profAtual == pp)
            {
                alunoCount = alunoCount+1;
            }
            ii = ii+1;
        }
        (*ap) = alunoCount;
    }
}

void Gym__alunoDeProfessor(Gym__ALUNO aa, Gym__PROF pp, bool *resp)
{
    {
        int32_t ap;
        
        ap = Gym__alunoProf_i[aa];
        if(ap == pp)
        {
            (*resp) = true;
        }
        else
        {
            (*resp) = false;
        }
    }
}

void Gym__canAddProf(Gym__PROF pp, bool *canAdd)
{
    {
        bool profAtual;
        
        profAtual = Gym__prof_i[pp];
        if(((pp) != (99)) &&
        (profAtual == false))
        {
            (*canAdd) = true;
        }
        else
        {
            (*canAdd) = false;
        }
    }
}

void Gym__canDeleteProf(Gym__PROF pp, bool *canDel)
{
    {
        bool profAtual;
        int32_t ii;
        int32_t profCount;
        bool verificarProf;
        
        profAtual = Gym__prof_i[pp];
        profCount = 0;
        ii = 0;
        while((ii) < (99))
        {
            verificarProf = Gym__prof_i[ii];
            if(verificarProf == true)
            {
                profCount = profCount+1;
            }
            ii = ii+1;
        }
        if((((pp) != (99)) &&
            (profAtual == true)) &&
        ((profCount) > (1)))
        {
            (*canDel) = true;
        }
        else
        {
            (*canDel) = false;
        }
    }
}

void Gym__canAddAluno(Gym__ALUNO aa, Gym__PROF pp, bool *canAdd)
{
    {
        bool alunoAtual;
        bool profAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        profAtual = Gym__prof_i[pp];
        if(((((aa) != (99)) &&
                ((pp) != (99))) &&
            (alunoAtual == false)) &&
        (profAtual == true))
        {
            (*canAdd) = true;
        }
        else
        {
            (*canAdd) = false;
        }
    }
}

void Gym__canDeleteAluno(Gym__ALUNO aa, bool *canDel)
{
    {
        bool alunoAtual;
        Gym__STATUS statusAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        statusAtual = Gym__alunoStatus_i[aa];
        if((((aa) != (99)) &&
            (alunoAtual == true)) &&
        (statusAtual == Gym__inativo))
        {
            (*canDel) = true;
        }
        else
        {
            (*canDel) = false;
        }
    }
}

void Gym__canAddTreinoProf(Gym__TREINO tt, Gym__PROF pp, bool *canAdd)
{
    {
        bool treinoAtual;
        bool profAtual;
        
        treinoAtual = Gym__treino_i[tt];
        profAtual = Gym__prof_i[pp];
        if(((((tt) != (99)) &&
                ((pp) != (99))) &&
            (treinoAtual == false)) &&
        (profAtual == true))
        {
            (*canAdd) = true;
        }
        else
        {
            (*canAdd) = false;
        }
    }
}

void Gym__canAddTreinoAluno(Gym__ALUNO aa, Gym__TREINO tt, int32_t dd, bool *canAdd)
{
    {
        bool alunoAtual;
        bool treinoAtual;
        Gym__STATUS statusAtual;
        int32_t profTreino;
        int32_t profAluno;
        bool treinoJaExiste;
        
        alunoAtual = Gym__aluno_i[aa];
        treinoAtual = Gym__treino_i[tt];
        statusAtual = Gym__alunoStatus_i[aa];
        profTreino = Gym__treinoProf_i[tt];
        profAluno = Gym__alunoProf_i[aa];
        treinoJaExiste = Gym__treinoAluno_i[tt][aa][dd];
        if((((((((aa) != (99)) &&
                            ((tt) != (99))) &&
                        (alunoAtual == true)) &&
                    (treinoAtual == true)) &&
                (statusAtual == Gym__ativo)) &&
            (profTreino == profAluno)) &&
        (treinoJaExiste == false))
        {
            (*canAdd) = true;
        }
        else
        {
            (*canAdd) = false;
        }
    }
}

void Gym__canAddExercicioTreino(Gym__EXERCICIO ex, Gym__TREINO tt, int32_t ss, int32_t rp, bool *canAdd)
{
    {
        bool treinoAtual;
        bool exercicioJaExiste;
        int32_t ss0;
        int32_t rp0;
        bool verificarTreino;
        
        treinoAtual = Gym__treino_i[tt];
        exercicioJaExiste = false;
        ss0 = 0;
        while(((ss0) <= (5)) &&
        (exercicioJaExiste == false))
        {
            rp0 = 0;
            while(((rp0) <= (20)) &&
            (exercicioJaExiste == false))
            {
                verificarTreino = Gym__treinoExercicio_i[tt][ex][ss0][rp0];
                if(verificarTreino == true)
                {
                    exercicioJaExiste = true;
                }
                rp0 = rp0+1;
            }
            ss0 = ss0+1;
        }
        if(((((((((ex) != (99)) &&
                                ((tt) != (99))) &&
                            (treinoAtual == true)) &&
                        ((ss) >= (0))) &&
                    ((ss) <= (5))) &&
                ((rp) >= (0))) &&
            ((rp) <= (20))) &&
        (exercicioJaExiste == false))
        {
            (*canAdd) = true;
        }
        else
        {
            (*canAdd) = false;
        }
    }
}

void Gym__canDeleteTreinoAluno(Gym__TREINO tt, Gym__ALUNO aa, int32_t dd, bool *canDel)
{
    {
        bool treinoAtual;
        bool alunoAtual;
        bool treinoExiste;
        
        treinoAtual = Gym__treino_i[tt];
        alunoAtual = Gym__aluno_i[aa];
        treinoExiste = Gym__treinoAluno_i[tt][aa][dd];
        if((((((tt) != (99)) &&
                    ((aa) != (99))) &&
                (treinoAtual == true)) &&
            (alunoAtual == true)) &&
        (treinoExiste == true))
        {
            (*canDel) = true;
        }
        else
        {
            (*canDel) = false;
        }
    }
}

void Gym__canDeleteExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t ss, int32_t rp, bool *canDel)
{
    {
        bool treinoAtual;
        bool exercicioAtual;
        bool exercicioExiste;
        
        treinoAtual = Gym__treino_i[tt];
        exercicioAtual = Gym__exercicio_i[ex];
        exercicioExiste = Gym__treinoExercicio_i[tt][ex][ss][rp];
        if((((((((((tt) != (99)) &&
                                    ((ex) != (99))) &&
                                (treinoAtual == true)) &&
                            (exercicioAtual == true)) &&
                        ((ss) >= (0))) &&
                    ((ss) <= (5))) &&
                ((rp) >= (0))) &&
            ((rp) <= (20))) &&
        (exercicioExiste == true))
        {
            (*canDel) = true;
        }
        else
        {
            (*canDel) = false;
        }
    }
}

void Gym__canUpdateAlunoProf(Gym__ALUNO aa, Gym__PROF pp, bool *canUpdate)
{
    {
        bool alunoAtual;
        bool profAtual;
        Gym__STATUS statusAtual;
        int32_t profAlunoAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        profAtual = Gym__prof_i[pp];
        statusAtual = Gym__alunoStatus_i[aa];
        profAlunoAtual = Gym__alunoProf_i[aa];
        if(((((((aa) != (99)) &&
                        ((pp) != (99))) &&
                    (alunoAtual == true)) &&
                (profAtual == true)) &&
            (statusAtual == Gym__ativo)) &&
        ((profAlunoAtual) != (pp)))
        {
            (*canUpdate) = true;
        }
        else
        {
            (*canUpdate) = false;
        }
    }
}

void Gym__canUpdatePagamento(Gym__ALUNO aa, bool *canUpdate)
{
    {
        bool alunoAtual;
        Gym__STATUS statusAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        statusAtual = Gym__alunoStatus_i[aa];
        if((((aa) != (99)) &&
            (alunoAtual == true)) &&
        (statusAtual == Gym__inativo))
        {
            (*canUpdate) = true;
        }
        else
        {
            (*canUpdate) = false;
        }
    }
}

void Gym__canSetAlunoInativo(Gym__ALUNO aa, bool *canSet)
{
    {
        bool alunoAtual;
        Gym__STATUS statusAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        statusAtual = Gym__alunoStatus_i[aa];
        if((((aa) != (99)) &&
            (alunoAtual == true)) &&
        (statusAtual == Gym__ativo))
        {
            (*canSet) = true;
        }
        else
        {
            (*canSet) = false;
        }
    }
}

void Gym__canUpdateDiaTreino(Gym__TREINO tt, Gym__ALUNO aa, int32_t ddAnterior, int32_t ddNovo, bool *canUpdate)
{
    {
        bool treinoAtual;
        bool alunoAtual;
        Gym__STATUS statusAtual;
        bool treinoExiste;
        
        treinoAtual = Gym__treino_i[tt];
        alunoAtual = Gym__aluno_i[aa];
        statusAtual = Gym__alunoStatus_i[aa];
        treinoExiste = Gym__treinoAluno_i[tt][aa][ddAnterior];
        if((((((((tt) != (99)) &&
                            ((aa) != (99))) &&
                        (treinoAtual == true)) &&
                    (alunoAtual == true)) &&
                (statusAtual == Gym__ativo)) &&
            ((ddAnterior) != (ddNovo))) &&
        (treinoExiste == true))
        {
            (*canUpdate) = true;
        }
        else
        {
            (*canUpdate) = false;
        }
    }
}

void Gym__canUpdateExercicioTreino(Gym__TREINO tt, Gym__EXERCICIO ex, int32_t newSs, int32_t newRp, bool *canUpdate)
{
    {
        bool treinoAtual;
        bool exercicioAtual;
        bool exercicioJaExiste;
        int32_t ss0;
        int32_t rp0;
        bool verificarTreinoExercicio;
        
        treinoAtual = Gym__treino_i[tt];
        exercicioAtual = Gym__exercicio_i[ex];
        exercicioJaExiste = false;
        ss0 = 0;
        while(((ss0) <= (5)) &&
        (exercicioJaExiste == false))
        {
            rp0 = 0;
            while(((rp0) <= (20)) &&
            (exercicioJaExiste == false))
            {
                verificarTreinoExercicio = Gym__treinoExercicio_i[tt][ex][ss0][rp0];
                if(verificarTreinoExercicio == true)
                {
                    exercicioJaExiste = true;
                }
                rp0 = rp0+1;
            }
            ss0 = ss0+1;
        }
        if((((((((((tt) != (99)) &&
                                    ((ex) != (99))) &&
                                (treinoAtual == true)) &&
                            (exercicioAtual == true)) &&
                        ((newSs) >= (0))) &&
                    ((newSs) <= (5))) &&
                ((newRp) >= (0))) &&
            ((newRp) <= (20))) &&
        (exercicioJaExiste == true))
        {
            (*canUpdate) = true;
        }
        else
        {
            (*canUpdate) = false;
        }
    }
}

void Gym__canCheckIn(Gym__ALUNO aa, bool *canCheck)
{
    {
        bool alunoAtual;
        Gym__STATUS statusAtual;
        Gym__PRESENTE presenteAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        statusAtual = Gym__alunoStatus_i[aa];
        presenteAtual = Gym__alunoPresente_i[aa];
        if(((((aa) != (99)) &&
                (alunoAtual == true)) &&
            (statusAtual == Gym__ativo)) &&
        (presenteAtual == Gym__ausente))
        {
            (*canCheck) = true;
        }
        else
        {
            (*canCheck) = false;
        }
    }
}

void Gym__canCheckOut(Gym__ALUNO aa, bool *canCheck)
{
    {
        bool alunoAtual;
        Gym__PRESENTE presenteAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        presenteAtual = Gym__alunoPresente_i[aa];
        if((((aa) != (99)) &&
            (alunoAtual == true)) &&
        (presenteAtual == Gym__presente))
        {
            (*canCheck) = true;
        }
        else
        {
            (*canCheck) = false;
        }
    }
}

void Gym__canQuantidadeAlunos(bool *canConsult)
{
    {
        int32_t ii;
        bool temAlunos;
        bool verificarAluno;
        
        temAlunos = false;
        ii = 0;
        while(((ii) < (99)) &&
        (temAlunos == false))
        {
            verificarAluno = Gym__aluno_i[ii];
            if(verificarAluno == true)
            {
                temAlunos = true;
            }
            ii = ii+1;
        }
        (*canConsult) = temAlunos;
    }
}

void Gym__canQuantidadeProfessores(bool *canConsult)
{
    {
        int32_t ii;
        bool temProfs;
        bool verificarProf;
        
        temProfs = false;
        ii = 0;
        while(((ii) < (99)) &&
        (temProfs == false))
        {
            verificarProf = Gym__prof_i[ii];
            if(verificarProf == true)
            {
                temProfs = true;
            }
            ii = ii+1;
        }
        (*canConsult) = temProfs;
    }
}

void Gym__canAlunosPorProf(Gym__PROF pp, bool *canConsult)
{
    {
        bool profAtual;
        int32_t ii;
        bool temAlunos;
        int32_t verificarAlunoProf;
        bool verificarAluno;
        
        profAtual = Gym__prof_i[pp];
        temAlunos = false;
        ii = 0;
        while(((ii) < (99)) &&
        (temAlunos == false))
        {
            verificarAlunoProf = Gym__alunoProf_i[ii];
            verificarAluno = Gym__aluno_i[ii];
            if((verificarAlunoProf == pp) &&
            (verificarAluno == true))
            {
                temAlunos = true;
            }
            ii = ii+1;
        }
        if((((pp) != (99)) &&
            (profAtual == true)) &&
        (temAlunos == true))
        {
            (*canConsult) = true;
        }
        else
        {
            (*canConsult) = false;
        }
    }
}

void Gym__canAlunoDeProfessor(Gym__ALUNO aa, Gym__PROF pp, bool *canConsult)
{
    {
        bool alunoAtual;
        bool profAtual;
        
        alunoAtual = Gym__aluno_i[aa];
        profAtual = Gym__prof_i[pp];
        if(((((aa) != (99)) &&
                ((pp) != (99))) &&
            (alunoAtual == true)) &&
        (profAtual == true))
        {
            (*canConsult) = true;
        }
        else
        {
            (*canConsult) = false;
        }
    }
}

