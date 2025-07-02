 MACHINE Gym

SETS
    ALUNO;
    PROF;
    TREINO;
    EXERCICIO; 
    DIA = {segunda, terca, quarta, quinta, sexta, sabado, domingo};
    STATUS = {ativo, inativo};
    PRESENTE = {presente, ausente};
    PLANO = {mensal, semestral, anual}

CONSTANTS
    dia,
    series,
    repeticoes,
    duracaoPlano
     
PROPERTIES
    dia <: DIA
    & series = 3..5
    & repeticoes = 10..20
    & duracaoPlano : PLANO --> NAT
    & duracaoPlano = {mensal |-> 31, semestral |-> 186, anual |-> 365}

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
    alunoPresente,
    alunoPlano,
    alunoVencimento,
    diaAtual

INVARIANT
    aluno <: ALUNO
    & prof <: PROF
    & treino <: TREINO
    & exercicio <: EXERCICIO
    & alunoProf : aluno --> prof
    & alunoStatus : aluno --> STATUS 
    & treinoProf : treino --> prof
    & treinoAluno : treino <-> aluno * dia 
    & treinoExercicio : treino <-> exercicio * series * repeticoes 
    & alunoPresente : aluno --> PRESENTE
    & alunoPlano : aluno --> PLANO
    & alunoVencimento : aluno --> NAT
    & diaAtual : NAT

    & alunoPresente~[{presente}] /\ alunoStatus~[{inativo}] = {}

    // Alunos ativos devem ter vencimento futuro
    & !(aa).(aa : aluno & alunoStatus(aa) = ativo => alunoVencimento(aa) >= diaAtual)

    // Se dois alunos diferentes possuem exatamente o mesmo treino, então esses alunos devem estar associados ao mesmo professor.
    & !(al1, al2, dd1, dd2) . 
    (al1:aluno & al2 : aluno & dd1:dia & dd2:dia & al1 /= al2 & 
    (al1,dd1) : ran(treinoAluno) & 
    (al2,dd2):ran(treinoAluno) & 
    treinoAluno~[{al1|->dd1}] = treinoAluno~[{al2|->dd2}]  
    => alunoProf[{al1}] = alunoProf[{al2}])

    // O professor associado ao treino tt deve ser o mesmo professor associado ao aluno aa
    & !(tt, aa, dd).(tt: treino & aa : aluno & dd: dia 
    & (tt |-> (aa, dd)) : treinoAluno =>
    treinoProf(tt) = alunoProf(aa))
    
    // Um exercício só pode estar presente no máximo uma vez em cada treino
    & !(tt, ex, ss1, ss2, rp1, rp2).(tt: treino & ex: exercicio & 
       ss1: series & ss2: series & 
       rp1: repeticoes & rp2: repeticoes & 
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
    || alunoPlano:={}
    || alunoVencimento:={}
    || diaAtual:=0

OPERATIONS
    
addProf(pp) = 
    PRE 
        pp : PROF
        & pp /: prof
    THEN
        prof := prof \/ {pp}
    END;

deleteProf(pp) =
    PRE 
        pp: prof 
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

addAluno(aa,pp,plano) = 
    PRE 
        aa : ALUNO 
        & pp : prof 
        & plano : PLANO
        & aa /: dom(alunoProf)
        & aa /: dom(alunoStatus)
        & alunoPresente \/ {aa |-> ausente} : aluno \/ {aa} --> PRESENTE
        & (alunoPresente \/ {aa |-> ausente})~[{presente}] /\ (alunoStatus \/ {aa |-> ativo})~[{inativo}] = {}
    THEN 
        alunoProf := alunoProf \/ {aa |-> pp}
        || aluno := aluno \/ {aa}
        || alunoStatus := alunoStatus \/ {aa |-> ativo}
        || alunoPresente := alunoPresente \/ {aa |-> ausente}
        || alunoPlano := alunoPlano \/ {aa |-> plano}
        || alunoVencimento := alunoVencimento \/ {aa |-> (diaAtual + duracaoPlano(plano))}
    END;

deleteAluno(aa) =
    PRE
        aa : aluno
        & alunoStatus[{aa}] = {inativo}
    THEN
        aluno := aluno - {aa}
        || alunoProf := {aa} <<| alunoProf
        || treinoAluno := treinoAluno |>> ({aa} * dia)
        || alunoStatus := {aa} <<| alunoStatus
        || alunoPresente := {aa} <<| alunoPresente
        || alunoPlano := {aa} <<| alunoPlano
        || alunoVencimento := {aa} <<| alunoVencimento
    END;

changeAlunoProf(aa, pp) =
    PRE
        aa: aluno
        & pp: prof
        & alunoStatus[{aa}] = {ativo}
        & alunoProf[{aa}] /= {pp}
    THEN
        treinoAluno := treinoAluno |>> ({aa} * dia)
        || alunoProf := alunoProf <+ {aa |-> pp}
    END;
     
addTreinoProf(tt,pp) = 
    PRE pp : prof
        & tt : TREINO
        & tt /: dom(treinoProf)
    THEN 
        treinoProf := treinoProf \/ {tt |-> pp}
        || treino := treino \/ {tt}
    END;

addTreinoAluno(aa,tt,dd) = 
    PRE 
        aa : aluno 
        & tt : treino 
        & dd : dia 
        & (tt |-> (aa, dd)) /: treinoAluno
        & treinoProf[{tt}] = alunoProf[{aa}]
        & alunoStatus(aa) /= inativo
    THEN 
        treinoAluno := treinoAluno \/ {tt |-> (aa,dd)} 
    END;

deleteTreinoAluno(tt, aa, dd) =
    PRE
        tt: treino
        & aa: aluno
        & dd: dia
        & (tt |-> (aa, dd)) : treinoAluno
    THEN
        treinoAluno := treinoAluno - {tt |-> (aa, dd)}
    END;

changeDiaTreino(tt, aa, ddAnterior, ddNovo) =
    PRE 
        tt : treino 
        & aa : aluno 
        & ddAnterior : dia 
        & ddNovo : dia 
        & ddAnterior /= ddNovo 
        & (tt |-> (aa, ddAnterior)) : treinoAluno
        & alunoStatus[{aa}] = {ativo}
    THEN 
        treinoAluno := (treinoAluno - {tt |-> (aa, ddAnterior)}) \/ {tt |-> (aa, ddNovo)}
    END;

addExercicioTreino(ex,tt,ss,rp) =
    PRE 
        ex : EXERCICIO 
        & tt : treino 
        & ss : series 
        & rp : repeticoes
        & not(#(ss0,rp0).(ss0 : series & rp0 : repeticoes & (tt |-> (ex, ss0, rp0)) : treinoExercicio))
    THEN 
        treinoExercicio := treinoExercicio \/ {tt |-> (ex,ss,rp)}
        || exercicio:= exercicio \/ {ex}
    END;

deleteExercicioTreino(tt, ex, ss, rp) =
    PRE
        tt : treino
        & ex : exercicio
        & ss : series 
        & rp : repeticoes
        & (tt |-> (ex, ss, rp)) : treinoExercicio
    THEN
        treinoExercicio := treinoExercicio - {tt |-> (ex, ss, rp)}
    END;

updateExercicioTreino(tt, ex, newSs, newRp) =
    PRE
        tt : treino
        & ex : exercicio
        & newSs : series
        & newRp : repeticoes
        & #(oldSs,oldRp).(oldSs : series & oldRp : repeticoes & (tt |-> (ex,oldSs,oldRp)) : treinoExercicio)
    THEN
        ANY oldSs, oldRp WHERE
            oldSs : series & oldRp : repeticoes & (tt |-> (ex,oldSs,oldRp)) : treinoExercicio
        THEN
            treinoExercicio := (treinoExercicio - {tt |-> (ex,oldSs,oldRp)}) \/ {tt |-> (ex,newSs,newRp)}
        END
    END;

checkIn(aa) =
    PRE
        aa: aluno
        & alunoStatus[{aa}] = {ativo}
        & alunoPresente[{aa}] = {ausente}
        & (alunoPresente <+ {aa |-> presente})~[{presente}] /\ alunoStatus~[{inativo}] = {}
    THEN
        alunoPresente := alunoPresente <+ {aa |-> presente}
    END;

checkOut(aa) =
    PRE
        aa: aluno
        & alunoPresente[{aa}] = {presente}
    THEN
        alunoPresente := alunoPresente <+ {aa |-> ausente}
    END;

atualizarPagamento(aa, novoPlano) =
    PRE
        aa: aluno
        & novoPlano : PLANO
        & alunoStatus[{aa}] = {inativo}
    THEN
        alunoStatus := alunoStatus <+ {aa |-> ativo}
        || alunoPlano := alunoPlano <+ {aa |-> novoPlano}
        || alunoVencimento := alunoVencimento <+ {aa |-> (diaAtual + duracaoPlano(novoPlano))}
    END;

passarDia =
    BEGIN
        diaAtual := diaAtual + 1
        || alunoStatus := alunoStatus <+ ({aa | aa : aluno & alunoVencimento(aa) <= diaAtual} * {inativo})
    END;

renovarPlano(aa, novoPlano) =
    PRE
        aa : aluno
        & novoPlano : PLANO
        & alunoStatus[{aa}] = {ativo}
    THEN
        alunoPlano := alunoPlano <+ {aa |-> novoPlano}
        || alunoVencimento := alunoVencimento <+ {aa |-> (diaAtual + duracaoPlano(novoPlano))}
    END;

aa <-- consultarAlunos(pp) = 
    PRE 
        pp : PROF 
        & alunoProf~[{pp}] /= {}
    THEN 
        aa := alunoProf~[{pp}]
    END;
    
tt <-- consultarTreinosDoDia(aa, dd) =
    PRE
        aa: aluno
        & dd: dia
        & treinoAluno~[{aa |-> dd}] /= {}
    THEN
        tt := treinoAluno~[{aa |-> dd}]
    END;

tt <-- consultarDetalhesTreinosDoDia(aa, dd) =
    PRE
        aa: aluno
        & dd: dia
        & treinoAluno~[{aa |-> dd}] /= {}
        & alunoStatus[{aa}] = {ativo}
    THEN
        tt := treinoExercicio[treinoAluno~[{aa |-> dd}]]
    END;
    
  
tt <-- consultarTreinosPorAluno(aa) =
    PRE
        aa: aluno
        & treinoAluno~[{aa} * dia] /= {}
    THEN
        tt := treinoAluno~[{aa} * dia]
    END;
    
aa <-- consultarAlunosSemTreino = 
    PRE 
        aluno /= {}   
    THEN
        aa := aluno - dom(ran(treinoAluno))
    END;

aa <-- consultarAlunosdeProfSemTreino(pp) = 
    PRE 
        pp : prof 
        & alunoProf~[{pp}] /= {}
    THEN 
        aa := alunoProf~[{pp}] - dom(ran(treinoAluno))
    END;

ss <-- consultarQuantSeriesTreino(tt) =
    PRE
        tt : treino
    THEN
        ss := SIGMA(ex, ss, rr).(ex : exercicio & ss : series & rr : repeticoes & (tt |-> (ex, ss, rr)) : treinoExercicio | ss)
    END;

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
        canDel := bool(pp : prof & #(pp2).(pp2 : prof & pp2 /= pp))
    END;

canAdd <-- canAddAluno(aa, pp, plano) =
    PRE
        aa : ALUNO & pp : PROF & plano : PLANO
    THEN
        canAdd := bool(aa : ALUNO & pp : prof & plano : PLANO & aa /: dom(alunoProf) & aa /: dom(alunoStatus) & 
                      (alunoPresente \/ {aa |-> ausente})~[{presente}] /\ (alunoStatus \/ {aa |-> ativo})~[{inativo}] = {})
    END;

canDel <-- canDeleteAluno(aa) =
    PRE
        aa : ALUNO
    THEN
        canDel := bool(aa : aluno & alunoStatus[{aa}] = {inativo})
    END;

canChange <-- canChangeAlunoProf(aa, pp) =
    PRE
        aa : ALUNO & pp : PROF
    THEN
        canChange := bool(aa : aluno & pp : prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}] /= {pp})
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
        canAdd := bool(aa : aluno & tt : treino & dd : dia & (tt |-> (aa, dd)) /: treinoAluno & 
                      treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa) /= inativo)
    END;

canDel <-- canDeleteTreinoAluno(tt, aa, dd) =
    PRE
        tt : TREINO & aa : ALUNO & dd : DIA
    THEN
        canDel := bool(tt : treino & aa : aluno & dd : dia & (tt |-> (aa, dd)) : treinoAluno)
    END;

canChange <-- canChangeDiaTreino(tt, aa, ddAnterior, ddNovo) =
    PRE
        tt : TREINO & aa : ALUNO & ddAnterior : DIA & ddNovo : DIA
    THEN
        canChange := bool(tt : treino & aa : aluno & ddAnterior : dia & ddNovo : dia & ddAnterior /= ddNovo & 
                         (tt |-> (aa, ddAnterior)) : treinoAluno & alunoStatus[{aa}] = {ativo})
    END;

canAdd <-- canAddExercicioTreino(ex, tt, ss, rp) =
    PRE
        ex : EXERCICIO & tt : TREINO & ss : NAT & rp : NAT
    THEN
        canAdd := bool(ex : EXERCICIO & tt : treino & ss : series & rp : repeticoes & 
                      not(#(ss0,rp0).(ss0 : series & rp0 : repeticoes & (tt |-> (ex, ss0, rp0)) : treinoExercicio)))
    END;

canDel <-- canDeleteExercicioTreino(tt, ex, ss, rp) =
    PRE
        tt : TREINO & ex : EXERCICIO & ss : NAT & rp : NAT
    THEN
        canDel := bool(tt : treino & ex : exercicio & ss : series & rp : repeticoes & 
                      (tt |-> (ex, ss, rp)) : treinoExercicio)
    END;

canUpdate <-- canUpdateExercicioTreino(tt, ex, newSs, newRp) =
    PRE
        tt : TREINO & ex : EXERCICIO & newSs : NAT & newRp : NAT
    THEN
        canUpdate := bool(tt : treino & ex : exercicio & newSs : series & newRp : repeticoes & 
                         #(oldSs,oldRp).(oldSs : series & oldRp : repeticoes & (tt |-> (ex,oldSs,oldRp)) : treinoExercicio))
    END;

canCheck <-- canCheckIn(aa) =
    PRE
        aa : ALUNO
    THEN
        canCheck := bool(aa : aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente} & 
                        (alunoPresente <+ {aa |-> presente})~[{presente}] /\ alunoStatus~[{inativo}] = {})
    END;

canCheck <-- canCheckOut(aa) =
    PRE
        aa : ALUNO
    THEN
        canCheck := bool(aa : aluno & alunoPresente[{aa}] = {presente})
    END;

canUpdate <-- canAtualizarPagamento(aa, novoPlano) =
    PRE
        aa : ALUNO & novoPlano : PLANO
    THEN
        canUpdate := bool(aa : aluno & novoPlano : PLANO & alunoStatus[{aa}] = {inativo})
    END;

canRenov <-- canRenovarPlano(aa, novoPlano) =
    PRE
        aa : ALUNO & novoPlano : PLANO
    THEN
        canRenov := bool(aa : aluno & novoPlano : PLANO & alunoStatus[{aa}] = {ativo})
    END;

canConsult <-- canConsultarAlunos(pp) =
    PRE
        pp : PROF
    THEN
        canConsult := bool(pp : PROF & alunoProf~[{pp}] /= {})
    END;

canConsult <-- canConsultarTreinosDoDia(aa, dd) =
    PRE
        aa : ALUNO & dd : DIA
    THEN
        canConsult := bool(aa : aluno & dd : dia & treinoAluno~[{aa |-> dd}] /= {})
    END;

canConsult <-- canConsultarDetalhesTreinosDoDia(aa, dd) =
    PRE
        aa : ALUNO & dd : DIA
    THEN
        canConsult := bool(aa : aluno & dd : dia & treinoAluno~[{aa |-> dd}] /= {} & alunoStatus[{aa}] = {ativo})
    END;

canConsult <-- canConsultarTreinosPorAluno(aa) =
    PRE
        aa : ALUNO
    THEN
        canConsult := bool(aa : aluno & treinoAluno~[{aa} * dia] /= {})
    END;

canConsult <-- canConsultarAlunosSemTreino =
    BEGIN
        canConsult := bool(aluno /= {})
    END;

canConsult <-- canConsultarAlunosdeProfSemTreino(pp) =
    PRE
        pp : PROF
    THEN
        canConsult := bool(pp : prof & alunoProf~[{pp}] /= {})
    END;

canConsult <-- canConsultarQuantSeriesTreino(tt) =
    PRE
        tt : TREINO
    THEN
        canConsult := bool(tt : treino)
    END;

canConsult <-- canConsultarDiasRestantes(aa) =
    PRE
        aa : ALUNO
    THEN
        canConsult := bool(aa : aluno)
    END;

canConsult <-- canConsultarPlanoAluno(aa) =
    PRE
        aa : ALUNO
    THEN
        canConsult := bool(aa : aluno)
    END;

canConsult <-- canConsultarAlunosVencendoEm(dias) =
    PRE
        dias : NAT
    THEN
        canConsult := bool(dias : NAT)
    END;

canConsult <-- canConsultarVencimentoAluno(aa) =
    PRE
        aa : ALUNO
    THEN
        canConsult := bool(aa : aluno)
    END

END