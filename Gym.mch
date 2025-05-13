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
    alunode, alunotreino, treinoprof, treinodia, treinoex, alunostatus,
    aluno, prof, treino, exercicio

INVARIANT
    aluno <: ALUNO &
    treino <: TREINO &
    prof <: PROF &
    exercicio <: EXERCICIO &

    alunode :          aluno --> prof &
    alunostatus :      aluno --> STATUS & 
    alunotreino :      aluno <-> treino &
    treinoprof :       treino --> prof &
    treinodia :        treino <-> dia &
    treinoex :         treino <-> exercicio * series * reps &
    
    //se tem o mesmo treino tem q ter o mesmo prof
    !(tt, al1, al2) . 
    (tt : treino & al1:aluno & al2 : aluno &     
    al1 : alunotreino~[{tt}] & al2 : alunotreino~[{tt}]  
    => alunode[{al1}] = alunode[{al2}]) 

INITIALISATION
    alunode:={} || alunotreino:={} || treinoprof:={} || 
    treinodia:={} || alunostatus:={} || treinoex:={} ||
    aluno:={} || prof:={} || treino:={} || exercicio:={}
OPERATIONS
    
addprof(pp) = 
        PRE pp : PROF
        THEN prof := prof \/ {pp}
        END;

    addaluno(aa,pp) = 
        PRE aa : ALUNO & pp : prof & aa /: dom(alunode) &
                 // saber a causa                
            alunostatus \/ {aa |-> atv} : aluno \/ {aa} --> STATUS 
                // saber a causa
        THEN alunode := alunode \/ {aa |-> pp} ||
            aluno := aluno \/ {aa}     ||
            alunostatus := alunostatus \/ {aa |-> atv} 
        END;
    
    addtreinoprof(tt,pp) = 
        PRE pp : prof & tt : TREINO & tt /: dom(treinoprof)
        THEN treinoprof := treinoprof \/ {tt |-> pp} ||
                    treino := treino \/ {tt}
        END;
    
    addorchangediatreino(tt,dd) = 
        PRE tt : treino & dd : dia 
        THEN IF card(treinodia[{tt}]) = 0
                THEN treinodia := treinodia \/ {tt |-> dd}
            ELSE treinodia := treinodia <+ {tt |-> dd}
                    END
        END;

    addexerciciotreino(ex,tt,ss,rp) =
        PRE ex : EXERCICIO & tt : treino & ss : series & rp : reps
        THEN treinoex := treinoex \/ {tt |-> (ex,ss,rp)} || 
             exercicio:= exercicio \/ {ex}
        END;

    addalunotreino(aa,tt) = 
        PRE aa: aluno & tt : treino & treinoprof[{tt}] = alunode[{aa}] 
        THEN alunotreino := alunotreino \/ {aa |-> tt}
        END;
    
    aa <-- consultaralunos(pp) = 
        PRE pp : PROF & alunode~[{pp}] /= {}
        THEN aa := alunode~[{pp}]
        END;
    
    aa <-- consultaralunossemtreino(pp) = 
        PRE pp : PROF & alunode~[{pp}] - dom(alunotreino) /= {}
        THEN aa := alunode~[{pp}] - dom(alunotreino)
        END
   
END