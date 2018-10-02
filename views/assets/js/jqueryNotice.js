var searchRequest = null;
$(document).ready(function(){
    var minlength = 3;
    var url = 'jquery.php/?controller=jquery&action=';
        // Search User
    $("#searchTitle").keyup(function(){
        var getTitle = $(this).val();
        if (getTitle.length >= minlength ) {
            if (searchRequest != null) 
                searchRequest.abort();
                searchRequest = $.ajax({
                    url: url+'searchNotice',
                    type: 'post',
                    data: {title:getTitle},
                    dataType: 'json',
                    success:function(response){
                        var len = 30;
                        $("#livesearch").empty();
                        for( var i = 0; i<len; i++){
                            var id = response[i]['id'];
                            var title = response[i]['title'];
                            $("#livesearch").append("<a class='list-group-item' href='?controller=notices&action=viewNotice&id="+id+"'>"+title+"</a>");
                        }
                    }
                });
        }
        else{
            $("#livesearch").empty();
        }
    });


});