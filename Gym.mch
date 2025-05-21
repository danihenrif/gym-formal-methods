 MACHINE Gym

SETS
    ALUNO;
    PROF;
    TREINO;
    EXERCICIO; 
    DIA = {segunda, terca, quarta, quinta, sexta, sabado, domingo};
    STATUS = {ativo, inativo};
    PRESENTE = {presente, ausente}

CONSTANTS
    dia,
    series,
    repeticoes
     
PROPERTIES
    dia <: DIA
    & series = 1..3
    & repeticoes = 1..20

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
    & treino <: TREINO
    & prof <: PROF
    & exercicio <: EXERCICIO
    & alunoProf : aluno --> prof
    & alunoStatus : aluno --> STATUS 
    & treinoProf : treino --> prof
    & treinoAluno : treino <-> aluno * dia 
    & treinoExercicio : treino <-> exercicio * series * repeticoes 
    & alunoPresente : aluno --> PRESENTE

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
    
addProf(pp) = 
    PRE 
        pp : PROF
    THEN
        prof := prof \/ {pp}
    END;

deleteProf(pp) =
    PRE 
        pp: prof
    THEN
        ANY newProf WHERE
            newProf: prof & newProf /= pp
        THEN
            alunoProf := alunoProf <+ (alunoProf~[{pp}] * {newProf})
            || treinoProf := treinoProf <+ (treinoProf~[{pp}] * {newProf})
            || prof := prof - {pp}
        END
    END;

addAluno(aa,pp) = 
    PRE 
        aa : ALUNO 
        & pp : prof 
        & aa /: dom(alunoProf)
        & aa /: dom(alunoStatus)
        & alunoPresente \/ {aa |-> ausente} : aluno \/ {aa} --> PRESENTE
    THEN 
        alunoProf := alunoProf \/ {aa |-> pp}
        || aluno := aluno \/ {aa}
        || alunoStatus := alunoStatus \/ {aa |-> ativo}
        || alunoPresente := alunoPresente \/ {aa |-> ausente}
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

atualizarPagamento(aa) =
    PRE
        aa: aluno
        & alunoStatus[{aa}] = {inativo}
    THEN
        alunoStatus := alunoStatus <+ {aa |-> ativo}
    END;

inativarMatricula(aa) =
    PRE
        aa : aluno
        & alunoStatus[{aa}] = {ativo}
    THEN
        alunoStatus := alunoStatus <+ {aa |-> inativo}
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
        pp : prof & alunoProf~[{pp}] /= {}
    THEN 
        aa := alunoProf~[{pp}] - dom(ran(treinoAluno))
    END;

ss <-- consultarQuantSeriesTreino(tt) =
    PRE
        tt : treino
    THEN
        ss := SIGMA(ex, ss, rr).(ex : exercicio & ss : series & rr : repeticoes & (tt |-> (ex, ss, rr)) : treinoExercicio | ss)
    END

END