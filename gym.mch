/* Gymteste2
 * Author: Daniel
 * Creation date: 09/05/2025
 */
/* Gymteste
 * Author: Daniel
 * Creation date: 09/05/2025
 */
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
    alunode, alunotreino, aluno, prof, treino, exercicio, treinoprof, treinodia, treinoex, exqtd

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
    exqtd :             exercicio  <-> qtd

INITIALISATION
    alunode:={} || alunotreino:={} || treinoprof:={} || treinodia:={} ||
    treinoex:={} || exqtd:={} ||
    aluno:={} || prof:={} || treino:={} || exercicio:={}
    
OPERATIONS
    
    addaluno(aa,pp) = 
        PRE aa : ALUNO & pp : PROF & aa /: dom(alunode)
        THEN alunode := alunode \/ {aa |-> pp} ||
                    aluno := aluno \/ {aa} ||
                    prof := prof \/ {pp} 
        END

END

