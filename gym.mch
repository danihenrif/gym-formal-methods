MACHINE Gym

CONSTANTS
    dia, qtd

SETS
    ALUNO; PROF; TREINO ; EXERCICIO; 
    DIA = {se,te,qua,qui,sex,sa,do} ;
    QTD = {qtd1}
     
PROPERTIES
    dia <: DIA &
    qtd <: QTD 

VARIABLES
    alunode, alunotreino, treinoprof, treinodia, treinoex, exqtd,
    aluno, prof, treino, exercicio

INVARIANT
    aluno <: ALUNO &
    treino <: TREINO &
    prof <: PROF &
    exercicio <: EXERCICIO &
    alunode :          aluno --> prof &
    alunotreino :     aluno <-> treino &
    treinoprof :       treino --> prof &
    treinodia :        treino <-> dia &
    treinoex :         treino <-> exercicio &
    exqtd :             exercicio  <-> qtd &
    
    //se tem o mesmo treino tem q ter o mesmo prof
    !(tt, al1, al2) . 
    (tt : treino & al1:aluno & al2 : aluno &     
    al1 : alunotreino~[{tt}] & al2 : alunotreino~[{tt}]  
    => alunode[{al1}] = alunode[{al2}]) 

INITIALISATION
    alunode:={} || alunotreino:={} || treinoprof:={} || treinodia:={} ||
    treinoex:={} || exqtd:={} ||
    aluno:={} || prof:={} || treino:={} || exercicio:={}
    
OPERATIONS
     addprof(pp) = 
        PRE pp : PROF 
        THEN prof := prof \/ {pp} 
        END;

    addaluno(aa,pp) = 
        PRE aa : ALUNO & pp : prof & aa /: dom(alunode)
        THEN alunode := alunode \/ {aa |-> pp} ||
                    aluno := aluno \/ {aa}
        END;
    
    addtreinoprof(tt,pp) = 
        PRE pp : prof & tt : TREINO & tt /: dom(treinoprof)
        THEN treinoprof := treinoprof \/ {tt |-> pp} ||
                    treino := treino \/ {tt}
        END;
    
    addorchangediatreino(tt,dd) = 
        PRE tt : treino & dd : DIA 
        THEN IF card(treinodia[{tt}]) < 1
                        THEN treinodia := treinodia \/ {tt |-> dd}
                        ELSE treinodia := treinodia <+ {tt |-> dd}
                    END
        END;

    addexerciciotreino(ex,tt) =
        PRE ex : EXERCICIO & tt : treino
        THEN treinoex := treinoex \/ {tt |-> ex} ||
                    exercicio := exercicio \/ {ex}
        END;

    addalunotreino(aa,tt) = 
        PRE aa: aluno & tt : TREINO & treinoprof[{tt}] = alunode[{aa}]
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