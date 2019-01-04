$(document).on('turbolinks:load', function() {
	$("#associado_cep").blur(function(){cep("associado", "")});
});

$(document).ready(function(){
	if(window.innerWidth <= 426) {
		$('.col-assoc-name').removeClass('col-5');
		$('.col-assoc-name').addClass('col-12 text-center');
		$('.col-assoc-actions').removeClass('col-auto ml-auto');
		$('.col-assoc-actions').addClass('col-12 text-center');		
	}

	$(window).resize(function(){
		if(window.innerWidth <= 426) {
			$('.col-assoc-name').removeClass('col-5');
			$('.col-assoc-name').addClass('col-12 text-center');
			$('.col-assoc-actions').removeClass('col-auto ml-auto');
			$('.col-assoc-actions').addClass('col-12 text-center');		
		} else {
			$('.col-assoc-name').removeClass('col-12 text-center');
			$('.col-assoc-name').addClass('col-5');
			$('.col-assoc-actions').removeClass('col-12 text-center');				
			$('.col-assoc-actions').addClass('col-auto ml-auto');
		}	
	})
})