$(document).ready(function() {
	$('.telefone').mask('(00) 0000-0000');
	$('.cep').mask('00000-000');;
});

$(document).on('turbolinks:load',function() {
	$(".campo").on("click",function () {
	 	if ($(this).is(':checked')) {
	    	$(".endereco_clube_tab").show();
	    } else {
	   		$(".endereco_clube_tab").hide();
		}
	});
});
