$(document).ready(function(){
    var searchRequest = null;
    var loader = "<center><div class='preloader pl-size-xl'><div class='spinner-layer'><div class='circle-clipper left'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div></center>";
    var warning = "<center><h1>Uh-oh! <i class='fa fa-frown-o' aria-hidden='true'></i></h1><h3>Empty Result: Nothing found in the database</h3></center>";
    var minlength = 3;
    var url = 'jquery.php/?controller=jquery&action=';

        // Search Conversation
    $("#searchConversation").keyup(function(){
        var getNames = $(this).val();
        if (getNames.length >= minlength ) {
            if (searchRequest != null) 
                searchRequest.abort();
                searchRequest = $.ajax({
                    url: url+'searchConversation',
                    type: 'post',
                    data: {names:getNames},
                    dataType: 'json',
                    success:function(response){
                        var len = 30;
                        $("#liveConversationSearch").empty();
                        for( var i = 0; i<len; i++){
                            var conversationUsername = response[i]['username'];
                            var conversationName = response[i]['name'];
                            $("#liveConversationSearch").append("<a class='list-group-item' href='?controller=messages&action=viewMessages&uname="+conversationUsername+"'>"+conversationName+"</a>");
                        }
                    }
                });
        }
        else{
            $("#liveConversationSearch").empty();
        }
    });


        // Add Message
    $("input[name=submit]").click(function(){
        var counter = parseInt($('#counter').val())+1;
        var uname = $("input[name=uname]").val();
        var message = tinyMCE.activeEditor.getContent();
        var html = "<div class='alert alert-success alert-dismissible success' role='alert' style='margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Success!</strong> Message has been added.</div>";
        if (message === undefined || message === null || message === ''){
            $("#error").empty();
            $("#error").append("Message box is empty!");
        }
        else{
             $.ajax({
                url: url+'sendMessage',
                type: 'post',
                data: {uname:uname, message:message},
                success:function(response){
                    $.ajax({
                        url: url+'viewNewMessages',
                        type: 'post',
                        data: {uname:uname, counter:counter},
                        dataType: 'json',
                        beforeSend: function(){
                            $("#conversations").empty();
                            $(loader).show().appendTo("#newMessage");
                        },
                        complete: function(){
                            $(loader).hide().appendTo("#newMessage");
                        },
                        success:function(response){
                            var len = response.length;
                            $("#newMessage").empty();
                            $("#notification").empty(); 
                            $("#warning").empty(); 
                            $("#counter").val(counter);
                            $(html).hide().appendTo("#notification").fadeIn(1000, function () {
                                $(this).delay(2000).fadeOut('slow');
                            });                       
                            tinyMCE.activeEditor.setContent('');
                            for( var i = 0; i<len; i++){
                                var messageId = response[i]['id'];
                                var image = response[i]['image'];
                                var sender = response[i]['sender'];
                                var message = response[i]['message'];
                                var date = response[i]['date'];
                                $("#newMessage").append("<div class='row clearfix'><div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><div class='card'><div class='header'><div class='col-lg-1 col-md-1 hidden-sm hidden-xs'><img class='img-thumbnail' src='"+image+"'  width='50' height='50'></div><div class='col-lg-11 col-md-11 col-sm-12 col-xs-12'></div><h2>"+sender+"<small><strong>Sent: </strong>"+date+"</small></h2><ul class='header-dropdown m-r--5'><li class='dropdown'><a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class='material-icons'>more_vert</i></a><ul class='dropdown-menu pull-right'><li><a href='?controller=messages&action=deleteMessage&id="+messageId+"'>Delete</a></li></ul></li></ul></div><div class='body'>"+message+"</div></div></div></div>");
                           }
                        }
                    });
                }
            });
        }
    });
    
        // Function for showing Conversations
    function showResult(response) {
        var len = response.length;
        var countFade = 10;
        var countDelay = 10; 
        $("#start").val(len);
        $("#moreMessage").empty();
        $("#moreMessageFeedback").empty();
        $("#conversations").empty();
        for( var i = 0; i<len; i++){    
            var message = response[i]['message'];
            var name = response[i]['name'];
            var username = response[i]['username'];
            var image = response[i]['image'];
            var send_date = response[i]['send_date'];
            var view_date = response[i]['view_date'];
            var messageclass = response[i]['class'].toString();
            var showMessages = "<a href='?controller=messages&action=viewMessages&uname="+username+"' target='_blank'><div class='col-lg-4 col-md-4 col-sm-6 col-xs-12'><div class='card'><div class='header "+messageclass+"'><h2>"+name+"<small><strong>Recieved Date: </strong>"+send_date+"</small></h2></div><div class='body'><div class='media'><div class='media-left'><img class='media-object' src="+image+" width='40' height='40'></div><div class='media-body'><div style='height:25px;'><p class='media-heading'>"+message+"</p></div><div style='height:15px;'>"+view_date+"</div></div></div></div></div></div></a>";   
            $(showMessages).hide().appendTo("#conversations").delay(countDelay = countDelay + 80).fadeIn(countFade = countFade + 100);
        }
    }

        // Function for showing Conversations
    function showMoreResult(response) {
        var len = response.length;
        var countFade = 10;
        var countDelay = 10; 
        for( var i = 0; i<len; i++){    
            var message = response[i]['message'];
            var name = response[i]['name'];
            var username = response[i]['username'];
            var image = response[i]['image'];
            var send_date = response[i]['send_date'];
            var view_date = response[i]['view_date'];
            var messageclass = response[i]['class'].toString();
            var showMessages = "<a href='?controller=messages&action=viewMessages&uname="+username+"' target='_blank'><div class='col-lg-4 col-md-4 col-sm-6 col-xs-12'><div class='card'><div class='header "+messageclass+"'><h2>"+name+"<small><strong>Recieved Date: </strong>"+send_date+"</small></h2></div><div class='body'><div class='media'><div class='media-left'><img class='media-object' src="+image+" width='40' height='40'></div><div class='media-body'><div style='height:25px;'><p class='media-heading'>"+message+"</p></div><div style='height:15px;'>"+view_date+"</div></div></div></div></div></div></a>";   
            $(showMessages).hide().appendTo("#moreMessage").delay(countDelay = countDelay + 80).fadeIn(countFade = countFade + 100);
        }
    }

        // Condition for showing Conversation
    $("#md_checkbox_1").click(function(){
	    if (this.checked) {
            $("#condition").val('sortConversations');
            $.ajax({
	            url: url+'sortConversations',
                dataType: 'json',
                beforeSend: function(){
                   $("#conversations").empty();
                   $(loader).show().appendTo("#conversations");
                },
                complete: function(){
                    $(loader).hide().appendTo("#conversations");
                },
                success:function(response){
                    if(response) {
                        showResult(response);
                    } else {
                        $("#conversations").empty();
                        $('#conversations').append(warning);
                    }
            	}
        	});
	    }
	    else{
	    	$("#condition").val('allConversations');
            $.ajax({
	            url: url+'allConversations',
                dataType: 'json',
            	beforeSend: function(){
                   $("#conversations").empty();
                   $(loader).show().appendTo("#conversations");
                },
                complete: function(){
                    $(loader).hide().appendTo("#conversations");
                },
                success:function(response){
                    if(response) {
                        showResult(response);
                    } else {
                        $("#conversations").empty();
                        $('#conversations').append(warning);
                    }
            	}
        	});
	    }
    });

        // Function for loading more data
    $(window).scroll(function() {
        var start = parseInt($('#start').val());
        var condition = $('#condition').val();
        limit = 9;
        var startRefresh = start + limit;
        if($(window).scrollTop() == $(document).height() - $(window).height()) {
           // ajax call get data from server and append to the div
            $.ajax({
                url: url+condition,
                type: 'post',
                data: {start:start, limit:limit},
                dataType: 'json',
                beforeSend: function(){
                    $("#moreMessageFeedback").empty();
                    $(loader).show().appendTo("#moreMessageFeedback");
                },
                complete: function(){
                    $(loader).hide().appendTo("#moreMessageFeedback");
                },
                success:function(response){
                    if(response) {
                        $("#start").val(startRefresh);
                        showMoreResult(response);
                    } else {
                        $("#moreMessageFeedback").empty();
                        $('#moreMessageFeedback').append(warning);
                    }
                }
            });     
        }
    });

});

    