var searchRequest = null;
$(document).ready(function(){
    var minlength = 3;
    var url = 'jquery.php/?controller=jquery&action=';

        // Student alert
    $('#student').hide(0).fadeIn(1000);

        // Check username availability
    $("input[name=uname]").keyup(function(){
        var uname = $(this).val();
        if (uname.length > 0) {
            $.ajax({
                url: url+'checkUsername',
                type: 'post',
                data: {uname: uname},
                dataType: 'json',
                success:function(response){
                    if(response == "yes") {
                        $("#uname_info").empty().append('Username available!');
                        $("#uname_class").attr('class', 'form-line focused');
                    } 
                    else {
                        $("#uname_info").empty().append('<span class="col-red">Username not available! Please try again with different username!</span>');
                        $("#uname_class").attr('class', 'form-line error focused');
                    }
                }    
            });
        }
        else{
            $("#uname_info").empty().append('Min. Value: 5, Max. Value: 20');
            $("#uname_class").attr('class', 'form-line');
        }
    });

        // Search User
    $("#searchUser").keyup(function(){
        var getName = $(this).val();
        if (getName.length >= minlength ) {
            if (searchRequest != null) 
                searchRequest.abort();
                searchRequest = $.ajax({
                    url: url+'searchUser',
                    type: 'post',
                    data: {name:getName},
                    dataType: 'json',
                    success:function(response){
                        var len = 30;
                        $("#livesearch").empty();
                        for( var i = 0; i<len; i++){
                            var username = response[i]['username'];
                            var name = response[i]['family_name']+' '+response[i]['given_name'];
                            $("#livesearch").append("<a class='list-group-item' href='?controller=users&action=showUser&uname="+username+"'>"+name+"</a>");
                        }
                    }
                });
        }
        else{
            $("#livesearch").empty();
        }
    });

        // Disable student designation
    $('#role').change(function () {
        if ($("#role option:selected").text() == 'Student') {
            $("#designationClass").attr('class', 'form-line');
            $("#designationLevel").empty();
            $('input[name=designation]').prop('readonly', true).val('None');
        } else {
            $("#designationClass").attr('class', 'form-line focused');
            $("#designationLevel").empty().append('Designation');
            $('input[name=designation]').prop('readonly', false).val('');
        }
    });

});