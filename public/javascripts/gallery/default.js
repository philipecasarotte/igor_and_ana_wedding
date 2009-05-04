$(document).ready(function() {
	//Carousel
	$("#thumbs div").jCarouselLite({
	    btnNext: ".bt_bottom",
	    btnPrev: ".bt_top",
	    visible: 3,
	    scroll: 1,
			vertical: true,
	    speed: 500,
	    circular: false
	});

	//Loader Imagem
	$("#thumbs li").find("a").click(function(){
		var loader = $("#loader");
		var newImage = $(this).attr('href');
		var bigImage = $('#big_image img:first');
		$.ajax({
		  type:"GET",
		  url: $(this).attr('href'),
		  success:function(data){
		  },
		  complete: function(){
			loader.hide();
		  },
		  beforeSend: function(){
			loader.show();
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
	$("#list_galleries").animate({height: 'toggle', opacity: 'toggle' },200);
} 

function up(){
	$("#list_galleries").animate({height: 'toggle', opacity: 'toggle' },300);
}

