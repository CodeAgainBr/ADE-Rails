$(document).on('turbolinks:load', function() {
	if (!$(".campo").is(':checked')) {
		$(".endereco_clube_tab").hide();
	}

	$(".campo").on("click",function () {
		if ($(this).is(':checked')) {
			$(".endereco_clube_tab").show();
		} else {
			$(".endereco_clube_tab").hide();
		}
	});

	$("#clube_cep").blur(function(){cep("clube", "")});
	$("#clube_cep_campo").blur(function(){cep("clube", "campo")});
});
