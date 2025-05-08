/* Gym
 * Author: Daniel
 * Creation date: 08/05/2025
 */
MACHINE Gym

CONSTANTS
    dia

SETS
    ALUNO; PROF; TREINO; EXERCICIO; QTD;
    DIA = {se,te,qua,qui,sex,sa,do}
    
PROPERTIES
    dia <: DIA    

VARIABLES
    alunode, alunotreino, treinodia, treinoex, exqtd//, treinoprof

INVARIANT
    dia <: DIA &   
    alunode :          ALUNO +-> PROF &
    alunotreino :     ALUNO <-> TREINO &
    //treinoprof :       TREINO --> PROF &
    treinodia :        TREINO <-> DIA &
    treinoex :         TREINO <-> EXERCICIO &
    exqtd :             EXERCICIO  <-> QTD

INITIALISATION
    alunode:={} || alunotreino:={} || treinodia:={} || treinoex:={} || exqtd:={} //|| treinoprof:={} 
    
OPERATIONS
    
    addaluno(aa,pf) = 
        PRE aa : ALUNO & pf : PROF & alunode \/ {aa |-> pf} : ALUNO +-> PROF
        THEN alunode := alunode \/ {aa |-> pf}
        END

END
