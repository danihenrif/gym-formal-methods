 MACHINE Gym

SETS
    ALUNO; PROF; TREINO ; EXERCICIO; 
    DIA = {se,te,qua,qui,sex,sa,do};
    STATUS = {atv, intv} 

CONSTANTS
    dia,series,reps
     
PROPERTIES
    dia <: DIA &
    series = 1..3 &
    reps = 1..20

VARIABLES  
    alunode, treinoprof, treinoaluno, treinoex, alunostatus,
    aluno, prof, treino, exercicio

INVARIANT
    aluno <: ALUNO &
    treino <: TREINO &
    prof <: PROF &
    exercicio <: EXERCICIO &

    alunode :          aluno --> prof &
    alunostatus :      aluno --> STATUS & 
    treinoprof :       treino --> prof &
    treinoaluno :      treino <-> aluno * dia & 
    treinoex :         treino <-> exercicio * series * reps  &
    
    //se tem o mesmo treino tem q ter o mesmo prof
    !(al1, al2, dd1, dd2) . 
    (al1:aluno & al2 : aluno & dd1:dia & dd2:dia & al1 /= al2 & 
    (al1,dd1) : ran(treinoaluno) & 
    (al2,dd2):ran(treinoaluno) & 
    treinoaluno~[{al1|->dd1}] = treinoaluno~[{al2|->dd2}]  
    => 
    alunode[{al1}] = alunode[{al2}]) &

    !(tt, aa, dd).(tt: treino & aa : aluno & dd: dia 
    & (tt |-> (aa, dd)) : treinoaluno =>
    treinoprof(tt) = alunode(aa))



INITIALISATION  
    alunode:={} || treinoprof:={} || treinoaluno:={} || 
    alunostatus:={} || treinoex:={} ||
    aluno:={} || prof:={} || treino:={} || exercicio:={}

OPERATIONS
    
    addprof(pp) = 
    PRE pp : PROF
    THEN prof := prof \/ {pp}
    END;

    addaluno(aa,pp) = 
    PRE 
        aa : ALUNO & pp : prof & aa /: dom(alunode)&                 
        aa /: dom(alunostatus)
    THEN 
        alunode := alunode \/ {aa |-> pp} ||
        aluno := aluno \/ {aa}     ||
        alunostatus := alunostatus \/ {aa |-> atv} 
    END;
     
    addtreinoprof(tt,pp) = 
    PRE pp : prof & tt : TREINO & tt /: dom(treinoprof)
    THEN treinoprof := treinoprof \/ {tt |-> pp} ||
        treino := treino \/ {tt}
    END;

    addtreinoaluno(aa,tt,dd) = 
    PRE 
        aa : aluno & tt : treino & dd : dia &
        (tt |-> (aa, dd)) /: treinoaluno & //o treino nao existe
        treinoprof[{tt}] = alunode[{aa}]
    THEN treinoaluno := treinoaluno \/ {tt |-> (aa,dd)} 
    END;
                            //DIA ANTERIOR E DIA NOVO
    changediatreino(tt, aa, dda, ddn) =
    PRE 
        tt : treino & aa : aluno & dda : dia & ddn : dia &  dda /= ddn &
        (tt |-> (aa, dda)) : treinoaluno //o treino com a data antiga deve existir
    THEN 
        IF dda = se 
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, se)}) \/ {tt |-> (aa, ddn)}
        ELSIF dda = te
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, te)}) \/ {tt |-> (aa, ddn)}
        ELSIF dda = qua
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, qua)}) \/ {tt |-> (aa, ddn)}
        ELSIF dda = qui
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, qui)}) \/ {tt |-> (aa, ddn)}
        ELSIF dda = sex
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, sex)}) \/ {tt |-> (aa, ddn)}
        ELSIF dda = sa
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, sa)}) \/ {tt |-> (aa, ddn)}
        ELSIF dda = do
            THEN treinoaluno := (treinoaluno - {tt |-> (aa, do)}) \/ {tt |-> (aa, ddn)}
            END
    END;

    addexerciciotreino(ex,tt,ss,rp) =
    PRE ex : EXERCICIO & tt : treino & ss : series & rp : reps
    THEN treinoex := treinoex \/ {tt |-> (ex,ss,rp)} || 
         exercicio:= exercicio \/ {ex}
    END;

    
    aa <-- consultaralunos(pp) = 
    PRE pp : PROF & alunode~[{pp}] /= {}
    THEN aa := alunode~[{pp}]
    END
    
//    aa <-- consultaralunossemtreino(pp) = 
//    PRE pp : PROF & alunode~[{pp}] /= {}
//    THEN 
//        aa := { ax, dd | ax : aluno & dd : DIA  & ax : alunode~[{pp}] & 
//                   (ax, dd) : ran(treinoaluno) }
//    END


END