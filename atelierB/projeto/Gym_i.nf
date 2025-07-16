Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Gym_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Gym_i))==(Machine(Gym));
  Level(Implementation(Gym_i))==(1);
  Upper_Level(Implementation(Gym_i))==(Machine(Gym))
END
&
THEORY LoadedStructureX IS
  Implementation(Gym_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Gym_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Gym_i))==(?);
  Inherited_List_Includes(Implementation(Gym_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Gym_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Gym_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Gym_i))==(?);
  Context_List_Variables(Implementation(Gym_i))==(?);
  Abstract_List_Variables(Implementation(Gym_i))==(alunoPresente,alunoStatus,treinoExercicio,treinoAluno,treinoProf,alunoProf,exercicio,treino,prof,aluno);
  Local_List_Variables(Implementation(Gym_i))==(?);
  List_Variables(Implementation(Gym_i))==(?);
  External_List_Variables(Implementation(Gym_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Gym_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Gym_i))==(?);
  External_List_VisibleVariables(Implementation(Gym_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Gym_i))==(?);
  List_VisibleVariables(Implementation(Gym_i))==(alunoPresente_i,alunoStatus_i,treinoExercicio_i,treinoAluno_i,treinoProf_i,alunoProf_i,exercicio_i,treino_i,prof_i,aluno_i);
  Internal_List_VisibleVariables(Implementation(Gym_i))==(alunoPresente_i,alunoStatus_i,treinoExercicio_i,treinoAluno_i,treinoProf_i,alunoProf_i,exercicio_i,treino_i,prof_i,aluno_i)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Gym_i))==(btrue);
  Expanded_List_Invariant(Implementation(Gym_i))==(btrue);
  Abstract_List_Invariant(Implementation(Gym_i))==(aluno <: ALUNO & prof <: PROF & treino <: TREINO & exercicio <: EXERCICIO & alunoProf: aluno --> prof & alunoStatus: aluno --> STATUS & treinoProf: treino --> prof & treinoAluno: treino <-> aluno*DIA & treinoExercicio: treino <-> exercicio*SERIES*REPETICOES & alunoPresente: aluno --> PRESENTE & alunoPresente~[{presente}]/\alunoStatus~[{inativo}] = {} & !(al1,al2,dd1,dd2).(al1: aluno & al2: aluno & dd1: DIA & dd2: DIA & al1/=al2 & al1,dd1: ran(treinoAluno) & al2,dd2: ran(treinoAluno) & treinoAluno~[{al1|->dd1}] = treinoAluno~[{al2|->dd2}] => alunoProf[{al1}] = alunoProf[{al2}]) & !(tt,aa,dd).(tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno => treinoProf(tt) = alunoProf(aa)) & !(tt,ex,ss1,ss2,rp1,rp2).(tt: treino & ex: exercicio & ss1: SERIES & ss2: SERIES & rp1: REPETICOES & rp2: REPETICOES & tt|->(ex,ss1,rp1): treinoExercicio & tt|->(ex,ss2,rp2): treinoExercicio => ss1 = ss2 & rp1 = rp2));
  Context_List_Invariant(Implementation(Gym_i))==(btrue);
  List_Invariant(Implementation(Gym_i))==(aluno_i: ALUNO --> BOOL & dom(aluno_i|>{TRUE}) = aluno & prof_i: PROF --> BOOL & dom(prof_i|>{TRUE}) = prof & treino_i: TREINO --> BOOL & dom(treino_i|>{TRUE}) = treino & exercicio_i: EXERCICIO --> BOOL & dom(exercicio_i|>{TRUE}) = exercicio & alunoProf_i: ALUNO --> PROF & alunoProf = aluno<|alunoProf_i & treinoProf_i: TREINO --> PROF & treinoProf = treino<|treinoProf_i & treinoAluno_i: TREINO*ALUNO*DIA --> BOOL & !(tt,aa,dd).(tt: treino & aa: aluno & dd: DIA => tt,(aa,dd): treinoAluno <=> (treinoAluno_i(tt,aa,dd) = TRUE)) & treinoExercicio_i: TREINO*EXERCICIO*SERIES*REPETICOES --> BOOL & !(tt,ee,ss,rr).(tt: treino & ee: exercicio & ss: SERIES & rr: REPETICOES => tt|->(ee|->ss|->rr): treinoExercicio <=> (treinoExercicio_i(tt|->ee|->ss|->rr) = TRUE)) & alunoStatus_i: ALUNO --> STATUS & alunoStatus = aluno<|alunoStatus_i & alunoPresente_i: ALUNO --> PRESENTE & alunoPresente = aluno<|alunoPresente_i)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Gym_i))==(btrue);
  Abstract_List_Assertions(Implementation(Gym_i))==(btrue);
  Context_List_Assertions(Implementation(Gym_i))==(btrue);
  List_Assertions(Implementation(Gym_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Gym_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Gym_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Gym_i))==(aluno_i:=ALUNO*{FALSE};prof_i:=PROF*{FALSE};treino_i:=TREINO*{FALSE};exercicio_i:=EXERCICIO*{FALSE};alunoProf_i:=ALUNO*{99};treinoProf_i:=TREINO*{99};alunoStatus_i:=ALUNO*{inativo};alunoPresente_i:=ALUNO*{ausente};@(ii,jj,kk).((0: INT | ii:=0);WHILE ii<100 DO (0: INT | jj:=0);WHILE jj<100 DO (0: INT | kk:=0);WHILE kk<7 DO (ii,jj,kk: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(ii,jj,kk)|->FALSE});(kk+1: INT & kk: INT & 1: INT | kk:=kk+1) INVARIANT kk: NAT & kk<=7 VARIANT 7-kk END;(jj+1: INT & jj: INT & 1: INT | jj:=jj+1) INVARIANT jj: NAT & jj<=100 VARIANT 100-jj END;(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=100 VARIANT 100-ii END);@(ii,jj,kk,ll).((0: INT | ii:=0);WHILE ii<100 DO (0: INT | jj:=0);WHILE jj<100 DO (0: INT | kk:=0);WHILE kk<6 DO (0: INT | ll:=0);WHILE ll<21 DO (ii,jj,kk,ll: dom(treinoExercicio_i) | treinoExercicio_i:=treinoExercicio_i<+{(ii,jj,kk,ll)|->FALSE});(ll+1: INT & ll: INT & 1: INT | ll:=ll+1) INVARIANT ll: NAT & ll<=21 VARIANT 21-ll END;(kk+1: INT & kk: INT & 1: INT | kk:=kk+1) INVARIANT kk: NAT & kk<=6 VARIANT 6-kk END;(jj+1: INT & jj: INT & 1: INT | jj:=jj+1) INVARIANT jj: NAT & jj<=100 VARIANT 100-jj END;(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=100 VARIANT 100-ii END));
  Context_List_Initialisation(Implementation(Gym_i))==(skip);
  List_Initialisation(Implementation(Gym_i))==(aluno_i:=ALUNO*{FALSE};prof_i:=PROF*{FALSE};treino_i:=TREINO*{FALSE};exercicio_i:=EXERCICIO*{FALSE};alunoProf_i:=ALUNO*{99};treinoProf_i:=TREINO*{99};alunoStatus_i:=ALUNO*{inativo};alunoPresente_i:=ALUNO*{ausente};VAR ii,jj,kk IN ii:=0;WHILE ii<100 DO jj:=0;WHILE jj<100 DO kk:=0;WHILE kk<7 DO treinoAluno_i(ii,jj,kk):=FALSE;kk:=kk+1 INVARIANT kk: NAT & kk<=7 VARIANT 7-kk END;jj:=jj+1 INVARIANT jj: NAT & jj<=100 VARIANT 100-jj END;ii:=ii+1 INVARIANT ii: NAT & ii<=100 VARIANT 100-ii END END;VAR ii,jj,kk,ll IN ii:=0;WHILE ii<100 DO jj:=0;WHILE jj<100 DO kk:=0;WHILE kk<6 DO ll:=0;WHILE ll<21 DO treinoExercicio_i(ii,jj,kk,ll):=FALSE;ll:=ll+1 INVARIANT ll: NAT & ll<=21 VARIANT 21-ll END;kk:=kk+1 INVARIANT kk: NAT & kk<=6 VARIANT 6-kk END;jj:=jj+1 INVARIANT jj: NAT & jj<=100 VARIANT 100-jj END;ii:=ii+1 INVARIANT ii: NAT & ii<=100 VARIANT 100-ii END END)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Gym_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Gym_i))==(btrue);
  List_Context_Constraints(Implementation(Gym_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Gym_i))==(addProf,addAluno,addTreinoProf,addTreinoAluno,addExercicioTreino,deleteProf,deleteAluno,deleteTreinoAluno,deleteExercicioTreino,updateAlunoProf,updatePagamento,setAlunoInativo,updateDiaTreino,updateExercicioTreino,checkIn,checkOut,quantidadeAlunos,quantidadeProfessores,alunosPorProf,alunoDeProfessor,canAddProf,canDeleteProf,canAddAluno,canDeleteAluno,canAddTreinoProf,canAddTreinoAluno,canAddExercicioTreino,canDeleteTreinoAluno,canDeleteExercicioTreino,canUpdateAlunoProf,canUpdatePagamento,canSetAlunoInativo,canUpdateDiaTreino,canUpdateExercicioTreino,canCheckIn,canCheckOut,canQuantidadeAlunos,canQuantidadeProfessores,canAlunosPorProf,canAlunoDeProfessor);
  List_Operations(Implementation(Gym_i))==(addProf,addAluno,addTreinoProf,addTreinoAluno,addExercicioTreino,deleteProf,deleteAluno,deleteTreinoAluno,deleteExercicioTreino,updateAlunoProf,updatePagamento,setAlunoInativo,updateDiaTreino,updateExercicioTreino,checkIn,checkOut,quantidadeAlunos,quantidadeProfessores,alunosPorProf,alunoDeProfessor,canAddProf,canDeleteProf,canAddAluno,canDeleteAluno,canAddTreinoProf,canAddTreinoAluno,canAddExercicioTreino,canDeleteTreinoAluno,canDeleteExercicioTreino,canUpdateAlunoProf,canUpdatePagamento,canSetAlunoInativo,canUpdateDiaTreino,canUpdateExercicioTreino,canCheckIn,canCheckOut,canQuantidadeAlunos,canQuantidadeProfessores,canAlunosPorProf,canAlunoDeProfessor)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Gym_i),addProf)==(pp);
  List_Input(Implementation(Gym_i),addAluno)==(aa,pp);
  List_Input(Implementation(Gym_i),addTreinoProf)==(tt,pp);
  List_Input(Implementation(Gym_i),addTreinoAluno)==(aa,tt,dd);
  List_Input(Implementation(Gym_i),addExercicioTreino)==(ex,tt,ss,rp);
  List_Input(Implementation(Gym_i),deleteProf)==(pp);
  List_Input(Implementation(Gym_i),deleteAluno)==(aa);
  List_Input(Implementation(Gym_i),deleteTreinoAluno)==(tt,aa,dd);
  List_Input(Implementation(Gym_i),deleteExercicioTreino)==(tt,ex,ss,rp);
  List_Input(Implementation(Gym_i),updateAlunoProf)==(aa,pp);
  List_Input(Implementation(Gym_i),updatePagamento)==(aa);
  List_Input(Implementation(Gym_i),setAlunoInativo)==(aa);
  List_Input(Implementation(Gym_i),updateDiaTreino)==(tt,aa,ddAnterior,ddNovo);
  List_Input(Implementation(Gym_i),updateExercicioTreino)==(tt,ex,newSs,newRp);
  List_Input(Implementation(Gym_i),checkIn)==(aa);
  List_Input(Implementation(Gym_i),checkOut)==(aa);
  List_Input(Implementation(Gym_i),quantidadeAlunos)==(?);
  List_Input(Implementation(Gym_i),quantidadeProfessores)==(?);
  List_Input(Implementation(Gym_i),alunosPorProf)==(pp);
  List_Input(Implementation(Gym_i),alunoDeProfessor)==(aa,pp);
  List_Input(Implementation(Gym_i),canAddProf)==(pp);
  List_Input(Implementation(Gym_i),canDeleteProf)==(pp);
  List_Input(Implementation(Gym_i),canAddAluno)==(aa,pp);
  List_Input(Implementation(Gym_i),canDeleteAluno)==(aa);
  List_Input(Implementation(Gym_i),canAddTreinoProf)==(tt,pp);
  List_Input(Implementation(Gym_i),canAddTreinoAluno)==(aa,tt,dd);
  List_Input(Implementation(Gym_i),canAddExercicioTreino)==(ex,tt,ss,rp);
  List_Input(Implementation(Gym_i),canDeleteTreinoAluno)==(tt,aa,dd);
  List_Input(Implementation(Gym_i),canDeleteExercicioTreino)==(tt,ex,ss,rp);
  List_Input(Implementation(Gym_i),canUpdateAlunoProf)==(aa,pp);
  List_Input(Implementation(Gym_i),canUpdatePagamento)==(aa);
  List_Input(Implementation(Gym_i),canSetAlunoInativo)==(aa);
  List_Input(Implementation(Gym_i),canUpdateDiaTreino)==(tt,aa,ddAnterior,ddNovo);
  List_Input(Implementation(Gym_i),canUpdateExercicioTreino)==(tt,ex,newSs,newRp);
  List_Input(Implementation(Gym_i),canCheckIn)==(aa);
  List_Input(Implementation(Gym_i),canCheckOut)==(aa);
  List_Input(Implementation(Gym_i),canQuantidadeAlunos)==(?);
  List_Input(Implementation(Gym_i),canQuantidadeProfessores)==(?);
  List_Input(Implementation(Gym_i),canAlunosPorProf)==(pp);
  List_Input(Implementation(Gym_i),canAlunoDeProfessor)==(aa,pp)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Gym_i),addProf)==(?);
  List_Output(Implementation(Gym_i),addAluno)==(?);
  List_Output(Implementation(Gym_i),addTreinoProf)==(?);
  List_Output(Implementation(Gym_i),addTreinoAluno)==(?);
  List_Output(Implementation(Gym_i),addExercicioTreino)==(?);
  List_Output(Implementation(Gym_i),deleteProf)==(?);
  List_Output(Implementation(Gym_i),deleteAluno)==(?);
  List_Output(Implementation(Gym_i),deleteTreinoAluno)==(?);
  List_Output(Implementation(Gym_i),deleteExercicioTreino)==(?);
  List_Output(Implementation(Gym_i),updateAlunoProf)==(?);
  List_Output(Implementation(Gym_i),updatePagamento)==(?);
  List_Output(Implementation(Gym_i),setAlunoInativo)==(?);
  List_Output(Implementation(Gym_i),updateDiaTreino)==(?);
  List_Output(Implementation(Gym_i),updateExercicioTreino)==(?);
  List_Output(Implementation(Gym_i),checkIn)==(?);
  List_Output(Implementation(Gym_i),checkOut)==(?);
  List_Output(Implementation(Gym_i),quantidadeAlunos)==(aa);
  List_Output(Implementation(Gym_i),quantidadeProfessores)==(pp);
  List_Output(Implementation(Gym_i),alunosPorProf)==(ap);
  List_Output(Implementation(Gym_i),alunoDeProfessor)==(resp);
  List_Output(Implementation(Gym_i),canAddProf)==(canAdd);
  List_Output(Implementation(Gym_i),canDeleteProf)==(canDel);
  List_Output(Implementation(Gym_i),canAddAluno)==(canAdd);
  List_Output(Implementation(Gym_i),canDeleteAluno)==(canDel);
  List_Output(Implementation(Gym_i),canAddTreinoProf)==(canAdd);
  List_Output(Implementation(Gym_i),canAddTreinoAluno)==(canAdd);
  List_Output(Implementation(Gym_i),canAddExercicioTreino)==(canAdd);
  List_Output(Implementation(Gym_i),canDeleteTreinoAluno)==(canDel);
  List_Output(Implementation(Gym_i),canDeleteExercicioTreino)==(canDel);
  List_Output(Implementation(Gym_i),canUpdateAlunoProf)==(canUpdate);
  List_Output(Implementation(Gym_i),canUpdatePagamento)==(canUpdate);
  List_Output(Implementation(Gym_i),canSetAlunoInativo)==(canSet);
  List_Output(Implementation(Gym_i),canUpdateDiaTreino)==(canUpdate);
  List_Output(Implementation(Gym_i),canUpdateExercicioTreino)==(canUpdate);
  List_Output(Implementation(Gym_i),canCheckIn)==(canCheck);
  List_Output(Implementation(Gym_i),canCheckOut)==(canCheck);
  List_Output(Implementation(Gym_i),canQuantidadeAlunos)==(canConsult);
  List_Output(Implementation(Gym_i),canQuantidadeProfessores)==(canConsult);
  List_Output(Implementation(Gym_i),canAlunosPorProf)==(canConsult);
  List_Output(Implementation(Gym_i),canAlunoDeProfessor)==(canConsult)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Gym_i),addProf)==(addProf(pp));
  List_Header(Implementation(Gym_i),addAluno)==(addAluno(aa,pp));
  List_Header(Implementation(Gym_i),addTreinoProf)==(addTreinoProf(tt,pp));
  List_Header(Implementation(Gym_i),addTreinoAluno)==(addTreinoAluno(aa,tt,dd));
  List_Header(Implementation(Gym_i),addExercicioTreino)==(addExercicioTreino(ex,tt,ss,rp));
  List_Header(Implementation(Gym_i),deleteProf)==(deleteProf(pp));
  List_Header(Implementation(Gym_i),deleteAluno)==(deleteAluno(aa));
  List_Header(Implementation(Gym_i),deleteTreinoAluno)==(deleteTreinoAluno(tt,aa,dd));
  List_Header(Implementation(Gym_i),deleteExercicioTreino)==(deleteExercicioTreino(tt,ex,ss,rp));
  List_Header(Implementation(Gym_i),updateAlunoProf)==(updateAlunoProf(aa,pp));
  List_Header(Implementation(Gym_i),updatePagamento)==(updatePagamento(aa));
  List_Header(Implementation(Gym_i),setAlunoInativo)==(setAlunoInativo(aa));
  List_Header(Implementation(Gym_i),updateDiaTreino)==(updateDiaTreino(tt,aa,ddAnterior,ddNovo));
  List_Header(Implementation(Gym_i),updateExercicioTreino)==(updateExercicioTreino(tt,ex,newSs,newRp));
  List_Header(Implementation(Gym_i),checkIn)==(checkIn(aa));
  List_Header(Implementation(Gym_i),checkOut)==(checkOut(aa));
  List_Header(Implementation(Gym_i),quantidadeAlunos)==(aa <-- quantidadeAlunos);
  List_Header(Implementation(Gym_i),quantidadeProfessores)==(pp <-- quantidadeProfessores);
  List_Header(Implementation(Gym_i),alunosPorProf)==(ap <-- alunosPorProf(pp));
  List_Header(Implementation(Gym_i),alunoDeProfessor)==(resp <-- alunoDeProfessor(aa,pp));
  List_Header(Implementation(Gym_i),canAddProf)==(canAdd <-- canAddProf(pp));
  List_Header(Implementation(Gym_i),canDeleteProf)==(canDel <-- canDeleteProf(pp));
  List_Header(Implementation(Gym_i),canAddAluno)==(canAdd <-- canAddAluno(aa,pp));
  List_Header(Implementation(Gym_i),canDeleteAluno)==(canDel <-- canDeleteAluno(aa));
  List_Header(Implementation(Gym_i),canAddTreinoProf)==(canAdd <-- canAddTreinoProf(tt,pp));
  List_Header(Implementation(Gym_i),canAddTreinoAluno)==(canAdd <-- canAddTreinoAluno(aa,tt,dd));
  List_Header(Implementation(Gym_i),canAddExercicioTreino)==(canAdd <-- canAddExercicioTreino(ex,tt,ss,rp));
  List_Header(Implementation(Gym_i),canDeleteTreinoAluno)==(canDel <-- canDeleteTreinoAluno(tt,aa,dd));
  List_Header(Implementation(Gym_i),canDeleteExercicioTreino)==(canDel <-- canDeleteExercicioTreino(tt,ex,ss,rp));
  List_Header(Implementation(Gym_i),canUpdateAlunoProf)==(canUpdate <-- canUpdateAlunoProf(aa,pp));
  List_Header(Implementation(Gym_i),canUpdatePagamento)==(canUpdate <-- canUpdatePagamento(aa));
  List_Header(Implementation(Gym_i),canSetAlunoInativo)==(canSet <-- canSetAlunoInativo(aa));
  List_Header(Implementation(Gym_i),canUpdateDiaTreino)==(canUpdate <-- canUpdateDiaTreino(tt,aa,ddAnterior,ddNovo));
  List_Header(Implementation(Gym_i),canUpdateExercicioTreino)==(canUpdate <-- canUpdateExercicioTreino(tt,ex,newSs,newRp));
  List_Header(Implementation(Gym_i),canCheckIn)==(canCheck <-- canCheckIn(aa));
  List_Header(Implementation(Gym_i),canCheckOut)==(canCheck <-- canCheckOut(aa));
  List_Header(Implementation(Gym_i),canQuantidadeAlunos)==(canConsult <-- canQuantidadeAlunos);
  List_Header(Implementation(Gym_i),canQuantidadeProfessores)==(canConsult <-- canQuantidadeProfessores);
  List_Header(Implementation(Gym_i),canAlunosPorProf)==(canConsult <-- canAlunosPorProf(pp));
  List_Header(Implementation(Gym_i),canAlunoDeProfessor)==(canConsult <-- canAlunoDeProfessor(aa,pp))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Gym_i),addProf)==(btrue);
  List_Precondition(Implementation(Gym_i),addProf)==(pp: PROF & pp/:prof);
  Own_Precondition(Implementation(Gym_i),addAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),addAluno)==(aa: ALUNO & pp: PROF & pp: prof & aa/:dom(alunoProf) & aa/:dom(alunoStatus) & alunoPresente\/{aa|->ausente}: aluno\/{aa} --> PRESENTE & (alunoPresente\/{aa|->ausente})~[{presente}]/\(alunoStatus\/{aa|->ativo})~[{inativo}] = {});
  Own_Precondition(Implementation(Gym_i),addTreinoProf)==(btrue);
  List_Precondition(Implementation(Gym_i),addTreinoProf)==(pp: PROF & pp: prof & tt: TREINO & tt/:dom(treinoProf));
  Own_Precondition(Implementation(Gym_i),addTreinoAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),addTreinoAluno)==(aa: ALUNO & tt: TREINO & aa: aluno & tt: treino & dd: DIA & tt|->(aa,dd)/:treinoAluno & treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa)/=inativo);
  Own_Precondition(Implementation(Gym_i),addExercicioTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),addExercicioTreino)==(ex: EXERCICIO & tt: TREINO & tt: treino & ss: SERIES & rp: REPETICOES & not(#(ss0,rp0).(ss0: SERIES & rp0: REPETICOES & tt|->(ex,ss0,rp0): treinoExercicio)));
  Own_Precondition(Implementation(Gym_i),deleteProf)==(btrue);
  List_Precondition(Implementation(Gym_i),deleteProf)==(pp: PROF & pp: prof & card(prof-{pp})>0);
  Own_Precondition(Implementation(Gym_i),deleteAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),deleteAluno)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo});
  Own_Precondition(Implementation(Gym_i),deleteTreinoAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),deleteTreinoAluno)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno);
  Own_Precondition(Implementation(Gym_i),deleteExercicioTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),deleteExercicioTreino)==(tt: TREINO & tt: treino & ex: EXERCICIO & ex: exercicio & ss: SERIES & rp: REPETICOES & tt|->(ex,ss,rp): treinoExercicio);
  Own_Precondition(Implementation(Gym_i),updateAlunoProf)==(btrue);
  List_Precondition(Implementation(Gym_i),updateAlunoProf)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}]/={pp});
  Own_Precondition(Implementation(Gym_i),updatePagamento)==(btrue);
  List_Precondition(Implementation(Gym_i),updatePagamento)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo});
  Own_Precondition(Implementation(Gym_i),setAlunoInativo)==(btrue);
  List_Precondition(Implementation(Gym_i),setAlunoInativo)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo});
  Own_Precondition(Implementation(Gym_i),updateDiaTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),updateDiaTreino)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & ddAnterior: DIA & ddNovo: DIA & ddAnterior/=ddNovo & tt|->(aa,ddAnterior): treinoAluno & alunoStatus[{aa}] = {ativo});
  Own_Precondition(Implementation(Gym_i),updateExercicioTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),updateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & tt: treino & ex: exercicio & newSs: SERIES & newRp: REPETICOES & #(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio));
  Own_Precondition(Implementation(Gym_i),checkIn)==(btrue);
  List_Precondition(Implementation(Gym_i),checkIn)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente});
  Own_Precondition(Implementation(Gym_i),checkOut)==(btrue);
  List_Precondition(Implementation(Gym_i),checkOut)==(aa: ALUNO & aa: aluno & alunoPresente[{aa}] = {presente});
  Own_Precondition(Implementation(Gym_i),quantidadeAlunos)==(btrue);
  List_Precondition(Implementation(Gym_i),quantidadeAlunos)==(card(aluno)>0);
  Own_Precondition(Implementation(Gym_i),quantidadeProfessores)==(btrue);
  List_Precondition(Implementation(Gym_i),quantidadeProfessores)==(card(prof)>0);
  Own_Precondition(Implementation(Gym_i),alunosPorProf)==(btrue);
  List_Precondition(Implementation(Gym_i),alunosPorProf)==(pp: PROF & pp: prof & card(alunoProf~[{pp}])>0);
  Own_Precondition(Implementation(Gym_i),alunoDeProfessor)==(btrue);
  List_Precondition(Implementation(Gym_i),alunoDeProfessor)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof);
  Own_Precondition(Implementation(Gym_i),canAddProf)==(btrue);
  List_Precondition(Implementation(Gym_i),canAddProf)==(pp: PROF);
  Own_Precondition(Implementation(Gym_i),canDeleteProf)==(btrue);
  List_Precondition(Implementation(Gym_i),canDeleteProf)==(pp: PROF);
  Own_Precondition(Implementation(Gym_i),canAddAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),canAddAluno)==(aa: ALUNO & pp: PROF);
  Own_Precondition(Implementation(Gym_i),canDeleteAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),canDeleteAluno)==(aa: ALUNO);
  Own_Precondition(Implementation(Gym_i),canAddTreinoProf)==(btrue);
  List_Precondition(Implementation(Gym_i),canAddTreinoProf)==(tt: TREINO & pp: PROF);
  Own_Precondition(Implementation(Gym_i),canAddTreinoAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),canAddTreinoAluno)==(aa: ALUNO & tt: TREINO & dd: DIA);
  Own_Precondition(Implementation(Gym_i),canAddExercicioTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),canAddExercicioTreino)==(ex: EXERCICIO & tt: TREINO & ss: NAT & rp: NAT);
  Own_Precondition(Implementation(Gym_i),canDeleteTreinoAluno)==(btrue);
  List_Precondition(Implementation(Gym_i),canDeleteTreinoAluno)==(tt: TREINO & aa: ALUNO & dd: DIA);
  Own_Precondition(Implementation(Gym_i),canDeleteExercicioTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),canDeleteExercicioTreino)==(tt: TREINO & ex: EXERCICIO & ss: NAT & rp: NAT);
  Own_Precondition(Implementation(Gym_i),canUpdateAlunoProf)==(btrue);
  List_Precondition(Implementation(Gym_i),canUpdateAlunoProf)==(aa: ALUNO & pp: PROF);
  Own_Precondition(Implementation(Gym_i),canUpdatePagamento)==(btrue);
  List_Precondition(Implementation(Gym_i),canUpdatePagamento)==(aa: ALUNO);
  Own_Precondition(Implementation(Gym_i),canSetAlunoInativo)==(btrue);
  List_Precondition(Implementation(Gym_i),canSetAlunoInativo)==(aa: ALUNO);
  Own_Precondition(Implementation(Gym_i),canUpdateDiaTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),canUpdateDiaTreino)==(tt: TREINO & aa: ALUNO & ddAnterior: DIA & ddNovo: DIA);
  Own_Precondition(Implementation(Gym_i),canUpdateExercicioTreino)==(btrue);
  List_Precondition(Implementation(Gym_i),canUpdateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & newSs: NAT & newRp: NAT);
  Own_Precondition(Implementation(Gym_i),canCheckIn)==(btrue);
  List_Precondition(Implementation(Gym_i),canCheckIn)==(aa: ALUNO);
  Own_Precondition(Implementation(Gym_i),canCheckOut)==(btrue);
  List_Precondition(Implementation(Gym_i),canCheckOut)==(aa: ALUNO);
  Own_Precondition(Implementation(Gym_i),canQuantidadeAlunos)==(btrue);
  List_Precondition(Implementation(Gym_i),canQuantidadeAlunos)==(btrue);
  Own_Precondition(Implementation(Gym_i),canQuantidadeProfessores)==(btrue);
  List_Precondition(Implementation(Gym_i),canQuantidadeProfessores)==(btrue);
  Own_Precondition(Implementation(Gym_i),canAlunosPorProf)==(btrue);
  List_Precondition(Implementation(Gym_i),canAlunosPorProf)==(pp: PROF);
  Own_Precondition(Implementation(Gym_i),canAlunoDeProfessor)==(btrue);
  List_Precondition(Implementation(Gym_i),canAlunoDeProfessor)==(aa: ALUNO & pp: PROF)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Gym_i),canAlunoDeProfessor)==(aa: ALUNO & pp: PROF | @(alunoAtual,profAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(pp: dom(prof_i) | profAtual:=prof_i(pp));(aa/=99 & pp/=99 & alunoAtual = TRUE & profAtual = TRUE ==> canConsult:=TRUE [] not(aa/=99 & pp/=99 & alunoAtual = TRUE & profAtual = TRUE) ==> canConsult:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canAlunosPorProf)==(pp: PROF | @(profAtual,ii,temAlunos,verificarAlunoProf,verificarAluno).((pp: dom(prof_i) | profAtual:=prof_i(pp));temAlunos:=FALSE;(0: INT | ii:=0);WHILE ii<99 & temAlunos = FALSE DO (ii: dom(alunoProf_i) | verificarAlunoProf:=alunoProf_i(ii));(ii: dom(aluno_i) | verificarAluno:=aluno_i(ii));(verificarAlunoProf = pp & verificarAluno = TRUE ==> temAlunos:=TRUE [] not(verificarAlunoProf = pp & verificarAluno = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=99 VARIANT 99-ii END;(pp/=99 & profAtual = TRUE & temAlunos = TRUE ==> canConsult:=TRUE [] not(pp/=99 & profAtual = TRUE & temAlunos = TRUE) ==> canConsult:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canQuantidadeProfessores)==(btrue | @(ii,temProfs,verificarProf).(temProfs:=FALSE;(0: INT | ii:=0);WHILE ii<99 & temProfs = FALSE DO (ii: dom(prof_i) | verificarProf:=prof_i(ii));(verificarProf = TRUE ==> temProfs:=TRUE [] not(verificarProf = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=99 VARIANT 99-ii END;canConsult:=temProfs));
  Expanded_List_Substitution(Implementation(Gym_i),canQuantidadeAlunos)==(btrue | @(ii,temAlunos,verificarAluno).(temAlunos:=FALSE;(0: INT | ii:=0);WHILE ii<99 & temAlunos = FALSE DO (ii: dom(aluno_i) | verificarAluno:=aluno_i(ii));(verificarAluno = TRUE ==> temAlunos:=TRUE [] not(verificarAluno = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=99 VARIANT 99-ii END;canConsult:=temAlunos));
  Expanded_List_Substitution(Implementation(Gym_i),canCheckOut)==(aa: ALUNO | @(alunoAtual,presenteAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(aa: dom(alunoPresente_i) | presenteAtual:=alunoPresente_i(aa));(aa/=99 & alunoAtual = TRUE & presenteAtual = presente ==> canCheck:=TRUE [] not(aa/=99 & alunoAtual = TRUE & presenteAtual = presente) ==> canCheck:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canCheckIn)==(aa: ALUNO | @(alunoAtual,statusAtual,presenteAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(aa: dom(alunoPresente_i) | presenteAtual:=alunoPresente_i(aa));(aa/=99 & alunoAtual = TRUE & statusAtual = ativo & presenteAtual = ausente ==> canCheck:=TRUE [] not(aa/=99 & alunoAtual = TRUE & statusAtual = ativo & presenteAtual = ausente) ==> canCheck:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canUpdateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & newSs: NAT & newRp: NAT | @(treinoAtual,exercicioAtual,exercicioJaExiste,ss0,rp0,verificarTreinoExercicio).((tt: dom(treino_i) | treinoAtual:=treino_i(tt));(ex: dom(exercicio_i) | exercicioAtual:=exercicio_i(ex));exercicioJaExiste:=FALSE;(0: INT | ss0:=0);WHILE ss0<=5 & exercicioJaExiste = FALSE DO (0: INT | rp0:=0);WHILE rp0<=20 & exercicioJaExiste = FALSE DO (tt,ex,ss0,rp0: dom(treinoExercicio_i) | verificarTreinoExercicio:=treinoExercicio_i(tt,ex,ss0,rp0));(verificarTreinoExercicio = TRUE ==> exercicioJaExiste:=TRUE [] not(verificarTreinoExercicio = TRUE) ==> skip);(rp0+1: INT & rp0: INT & 1: INT | rp0:=rp0+1) INVARIANT rp0: NAT & rp0<=21 VARIANT 21-rp0 END;(ss0+1: INT & ss0: INT & 1: INT | ss0:=ss0+1) INVARIANT ss0: NAT & ss0<=6 VARIANT 6-ss0 END;(tt/=99 & ex/=99 & treinoAtual = TRUE & exercicioAtual = TRUE & newSs>=0 & newSs<=5 & newRp>=0 & newRp<=20 & exercicioJaExiste = TRUE ==> canUpdate:=TRUE [] not(tt/=99 & ex/=99 & treinoAtual = TRUE & exercicioAtual = TRUE & newSs>=0 & newSs<=5 & newRp>=0 & newRp<=20 & exercicioJaExiste = TRUE) ==> canUpdate:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canUpdateDiaTreino)==(tt: TREINO & aa: ALUNO & ddAnterior: DIA & ddNovo: DIA | @(treinoAtual,alunoAtual,statusAtual,treinoExiste).((tt: dom(treino_i) | treinoAtual:=treino_i(tt));(aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(tt,aa,ddAnterior: dom(treinoAluno_i) | treinoExiste:=treinoAluno_i(tt,aa,ddAnterior));(tt/=99 & aa/=99 & treinoAtual = TRUE & alunoAtual = TRUE & statusAtual = ativo & ddAnterior/=ddNovo & treinoExiste = TRUE ==> canUpdate:=TRUE [] not(tt/=99 & aa/=99 & treinoAtual = TRUE & alunoAtual = TRUE & statusAtual = ativo & ddAnterior/=ddNovo & treinoExiste = TRUE) ==> canUpdate:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canSetAlunoInativo)==(aa: ALUNO | @(alunoAtual,statusAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(aa/=99 & alunoAtual = TRUE & statusAtual = ativo ==> canSet:=TRUE [] not(aa/=99 & alunoAtual = TRUE & statusAtual = ativo) ==> canSet:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canUpdatePagamento)==(aa: ALUNO | @(alunoAtual,statusAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(aa/=99 & alunoAtual = TRUE & statusAtual = inativo ==> canUpdate:=TRUE [] not(aa/=99 & alunoAtual = TRUE & statusAtual = inativo) ==> canUpdate:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canUpdateAlunoProf)==(aa: ALUNO & pp: PROF | @(alunoAtual,profAtual,statusAtual,profAlunoAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(pp: dom(prof_i) | profAtual:=prof_i(pp));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(aa: dom(alunoProf_i) | profAlunoAtual:=alunoProf_i(aa));(aa/=99 & pp/=99 & alunoAtual = TRUE & profAtual = TRUE & statusAtual = ativo & profAlunoAtual/=pp ==> canUpdate:=TRUE [] not(aa/=99 & pp/=99 & alunoAtual = TRUE & profAtual = TRUE & statusAtual = ativo & profAlunoAtual/=pp) ==> canUpdate:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canDeleteExercicioTreino)==(tt: TREINO & ex: EXERCICIO & ss: NAT & rp: NAT | @(treinoAtual,exercicioAtual,exercicioExiste).((tt: dom(treino_i) | treinoAtual:=treino_i(tt));(ex: dom(exercicio_i) | exercicioAtual:=exercicio_i(ex));(tt,ex,ss,rp: dom(treinoExercicio_i) | exercicioExiste:=treinoExercicio_i(tt,ex,ss,rp));(tt/=99 & ex/=99 & treinoAtual = TRUE & exercicioAtual = TRUE & ss>=0 & ss<=5 & rp>=0 & rp<=20 & exercicioExiste = TRUE ==> canDel:=TRUE [] not(tt/=99 & ex/=99 & treinoAtual = TRUE & exercicioAtual = TRUE & ss>=0 & ss<=5 & rp>=0 & rp<=20 & exercicioExiste = TRUE) ==> canDel:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canDeleteTreinoAluno)==(tt: TREINO & aa: ALUNO & dd: DIA | @(treinoAtual,alunoAtual,treinoExiste).((tt: dom(treino_i) | treinoAtual:=treino_i(tt));(aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(tt,aa,dd: dom(treinoAluno_i) | treinoExiste:=treinoAluno_i(tt,aa,dd));(tt/=99 & aa/=99 & treinoAtual = TRUE & alunoAtual = TRUE & treinoExiste = TRUE ==> canDel:=TRUE [] not(tt/=99 & aa/=99 & treinoAtual = TRUE & alunoAtual = TRUE & treinoExiste = TRUE) ==> canDel:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canAddExercicioTreino)==(ex: EXERCICIO & tt: TREINO & ss: NAT & rp: NAT | @(treinoAtual,exercicioJaExiste,ss0,rp0,verificarTreino).((tt: dom(treino_i) | treinoAtual:=treino_i(tt));exercicioJaExiste:=FALSE;(0: INT | ss0:=0);WHILE ss0<=5 & exercicioJaExiste = FALSE DO (0: INT | rp0:=0);WHILE rp0<=20 & exercicioJaExiste = FALSE DO (tt,ex,ss0,rp0: dom(treinoExercicio_i) | verificarTreino:=treinoExercicio_i(tt,ex,ss0,rp0));(verificarTreino = TRUE ==> exercicioJaExiste:=TRUE [] not(verificarTreino = TRUE) ==> skip);(rp0+1: INT & rp0: INT & 1: INT | rp0:=rp0+1) INVARIANT rp0: NAT & rp0<=21 VARIANT 21-rp0 END;(ss0+1: INT & ss0: INT & 1: INT | ss0:=ss0+1) INVARIANT ss0: NAT & ss0<=6 VARIANT 6-ss0 END;(ex/=99 & tt/=99 & treinoAtual = TRUE & ss>=0 & ss<=5 & rp>=0 & rp<=20 & exercicioJaExiste = FALSE ==> canAdd:=TRUE [] not(ex/=99 & tt/=99 & treinoAtual = TRUE & ss>=0 & ss<=5 & rp>=0 & rp<=20 & exercicioJaExiste = FALSE) ==> canAdd:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canAddTreinoAluno)==(aa: ALUNO & tt: TREINO & dd: DIA | @(alunoAtual,treinoAtual,statusAtual,profTreino,profAluno,treinoJaExiste).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(tt: dom(treino_i) | treinoAtual:=treino_i(tt));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(tt: dom(treinoProf_i) | profTreino:=treinoProf_i(tt));(aa: dom(alunoProf_i) | profAluno:=alunoProf_i(aa));(tt,aa,dd: dom(treinoAluno_i) | treinoJaExiste:=treinoAluno_i(tt,aa,dd));(aa/=99 & tt/=99 & alunoAtual = TRUE & treinoAtual = TRUE & statusAtual = ativo & profTreino = profAluno & treinoJaExiste = FALSE ==> canAdd:=TRUE [] not(aa/=99 & tt/=99 & alunoAtual = TRUE & treinoAtual = TRUE & statusAtual = ativo & profTreino = profAluno & treinoJaExiste = FALSE) ==> canAdd:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canAddTreinoProf)==(tt: TREINO & pp: PROF | @(treinoAtual,profAtual).((tt: dom(treino_i) | treinoAtual:=treino_i(tt));(pp: dom(prof_i) | profAtual:=prof_i(pp));(tt/=99 & pp/=99 & treinoAtual = FALSE & profAtual = TRUE ==> canAdd:=TRUE [] not(tt/=99 & pp/=99 & treinoAtual = FALSE & profAtual = TRUE) ==> canAdd:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canDeleteAluno)==(aa: ALUNO | @(alunoAtual,statusAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(aa: dom(alunoStatus_i) | statusAtual:=alunoStatus_i(aa));(aa/=99 & alunoAtual = TRUE & statusAtual = inativo ==> canDel:=TRUE [] not(aa/=99 & alunoAtual = TRUE & statusAtual = inativo) ==> canDel:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canAddAluno)==(aa: ALUNO & pp: PROF | @(alunoAtual,profAtual).((aa: dom(aluno_i) | alunoAtual:=aluno_i(aa));(pp: dom(prof_i) | profAtual:=prof_i(pp));(aa/=99 & pp/=99 & alunoAtual = FALSE & profAtual = TRUE ==> canAdd:=TRUE [] not(aa/=99 & pp/=99 & alunoAtual = FALSE & profAtual = TRUE) ==> canAdd:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canDeleteProf)==(pp: PROF | @(profAtual,ii,profCount,verificarProf).((pp: dom(prof_i) | profAtual:=prof_i(pp));(0: INT | profCount:=0);(0: INT | ii:=0);WHILE ii<99 DO (ii: dom(prof_i) | verificarProf:=prof_i(ii));(verificarProf = TRUE ==> (profCount+1: INT & profCount: INT & 1: INT | profCount:=profCount+1) [] not(verificarProf = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=99 & profCount<=99 VARIANT 99-ii END;(pp/=99 & profAtual = TRUE & profCount>1 ==> canDel:=TRUE [] not(pp/=99 & profAtual = TRUE & profCount>1) ==> canDel:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),canAddProf)==(pp: PROF | @profAtual.((pp: dom(prof_i) | profAtual:=prof_i(pp));(pp/=99 & profAtual = FALSE ==> canAdd:=TRUE [] not(pp/=99 & profAtual = FALSE) ==> canAdd:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),alunoDeProfessor)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof | @ap.((aa: dom(alunoProf_i) | ap:=alunoProf_i(aa));(ap = pp ==> resp:=TRUE [] not(ap = pp) ==> resp:=FALSE)));
  Expanded_List_Substitution(Implementation(Gym_i),alunosPorProf)==(pp: PROF & pp: prof & card(alunoProf~[{pp}])>0 | @(ii,alunoCount,profAtual).((0: INT | ii:=0);(0: INT | alunoCount:=0);WHILE ii<99 DO (ii: dom(alunoProf_i) | profAtual:=alunoProf_i(ii));(profAtual = pp ==> (alunoCount+1: INT & alunoCount: INT & 1: INT | alunoCount:=alunoCount+1) [] not(profAtual = pp) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: NAT & ii<=99 & alunoCount<99 VARIANT 99-ii END;(alunoCount: INT | ap:=alunoCount)));
  Expanded_List_Substitution(Implementation(Gym_i),quantidadeProfessores)==(card(prof)>0 | @(ii,professorAtual,professorCount).((0: INT | ii:=0);(0: INT | professorCount:=0);WHILE ii<99 DO (ii: dom(prof_i) | professorAtual:=prof_i(ii));(professorAtual = TRUE ==> (professorCount+1: INT & professorCount: INT & 1: INT | professorCount:=professorCount+1) [] not(professorAtual = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii<=99 & ii: NAT & professorCount<99 VARIANT 99-ii END;(professorCount: INT | pp:=professorCount)));
  Expanded_List_Substitution(Implementation(Gym_i),quantidadeAlunos)==(card(aluno)>0 | @(alunoCount,ii,alunoAtual).((0: INT | alunoCount:=0);(0: INT | ii:=0);WHILE ii<99 DO (ii: dom(aluno_i) | alunoAtual:=aluno_i(ii));(alunoAtual = TRUE ==> (alunoCount+1: INT & alunoCount: INT & 1: INT | alunoCount:=alunoCount+1) [] not(alunoAtual = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii<=99 & ii: NAT & alunoCount<99 VARIANT 99-ii END;(alunoCount: INT | aa:=alunoCount)));
  Expanded_List_Substitution(Implementation(Gym_i),checkOut)==(aa: ALUNO & aa: aluno & alunoPresente[{aa}] = {presente} & aa: dom(alunoPresente_i) | alunoPresente_i:=alunoPresente_i<+{aa|->ausente});
  Expanded_List_Substitution(Implementation(Gym_i),checkIn)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente} & aa: dom(alunoPresente_i) | alunoPresente_i:=alunoPresente_i<+{aa|->presente});
  Expanded_List_Substitution(Implementation(Gym_i),updateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & tt: treino & ex: exercicio & newSs: SERIES & newRp: REPETICOES & #(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio) | @(ss,rp,tempTreinoExercicio).((0: INT | ss:=0);WHILE ss<=5 DO (0: INT | rp:=0);WHILE rp<=20 DO (tt,ex,ss,rp: dom(treinoExercicio_i) | tempTreinoExercicio:=treinoExercicio_i(tt,ex,ss,rp));(tempTreinoExercicio = TRUE ==> (tt,ex,ss,rp: dom(treinoExercicio_i) | treinoExercicio_i:=treinoExercicio_i<+{(tt,ex,ss,rp)|->FALSE}) [] not(tempTreinoExercicio = TRUE) ==> skip);(rp+1: INT & rp: INT & 1: INT | rp:=rp+1) INVARIANT rp: NAT & rp<=21 VARIANT 21-rp END;(ss+1: INT & ss: INT & 1: INT | ss:=ss+1) INVARIANT ss: NAT & ss<=6 VARIANT 6-ss END);(tt,ex,newSs,newRp: dom(treinoExercicio_i) | treinoExercicio_i:=treinoExercicio_i<+{(tt,ex,newSs,newRp)|->TRUE}));
  Expanded_List_Substitution(Implementation(Gym_i),updateDiaTreino)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & ddAnterior: DIA & ddNovo: DIA & ddAnterior/=ddNovo & tt|->(aa,ddAnterior): treinoAluno & alunoStatus[{aa}] = {ativo} | (tt,aa,ddAnterior: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(tt,aa,ddAnterior)|->FALSE});(tt,aa,ddNovo: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(tt,aa,ddNovo)|->TRUE}));
  Expanded_List_Substitution(Implementation(Gym_i),setAlunoInativo)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo} & aa: dom(alunoStatus_i) | alunoStatus_i:=alunoStatus_i<+{aa|->inativo});
  Expanded_List_Substitution(Implementation(Gym_i),updatePagamento)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo} & aa: dom(alunoStatus_i) | alunoStatus_i:=alunoStatus_i<+{aa|->ativo});
  Expanded_List_Substitution(Implementation(Gym_i),updateAlunoProf)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}]/={pp} | @(treinoTemp,diaTemp).((0: INT | treinoTemp:=0);WHILE treinoTemp<100 DO (0: INT | diaTemp:=0);WHILE diaTemp<7 DO (treinoTemp,aa,diaTemp: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(treinoTemp,aa,diaTemp)|->FALSE});(diaTemp+1: INT & diaTemp: INT & 1: INT | diaTemp:=diaTemp+1) INVARIANT diaTemp: NAT & diaTemp<=7 VARIANT 7-diaTemp END;(treinoTemp+1: INT & treinoTemp: INT & 1: INT | treinoTemp:=treinoTemp+1) INVARIANT treinoTemp: NAT & treinoTemp<=100 VARIANT 100-treinoTemp END);(aa: dom(alunoProf_i) & pp: INT | alunoProf_i:=alunoProf_i<+{aa|->pp}));
  Expanded_List_Substitution(Implementation(Gym_i),deleteExercicioTreino)==(tt: TREINO & tt: treino & ex: EXERCICIO & ex: exercicio & ss: SERIES & rp: REPETICOES & tt|->(ex,ss,rp): treinoExercicio & tt,ex,ss,rp: dom(treinoExercicio_i) | treinoExercicio_i:=treinoExercicio_i<+{(tt,ex,ss,rp)|->FALSE});
  Expanded_List_Substitution(Implementation(Gym_i),deleteTreinoAluno)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno & tt,aa,dd: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(tt,aa,dd)|->FALSE});
  Expanded_List_Substitution(Implementation(Gym_i),deleteAluno)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo} | @(treinoTemp,diaTemp).((0: INT | treinoTemp:=0);WHILE treinoTemp<100 DO (0: INT | diaTemp:=0);WHILE diaTemp<7 DO (treinoTemp,aa,diaTemp: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(treinoTemp,aa,diaTemp)|->FALSE});(diaTemp+1: INT & diaTemp: INT & 1: INT | diaTemp:=diaTemp+1) INVARIANT diaTemp: NAT & diaTemp<=7 VARIANT 7-diaTemp END;(treinoTemp+1: INT & treinoTemp: INT & 1: INT | treinoTemp:=treinoTemp+1) INVARIANT treinoTemp: NAT & treinoTemp<=100 VARIANT 100-treinoTemp END);(aa: dom(alunoStatus_i) | alunoStatus_i:=alunoStatus_i<+{aa|->inativo});(aa: dom(alunoPresente_i) | alunoPresente_i:=alunoPresente_i<+{aa|->ausente});(aa: dom(alunoProf_i) & 99: INT | alunoProf_i:=alunoProf_i<+{aa|->99});(aa: dom(aluno_i) | aluno_i:=aluno_i<+{aa|->FALSE}));
  Expanded_List_Substitution(Implementation(Gym_i),deleteProf)==(pp: PROF & pp: prof & card(prof-{pp})>0 | @(alunoTemp,profAtual,treinoTemp).((0: INT | alunoTemp:=0);WHILE alunoTemp<100 DO (alunoTemp: dom(alunoProf_i) | profAtual:=alunoProf_i(alunoTemp));(profAtual = pp ==> (alunoTemp: dom(alunoProf_i) & 99: INT | alunoProf_i:=alunoProf_i<+{alunoTemp|->99}) [] not(profAtual = pp) ==> skip);(alunoTemp+1: INT & alunoTemp: INT & 1: INT | alunoTemp:=alunoTemp+1) INVARIANT alunoTemp: NAT & alunoTemp<100 & alunoTemp: dom(alunoProf_i) VARIANT 100-alunoTemp END;(0: INT | treinoTemp:=0);WHILE treinoTemp<100 DO (treinoProf_i(treinoTemp): INT & treinoTemp: dom(treinoProf_i) | profAtual:=treinoProf_i(treinoTemp));(profAtual = pp ==> (treinoTemp: dom(treinoProf_i) & 99: INT | treinoProf_i:=treinoProf_i<+{treinoTemp|->99}) [] not(profAtual = pp) ==> skip);(treinoTemp+1: INT & treinoTemp: INT & 1: INT | treinoTemp:=treinoTemp+1) INVARIANT treinoTemp: NAT & treinoTemp<100 VARIANT 100-treinoTemp END);(pp: dom(prof_i) | prof_i:=prof_i<+{pp|->FALSE}));
  Expanded_List_Substitution(Implementation(Gym_i),addExercicioTreino)==(ex: EXERCICIO & tt: TREINO & tt: treino & ss: SERIES & rp: REPETICOES & not(#(ss0,rp0).(ss0: SERIES & rp0: REPETICOES & tt|->(ex,ss0,rp0): treinoExercicio)) | (tt,ex,ss,rp: dom(treinoExercicio_i) | treinoExercicio_i:=treinoExercicio_i<+{(tt,ex,ss,rp)|->TRUE});(ex: dom(exercicio_i) | exercicio_i:=exercicio_i<+{ex|->TRUE}));
  Expanded_List_Substitution(Implementation(Gym_i),addTreinoAluno)==(aa: ALUNO & tt: TREINO & aa: aluno & tt: treino & dd: DIA & tt|->(aa,dd)/:treinoAluno & treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa)/=inativo & tt,aa,dd: dom(treinoAluno_i) | treinoAluno_i:=treinoAluno_i<+{(tt,aa,dd)|->TRUE});
  Expanded_List_Substitution(Implementation(Gym_i),addTreinoProf)==(pp: PROF & pp: prof & tt: TREINO & tt/:dom(treinoProf) | (tt: dom(treino_i) | treino_i:=treino_i<+{tt|->TRUE});(tt: dom(treinoProf_i) & pp: INT | treinoProf_i:=treinoProf_i<+{tt|->pp}));
  Expanded_List_Substitution(Implementation(Gym_i),addAluno)==(aa: ALUNO & pp: PROF & pp: prof & aa/:dom(alunoProf) & aa/:dom(alunoStatus) & alunoPresente\/{aa|->ausente}: aluno\/{aa} --> PRESENTE & (alunoPresente\/{aa|->ausente})~[{presente}]/\(alunoStatus\/{aa|->ativo})~[{inativo}] = {} | (aa: dom(aluno_i) | aluno_i:=aluno_i<+{aa|->TRUE});(aa: dom(alunoProf_i) & pp: INT | alunoProf_i:=alunoProf_i<+{aa|->pp});(aa: dom(alunoStatus_i) | alunoStatus_i:=alunoStatus_i<+{aa|->ativo});(aa: dom(alunoPresente_i) | alunoPresente_i:=alunoPresente_i<+{aa|->ausente}));
  Expanded_List_Substitution(Implementation(Gym_i),addProf)==(pp: PROF & pp/:prof & pp: dom(prof_i) | prof_i:=prof_i<+{pp|->TRUE});
  List_Substitution(Implementation(Gym_i),addProf)==(prof_i(pp):=TRUE);
  List_Substitution(Implementation(Gym_i),addAluno)==(aluno_i(aa):=TRUE;alunoProf_i(aa):=pp;alunoStatus_i(aa):=ativo;alunoPresente_i(aa):=ausente);
  List_Substitution(Implementation(Gym_i),addTreinoProf)==(treino_i(tt):=TRUE;treinoProf_i(tt):=pp);
  List_Substitution(Implementation(Gym_i),addTreinoAluno)==(treinoAluno_i(tt,aa,dd):=TRUE);
  List_Substitution(Implementation(Gym_i),addExercicioTreino)==(treinoExercicio_i(tt,ex,ss,rp):=TRUE;exercicio_i(ex):=TRUE);
  List_Substitution(Implementation(Gym_i),deleteProf)==(VAR alunoTemp,profAtual,treinoTemp IN alunoTemp:=0;WHILE alunoTemp<100 DO profAtual:=alunoProf_i(alunoTemp);IF profAtual = pp THEN alunoProf_i(alunoTemp):=99 ELSE skip END;alunoTemp:=alunoTemp+1 INVARIANT alunoTemp: NAT & alunoTemp<100 & alunoTemp: dom(alunoProf_i) VARIANT 100-alunoTemp END;treinoTemp:=0;WHILE treinoTemp<100 DO profAtual:=treinoProf_i(treinoTemp);IF profAtual = pp THEN treinoProf_i(treinoTemp):=99 ELSE skip END;treinoTemp:=treinoTemp+1 INVARIANT treinoTemp: NAT & treinoTemp<100 VARIANT 100-treinoTemp END END;prof_i(pp):=FALSE);
  List_Substitution(Implementation(Gym_i),deleteAluno)==(VAR treinoTemp,diaTemp IN treinoTemp:=0;WHILE treinoTemp<100 DO diaTemp:=0;WHILE diaTemp<7 DO treinoAluno_i(treinoTemp,aa,diaTemp):=FALSE;diaTemp:=diaTemp+1 INVARIANT diaTemp: NAT & diaTemp<=7 VARIANT 7-diaTemp END;treinoTemp:=treinoTemp+1 INVARIANT treinoTemp: NAT & treinoTemp<=100 VARIANT 100-treinoTemp END END;alunoStatus_i(aa):=inativo;alunoPresente_i(aa):=ausente;alunoProf_i(aa):=99;aluno_i(aa):=FALSE);
  List_Substitution(Implementation(Gym_i),deleteTreinoAluno)==(treinoAluno_i(tt,aa,dd):=FALSE);
  List_Substitution(Implementation(Gym_i),deleteExercicioTreino)==(treinoExercicio_i(tt,ex,ss,rp):=FALSE);
  List_Substitution(Implementation(Gym_i),updateAlunoProf)==(VAR treinoTemp,diaTemp IN treinoTemp:=0;WHILE treinoTemp<100 DO diaTemp:=0;WHILE diaTemp<7 DO treinoAluno_i(treinoTemp,aa,diaTemp):=FALSE;diaTemp:=diaTemp+1 INVARIANT diaTemp: NAT & diaTemp<=7 VARIANT 7-diaTemp END;treinoTemp:=treinoTemp+1 INVARIANT treinoTemp: NAT & treinoTemp<=100 VARIANT 100-treinoTemp END END;alunoProf_i(aa):=pp);
  List_Substitution(Implementation(Gym_i),updatePagamento)==(alunoStatus_i(aa):=ativo);
  List_Substitution(Implementation(Gym_i),setAlunoInativo)==(alunoStatus_i(aa):=inativo);
  List_Substitution(Implementation(Gym_i),updateDiaTreino)==(treinoAluno_i(tt,aa,ddAnterior):=FALSE;treinoAluno_i(tt,aa,ddNovo):=TRUE);
  List_Substitution(Implementation(Gym_i),updateExercicioTreino)==(VAR ss,rp,tempTreinoExercicio IN ss:=0;WHILE ss<=5 DO rp:=0;WHILE rp<=20 DO tempTreinoExercicio:=treinoExercicio_i(tt,ex,ss,rp);IF tempTreinoExercicio = TRUE THEN treinoExercicio_i(tt,ex,ss,rp):=FALSE ELSE skip END;rp:=rp+1 INVARIANT rp: NAT & rp<=21 VARIANT 21-rp END;ss:=ss+1 INVARIANT ss: NAT & ss<=6 VARIANT 6-ss END END;treinoExercicio_i(tt,ex,newSs,newRp):=TRUE);
  List_Substitution(Implementation(Gym_i),checkIn)==(alunoPresente_i(aa):=presente);
  List_Substitution(Implementation(Gym_i),checkOut)==(alunoPresente_i(aa):=ausente);
  List_Substitution(Implementation(Gym_i),quantidadeAlunos)==(VAR alunoCount,ii,alunoAtual IN alunoCount:=0;ii:=0;WHILE ii<99 DO alunoAtual:=aluno_i(ii);IF alunoAtual = TRUE THEN alunoCount:=alunoCount+1 END;ii:=ii+1 INVARIANT ii<=99 & ii: NAT & alunoCount<99 VARIANT 99-ii END;aa:=alunoCount END);
  List_Substitution(Implementation(Gym_i),quantidadeProfessores)==(VAR ii,professorAtual,professorCount IN ii:=0;professorCount:=0;WHILE ii<99 DO professorAtual:=prof_i(ii);IF professorAtual = TRUE THEN professorCount:=professorCount+1 END;ii:=ii+1 INVARIANT ii<=99 & ii: NAT & professorCount<99 VARIANT 99-ii END;pp:=professorCount END);
  List_Substitution(Implementation(Gym_i),alunosPorProf)==(VAR ii,alunoCount,profAtual IN ii:=0;alunoCount:=0;WHILE ii<99 DO profAtual:=alunoProf_i(ii);IF profAtual = pp THEN alunoCount:=alunoCount+1 END;ii:=ii+1 INVARIANT ii: NAT & ii<=99 & alunoCount<99 VARIANT 99-ii END;ap:=alunoCount END);
  List_Substitution(Implementation(Gym_i),alunoDeProfessor)==(VAR ap IN ap:=alunoProf_i(aa);IF ap = pp THEN resp:=TRUE ELSE resp:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canAddProf)==(VAR profAtual IN profAtual:=prof_i(pp);IF pp/=99 & profAtual = FALSE THEN canAdd:=TRUE ELSE canAdd:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canDeleteProf)==(VAR profAtual,ii,profCount,verificarProf IN profAtual:=prof_i(pp);profCount:=0;ii:=0;WHILE ii<99 DO verificarProf:=prof_i(ii);IF verificarProf = TRUE THEN profCount:=profCount+1 END;ii:=ii+1 INVARIANT ii: NAT & ii<=99 & profCount<=99 VARIANT 99-ii END;IF pp/=99 & profAtual = TRUE & profCount>1 THEN canDel:=TRUE ELSE canDel:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canAddAluno)==(VAR alunoAtual,profAtual IN alunoAtual:=aluno_i(aa);profAtual:=prof_i(pp);IF aa/=99 & pp/=99 & alunoAtual = FALSE & profAtual = TRUE THEN canAdd:=TRUE ELSE canAdd:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canDeleteAluno)==(VAR alunoAtual,statusAtual IN alunoAtual:=aluno_i(aa);statusAtual:=alunoStatus_i(aa);IF aa/=99 & alunoAtual = TRUE & statusAtual = inativo THEN canDel:=TRUE ELSE canDel:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canAddTreinoProf)==(VAR treinoAtual,profAtual IN treinoAtual:=treino_i(tt);profAtual:=prof_i(pp);IF tt/=99 & pp/=99 & treinoAtual = FALSE & profAtual = TRUE THEN canAdd:=TRUE ELSE canAdd:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canAddTreinoAluno)==(VAR alunoAtual,treinoAtual,statusAtual,profTreino,profAluno,treinoJaExiste IN alunoAtual:=aluno_i(aa);treinoAtual:=treino_i(tt);statusAtual:=alunoStatus_i(aa);profTreino:=treinoProf_i(tt);profAluno:=alunoProf_i(aa);treinoJaExiste:=treinoAluno_i(tt,aa,dd);IF aa/=99 & tt/=99 & alunoAtual = TRUE & treinoAtual = TRUE & statusAtual = ativo & profTreino = profAluno & treinoJaExiste = FALSE THEN canAdd:=TRUE ELSE canAdd:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canAddExercicioTreino)==(VAR treinoAtual,exercicioJaExiste,ss0,rp0,verificarTreino IN treinoAtual:=treino_i(tt);exercicioJaExiste:=FALSE;ss0:=0;WHILE ss0<=5 & exercicioJaExiste = FALSE DO rp0:=0;WHILE rp0<=20 & exercicioJaExiste = FALSE DO verificarTreino:=treinoExercicio_i(tt,ex,ss0,rp0);IF verificarTreino = TRUE THEN exercicioJaExiste:=TRUE END;rp0:=rp0+1 INVARIANT rp0: NAT & rp0<=21 VARIANT 21-rp0 END;ss0:=ss0+1 INVARIANT ss0: NAT & ss0<=6 VARIANT 6-ss0 END;IF ex/=99 & tt/=99 & treinoAtual = TRUE & ss>=0 & ss<=5 & rp>=0 & rp<=20 & exercicioJaExiste = FALSE THEN canAdd:=TRUE ELSE canAdd:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canDeleteTreinoAluno)==(VAR treinoAtual,alunoAtual,treinoExiste IN treinoAtual:=treino_i(tt);alunoAtual:=aluno_i(aa);treinoExiste:=treinoAluno_i(tt,aa,dd);IF tt/=99 & aa/=99 & treinoAtual = TRUE & alunoAtual = TRUE & treinoExiste = TRUE THEN canDel:=TRUE ELSE canDel:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canDeleteExercicioTreino)==(VAR treinoAtual,exercicioAtual,exercicioExiste IN treinoAtual:=treino_i(tt);exercicioAtual:=exercicio_i(ex);exercicioExiste:=treinoExercicio_i(tt,ex,ss,rp);IF tt/=99 & ex/=99 & treinoAtual = TRUE & exercicioAtual = TRUE & ss>=0 & ss<=5 & rp>=0 & rp<=20 & exercicioExiste = TRUE THEN canDel:=TRUE ELSE canDel:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canUpdateAlunoProf)==(VAR alunoAtual,profAtual,statusAtual,profAlunoAtual IN alunoAtual:=aluno_i(aa);profAtual:=prof_i(pp);statusAtual:=alunoStatus_i(aa);profAlunoAtual:=alunoProf_i(aa);IF aa/=99 & pp/=99 & alunoAtual = TRUE & profAtual = TRUE & statusAtual = ativo & profAlunoAtual/=pp THEN canUpdate:=TRUE ELSE canUpdate:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canUpdatePagamento)==(VAR alunoAtual,statusAtual IN alunoAtual:=aluno_i(aa);statusAtual:=alunoStatus_i(aa);IF aa/=99 & alunoAtual = TRUE & statusAtual = inativo THEN canUpdate:=TRUE ELSE canUpdate:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canSetAlunoInativo)==(VAR alunoAtual,statusAtual IN alunoAtual:=aluno_i(aa);statusAtual:=alunoStatus_i(aa);IF aa/=99 & alunoAtual = TRUE & statusAtual = ativo THEN canSet:=TRUE ELSE canSet:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canUpdateDiaTreino)==(VAR treinoAtual,alunoAtual,statusAtual,treinoExiste IN treinoAtual:=treino_i(tt);alunoAtual:=aluno_i(aa);statusAtual:=alunoStatus_i(aa);treinoExiste:=treinoAluno_i(tt,aa,ddAnterior);IF tt/=99 & aa/=99 & treinoAtual = TRUE & alunoAtual = TRUE & statusAtual = ativo & ddAnterior/=ddNovo & treinoExiste = TRUE THEN canUpdate:=TRUE ELSE canUpdate:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canUpdateExercicioTreino)==(VAR treinoAtual,exercicioAtual,exercicioJaExiste,ss0,rp0,verificarTreinoExercicio IN treinoAtual:=treino_i(tt);exercicioAtual:=exercicio_i(ex);exercicioJaExiste:=FALSE;ss0:=0;WHILE ss0<=5 & exercicioJaExiste = FALSE DO rp0:=0;WHILE rp0<=20 & exercicioJaExiste = FALSE DO verificarTreinoExercicio:=treinoExercicio_i(tt,ex,ss0,rp0);IF verificarTreinoExercicio = TRUE THEN exercicioJaExiste:=TRUE END;rp0:=rp0+1 INVARIANT rp0: NAT & rp0<=21 VARIANT 21-rp0 END;ss0:=ss0+1 INVARIANT ss0: NAT & ss0<=6 VARIANT 6-ss0 END;IF tt/=99 & ex/=99 & treinoAtual = TRUE & exercicioAtual = TRUE & newSs>=0 & newSs<=5 & newRp>=0 & newRp<=20 & exercicioJaExiste = TRUE THEN canUpdate:=TRUE ELSE canUpdate:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canCheckIn)==(VAR alunoAtual,statusAtual,presenteAtual IN alunoAtual:=aluno_i(aa);statusAtual:=alunoStatus_i(aa);presenteAtual:=alunoPresente_i(aa);IF aa/=99 & alunoAtual = TRUE & statusAtual = ativo & presenteAtual = ausente THEN canCheck:=TRUE ELSE canCheck:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canCheckOut)==(VAR alunoAtual,presenteAtual IN alunoAtual:=aluno_i(aa);presenteAtual:=alunoPresente_i(aa);IF aa/=99 & alunoAtual = TRUE & presenteAtual = presente THEN canCheck:=TRUE ELSE canCheck:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canQuantidadeAlunos)==(VAR ii,temAlunos,verificarAluno IN temAlunos:=FALSE;ii:=0;WHILE ii<99 & temAlunos = FALSE DO verificarAluno:=aluno_i(ii);IF verificarAluno = TRUE THEN temAlunos:=TRUE END;ii:=ii+1 INVARIANT ii: NAT & ii<=99 VARIANT 99-ii END;canConsult:=temAlunos END);
  List_Substitution(Implementation(Gym_i),canQuantidadeProfessores)==(VAR ii,temProfs,verificarProf IN temProfs:=FALSE;ii:=0;WHILE ii<99 & temProfs = FALSE DO verificarProf:=prof_i(ii);IF verificarProf = TRUE THEN temProfs:=TRUE END;ii:=ii+1 INVARIANT ii: NAT & ii<=99 VARIANT 99-ii END;canConsult:=temProfs END);
  List_Substitution(Implementation(Gym_i),canAlunosPorProf)==(VAR profAtual,ii,temAlunos,verificarAlunoProf,verificarAluno IN profAtual:=prof_i(pp);temAlunos:=FALSE;ii:=0;WHILE ii<99 & temAlunos = FALSE DO verificarAlunoProf:=alunoProf_i(ii);verificarAluno:=aluno_i(ii);IF verificarAlunoProf = pp & verificarAluno = TRUE THEN temAlunos:=TRUE END;ii:=ii+1 INVARIANT ii: NAT & ii<=99 VARIANT 99-ii END;IF pp/=99 & profAtual = TRUE & temAlunos = TRUE THEN canConsult:=TRUE ELSE canConsult:=FALSE END END);
  List_Substitution(Implementation(Gym_i),canAlunoDeProfessor)==(VAR alunoAtual,profAtual IN alunoAtual:=aluno_i(aa);profAtual:=prof_i(pp);IF aa/=99 & pp/=99 & alunoAtual = TRUE & profAtual = TRUE THEN canConsult:=TRUE ELSE canConsult:=FALSE END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Gym_i))==(DIA,SERIES,REPETICOES);
  Inherited_List_Constants(Implementation(Gym_i))==(DIA,SERIES,REPETICOES);
  List_Constants(Implementation(Gym_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(Gym_i),PRESENTE)==({presente,ausente});
  Context_List_Enumerated(Implementation(Gym_i))==(?);
  Context_List_Defered(Implementation(Gym_i))==(?);
  Context_List_Sets(Implementation(Gym_i))==(?);
  List_Own_Enumerated(Implementation(Gym_i))==(STATUS,PRESENTE);
  List_Valuable_Sets(Implementation(Gym_i))==(ALUNO,PROF,TREINO,EXERCICIO);
  Inherited_List_Enumerated(Implementation(Gym_i))==(STATUS,PRESENTE);
  Inherited_List_Defered(Implementation(Gym_i))==(ALUNO,PROF,TREINO,EXERCICIO);
  Inherited_List_Sets(Implementation(Gym_i))==(ALUNO,PROF,TREINO,EXERCICIO,STATUS,PRESENTE);
  List_Enumerated(Implementation(Gym_i))==(?);
  List_Defered(Implementation(Gym_i))==(?);
  List_Sets(Implementation(Gym_i))==(?);
  Set_Definition(Implementation(Gym_i),STATUS)==({ativo,inativo});
  Set_Definition(Implementation(Gym_i),EXERCICIO)==(?);
  Set_Definition(Implementation(Gym_i),TREINO)==(?);
  Set_Definition(Implementation(Gym_i),PROF)==(?);
  Set_Definition(Implementation(Gym_i),ALUNO)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Gym_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Gym_i))==(?);
  List_HiddenConstants(Implementation(Gym_i))==(?);
  External_List_HiddenConstants(Implementation(Gym_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Gym_i))==(DIA = 0..6 & SERIES = 0..5 & REPETICOES = 0..20 & ALUNO: FIN(INTEGER) & not(ALUNO = {}) & PROF: FIN(INTEGER) & not(PROF = {}) & TREINO: FIN(INTEGER) & not(TREINO = {}) & EXERCICIO: FIN(INTEGER) & not(EXERCICIO = {}) & STATUS: FIN(INTEGER) & not(STATUS = {}) & PRESENTE: FIN(INTEGER) & not(PRESENTE = {}));
  Context_List_Properties(Implementation(Gym_i))==(btrue);
  Inherited_List_Properties(Implementation(Gym_i))==(btrue);
  List_Properties(Implementation(Gym_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(Gym_i))==(btrue);
  Values_Subs(Implementation(Gym_i))==(ALUNO,PROF,DIA,TREINO,EXERCICIO,SERIES,REPETICOES: 0..99,0..99,0..6,0..99,0..99,0..5,0..20);
  List_Values(Implementation(Gym_i))==(ALUNO = 0..99;PROF = 0..99;DIA = 0..6;TREINO = 0..99;EXERCICIO = 0..99;SERIES = 0..5;REPETICOES = 0..20)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(Gym_i))==(Type(aluno_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*btype(BOOL,0,1)));Type(prof_i) == Mvv(SetOf(btype(INTEGER,"[PROF","]PROF")*btype(BOOL,0,1)));Type(treino_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(BOOL,0,1)));Type(exercicio_i) == Mvv(SetOf(btype(INTEGER,"[EXERCICIO","]EXERCICIO")*btype(BOOL,0,1)));Type(alunoProf_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*btype(INTEGER,"[PROF","]PROF")));Type(treinoProf_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(INTEGER,"[PROF","]PROF")));Type(treinoAluno_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(INTEGER,"[ALUNO","]ALUNO")*btype(INTEGER,"[DIA","]DIA")*btype(BOOL,0,1)));Type(treinoExercicio_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(INTEGER,"[EXERCICIO","]EXERCICIO")*btype(INTEGER,"[SERIES","]SERIES")*btype(INTEGER,"[REPETICOES","]REPETICOES")*btype(BOOL,0,1)));Type(alunoStatus_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*etype(STATUS,0,1)));Type(alunoPresente_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*etype(PRESENTE,0,1))));
  Operations(Implementation(Gym_i))==(Type(canAlunoDeProfessor) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canAlunosPorProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(canQuantidadeProfessores) == Cst(btype(BOOL,?,?),No_type);Type(canQuantidadeAlunos) == Cst(btype(BOOL,?,?),No_type);Type(canCheckOut) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canCheckIn) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdateExercicioTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canUpdateDiaTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canSetAlunoInativo) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdatePagamento) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdateAlunoProf) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canDeleteExercicioTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canDeleteTreinoAluno) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?));Type(canAddExercicioTreino) == Cst(btype(BOOL,?,?),atype(EXERCICIO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canAddTreinoAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?));Type(canAddTreinoProf) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(PROF,?,?));Type(canDeleteAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canAddAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canDeleteProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(canAddProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(alunoDeProfessor) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(alunosPorProf) == Cst(btype(INTEGER,?,?),atype(PROF,?,?));Type(quantidadeProfessores) == Cst(btype(INTEGER,?,?),No_type);Type(quantidadeAlunos) == Cst(btype(INTEGER,?,?),No_type);Type(checkOut) == Cst(No_type,atype(ALUNO,?,?));Type(checkIn) == Cst(No_type,atype(ALUNO,?,?));Type(updateExercicioTreino) == Cst(No_type,atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(updateDiaTreino) == Cst(No_type,atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(setAlunoInativo) == Cst(No_type,atype(ALUNO,?,?));Type(updatePagamento) == Cst(No_type,atype(ALUNO,?,?));Type(updateAlunoProf) == Cst(No_type,atype(ALUNO,?,?)*atype(PROF,?,?));Type(deleteExercicioTreino) == Cst(No_type,atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(deleteTreinoAluno) == Cst(No_type,atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?));Type(deleteAluno) == Cst(No_type,atype(ALUNO,?,?));Type(deleteProf) == Cst(No_type,atype(PROF,?,?));Type(addExercicioTreino) == Cst(No_type,atype(EXERCICIO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(addTreinoAluno) == Cst(No_type,atype(ALUNO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?));Type(addTreinoProf) == Cst(No_type,atype(TREINO,?,?)*atype(PROF,?,?));Type(addAluno) == Cst(No_type,atype(ALUNO,?,?)*atype(PROF,?,?));Type(addProf) == Cst(No_type,atype(PROF,?,?)));
  Constants(Implementation(Gym_i))==(Type(ativo) == Cst(etype(STATUS,0,1));Type(inativo) == Cst(etype(STATUS,0,1));Type(presente) == Cst(etype(PRESENTE,0,1));Type(ausente) == Cst(etype(PRESENTE,0,1));Type(DIA) == Cst(SetOf(btype(INTEGER,"[DIA","]DIA")));Type(SERIES) == Cst(SetOf(btype(INTEGER,"[SERIES","]SERIES")));Type(REPETICOES) == Cst(SetOf(btype(INTEGER,"[REPETICOES","]REPETICOES"))))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Gym_i)) == (? | ? | ? | ? | addProf,addAluno,addTreinoProf,addTreinoAluno,addExercicioTreino,deleteProf,deleteAluno,deleteTreinoAluno,deleteExercicioTreino,updateAlunoProf,updatePagamento,setAlunoInativo,updateDiaTreino,updateExercicioTreino,checkIn,checkOut,quantidadeAlunos,quantidadeProfessores,alunosPorProf,alunoDeProfessor,canAddProf,canDeleteProf,canAddAluno,canDeleteAluno,canAddTreinoProf,canAddTreinoAluno,canAddExercicioTreino,canDeleteTreinoAluno,canDeleteExercicioTreino,canUpdateAlunoProf,canUpdatePagamento,canSetAlunoInativo,canUpdateDiaTreino,canUpdateExercicioTreino,canCheckIn,canCheckOut,canQuantidadeAlunos,canQuantidadeProfessores,canAlunosPorProf,canAlunoDeProfessor | ? | ? | ? | Gym_i);
  List_Of_HiddenCst_Ids(Implementation(Gym_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Gym_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Gym_i)) == (alunoPresente_i,alunoStatus_i,treinoExercicio_i,treinoAluno_i,treinoProf_i,alunoProf_i,exercicio_i,treino_i,prof_i,aluno_i | ?);
  List_Of_Ids_SeenBNU(Implementation(Gym_i)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Implementation(Gym_i)) == (Type(PRESENTE) == Cst(SetOf(etype(PRESENTE,0,1)));Type(STATUS) == Cst(SetOf(etype(STATUS,0,1)));Type(EXERCICIO) == Cst(SetOf(btype(INTEGER,"[EXERCICIO","]EXERCICIO")));Type(TREINO) == Cst(SetOf(btype(INTEGER,"[TREINO","]TREINO")));Type(PROF) == Cst(SetOf(btype(INTEGER,"[PROF","]PROF")));Type(ALUNO) == Cst(SetOf(btype(INTEGER,"[ALUNO","]ALUNO"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(Gym_i)) == (Type(REPETICOES) == Cst(SetOf(btype(INTEGER,"[REPETICOES","]REPETICOES")));Type(SERIES) == Cst(SetOf(btype(INTEGER,"[SERIES","]SERIES")));Type(DIA) == Cst(SetOf(btype(INTEGER,"[DIA","]DIA")));Type(ausente) == Cst(etype(PRESENTE,0,1));Type(presente) == Cst(etype(PRESENTE,0,1));Type(inativo) == Cst(etype(STATUS,0,1));Type(ativo) == Cst(etype(STATUS,0,1)))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Gym_i)) == (Type(alunoPresente_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*etype(PRESENTE,0,1)));Type(alunoStatus_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*etype(STATUS,0,1)));Type(treinoExercicio_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(INTEGER,"[EXERCICIO","]EXERCICIO")*btype(INTEGER,"[SERIES","]SERIES")*btype(INTEGER,"[REPETICOES","]REPETICOES")*btype(BOOL,0,1)));Type(treinoAluno_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(INTEGER,"[ALUNO","]ALUNO")*btype(INTEGER,"[DIA","]DIA")*btype(BOOL,0,1)));Type(treinoProf_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(INTEGER,"[PROF","]PROF")));Type(alunoProf_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*btype(INTEGER,"[PROF","]PROF")));Type(exercicio_i) == Mvv(SetOf(btype(INTEGER,"[EXERCICIO","]EXERCICIO")*btype(BOOL,0,1)));Type(treino_i) == Mvv(SetOf(btype(INTEGER,"[TREINO","]TREINO")*btype(BOOL,0,1)));Type(prof_i) == Mvv(SetOf(btype(INTEGER,"[PROF","]PROF")*btype(BOOL,0,1)));Type(aluno_i) == Mvv(SetOf(btype(INTEGER,"[ALUNO","]ALUNO")*btype(BOOL,0,1))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Gym_i),?, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(jj) == Lvl(btype(INTEGER,?,?));Type(kk) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),?, 2) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(jj) == Lvl(btype(INTEGER,?,?));Type(kk) == Lvl(btype(INTEGER,?,?));Type(ll) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),deleteProf, 1) == (Type(alunoTemp) == Lvl(btype(INTEGER,?,?));Type(profAtual) == Lvl(btype(INTEGER,?,?));Type(treinoTemp) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),deleteAluno, 1) == (Type(treinoTemp) == Lvl(btype(INTEGER,?,?));Type(diaTemp) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),updateAlunoProf, 1) == (Type(treinoTemp) == Lvl(btype(INTEGER,?,?));Type(diaTemp) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),updateExercicioTreino, 1) == (Type(ss) == Lvl(btype(INTEGER,?,?));Type(rp) == Lvl(btype(INTEGER,?,?));Type(tempTreinoExercicio) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),quantidadeAlunos, 1) == (Type(alunoCount) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(alunoAtual) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),quantidadeProfessores, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(professorAtual) == Lvl(btype(BOOL,?,?));Type(professorCount) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),alunosPorProf, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(alunoCount) == Lvl(btype(INTEGER,?,?));Type(profAtual) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),alunoDeProfessor, 1) == (Type(ap) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),canAddProf, 1) == (Type(profAtual) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canDeleteProf, 1) == (Type(profAtual) == Lvl(btype(BOOL,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(profCount) == Lvl(btype(INTEGER,?,?));Type(verificarProf) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canAddAluno, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(profAtual) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canDeleteAluno, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?)));
  Variables_Loc(Implementation(Gym_i),canAddTreinoProf, 1) == (Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(profAtual) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canAddTreinoAluno, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?));Type(profTreino) == Lvl(btype(INTEGER,?,?));Type(profAluno) == Lvl(btype(INTEGER,?,?));Type(treinoJaExiste) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canAddExercicioTreino, 1) == (Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(exercicioJaExiste) == Lvl(btype(BOOL,?,?));Type(ss0) == Lvl(btype(INTEGER,?,?));Type(rp0) == Lvl(btype(INTEGER,?,?));Type(verificarTreino) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canDeleteTreinoAluno, 1) == (Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(treinoExiste) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canDeleteExercicioTreino, 1) == (Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(exercicioAtual) == Lvl(btype(BOOL,?,?));Type(exercicioExiste) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canUpdateAlunoProf, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(profAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?));Type(profAlunoAtual) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gym_i),canUpdatePagamento, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?)));
  Variables_Loc(Implementation(Gym_i),canSetAlunoInativo, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?)));
  Variables_Loc(Implementation(Gym_i),canUpdateDiaTreino, 1) == (Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?));Type(treinoExiste) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canUpdateExercicioTreino, 1) == (Type(treinoAtual) == Lvl(btype(BOOL,?,?));Type(exercicioAtual) == Lvl(btype(BOOL,?,?));Type(exercicioJaExiste) == Lvl(btype(BOOL,?,?));Type(ss0) == Lvl(btype(INTEGER,?,?));Type(rp0) == Lvl(btype(INTEGER,?,?));Type(verificarTreinoExercicio) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canCheckIn, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(statusAtual) == Lvl(etype(STATUS,?,?));Type(presenteAtual) == Lvl(etype(PRESENTE,?,?)));
  Variables_Loc(Implementation(Gym_i),canCheckOut, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(presenteAtual) == Lvl(etype(PRESENTE,?,?)));
  Variables_Loc(Implementation(Gym_i),canQuantidadeAlunos, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(temAlunos) == Lvl(btype(BOOL,?,?));Type(verificarAluno) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canQuantidadeProfessores, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(temProfs) == Lvl(btype(BOOL,?,?));Type(verificarProf) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canAlunosPorProf, 1) == (Type(profAtual) == Lvl(btype(BOOL,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(temAlunos) == Lvl(btype(BOOL,?,?));Type(verificarAlunoProf) == Lvl(btype(INTEGER,?,?));Type(verificarAluno) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Gym_i),canAlunoDeProfessor, 1) == (Type(alunoAtual) == Lvl(btype(BOOL,?,?));Type(profAtual) == Lvl(btype(BOOL,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(Gym_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Gym_i))==(aluno_i: POW(INTEGER*BOOL) & prof_i: POW(INTEGER*BOOL) & treino_i: POW(INTEGER*BOOL) & exercicio_i: POW(INTEGER*BOOL) & alunoProf_i: POW(INTEGER*INTEGER) & treinoProf_i: POW(INTEGER*INTEGER) & treinoAluno_i: POW(INTEGER*INTEGER*INTEGER*BOOL) & treinoExercicio_i: POW(INTEGER*INTEGER*INTEGER*INTEGER*BOOL) & alunoStatus_i: POW(INTEGER*STATUS) & alunoPresente_i: POW(INTEGER*PRESENTE))
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
