//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap
//= require jquery.mask

$(document).on('turbolinks:load', function() {
	$('.data').mask('00/00/0000');
	$('.celular').mask('(00) 00000-0000');
	$('.telefone').mask('(00) 0000-0000');
	$('.cep').mask('00000-000');
	$('.rg').mask('0.000.000');
	$('.cpf').mask('000.000.000-00');
	$('.horario').mask('00:00');
	$('.mes').mask('00');
	$('.diames').mask('00/00');
});

function limpa_formulario_cep(prefix, sufix) {
	// Limpa valores do formulário de cep.
	$("#"+prefix+"_rua"+sufix).val("");
	$("#"+prefix+"_bairro"+sufix).val("");
	$("#"+prefix+"_cidade"+sufix).val("");
	$("#"+prefix+"_estado"+sufix).val("");
	$("#"+prefix+"_rua"+sufix).removeAttr("readonly");
	$("#"+prefix+"_bairro"+sufix).removeAttr("readonly");
	$("#"+prefix+"_cidade"+sufix).removeAttr("readonly");
	$("#"+prefix+"_estado"+sufix).removeAttr("readonly");
}

function cep(prefix, sufix) {
	if(sufix != "") {
		sufix = "_" + sufix;
	}

	if($("#"+prefix+"_cep"+sufix).val() != "" && $("#"+prefix+"_cep"+sufix).val() != undefined) {
		//Nova variável "cep" somente com dígitos.
		var cep = $("#"+prefix+"_cep"+sufix).val().replace(/\D/g, '');

		//Verifica se campo cep possui valor informado.
		if (cep != "") {
			//Expressão regular para validar o CEP.
			var validacep = /^[0-9]{8}$/;

			//Valida o formato do CEP.
			if(validacep.test(cep)) {
				//Consulta o webservice viacep.com.br/
				$.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
					if (!("erro" in dados)) {
						//Atualiza os campos com os valores da consulta.
						$("#"+prefix+"_rua"+sufix).val(dados.logradouro);
						$("#"+prefix+"_bairro"+sufix).val(dados.bairro);
						$("#"+prefix+"_cidade"+sufix).val(dados.localidade);
						$("#"+prefix+"_estado"+sufix).val(dados.uf);
						$("#"+prefix+"_rua"+sufix).prop("readonly", "readonly");
						$("#"+prefix+"_bairro"+sufix).prop("readonly", "readonly");
						$("#"+prefix+"_cidade"+sufix).prop("readonly", "readonly");
						$("#"+prefix+"_estado"+sufix).prop("readonly", "readonly");
					} else {
						//CEP pesquisado não foi encontrado.
						limpa_formulario_cep(prefix, sufix);
						alert("CEP não encontrado.");
					}
				});
			} else {
				//cep é inválido.
				limpa_formulario_cep(prefix, sufix);
				alert("Formato de CEP inválido.");
			}
		} else {
			//cep sem valor, limpa formulário.
			limpa_formulario_cep(prefix, sufix);
		}
	}
}

function relatoriosAniversario(referente, tipo, valor) {
	if((tipo == "" || tipo == undefined) && (valor == "" || valor == undefined)) {
		window.open("/relatorios/aniversario/pdf?referente=" + referente + "&tipo=anual", "_blank");
	} else {
		window.open("/relatorios/aniversario/pdf?referente=" + referente + "&tipo=" + tipo + "&data=" + valor, "_blank");
	}
}

function teste() {
	$.ajax({
		url: "http://192.168.1.5/rfid=1234&nome!Alex*",
		crossDomain: true,
		method: "get",
		success: function(data, status, xhr) {
			console.log(xhr);
			alert("Dados: " + data + "\nStatus: " + status + "\nXHR: " + xhr);
		},
		error: function(request, status, erro) {
			alert(erro);
		}
	});
}

//Botão de imprimir das telas de relatorios
function imprimir(){
	window.print();
}
