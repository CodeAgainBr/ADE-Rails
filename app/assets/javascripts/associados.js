$(document).ready(function() {
	$('.date').mask('00/00/0000');
	$('.celular').mask('(00) 00000-0000');
	$('.telefone').mask('(00) 0000-0000');
	$('.cep').mask('00000-000');
	$('.rg').mask('0.000.000');
	$('.cpf').mask('000.000.000-00');

	function limpa_formulario_cep() {
    // Limpa valores do formulário de cep.
    $("#associado_rua").val("");
    $("#associado_bairro").val("");
    $("#associado_cidade").val("");
    $("#associado_estado").val("");
    $("#associado_rua").prop('disabled', false);
    $("#associado_bairro").prop('disabled', false);
    $("#associado_cidade").prop('disabled', false);
    $("#associado_estado").prop('disabled', false);
  }
  
  //Quando o campo cep perde o foco.
  $("#associado_cep").blur(function() {

    //Nova variável "cep" somente com dígitos.
    var cep = $(this).val().replace(/\D/g, '');

    //Verifica se campo cep possui valor informado.
    if (cep != "") {

        //Expressão regular para validar o CEP.
        var validacep = /^[0-9]{8}$/;

        //Valida o formato do CEP.
        if(validacep.test(cep)) {
          //Preenche os campos com "..." enquanto consulta webservice.
          $("#associado_rua").val("...");
          $("#associado_bairro").val("...");
          $("#associado_cidade").val("...");
          $("#associado_estado").val("...");
          $("#associado_rua").prop('disabled', true);
          $("#associado_bairro").prop('disabled', true);
          $("#associado_cidade").prop('disabled', true);
          $("#associado_estado").prop('disabled', true);

          //Consulta o webservice viacep.com.br/
          $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
            if (!("erro" in dados)) {
              //Atualiza os campos com os valores da consulta.
              $("#associado_rua").val(dados.logradouro);
              $("#associado_bairro").val(dados.bairro);
              $("#associado_cidade").val(dados.localidade);
              $("#associado_estado").val(dados.uf);
              $("#associado_rua").prop('disabled', true);
              $("#associado_bairro").prop('disabled', true);
              $("#associado_cidade").prop('disabled', true);
              $("#associado_estado").prop('disabled', true);
            } //end if.
            else {
              //CEP pesquisado não foi encontrado.
              limpa_formulario_cep();
              alert("CEP não encontrado.");
            }
          });
        } //end if.
        else {
          //cep é inválido.
          limpa_formulario_cep();
          alert("Formato de CEP inválido.");
        }
    } //end if.
    else {
      //cep sem valor, limpa formulário.
      limpa_formulario_cep();
    }
  });
});
