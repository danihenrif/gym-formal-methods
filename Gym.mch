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

    //se tem o mesmo treino tem q ter o mesmo prof
    & !(al1, al2, dd1, dd2) . 
    (al1:aluno & al2 : aluno & dd1:dia & dd2:dia & al1 /= al2 & 
    (al1,dd1) : ran(treinoAluno) & 
    (al2,dd2):ran(treinoAluno) & 
    treinoAluno~[{al1|->dd1}] = treinoAluno~[{al2|->dd2}]  
    => alunoProf[{al1}] = alunoProf[{al2}])

    & !(tt, aa, dd).(tt: treino & aa : aluno & dd: dia & (tt |-> (aa, dd)) : treinoAluno => treinoProf(tt) = alunoProf(aa))



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
     
addTreinoProf(tt,pp) = 
    PRE 
        pp : prof
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
        & (tt |-> (aa, dd)) /: treinoAluno //o treino nao existe
        & treinoProf[{tt}] = alunoProf[{aa}]
    THEN 
        treinoAluno := treinoAluno \/ {tt |-> (aa,dd)} 
    END;

changeDiaTreino(tt, aa, ddAnterior, ddNovo) =
    PRE 
        tt : treino 
        & aa : aluno 
        & ddAnterior : dia 
        & ddNovo : dia 
        & ddAnterior /= ddNovo 
        & (tt |-> (aa, ddAnterior)) : treinoAluno //o treino com a data antiga deve existir
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

cancelarMatricula(aa) =
    PRE
        aa : aluno
        & alunoStatus[{aa}] = {ativo}
        & alunoStatus \/ {aa |-> inativo} : aluno \/ {aa} --> STATUS
        & alunoStatus \/ {aa |-> inativo} : aluno --> STATUS
    THEN
        alunoStatus := alunoStatus \/ {aa |-> inativo}
    END;

    
aa <-- consultarAlunos(pp) = 
    PRE 
        pp : PROF 
        & alunoProf~[{pp}] /= {}
    THEN 
        aa := alunoProf~[{pp}]
    END;
    
tt <-- consultarTreinosPorAlunoEDia(aa, dd) =
    PRE
        aa: aluno
        & dd: dia
        & treinoAluno~[{aa |-> dd}] /= {}
    THEN
        tt := treinoAluno~[{aa |-> dd}]
    END;
    
tt <-- consultarTreinosPorAluno(aa) =
    PRE
        aa: aluno
        & treinoAluno~[{aa} * dia] /= {}
    THEN
        tt := treinoAluno~[{aa} * dia]
    END;
    
aa <-- consultarAlunosSemTreino = 
    BEGIN 
        aa := aluno - dom(ran(treinoAluno))
    END


END