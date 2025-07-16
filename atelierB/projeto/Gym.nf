Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Gym))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Gym))==(Machine(Gym));
  Level(Machine(Gym))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Gym)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Gym))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Gym))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Gym))==(?);
  List_Includes(Machine(Gym))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Gym))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Gym))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Gym))==(?);
  Context_List_Variables(Machine(Gym))==(?);
  Abstract_List_Variables(Machine(Gym))==(?);
  Local_List_Variables(Machine(Gym))==(alunoPresente,alunoStatus,treinoExercicio,treinoAluno,treinoProf,alunoProf,exercicio,treino,prof,aluno);
  List_Variables(Machine(Gym))==(alunoPresente,alunoStatus,treinoExercicio,treinoAluno,treinoProf,alunoProf,exercicio,treino,prof,aluno);
  External_List_Variables(Machine(Gym))==(alunoPresente,alunoStatus,treinoExercicio,treinoAluno,treinoProf,alunoProf,exercicio,treino,prof,aluno)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Gym))==(?);
  Abstract_List_VisibleVariables(Machine(Gym))==(?);
  External_List_VisibleVariables(Machine(Gym))==(?);
  Expanded_List_VisibleVariables(Machine(Gym))==(?);
  List_VisibleVariables(Machine(Gym))==(?);
  Internal_List_VisibleVariables(Machine(Gym))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Gym))==(btrue);
  Gluing_List_Invariant(Machine(Gym))==(btrue);
  Expanded_List_Invariant(Machine(Gym))==(btrue);
  Abstract_List_Invariant(Machine(Gym))==(btrue);
  Context_List_Invariant(Machine(Gym))==(btrue);
  List_Invariant(Machine(Gym))==(aluno <: ALUNO & prof <: PROF & treino <: TREINO & exercicio <: EXERCICIO & alunoProf: aluno --> prof & alunoStatus: aluno --> STATUS & treinoProf: treino --> prof & treinoAluno: treino <-> aluno*DIA & treinoExercicio: treino <-> exercicio*SERIES*REPETICOES & alunoPresente: aluno --> PRESENTE & alunoPresente~[{presente}]/\alunoStatus~[{inativo}] = {} & !(al1,al2,dd1,dd2).(al1: aluno & al2: aluno & dd1: DIA & dd2: DIA & al1/=al2 & al1,dd1: ran(treinoAluno) & al2,dd2: ran(treinoAluno) & treinoAluno~[{al1|->dd1}] = treinoAluno~[{al2|->dd2}] => alunoProf[{al1}] = alunoProf[{al2}]) & !(tt,aa,dd).(tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno => treinoProf(tt) = alunoProf(aa)) & !(tt,ex,ss1,ss2,rp1,rp2).(tt: treino & ex: exercicio & ss1: SERIES & ss2: SERIES & rp1: REPETICOES & rp2: REPETICOES & tt|->(ex,ss1,rp1): treinoExercicio & tt|->(ex,ss2,rp2): treinoExercicio => ss1 = ss2 & rp1 = rp2))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Gym))==(btrue);
  Abstract_List_Assertions(Machine(Gym))==(btrue);
  Context_List_Assertions(Machine(Gym))==(btrue);
  List_Assertions(Machine(Gym))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Gym))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Gym))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Gym))==(alunoProf,treinoProf,treinoAluno,alunoStatus,treinoExercicio,aluno,prof,treino,exercicio,alunoPresente:={},{},{},{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(Gym))==(skip);
  List_Initialisation(Machine(Gym))==(alunoProf:={} || treinoProf:={} || treinoAluno:={} || alunoStatus:={} || treinoExercicio:={} || aluno:={} || prof:={} || treino:={} || exercicio:={} || alunoPresente:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Gym))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Gym))==(btrue);
  List_Constraints(Machine(Gym))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Gym))==(addProf,addAluno,addTreinoProf,addTreinoAluno,addExercicioTreino,deleteProf,deleteAluno,deleteTreinoAluno,deleteExercicioTreino,updateAlunoProf,updatePagamento,setAlunoInativo,updateDiaTreino,updateExercicioTreino,checkIn,checkOut,quantidadeAlunos,quantidadeProfessores,alunosPorProf,alunoDeProfessor,canAddProf,canDeleteProf,canAddAluno,canDeleteAluno,canAddTreinoProf,canAddTreinoAluno,canAddExercicioTreino,canDeleteTreinoAluno,canDeleteExercicioTreino,canUpdateAlunoProf,canUpdatePagamento,canSetAlunoInativo,canUpdateDiaTreino,canUpdateExercicioTreino,canCheckIn,canCheckOut,canQuantidadeAlunos,canQuantidadeProfessores,canAlunosPorProf,canAlunoDeProfessor);
  List_Operations(Machine(Gym))==(addProf,addAluno,addTreinoProf,addTreinoAluno,addExercicioTreino,deleteProf,deleteAluno,deleteTreinoAluno,deleteExercicioTreino,updateAlunoProf,updatePagamento,setAlunoInativo,updateDiaTreino,updateExercicioTreino,checkIn,checkOut,quantidadeAlunos,quantidadeProfessores,alunosPorProf,alunoDeProfessor,canAddProf,canDeleteProf,canAddAluno,canDeleteAluno,canAddTreinoProf,canAddTreinoAluno,canAddExercicioTreino,canDeleteTreinoAluno,canDeleteExercicioTreino,canUpdateAlunoProf,canUpdatePagamento,canSetAlunoInativo,canUpdateDiaTreino,canUpdateExercicioTreino,canCheckIn,canCheckOut,canQuantidadeAlunos,canQuantidadeProfessores,canAlunosPorProf,canAlunoDeProfessor)
END
&
THEORY ListInputX IS
  List_Input(Machine(Gym),addProf)==(pp);
  List_Input(Machine(Gym),addAluno)==(aa,pp);
  List_Input(Machine(Gym),addTreinoProf)==(tt,pp);
  List_Input(Machine(Gym),addTreinoAluno)==(aa,tt,dd);
  List_Input(Machine(Gym),addExercicioTreino)==(ex,tt,ss,rp);
  List_Input(Machine(Gym),deleteProf)==(pp);
  List_Input(Machine(Gym),deleteAluno)==(aa);
  List_Input(Machine(Gym),deleteTreinoAluno)==(tt,aa,dd);
  List_Input(Machine(Gym),deleteExercicioTreino)==(tt,ex,ss,rp);
  List_Input(Machine(Gym),updateAlunoProf)==(aa,pp);
  List_Input(Machine(Gym),updatePagamento)==(aa);
  List_Input(Machine(Gym),setAlunoInativo)==(aa);
  List_Input(Machine(Gym),updateDiaTreino)==(tt,aa,ddAnterior,ddNovo);
  List_Input(Machine(Gym),updateExercicioTreino)==(tt,ex,newSs,newRp);
  List_Input(Machine(Gym),checkIn)==(aa);
  List_Input(Machine(Gym),checkOut)==(aa);
  List_Input(Machine(Gym),quantidadeAlunos)==(?);
  List_Input(Machine(Gym),quantidadeProfessores)==(?);
  List_Input(Machine(Gym),alunosPorProf)==(pp);
  List_Input(Machine(Gym),alunoDeProfessor)==(aa,pp);
  List_Input(Machine(Gym),canAddProf)==(pp);
  List_Input(Machine(Gym),canDeleteProf)==(pp);
  List_Input(Machine(Gym),canAddAluno)==(aa,pp);
  List_Input(Machine(Gym),canDeleteAluno)==(aa);
  List_Input(Machine(Gym),canAddTreinoProf)==(tt,pp);
  List_Input(Machine(Gym),canAddTreinoAluno)==(aa,tt,dd);
  List_Input(Machine(Gym),canAddExercicioTreino)==(ex,tt,ss,rp);
  List_Input(Machine(Gym),canDeleteTreinoAluno)==(tt,aa,dd);
  List_Input(Machine(Gym),canDeleteExercicioTreino)==(tt,ex,ss,rp);
  List_Input(Machine(Gym),canUpdateAlunoProf)==(aa,pp);
  List_Input(Machine(Gym),canUpdatePagamento)==(aa);
  List_Input(Machine(Gym),canSetAlunoInativo)==(aa);
  List_Input(Machine(Gym),canUpdateDiaTreino)==(tt,aa,ddAnterior,ddNovo);
  List_Input(Machine(Gym),canUpdateExercicioTreino)==(tt,ex,newSs,newRp);
  List_Input(Machine(Gym),canCheckIn)==(aa);
  List_Input(Machine(Gym),canCheckOut)==(aa);
  List_Input(Machine(Gym),canQuantidadeAlunos)==(?);
  List_Input(Machine(Gym),canQuantidadeProfessores)==(?);
  List_Input(Machine(Gym),canAlunosPorProf)==(pp);
  List_Input(Machine(Gym),canAlunoDeProfessor)==(aa,pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Gym),addProf)==(?);
  List_Output(Machine(Gym),addAluno)==(?);
  List_Output(Machine(Gym),addTreinoProf)==(?);
  List_Output(Machine(Gym),addTreinoAluno)==(?);
  List_Output(Machine(Gym),addExercicioTreino)==(?);
  List_Output(Machine(Gym),deleteProf)==(?);
  List_Output(Machine(Gym),deleteAluno)==(?);
  List_Output(Machine(Gym),deleteTreinoAluno)==(?);
  List_Output(Machine(Gym),deleteExercicioTreino)==(?);
  List_Output(Machine(Gym),updateAlunoProf)==(?);
  List_Output(Machine(Gym),updatePagamento)==(?);
  List_Output(Machine(Gym),setAlunoInativo)==(?);
  List_Output(Machine(Gym),updateDiaTreino)==(?);
  List_Output(Machine(Gym),updateExercicioTreino)==(?);
  List_Output(Machine(Gym),checkIn)==(?);
  List_Output(Machine(Gym),checkOut)==(?);
  List_Output(Machine(Gym),quantidadeAlunos)==(aa);
  List_Output(Machine(Gym),quantidadeProfessores)==(pp);
  List_Output(Machine(Gym),alunosPorProf)==(ap);
  List_Output(Machine(Gym),alunoDeProfessor)==(resp);
  List_Output(Machine(Gym),canAddProf)==(canAdd);
  List_Output(Machine(Gym),canDeleteProf)==(canDel);
  List_Output(Machine(Gym),canAddAluno)==(canAdd);
  List_Output(Machine(Gym),canDeleteAluno)==(canDel);
  List_Output(Machine(Gym),canAddTreinoProf)==(canAdd);
  List_Output(Machine(Gym),canAddTreinoAluno)==(canAdd);
  List_Output(Machine(Gym),canAddExercicioTreino)==(canAdd);
  List_Output(Machine(Gym),canDeleteTreinoAluno)==(canDel);
  List_Output(Machine(Gym),canDeleteExercicioTreino)==(canDel);
  List_Output(Machine(Gym),canUpdateAlunoProf)==(canUpdate);
  List_Output(Machine(Gym),canUpdatePagamento)==(canUpdate);
  List_Output(Machine(Gym),canSetAlunoInativo)==(canSet);
  List_Output(Machine(Gym),canUpdateDiaTreino)==(canUpdate);
  List_Output(Machine(Gym),canUpdateExercicioTreino)==(canUpdate);
  List_Output(Machine(Gym),canCheckIn)==(canCheck);
  List_Output(Machine(Gym),canCheckOut)==(canCheck);
  List_Output(Machine(Gym),canQuantidadeAlunos)==(canConsult);
  List_Output(Machine(Gym),canQuantidadeProfessores)==(canConsult);
  List_Output(Machine(Gym),canAlunosPorProf)==(canConsult);
  List_Output(Machine(Gym),canAlunoDeProfessor)==(canConsult)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Gym),addProf)==(addProf(pp));
  List_Header(Machine(Gym),addAluno)==(addAluno(aa,pp));
  List_Header(Machine(Gym),addTreinoProf)==(addTreinoProf(tt,pp));
  List_Header(Machine(Gym),addTreinoAluno)==(addTreinoAluno(aa,tt,dd));
  List_Header(Machine(Gym),addExercicioTreino)==(addExercicioTreino(ex,tt,ss,rp));
  List_Header(Machine(Gym),deleteProf)==(deleteProf(pp));
  List_Header(Machine(Gym),deleteAluno)==(deleteAluno(aa));
  List_Header(Machine(Gym),deleteTreinoAluno)==(deleteTreinoAluno(tt,aa,dd));
  List_Header(Machine(Gym),deleteExercicioTreino)==(deleteExercicioTreino(tt,ex,ss,rp));
  List_Header(Machine(Gym),updateAlunoProf)==(updateAlunoProf(aa,pp));
  List_Header(Machine(Gym),updatePagamento)==(updatePagamento(aa));
  List_Header(Machine(Gym),setAlunoInativo)==(setAlunoInativo(aa));
  List_Header(Machine(Gym),updateDiaTreino)==(updateDiaTreino(tt,aa,ddAnterior,ddNovo));
  List_Header(Machine(Gym),updateExercicioTreino)==(updateExercicioTreino(tt,ex,newSs,newRp));
  List_Header(Machine(Gym),checkIn)==(checkIn(aa));
  List_Header(Machine(Gym),checkOut)==(checkOut(aa));
  List_Header(Machine(Gym),quantidadeAlunos)==(aa <-- quantidadeAlunos);
  List_Header(Machine(Gym),quantidadeProfessores)==(pp <-- quantidadeProfessores);
  List_Header(Machine(Gym),alunosPorProf)==(ap <-- alunosPorProf(pp));
  List_Header(Machine(Gym),alunoDeProfessor)==(resp <-- alunoDeProfessor(aa,pp));
  List_Header(Machine(Gym),canAddProf)==(canAdd <-- canAddProf(pp));
  List_Header(Machine(Gym),canDeleteProf)==(canDel <-- canDeleteProf(pp));
  List_Header(Machine(Gym),canAddAluno)==(canAdd <-- canAddAluno(aa,pp));
  List_Header(Machine(Gym),canDeleteAluno)==(canDel <-- canDeleteAluno(aa));
  List_Header(Machine(Gym),canAddTreinoProf)==(canAdd <-- canAddTreinoProf(tt,pp));
  List_Header(Machine(Gym),canAddTreinoAluno)==(canAdd <-- canAddTreinoAluno(aa,tt,dd));
  List_Header(Machine(Gym),canAddExercicioTreino)==(canAdd <-- canAddExercicioTreino(ex,tt,ss,rp));
  List_Header(Machine(Gym),canDeleteTreinoAluno)==(canDel <-- canDeleteTreinoAluno(tt,aa,dd));
  List_Header(Machine(Gym),canDeleteExercicioTreino)==(canDel <-- canDeleteExercicioTreino(tt,ex,ss,rp));
  List_Header(Machine(Gym),canUpdateAlunoProf)==(canUpdate <-- canUpdateAlunoProf(aa,pp));
  List_Header(Machine(Gym),canUpdatePagamento)==(canUpdate <-- canUpdatePagamento(aa));
  List_Header(Machine(Gym),canSetAlunoInativo)==(canSet <-- canSetAlunoInativo(aa));
  List_Header(Machine(Gym),canUpdateDiaTreino)==(canUpdate <-- canUpdateDiaTreino(tt,aa,ddAnterior,ddNovo));
  List_Header(Machine(Gym),canUpdateExercicioTreino)==(canUpdate <-- canUpdateExercicioTreino(tt,ex,newSs,newRp));
  List_Header(Machine(Gym),canCheckIn)==(canCheck <-- canCheckIn(aa));
  List_Header(Machine(Gym),canCheckOut)==(canCheck <-- canCheckOut(aa));
  List_Header(Machine(Gym),canQuantidadeAlunos)==(canConsult <-- canQuantidadeAlunos);
  List_Header(Machine(Gym),canQuantidadeProfessores)==(canConsult <-- canQuantidadeProfessores);
  List_Header(Machine(Gym),canAlunosPorProf)==(canConsult <-- canAlunosPorProf(pp));
  List_Header(Machine(Gym),canAlunoDeProfessor)==(canConsult <-- canAlunoDeProfessor(aa,pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Gym),addProf)==(pp: PROF & pp/:prof);
  List_Precondition(Machine(Gym),addAluno)==(aa: ALUNO & pp: PROF & pp: prof & aa/:dom(alunoProf) & aa/:dom(alunoStatus) & alunoPresente\/{aa|->ausente}: aluno\/{aa} --> PRESENTE & (alunoPresente\/{aa|->ausente})~[{presente}]/\(alunoStatus\/{aa|->ativo})~[{inativo}] = {});
  List_Precondition(Machine(Gym),addTreinoProf)==(pp: PROF & pp: prof & tt: TREINO & tt/:dom(treinoProf));
  List_Precondition(Machine(Gym),addTreinoAluno)==(aa: ALUNO & tt: TREINO & aa: aluno & tt: treino & dd: DIA & tt|->(aa,dd)/:treinoAluno & treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa)/=inativo);
  List_Precondition(Machine(Gym),addExercicioTreino)==(ex: EXERCICIO & tt: TREINO & tt: treino & ss: SERIES & rp: REPETICOES & not(#(ss0,rp0).(ss0: SERIES & rp0: REPETICOES & tt|->(ex,ss0,rp0): treinoExercicio)));
  List_Precondition(Machine(Gym),deleteProf)==(pp: PROF & pp: prof & card(prof-{pp})>0);
  List_Precondition(Machine(Gym),deleteAluno)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo});
  List_Precondition(Machine(Gym),deleteTreinoAluno)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno);
  List_Precondition(Machine(Gym),deleteExercicioTreino)==(tt: TREINO & tt: treino & ex: EXERCICIO & ex: exercicio & ss: SERIES & rp: REPETICOES & tt|->(ex,ss,rp): treinoExercicio);
  List_Precondition(Machine(Gym),updateAlunoProf)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}]/={pp});
  List_Precondition(Machine(Gym),updatePagamento)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo});
  List_Precondition(Machine(Gym),setAlunoInativo)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo});
  List_Precondition(Machine(Gym),updateDiaTreino)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & ddAnterior: DIA & ddNovo: DIA & ddAnterior/=ddNovo & tt|->(aa,ddAnterior): treinoAluno & alunoStatus[{aa}] = {ativo});
  List_Precondition(Machine(Gym),updateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & tt: treino & ex: exercicio & newSs: SERIES & newRp: REPETICOES & #(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio));
  List_Precondition(Machine(Gym),checkIn)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente});
  List_Precondition(Machine(Gym),checkOut)==(aa: ALUNO & aa: aluno & alunoPresente[{aa}] = {presente});
  List_Precondition(Machine(Gym),quantidadeAlunos)==(card(aluno)>0);
  List_Precondition(Machine(Gym),quantidadeProfessores)==(card(prof)>0);
  List_Precondition(Machine(Gym),alunosPorProf)==(pp: PROF & pp: prof & card(alunoProf~[{pp}])>0);
  List_Precondition(Machine(Gym),alunoDeProfessor)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof);
  List_Precondition(Machine(Gym),canAddProf)==(pp: PROF);
  List_Precondition(Machine(Gym),canDeleteProf)==(pp: PROF);
  List_Precondition(Machine(Gym),canAddAluno)==(aa: ALUNO & pp: PROF);
  List_Precondition(Machine(Gym),canDeleteAluno)==(aa: ALUNO);
  List_Precondition(Machine(Gym),canAddTreinoProf)==(tt: TREINO & pp: PROF);
  List_Precondition(Machine(Gym),canAddTreinoAluno)==(aa: ALUNO & tt: TREINO & dd: DIA);
  List_Precondition(Machine(Gym),canAddExercicioTreino)==(ex: EXERCICIO & tt: TREINO & ss: NAT & rp: NAT);
  List_Precondition(Machine(Gym),canDeleteTreinoAluno)==(tt: TREINO & aa: ALUNO & dd: DIA);
  List_Precondition(Machine(Gym),canDeleteExercicioTreino)==(tt: TREINO & ex: EXERCICIO & ss: NAT & rp: NAT);
  List_Precondition(Machine(Gym),canUpdateAlunoProf)==(aa: ALUNO & pp: PROF);
  List_Precondition(Machine(Gym),canUpdatePagamento)==(aa: ALUNO);
  List_Precondition(Machine(Gym),canSetAlunoInativo)==(aa: ALUNO);
  List_Precondition(Machine(Gym),canUpdateDiaTreino)==(tt: TREINO & aa: ALUNO & ddAnterior: DIA & ddNovo: DIA);
  List_Precondition(Machine(Gym),canUpdateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & newSs: NAT & newRp: NAT);
  List_Precondition(Machine(Gym),canCheckIn)==(aa: ALUNO);
  List_Precondition(Machine(Gym),canCheckOut)==(aa: ALUNO);
  List_Precondition(Machine(Gym),canQuantidadeAlunos)==(btrue);
  List_Precondition(Machine(Gym),canQuantidadeProfessores)==(btrue);
  List_Precondition(Machine(Gym),canAlunosPorProf)==(pp: PROF);
  List_Precondition(Machine(Gym),canAlunoDeProfessor)==(aa: ALUNO & pp: PROF)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Gym),canAlunoDeProfessor)==(aa: ALUNO & pp: PROF | canConsult:=bool(aa: aluno & pp: prof));
  Expanded_List_Substitution(Machine(Gym),canAlunosPorProf)==(pp: PROF | canConsult:=bool(pp: prof & card(alunoProf~[{pp}])>0));
  Expanded_List_Substitution(Machine(Gym),canQuantidadeProfessores)==(btrue | canConsult:=bool(card(prof)>0));
  Expanded_List_Substitution(Machine(Gym),canQuantidadeAlunos)==(btrue | canConsult:=bool(card(aluno)>0));
  Expanded_List_Substitution(Machine(Gym),canCheckOut)==(aa: ALUNO | canCheck:=bool(aa: aluno & alunoPresente[{aa}] = {presente}));
  Expanded_List_Substitution(Machine(Gym),canCheckIn)==(aa: ALUNO | canCheck:=bool(aa: aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente}));
  Expanded_List_Substitution(Machine(Gym),canUpdateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & newSs: NAT & newRp: NAT | canUpdate:=bool(tt: treino & ex: exercicio & newSs: SERIES & newRp: REPETICOES & #(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio)));
  Expanded_List_Substitution(Machine(Gym),canUpdateDiaTreino)==(tt: TREINO & aa: ALUNO & ddAnterior: DIA & ddNovo: DIA | canUpdate:=bool(tt: treino & aa: aluno & ddAnterior: DIA & ddNovo: DIA & ddAnterior/=ddNovo & tt|->(aa,ddAnterior): treinoAluno & alunoStatus[{aa}] = {ativo}));
  Expanded_List_Substitution(Machine(Gym),canSetAlunoInativo)==(aa: ALUNO | canSet:=bool(aa: aluno & alunoStatus[{aa}] = {ativo}));
  Expanded_List_Substitution(Machine(Gym),canUpdatePagamento)==(aa: ALUNO | canUpdate:=bool(aa: aluno & alunoStatus[{aa}] = {inativo}));
  Expanded_List_Substitution(Machine(Gym),canUpdateAlunoProf)==(aa: ALUNO & pp: PROF | canUpdate:=bool(aa: aluno & pp: prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}]/={pp}));
  Expanded_List_Substitution(Machine(Gym),canDeleteExercicioTreino)==(tt: TREINO & ex: EXERCICIO & ss: NAT & rp: NAT | canDel:=bool(tt: treino & ex: exercicio & ss: SERIES & rp: REPETICOES & tt|->(ex,ss,rp): treinoExercicio));
  Expanded_List_Substitution(Machine(Gym),canDeleteTreinoAluno)==(tt: TREINO & aa: ALUNO & dd: DIA | canDel:=bool(tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno));
  Expanded_List_Substitution(Machine(Gym),canAddExercicioTreino)==(ex: EXERCICIO & tt: TREINO & ss: NAT & rp: NAT | canAdd:=bool(ex: EXERCICIO & tt: treino & ss: SERIES & rp: REPETICOES & not(#(ss0,rp0).(ss0: SERIES & rp0: REPETICOES & tt|->(ex,ss0,rp0): treinoExercicio))));
  Expanded_List_Substitution(Machine(Gym),canAddTreinoAluno)==(aa: ALUNO & tt: TREINO & dd: DIA | canAdd:=bool(aa: aluno & tt: treino & dd: DIA & tt|->(aa,dd)/:treinoAluno & treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa)/=inativo));
  Expanded_List_Substitution(Machine(Gym),canAddTreinoProf)==(tt: TREINO & pp: PROF | canAdd:=bool(pp: prof & tt: TREINO & tt/:dom(treinoProf)));
  Expanded_List_Substitution(Machine(Gym),canDeleteAluno)==(aa: ALUNO | canDel:=bool(aa: aluno & alunoStatus[{aa}] = {inativo}));
  Expanded_List_Substitution(Machine(Gym),canAddAluno)==(aa: ALUNO & pp: PROF | canAdd:=bool(aa: ALUNO & pp: prof & aa/:dom(alunoProf) & aa/:dom(alunoStatus) & (alunoPresente\/{aa|->ausente})~[{presente}]/\(alunoStatus\/{aa|->ativo})~[{inativo}] = {}));
  Expanded_List_Substitution(Machine(Gym),canDeleteProf)==(pp: PROF | canDel:=bool(pp: prof & card(prof-{pp})>0));
  Expanded_List_Substitution(Machine(Gym),canAddProf)==(pp: PROF | canAdd:=bool(pp: PROF & pp/:prof));
  Expanded_List_Substitution(Machine(Gym),alunoDeProfessor)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof | alunoProf(aa) = pp ==> resp:=TRUE [] not(alunoProf(aa) = pp) ==> resp:=FALSE);
  Expanded_List_Substitution(Machine(Gym),alunosPorProf)==(pp: PROF & pp: prof & card(alunoProf~[{pp}])>0 | ap:=card(alunoProf~[{pp}]));
  Expanded_List_Substitution(Machine(Gym),quantidadeProfessores)==(card(prof)>0 | pp:=card(prof));
  Expanded_List_Substitution(Machine(Gym),quantidadeAlunos)==(card(aluno)>0 | aa:=card(aluno));
  Expanded_List_Substitution(Machine(Gym),checkOut)==(aa: ALUNO & aa: aluno & alunoPresente[{aa}] = {presente} | alunoPresente:=alunoPresente<+{aa|->ausente});
  Expanded_List_Substitution(Machine(Gym),checkIn)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente} | alunoPresente:=alunoPresente<+{aa|->presente});
  Expanded_List_Substitution(Machine(Gym),updateExercicioTreino)==(tt: TREINO & ex: EXERCICIO & tt: treino & ex: exercicio & newSs: SERIES & newRp: REPETICOES & #(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio) | @(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio ==> treinoExercicio:=treinoExercicio-{tt|->(ex,oldSs,oldRp)}\/{tt|->(ex,newSs,newRp)}));
  Expanded_List_Substitution(Machine(Gym),updateDiaTreino)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & ddAnterior: DIA & ddNovo: DIA & ddAnterior/=ddNovo & tt|->(aa,ddAnterior): treinoAluno & alunoStatus[{aa}] = {ativo} | treinoAluno:=treinoAluno-{tt|->(aa,ddAnterior)}\/{tt|->(aa,ddNovo)});
  Expanded_List_Substitution(Machine(Gym),setAlunoInativo)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {ativo} | alunoStatus:=alunoStatus<+{aa|->inativo});
  Expanded_List_Substitution(Machine(Gym),updatePagamento)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo} | alunoStatus:=alunoStatus<+{aa|->ativo});
  Expanded_List_Substitution(Machine(Gym),updateAlunoProf)==(aa: ALUNO & pp: PROF & aa: aluno & pp: prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}]/={pp} | treinoAluno,alunoProf:=treinoAluno|>>{aa}*DIA,alunoProf<+{aa|->pp});
  Expanded_List_Substitution(Machine(Gym),deleteExercicioTreino)==(tt: TREINO & tt: treino & ex: EXERCICIO & ex: exercicio & ss: SERIES & rp: REPETICOES & tt|->(ex,ss,rp): treinoExercicio | treinoExercicio:=treinoExercicio-{tt|->(ex,ss,rp)});
  Expanded_List_Substitution(Machine(Gym),deleteTreinoAluno)==(aa: ALUNO & tt: TREINO & tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno | treinoAluno:=treinoAluno-{tt|->(aa,dd)});
  Expanded_List_Substitution(Machine(Gym),deleteAluno)==(aa: ALUNO & aa: aluno & alunoStatus[{aa}] = {inativo} | aluno,alunoProf,treinoAluno,alunoStatus,alunoPresente:=aluno-{aa},{aa}<<|alunoProf,treinoAluno|>>{aa}*DIA,{aa}<<|alunoStatus,{aa}<<|alunoPresente);
  Expanded_List_Substitution(Machine(Gym),deleteProf)==(pp: PROF & pp: prof & card(prof-{pp})>0 | @newProf.(newProf: prof & newProf/=pp ==> alunoProf,treinoProf,prof:=alunoProf<+alunoProf~[{pp}]*{newProf},treinoProf<+treinoProf~[{pp}]*{newProf},prof-{pp}));
  Expanded_List_Substitution(Machine(Gym),addExercicioTreino)==(ex: EXERCICIO & tt: TREINO & tt: treino & ss: SERIES & rp: REPETICOES & not(#(ss0,rp0).(ss0: SERIES & rp0: REPETICOES & tt|->(ex,ss0,rp0): treinoExercicio)) | treinoExercicio,exercicio:=treinoExercicio\/{tt|->(ex,ss,rp)},exercicio\/{ex});
  Expanded_List_Substitution(Machine(Gym),addTreinoAluno)==(aa: ALUNO & tt: TREINO & aa: aluno & tt: treino & dd: DIA & tt|->(aa,dd)/:treinoAluno & treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa)/=inativo | treinoAluno:=treinoAluno\/{tt|->(aa,dd)});
  Expanded_List_Substitution(Machine(Gym),addTreinoProf)==(pp: PROF & pp: prof & tt: TREINO & tt/:dom(treinoProf) | treinoProf,treino:=treinoProf\/{tt|->pp},treino\/{tt});
  Expanded_List_Substitution(Machine(Gym),addAluno)==(aa: ALUNO & pp: PROF & pp: prof & aa/:dom(alunoProf) & aa/:dom(alunoStatus) & alunoPresente\/{aa|->ausente}: aluno\/{aa} --> PRESENTE & (alunoPresente\/{aa|->ausente})~[{presente}]/\(alunoStatus\/{aa|->ativo})~[{inativo}] = {} | alunoProf,aluno,alunoStatus,alunoPresente:=alunoProf\/{aa|->pp},aluno\/{aa},alunoStatus\/{aa|->ativo},alunoPresente\/{aa|->ausente});
  Expanded_List_Substitution(Machine(Gym),addProf)==(pp: PROF & pp/:prof | prof:=prof\/{pp});
  List_Substitution(Machine(Gym),addProf)==(prof:=prof\/{pp});
  List_Substitution(Machine(Gym),addAluno)==(alunoProf:=alunoProf\/{aa|->pp} || aluno:=aluno\/{aa} || alunoStatus:=alunoStatus\/{aa|->ativo} || alunoPresente:=alunoPresente\/{aa|->ausente});
  List_Substitution(Machine(Gym),addTreinoProf)==(treinoProf:=treinoProf\/{tt|->pp} || treino:=treino\/{tt});
  List_Substitution(Machine(Gym),addTreinoAluno)==(treinoAluno:=treinoAluno\/{tt|->(aa,dd)});
  List_Substitution(Machine(Gym),addExercicioTreino)==(treinoExercicio:=treinoExercicio\/{tt|->(ex,ss,rp)} || exercicio:=exercicio\/{ex});
  List_Substitution(Machine(Gym),deleteProf)==(ANY newProf WHERE newProf: prof & newProf/=pp THEN alunoProf:=alunoProf<+alunoProf~[{pp}]*{newProf} || treinoProf:=treinoProf<+treinoProf~[{pp}]*{newProf} || prof:=prof-{pp} END);
  List_Substitution(Machine(Gym),deleteAluno)==(aluno:=aluno-{aa} || alunoProf:={aa}<<|alunoProf || treinoAluno:=treinoAluno|>>{aa}*DIA || alunoStatus:={aa}<<|alunoStatus || alunoPresente:={aa}<<|alunoPresente);
  List_Substitution(Machine(Gym),deleteTreinoAluno)==(treinoAluno:=treinoAluno-{tt|->(aa,dd)});
  List_Substitution(Machine(Gym),deleteExercicioTreino)==(treinoExercicio:=treinoExercicio-{tt|->(ex,ss,rp)});
  List_Substitution(Machine(Gym),updateAlunoProf)==(treinoAluno:=treinoAluno|>>{aa}*DIA || alunoProf:=alunoProf<+{aa|->pp});
  List_Substitution(Machine(Gym),updatePagamento)==(alunoStatus:=alunoStatus<+{aa|->ativo});
  List_Substitution(Machine(Gym),setAlunoInativo)==(alunoStatus:=alunoStatus<+{aa|->inativo});
  List_Substitution(Machine(Gym),updateDiaTreino)==(treinoAluno:=treinoAluno-{tt|->(aa,ddAnterior)}\/{tt|->(aa,ddNovo)});
  List_Substitution(Machine(Gym),updateExercicioTreino)==(ANY oldSs,oldRp WHERE oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio THEN treinoExercicio:=treinoExercicio-{tt|->(ex,oldSs,oldRp)}\/{tt|->(ex,newSs,newRp)} END);
  List_Substitution(Machine(Gym),checkIn)==(alunoPresente:=alunoPresente<+{aa|->presente});
  List_Substitution(Machine(Gym),checkOut)==(alunoPresente:=alunoPresente<+{aa|->ausente});
  List_Substitution(Machine(Gym),quantidadeAlunos)==(aa:=card(aluno));
  List_Substitution(Machine(Gym),quantidadeProfessores)==(pp:=card(prof));
  List_Substitution(Machine(Gym),alunosPorProf)==(ap:=card(alunoProf~[{pp}]));
  List_Substitution(Machine(Gym),alunoDeProfessor)==(IF alunoProf(aa) = pp THEN resp:=TRUE ELSE resp:=FALSE END);
  List_Substitution(Machine(Gym),canAddProf)==(canAdd:=bool(pp: PROF & pp/:prof));
  List_Substitution(Machine(Gym),canDeleteProf)==(canDel:=bool(pp: prof & card(prof-{pp})>0));
  List_Substitution(Machine(Gym),canAddAluno)==(canAdd:=bool(aa: ALUNO & pp: prof & aa/:dom(alunoProf) & aa/:dom(alunoStatus) & (alunoPresente\/{aa|->ausente})~[{presente}]/\(alunoStatus\/{aa|->ativo})~[{inativo}] = {}));
  List_Substitution(Machine(Gym),canDeleteAluno)==(canDel:=bool(aa: aluno & alunoStatus[{aa}] = {inativo}));
  List_Substitution(Machine(Gym),canAddTreinoProf)==(canAdd:=bool(pp: prof & tt: TREINO & tt/:dom(treinoProf)));
  List_Substitution(Machine(Gym),canAddTreinoAluno)==(canAdd:=bool(aa: aluno & tt: treino & dd: DIA & tt|->(aa,dd)/:treinoAluno & treinoProf[{tt}] = alunoProf[{aa}] & alunoStatus(aa)/=inativo));
  List_Substitution(Machine(Gym),canAddExercicioTreino)==(canAdd:=bool(ex: EXERCICIO & tt: treino & ss: SERIES & rp: REPETICOES & not(#(ss0,rp0).(ss0: SERIES & rp0: REPETICOES & tt|->(ex,ss0,rp0): treinoExercicio))));
  List_Substitution(Machine(Gym),canDeleteTreinoAluno)==(canDel:=bool(tt: treino & aa: aluno & dd: DIA & tt|->(aa,dd): treinoAluno));
  List_Substitution(Machine(Gym),canDeleteExercicioTreino)==(canDel:=bool(tt: treino & ex: exercicio & ss: SERIES & rp: REPETICOES & tt|->(ex,ss,rp): treinoExercicio));
  List_Substitution(Machine(Gym),canUpdateAlunoProf)==(canUpdate:=bool(aa: aluno & pp: prof & alunoStatus[{aa}] = {ativo} & alunoProf[{aa}]/={pp}));
  List_Substitution(Machine(Gym),canUpdatePagamento)==(canUpdate:=bool(aa: aluno & alunoStatus[{aa}] = {inativo}));
  List_Substitution(Machine(Gym),canSetAlunoInativo)==(canSet:=bool(aa: aluno & alunoStatus[{aa}] = {ativo}));
  List_Substitution(Machine(Gym),canUpdateDiaTreino)==(canUpdate:=bool(tt: treino & aa: aluno & ddAnterior: DIA & ddNovo: DIA & ddAnterior/=ddNovo & tt|->(aa,ddAnterior): treinoAluno & alunoStatus[{aa}] = {ativo}));
  List_Substitution(Machine(Gym),canUpdateExercicioTreino)==(canUpdate:=bool(tt: treino & ex: exercicio & newSs: SERIES & newRp: REPETICOES & #(oldSs,oldRp).(oldSs: SERIES & oldRp: REPETICOES & tt|->(ex,oldSs,oldRp): treinoExercicio)));
  List_Substitution(Machine(Gym),canCheckIn)==(canCheck:=bool(aa: aluno & alunoStatus[{aa}] = {ativo} & alunoPresente[{aa}] = {ausente}));
  List_Substitution(Machine(Gym),canCheckOut)==(canCheck:=bool(aa: aluno & alunoPresente[{aa}] = {presente}));
  List_Substitution(Machine(Gym),canQuantidadeAlunos)==(canConsult:=bool(card(aluno)>0));
  List_Substitution(Machine(Gym),canQuantidadeProfessores)==(canConsult:=bool(card(prof)>0));
  List_Substitution(Machine(Gym),canAlunosPorProf)==(canConsult:=bool(pp: prof & card(alunoProf~[{pp}])>0));
  List_Substitution(Machine(Gym),canAlunoDeProfessor)==(canConsult:=bool(aa: aluno & pp: prof))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Gym))==(DIA,SERIES,REPETICOES);
  Inherited_List_Constants(Machine(Gym))==(?);
  List_Constants(Machine(Gym))==(DIA,SERIES,REPETICOES)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Gym),ALUNO)==(?);
  Context_List_Enumerated(Machine(Gym))==(?);
  Context_List_Defered(Machine(Gym))==(?);
  Context_List_Sets(Machine(Gym))==(?);
  List_Valuable_Sets(Machine(Gym))==(ALUNO,PROF,TREINO,EXERCICIO);
  Inherited_List_Enumerated(Machine(Gym))==(?);
  Inherited_List_Defered(Machine(Gym))==(?);
  Inherited_List_Sets(Machine(Gym))==(?);
  List_Enumerated(Machine(Gym))==(STATUS,PRESENTE);
  List_Defered(Machine(Gym))==(ALUNO,PROF,TREINO,EXERCICIO);
  List_Sets(Machine(Gym))==(ALUNO,PROF,TREINO,EXERCICIO,STATUS,PRESENTE);
  Set_Definition(Machine(Gym),PROF)==(?);
  Set_Definition(Machine(Gym),TREINO)==(?);
  Set_Definition(Machine(Gym),EXERCICIO)==(?);
  Set_Definition(Machine(Gym),STATUS)==({ativo,inativo});
  Set_Definition(Machine(Gym),PRESENTE)==({presente,ausente})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Gym))==(?);
  Expanded_List_HiddenConstants(Machine(Gym))==(?);
  List_HiddenConstants(Machine(Gym))==(?);
  External_List_HiddenConstants(Machine(Gym))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Gym))==(btrue);
  Context_List_Properties(Machine(Gym))==(btrue);
  Inherited_List_Properties(Machine(Gym))==(btrue);
  List_Properties(Machine(Gym))==(DIA = 0..6 & SERIES = 0..5 & REPETICOES = 0..20 & ALUNO: FIN(INTEGER) & not(ALUNO = {}) & PROF: FIN(INTEGER) & not(PROF = {}) & TREINO: FIN(INTEGER) & not(TREINO = {}) & EXERCICIO: FIN(INTEGER) & not(EXERCICIO = {}) & STATUS: FIN(INTEGER) & not(STATUS = {}) & PRESENTE: FIN(INTEGER) & not(PRESENTE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Gym),addProf)==(?);
  List_ANY_Var(Machine(Gym),addAluno)==(?);
  List_ANY_Var(Machine(Gym),addTreinoProf)==(?);
  List_ANY_Var(Machine(Gym),addTreinoAluno)==(?);
  List_ANY_Var(Machine(Gym),addExercicioTreino)==(?);
  List_ANY_Var(Machine(Gym),deleteProf)==(Var(newProf) == atype(PROF,?,?));
  List_ANY_Var(Machine(Gym),deleteAluno)==(?);
  List_ANY_Var(Machine(Gym),deleteTreinoAluno)==(?);
  List_ANY_Var(Machine(Gym),deleteExercicioTreino)==(?);
  List_ANY_Var(Machine(Gym),updateAlunoProf)==(?);
  List_ANY_Var(Machine(Gym),updatePagamento)==(?);
  List_ANY_Var(Machine(Gym),setAlunoInativo)==(?);
  List_ANY_Var(Machine(Gym),updateDiaTreino)==(?);
  List_ANY_Var(Machine(Gym),updateExercicioTreino)==((Var(oldSs) == btype(INTEGER,?,?)),(Var(oldRp) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(Gym),checkIn)==(?);
  List_ANY_Var(Machine(Gym),checkOut)==(?);
  List_ANY_Var(Machine(Gym),quantidadeAlunos)==(?);
  List_ANY_Var(Machine(Gym),quantidadeProfessores)==(?);
  List_ANY_Var(Machine(Gym),alunosPorProf)==(?);
  List_ANY_Var(Machine(Gym),alunoDeProfessor)==(?);
  List_ANY_Var(Machine(Gym),canAddProf)==(?);
  List_ANY_Var(Machine(Gym),canDeleteProf)==(?);
  List_ANY_Var(Machine(Gym),canAddAluno)==(?);
  List_ANY_Var(Machine(Gym),canDeleteAluno)==(?);
  List_ANY_Var(Machine(Gym),canAddTreinoProf)==(?);
  List_ANY_Var(Machine(Gym),canAddTreinoAluno)==(?);
  List_ANY_Var(Machine(Gym),canAddExercicioTreino)==(?);
  List_ANY_Var(Machine(Gym),canDeleteTreinoAluno)==(?);
  List_ANY_Var(Machine(Gym),canDeleteExercicioTreino)==(?);
  List_ANY_Var(Machine(Gym),canUpdateAlunoProf)==(?);
  List_ANY_Var(Machine(Gym),canUpdatePagamento)==(?);
  List_ANY_Var(Machine(Gym),canSetAlunoInativo)==(?);
  List_ANY_Var(Machine(Gym),canUpdateDiaTreino)==(?);
  List_ANY_Var(Machine(Gym),canUpdateExercicioTreino)==(?);
  List_ANY_Var(Machine(Gym),canCheckIn)==(?);
  List_ANY_Var(Machine(Gym),canCheckOut)==(?);
  List_ANY_Var(Machine(Gym),canQuantidadeAlunos)==(?);
  List_ANY_Var(Machine(Gym),canQuantidadeProfessores)==(?);
  List_ANY_Var(Machine(Gym),canAlunosPorProf)==(?);
  List_ANY_Var(Machine(Gym),canAlunoDeProfessor)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Gym)) == (DIA,SERIES,REPETICOES,ALUNO,PROF,TREINO,EXERCICIO,STATUS,PRESENTE,ativo,inativo,presente,ausente | ? | alunoPresente,alunoStatus,treinoExercicio,treinoAluno,treinoProf,alunoProf,exercicio,treino,prof,aluno | ? | addProf,addAluno,addTreinoProf,addTreinoAluno,addExercicioTreino,deleteProf,deleteAluno,deleteTreinoAluno,deleteExercicioTreino,updateAlunoProf,updatePagamento,setAlunoInativo,updateDiaTreino,updateExercicioTreino,checkIn,checkOut,quantidadeAlunos,quantidadeProfessores,alunosPorProf,alunoDeProfessor,canAddProf,canDeleteProf,canAddAluno,canDeleteAluno,canAddTreinoProf,canAddTreinoAluno,canAddExercicioTreino,canDeleteTreinoAluno,canDeleteExercicioTreino,canUpdateAlunoProf,canUpdatePagamento,canSetAlunoInativo,canUpdateDiaTreino,canUpdateExercicioTreino,canCheckIn,canCheckOut,canQuantidadeAlunos,canQuantidadeProfessores,canAlunosPorProf,canAlunoDeProfessor | ? | ? | ? | Gym);
  List_Of_HiddenCst_Ids(Machine(Gym)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Gym)) == (DIA,SERIES,REPETICOES);
  List_Of_VisibleVar_Ids(Machine(Gym)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Gym)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Gym)) == (Type(ALUNO) == Cst(SetOf(atype(ALUNO,"[ALUNO","]ALUNO")));Type(PROF) == Cst(SetOf(atype(PROF,"[PROF","]PROF")));Type(TREINO) == Cst(SetOf(atype(TREINO,"[TREINO","]TREINO")));Type(EXERCICIO) == Cst(SetOf(atype(EXERCICIO,"[EXERCICIO","]EXERCICIO")));Type(STATUS) == Cst(SetOf(etype(STATUS,0,1)));Type(PRESENTE) == Cst(SetOf(etype(PRESENTE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Gym)) == (Type(ativo) == Cst(etype(STATUS,0,1));Type(inativo) == Cst(etype(STATUS,0,1));Type(presente) == Cst(etype(PRESENTE,0,1));Type(ausente) == Cst(etype(PRESENTE,0,1));Type(DIA) == Cst(SetOf(btype(INTEGER,"[DIA","]DIA")));Type(SERIES) == Cst(SetOf(btype(INTEGER,"[SERIES","]SERIES")));Type(REPETICOES) == Cst(SetOf(btype(INTEGER,"[REPETICOES","]REPETICOES"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Gym)) == (Type(alunoPresente) == Mvl(SetOf(atype(ALUNO,?,?)*etype(PRESENTE,0,1)));Type(alunoStatus) == Mvl(SetOf(atype(ALUNO,?,?)*etype(STATUS,0,1)));Type(treinoExercicio) == Mvl(SetOf(atype(TREINO,?,?)*(atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(treinoAluno) == Mvl(SetOf(atype(TREINO,?,?)*(atype(ALUNO,?,?)*btype(INTEGER,?,?))));Type(treinoProf) == Mvl(SetOf(atype(TREINO,?,?)*atype(PROF,?,?)));Type(alunoProf) == Mvl(SetOf(atype(ALUNO,?,?)*atype(PROF,?,?)));Type(exercicio) == Mvl(SetOf(atype(EXERCICIO,?,?)));Type(treino) == Mvl(SetOf(atype(TREINO,?,?)));Type(prof) == Mvl(SetOf(atype(PROF,?,?)));Type(aluno) == Mvl(SetOf(atype(ALUNO,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Gym)) == (Type(canAlunoDeProfessor) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canAlunosPorProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(canQuantidadeProfessores) == Cst(btype(BOOL,?,?),No_type);Type(canQuantidadeAlunos) == Cst(btype(BOOL,?,?),No_type);Type(canCheckOut) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canCheckIn) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdateExercicioTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canUpdateDiaTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canSetAlunoInativo) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdatePagamento) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdateAlunoProf) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canDeleteExercicioTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canDeleteTreinoAluno) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?));Type(canAddExercicioTreino) == Cst(btype(BOOL,?,?),atype(EXERCICIO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canAddTreinoAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?));Type(canAddTreinoProf) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(PROF,?,?));Type(canDeleteAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canAddAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canDeleteProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(canAddProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(alunoDeProfessor) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(alunosPorProf) == Cst(btype(INTEGER,?,?),atype(PROF,?,?));Type(quantidadeProfessores) == Cst(btype(INTEGER,?,?),No_type);Type(quantidadeAlunos) == Cst(btype(INTEGER,?,?),No_type);Type(checkOut) == Cst(No_type,atype(ALUNO,?,?));Type(checkIn) == Cst(No_type,atype(ALUNO,?,?));Type(updateExercicioTreino) == Cst(No_type,atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(updateDiaTreino) == Cst(No_type,atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(setAlunoInativo) == Cst(No_type,atype(ALUNO,?,?));Type(updatePagamento) == Cst(No_type,atype(ALUNO,?,?));Type(updateAlunoProf) == Cst(No_type,atype(ALUNO,?,?)*atype(PROF,?,?));Type(deleteExercicioTreino) == Cst(No_type,atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(deleteTreinoAluno) == Cst(No_type,atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?));Type(deleteAluno) == Cst(No_type,atype(ALUNO,?,?));Type(deleteProf) == Cst(No_type,atype(PROF,?,?));Type(addExercicioTreino) == Cst(No_type,atype(EXERCICIO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(addTreinoAluno) == Cst(No_type,atype(ALUNO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?));Type(addTreinoProf) == Cst(No_type,atype(TREINO,?,?)*atype(PROF,?,?));Type(addAluno) == Cst(No_type,atype(ALUNO,?,?)*atype(PROF,?,?));Type(addProf) == Cst(No_type,atype(PROF,?,?)));
  Observers(Machine(Gym)) == (Type(canAlunoDeProfessor) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canAlunosPorProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(canQuantidadeProfessores) == Cst(btype(BOOL,?,?),No_type);Type(canQuantidadeAlunos) == Cst(btype(BOOL,?,?),No_type);Type(canCheckOut) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canCheckIn) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdateExercicioTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canUpdateDiaTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canSetAlunoInativo) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdatePagamento) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canUpdateAlunoProf) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canDeleteExercicioTreino) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(EXERCICIO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canDeleteTreinoAluno) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(ALUNO,?,?)*btype(INTEGER,?,?));Type(canAddExercicioTreino) == Cst(btype(BOOL,?,?),atype(EXERCICIO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(canAddTreinoAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(TREINO,?,?)*btype(INTEGER,?,?));Type(canAddTreinoProf) == Cst(btype(BOOL,?,?),atype(TREINO,?,?)*atype(PROF,?,?));Type(canDeleteAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?));Type(canAddAluno) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(canDeleteProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(canAddProf) == Cst(btype(BOOL,?,?),atype(PROF,?,?));Type(alunoDeProfessor) == Cst(btype(BOOL,?,?),atype(ALUNO,?,?)*atype(PROF,?,?));Type(alunosPorProf) == Cst(btype(INTEGER,?,?),atype(PROF,?,?));Type(quantidadeProfessores) == Cst(btype(INTEGER,?,?),No_type);Type(quantidadeAlunos) == Cst(btype(INTEGER,?,?),No_type))
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
)
