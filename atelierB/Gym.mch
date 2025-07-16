MACHINE Gym

SETS
ALUNO;
PROF;
TREINO;
EXERCICIO;
STATUS = {ativo, inativo};
PRESENTE = {presente, ausente}

CONSTANTS
DIA,
SERIES,
REPETICOES

PROPERTIES
DIA = 0..6
& SERIES = 0..5
& REPETICOES = 0..20

VARIABLES
aluno,
prof,
treino,
exercicio,
alunoProf,
treinoProf,
treinoAluno,
treinoExercicio,
alunoStatus,
alunoPresente

INVARIANT
    aluno <: ALUNO
    & prof <: PROF
    & treino <: TREINO
    & exercicio <: EXERCICIO
    & alunoProf : aluno --> prof
    & alunoStatus : aluno --> STATUS 
    & treinoProf : treino --> prof
    & treinoAluno : treino <-> aluno * DIA 
    & treinoExercicio : treino <-> exercicio * SERIES * REPETICOES 
    & alunoPresente : aluno --> PRESENTE
//    & alunoPlano : aluno --> PLANO
//    & alunoVencimento : aluno --> NAT
//    & diaAtual : NAT

    & alunoPresente~[{presente}] /\ alunoStatus~[{inativo}] = {}

    // Alunos ativos devem ter vencimento futuro
//    & !(aa).(aa : aluno & alunoStatus(aa) = ativo => alunoVencimento(aa) >= diaAtual)

    // Se dois alunos diferentes possuem exatamente o mesmo treino, então esses alunos devem estar associados ao mesmo professor.
    & !(al1, al2, dd1, dd2) . 
    (al1:aluno & al2 : aluno & dd1:DIA & dd2:DIA & al1 /= al2 & 
    (al1,dd1) : ran(treinoAluno) & 
    (al2,dd2):ran(treinoAluno) & 
    treinoAluno~[{al1|->dd1}] = treinoAluno~[{al2|->dd2}]  
    => alunoProf[{al1}] = alunoProf[{al2}])

    // O professor associado ao treino tt deve ser o mesmo professor associado ao aluno aa
    & !(tt, aa, dd).(tt: treino & aa : aluno & dd: DIA 
    & (tt |-> (aa, dd)) : treinoAluno =>
    treinoProf(tt) = alunoProf(aa))
    
    // Um exercício só pode estar presente no máximo uma vez em cada treino
    & !(tt, ex, ss1, ss2, rp1, rp2).(tt: treino & ex: exercicio & 
       ss1: SERIES & ss2: SERIES & 
       rp1: REPETICOES & rp2: REPETICOES & 
       (tt |-> (ex, ss1, rp1)) : treinoExercicio & 
       (tt |-> (ex, ss2, rp2)) : treinoExercicio => 
       (ss1 = ss2 & rp1 = rp2))

INITIALISATION
alunoProf:={}
|| treinoProf:={}
|| treinoAluno:={}
|| alunoStatus:={}
|| treinoExercicio:={}
|| aluno:={}
|| prof:={}
|| treino:={}
|| exercicio:={}
|| alunoPresente:={}

OPERATIONS

/*-------------------------------- ADICIONAR --------------------------------*/

addProf(pp) =
    PRE
        pp : PROF
        & pp /: prof
    THEN
        prof := prof \/ {pp}
    END;

addAluno(aa,pp) =
    PRE
        aa : ALUNO
        & pp : PROF
        & pp : prof
        & aa /: dom(alunoProf)
        & aa /: dom(alunoStatus)
        & alunoPresente \/ {aa |-> ausente} : aluno \/ {aa} --> PRESENTE
        & (alunoPresente \/ {aa |-> ausente})~[{presente}] /\ (alunoStatus \/ {aa |-> ativo})~[{inativo}] = {}
    THEN
        alunoProf := alunoProf \/ {aa |-> pp}
        || aluno := aluno \/ {aa}
        || alunoStatus := alunoStatus \/ {aa |-> ativo}
        || alunoPresente := alunoPresente \/ {aa |-> ausente}
    END;

addTreinoProf(tt,pp) = 
    PRE 
        pp : PROF
        & pp : prof
        & tt : TREINO
        & tt /: dom(treinoProf)
    THEN 
        treinoProf := treinoProf \/ {tt |-> pp}
        || treino := treino \/ {tt}
    END;
    
addTreinoAluno(aa,tt,dd) = 
    PRE 
        aa : ALUNO
        & tt : TREINO
        & aa : aluno 
        & tt : treino 
        & dd : DIA 
        & (tt |-> (aa, dd)) /: treinoAluno
        & treinoProf[{tt}] = alunoProf[{aa}]
        & alunoStatus(aa) /= inativo
    THEN 
        treinoAluno := treinoAluno \/ {tt |-> (aa,dd)} 
    END;

addExercicioTreino(ex,tt,ss,rp) =
    PRE 
        ex : EXERCICIO 
        & tt : TREINO
        & tt : treino 
        & ss : SERIES 
        & rp : REPETICOES
        & not(#(ss0,rp0).(ss0 : SERIES & rp0 : REPETICOES & (tt |-> (ex, ss0, rp0)) : treinoExercicio))
    THEN 
        treinoExercicio := treinoExercicio \/ {tt |-> (ex,ss,rp)}
        || exercicio:= exercicio \/ {ex}
    END;
    

/*-------------------------------- ADICIONAR --------------------------------*/

/*-------------------------------- EXCLUIR --------------------------------*/
deleteProf(pp) =
    PRE 
        pp: PROF
        & pp: prof 
        & card(prof - {pp}) > 0
    THEN
        ANY newProf WHERE
            newProf: prof & newProf /= pp
        THEN
            alunoProf := alunoProf <+ (alunoProf~[{pp}] * {newProf})
            || treinoProf := treinoProf <+ (treinoProf~[{pp}] * {newProf})
            || prof := prof - {pp}
        END
    END;


deleteAluno(aa) =
    PRE
        aa : ALUNO
        & aa : aluno
        & alunoStatus[{aa}] = {inativo}
    THEN
        aluno := aluno - {aa}
        || alunoProf := {aa} <<| alunoProf
        || treinoAluno := treinoAluno |>> ({aa} * DIA)
        || alunoStatus := {aa} <<| alunoStatus
        || alunoPresente := {aa} <<| alunoPresente
    END;

deleteTreinoAluno(tt, aa, dd) =
    PRE
        aa : ALUNO
        & tt : TREINO
        & tt: treino
        & aa: aluno
        & dd: DIA
        & (tt |-> (aa, dd)) : treinoAluno
    THEN
        treinoAluno := treinoAluno - {tt |-> (aa, dd)}
    END;

deleteExercicioTreino(tt, ex, ss, rp) =
    PRE
        tt : TREINO
        & tt : treino
        & ex : EXERCICIO
        & ex : exercicio
        & ss : SERIES 
        & rp : REPETICOES
        & (tt |-> (ex, ss, rp)) : treinoExercicio
    THEN
        treinoExercicio := treinoExercicio - {tt |-> (ex, ss, rp)}
    END;
/*-------------------------------- EXCLUIR --------------------------------*/

/*-------------------------------- ATUALIZAR ------------------------------*/
    
updateAlunoProf(aa, pp) =
    PRE
        aa: ALUNO
        & pp : PROF
        & aa: aluno
        & pp: prof
        & alunoStatus[{aa}] = {ativo}
        & alunoProf[{aa}] /= {pp}
    THEN
        treinoAluno := treinoAluno |>> ({aa} * DIA)
        || alunoProf := alunoProf <+ {aa |-> pp}
    END;

updatePagamento(aa) =
    PRE
        aa: ALUNO
        & aa: aluno
        & alunoStatus[{aa}] = {inativo}
    THEN
        alunoStatus := alunoStatus <+ {aa |-> ativo}
    END;

setAlunoInativo(aa) =
    PRE
        aa : ALUNO
        & aa : aluno
        & alunoStatus[{aa}] = {ativo}
    THEN
        alunoStatus := alunoStatus <+ {aa |-> inativo}
    END;
        
updateDiaTreino(tt, aa, ddAnterior, ddNovo) =
    PRE 
        aa : ALUNO
        & tt : TREINO
        & tt : treino 
        & aa : aluno 
        & ddAnterior : DIA 
        & ddNovo : DIA 
        & ddAnterior /= ddNovo 
        & (tt |-> (aa, ddAnterior)) : treinoAluno
        & alunoStatus[{aa}] = {ativo}
    THEN 
        treinoAluno := (treinoAluno - {tt |-> (aa, ddAnterior)}) \/ {tt |-> (aa, ddNovo)}
    END;
      
updateExercicioTreino(tt, ex, newSs, newRp) =
    PRE
        tt : TREINO
        & ex : EXERCICIO
        & tt : treino
        & ex : exercicio
        & newSs : SERIES
        & newRp : REPETICOES
        & #(oldSs,oldRp).(oldSs : SERIES & oldRp : REPETICOES & (tt |-> (ex,oldSs,oldRp)) : treinoExercicio)
    THEN
        ANY oldSs, oldRp WHERE
            oldSs : SERIES & oldRp : REPETICOES & (tt |-> (ex,oldSs,oldRp)) : treinoExercicio
        THEN
            treinoExercicio := (treinoExercicio - {tt |-> (ex,oldSs,oldRp)}) \/ {tt |-> (ex,newSs,newRp)}
        END
    END;

/*-------------------------------- ATUALIZAR ------------------------------*/


/*----------------------------------- I/O ---------------------------------*/
checkIn(aa) =
    PRE
        aa : ALUNO
        & aa: aluno
        & alunoStatus[{aa}] = {ativo}
        & alunoPresente[{aa}] = {ausente}
    THEN
        alunoPresente := alunoPresente <+ {aa |-> presente}
    END;

checkOut(aa) =
    PRE
        aa : ALUNO
        & aa: aluno
        & alunoPresente[{aa}] = {presente}
    THEN
        alunoPresente := alunoPresente <+ {aa |-> ausente}
    END;
    
    
/*-------------------------------- CONSULTA --------------------------------*/
    
    
aa <-- quantidadeAlunos =
    PRE
        card(aluno) > 0
    THEN
        aa := card(aluno)
    END;
    
pp <-- quantidadeProfessores =
    PRE
        card(prof) > 0
    THEN
        pp := card(prof)
    END;
    
ap <-- alunosPorProf(pp) =
    PRE
        pp: PROF
        & pp: prof
        & card(alunoProf~[{pp}]) > 0
    THEN
        ap := card(alunoProf~[{pp}])
    END;
    
resp <-- alunoDeProfessor(aa, pp) =
    PRE
        aa: ALUNO
        & pp: PROF
        & aa: aluno
        & pp: prof
    THEN
        IF alunoProf(aa) = pp THEN
            resp := TRUE
        ELSE
            resp := FALSE
        END
    END;

/*-------------------------------- CONSULTA --------------------------------*/


/* Operações de Consulta para verificar se operações podem ser chamadas */

canAdd <-- canAddProf(pp) =
    PRE
        pp : PROF
    THEN
        canAdd := bool(pp : PROF & pp /: prof)
    END;

canDel <-- canDeleteProf(pp) =
    PRE
        pp : PROF
    THEN
        canDel := bool(pp : prof & card(prof - {pp}) > 0)
    END;

canAdd <-- canAddAluno(aa, pp) =
    PRE
        aa : ALUNO & pp : PROF
    THEN
        canAdd := bool(aa : ALUNO & pp : prof & aa /: dom(alunoProf) & aa /: dom(alunoStatus) & 
                      (alunoPresente \/ {aa |-> ausente})~[{presente}] /\ (alunoStatus \/ {aa |-> ativo})~[{inativo}] = {})
    END;

canDel <-- canDeleteAluno(aa) =
    PRE
        aa : ALUNO
    THEN
        canDel := bool(aa : aluno & alunoStatus[{aa}] = {inativo})
    END;

canAdd <-- canAddTreinoProf(tt, pp) =
    PRE
        tt : TREINO & pp : PROF
    THEN
        canAdd := bool(pp : prof & tt : TREINO & tt /: dom(treinoProf))
    END;

canAdd <-- canAddTreinoAluno(aa, tt, dd) =
    PRE
        aa : ALUNO & tt : TREINO & dd : DIA
    THEN
        canAdd := bool(aa : aluno & tt : treino & dd : DIA & (tt |-> (aa, dd)) /: treinoAluno & 
                      treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa) /= inativo)
    END;

canAdd <-- canAddExercicioTreino(ex, tt, ss, rp) =
    PRE
        ex : EXERCICIO & tt : TREINO & ss : NAT & rp : NAT
    THEN
        canAdd := bool(ex : EXERCICIO & tt : treino & ss : SERIES & rp : REPETICOES & 
                      not(#(ss0,rp0).(ss0 : SERIES & rp0 : REPETICOES & (tt |-> (ex, ss0, rp0)) : treinoExercicio)))
    END;

canDel <-- canDeleteTreinoAluno(tt, aa, dd) =
    PRE
        tt : TREINO & aa : ALUNO & dd : DIA
    THEN
        canDel := bool(tt : treino & aa : aluno & dd : DIA & (tt |-> (aa, dd)) : treinoAluno)
    END;

canDel <-- canDeleteExercicioTreino(tt, ex, ss, rp) =
    PRE
        tt : TREINO & ex : EXERCICIO & ss : NAT & rp : NAT
    THEN
        canDel := bool(tt : treino & ex : exercicio & ss : SERIES & rp : REPETICOES & 
                      (tt |-> (ex, ss, rp)) : treinoExercicio)
    END;

canUpdate <-- canUpdateAlunoProf(aa, pp) =
    PRE
        aa : ALUNO & pp : PROF
    THEN
        canUpdate := bool(aa : aluno & pp : prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}] /= {pp})
    END;

canUpdate <-- canUpdatePagamento(aa) =
    PRE
        aa : ALUNO
    THEN
        canUpdate := bool(aa : aluno & alunoStatus[{aa}] = {inativo})
    END;

canSet <-- canSetAlunoInativo(aa) =
    PRE
        aa : ALUNO
    THEN
        canSet := bool(aa : aluno & alunoStatus[{aa}] = {ativo})
    END;

canUpdate <-- canUpdateDiaTreino(tt, aa, ddAnterior, ddNovo) =
    PRE
        tt : TREINO & aa : ALUNO & ddAnterior : DIA & ddNovo : DIA
    THEN
        canUpdate := bool(tt : treino & aa : aluno & ddAnterior : DIA & ddNovo : DIA & ddAnterior /= ddNovo & 
                         (tt |-> (aa, ddAnterior)) : treinoAluno & alunoStatus[{aa}] = {ativo})
    END;

canUpdate <-- canUpdateExercicioTreino(tt, ex, newSs, newRp) =
    PRE
        tt : TREINO & ex : EXERCICIO & newSs : NAT & newRp : NAT
    THEN
        canUpdate := bool(tt : treino & ex : exercicio & newSs : SERIES & newRp : REPETICOES & 
                         #(oldSs,oldRp).(oldSs : SERIES & oldRp : REPETICOES & (tt |-> (ex,oldSs,oldRp)) : treinoExercicio))
    END;

canCheck <-- canCheckIn(aa) =
    PRE
        aa : ALUNO
    THEN
        canCheck := bool(aa : aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente})
    END;

canCheck <-- canCheckOut(aa) =
    PRE
        aa : ALUNO
    THEN
        canCheck := bool(aa : aluno & alunoPresente[{aa}] = {presente})
    END;

canConsult <-- canQuantidadeAlunos =
    BEGIN
        canConsult := bool(card(aluno) > 0)
    END;

canConsult <-- canQuantidadeProfessores =
    BEGIN
        canConsult := bool(card(prof) > 0)
    END;

canConsult <-- canAlunosPorProf(pp) =
    PRE
        pp : PROF
    THEN
        canConsult := bool(pp : prof & card(alunoProf~[{pp}]) > 0)
    END;

canConsult <-- canAlunoDeProfessor(aa, pp) =
    PRE
        aa : ALUNO & pp : PROF
    THEN
        canConsult := bool(aa : aluno & pp : prof)
    END

END