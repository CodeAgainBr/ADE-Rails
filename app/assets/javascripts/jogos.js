$(document).on('turbolinks:load', function() {
	if ($(".campo").is(':checked')) {
		$(".endereco_tab").hide();
	}

	$(".campo").on("click",function () {
		if (!$(this).is(':checked')) {
			$(".endereco_tab").show();
		} else {
			$(".endereco_tab").hide();
			limpa_formulario_cep("jogo", "")
			$("#jogo_cep").val("");
			$("#jogo_numero").val("");
		}
	});

	$("#jogo_cep").blur(function(){cep("jogo", "")});
});
