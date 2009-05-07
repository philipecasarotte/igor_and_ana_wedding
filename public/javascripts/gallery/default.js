$(document).ready(function() {
	//Carousel
	$("#thumbs div").jCarouselLite({
	    btnNext: "#next",
	    btnPrev: "#prev",
	    visible: 6,
	    scroll: 1,
		vertical: false,
	    speed: 500,
	    circular: false
	});

	//Loader Imagem
	$("#thumbs li").find("a").click(function(){
		var newImage = $(this).attr('href');
		var bigImage = $('#big_image img:first');
		bigImage.fadeOut();
		$.ajax({
		  type:"GET",
		  url: $(this).attr('href'),
		  success:function(data){
		  },
		  complete: function(){
			bigImage.fadeIn();
		  },
		  beforeSend: function(){
			bigImage.attr('src', newImage);
		  }
		});
		$("#big_image .description").html($(this).find("img:first").attr("title"));
		return false;
	});
	
	//Categories List Drop Down
	$("#drop_down").hoverIntent(down,up);
});

function down(){
	$("#drop_down ul").animate({height: 'toggle', opacity: 'toggle' },200);
} 

function up(){
	$("#drop_down ul").animate({height: 'toggle', opacity: 'toggle' },300);
}

