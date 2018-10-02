
	// Function for timer
$(document).ready(function(){
    function startTimer(duration, display) {
        var timer = duration, minutes, seconds;
        setInterval(function () {
            minutes = parseInt(timer / 60, 10)
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.text(minutes + ":" + seconds +" ");

            if (--timer < 0) {
                timer = 0;
                $('input[name=uname]').prop('disabled', false);
                $('input[name=pass]').prop('disabled', false);
                $('#submit').prop('disabled', false);
                $("#error_reload").empty().append('<div class="msg">Sign in to start your session</div>')
            }
        }, 1000);
    }

    jQuery(function ($) {
        var leftMinutes = $('#currentTime').val()
            display = $('#time');
        startTimer(leftMinutes, display);
    });
});


	// Fucntion for image preview
$(document).ready(function(){
	var input = document.getElementsByClassName("input");
	var output = document.getElementsByClassName("output");
	var selected = document.getElementsByClassName("imageAlert");

	for (i = 0; i < input.length; i++) {
		(function(index) {
	        input[index].onchange = function() {
	            output[index].src = URL.createObjectURL(event.target.files[0]);
				selected[index].innerText="Image has been Selected! Now click the upload button..";
		        $(".clear_preview").prop('disabled', false);
		        $('input[name=submit]').prop('disabled', false); 
	        };
	    }(i));
	}

	$(".clear_preview").click(function(){
        $(this).prop('disabled', true);
        $('input[name=submit]').prop('disabled', true);
        $('input[name=image]').empty().val('');
        $(output).attr('src', 'all_images/preview.png');
        $(selected).text('');
    });
});


	// Function for fade-in effect
$(document).ready(function(){
	$('.success').hide(0).fadeIn(1000, function () {
	    $(this).delay(2000).fadeOut('slow');
	});
	$(".error").hide(0).fadeIn(1000);
	$(".warning").hide(0).delay(50).fadeIn(1000);
});

	// Function for scroll button
$(document).ready(function(){

	$("#scrollToTopButton").hide();
	
	//Check to see if the window is top if not then display button
	$(window).scroll(function(){
		if ($(this).scrollTop() > 200) {
			$("#scrollToTopButton").fadeIn();
		} else {
			$("#scrollToTopButton").fadeOut();
		}
	});
	
	//Click event to scroll to top
	$("#scrollToTopButton").click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
	
});


	// Function for auto complete
$('#remote_input').autocomplete({
valueKey:'title',
source:[{
    url:"jquery.php/?controller=jquery&action=homeSearch",
	type:'remote',
	getTitle:function(item){
	  return item['title']
	},
	getValue:function(item){
	  return item['title']
	},
	ajax:{
		dataType : 'json'	
	}	
}]
});


$(function() {
    $('form[name="goto"]').each(function() {
        $(this).find('input').keypress(function(e) {
            // Enter pressed?
            if(e.which == 10 || e.which == 13) {
                this.form.submit();
            }
        });

        $(this).find('input[type=submit]').hide();
    });
});



	// Generate Quote

var quoteAuthor = "";
var quoteText = "";

function getQuote() {
  $.getJSON("https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=jsonp&lang=en&jsonp=?", function(data) {
    quoteText = data.quoteText;

    if (data.quoteAuthor) {
      quoteAuthor = data.quoteAuthor;
    } else {
      quoteAuthor = "Anonymous"
    }
    $("#quote").append("&#34;"+quoteText+"&#34;-<span class='font-italic'>"+quoteAuthor+"</span>");
    
  }); 
}

getQuote();