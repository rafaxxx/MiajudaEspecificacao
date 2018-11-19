-- Assinaturas --
sig Cadastro {}
sig Material {}
sig Chat {}
sig Turma {}
sig Timeline {}
sig Login {}

sig Professor {
	logarProf : one Login,
	seCadastrar : one Cadastro, 
	cadastrarTurmas : one Turma,
	adicionarMaterial : one Material 
}

sig Aluno {
	logarAluno : one Login,
	conversarComMonitor : lone Chat, 
	visitarTurma : some Turma,
	visualizarTimeline : one Timeline
}

sig Monitor extends Aluno {
	logarMonitor : one Login,
	enviarArquivos : some Material,
	fazerAtendimentos : lone Chat
}

-- Fatos --

fact { all c : Cadastro | some c.~seCadastrar } -- apenas não cadastrados podem se cadastrar
fact { all m : Material | some m.~enviarArquivos or some m.~adicionarMaterial } -- materiais so podem ser adicionados por monitor ou professor

-- Predicados -- 
