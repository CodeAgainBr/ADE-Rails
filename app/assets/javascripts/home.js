$(document).on('turbolinks:load', function() {
	if (window.innerWidth <= 998) {
        $('.col-jogo-data').addClass('text-center');
    }

    $(window).resize(function(){
        if(window.innerWidth <= 998) {
            $('.col-jogo-data').addClass('text-center');
            
        } else {
            $('.col-jogo-data').removeClass('text-center');
            
        }
    })
});