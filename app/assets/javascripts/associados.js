$(document).on('turbolinks:load', function() {
	$("#associado_cep").blur(function(){cep("associado", "")});
});
