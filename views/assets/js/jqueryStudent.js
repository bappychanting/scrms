$(document).ready(function(){

    var url = 'jquery.php/?controller=jquery&action=';
    var loader = "<center><div class='preloader pl-size-xl'><div class='spinner-layer'><div class='circle-clipper left'><div class='circle'></div></div><div class='circle-clipper right'><div class='circle'></div></div></div></div></center>";
    
    
        // Find Roll
    $('#batch').change(function () {
        var batchId = $(this).val();
        var username = $('input[name=uname]').val();
        $.ajax({
            url: url+'getRoll',
            type: 'post',
            data: {batch:batchId, uname:username},
            dataType: 'json',
            success:function(response){
                $("#rollclass").attr('class', 'form-line focused');
                $('input[name=roll]').empty().attr('value', response).val(response);
                $("#rollhelpinfo").empty().append('Roll Number should be between 1 to 999');
            }
        });
    });


        // Check roll availability
    $('input[name=roll]').keyup(function () {
        var roll = $(this).val();
        var batchId = $('#batch').val();
        var username = $('input[name=uname]').val();
        if (roll.length > 0) {
            $.ajax({
                url: url+'verifyRoll',
                type: 'post',
                data: {batch:batchId, uname:username, roll:roll},
                dataType: 'json',
                success:function(response){
                    if(response == "yes") {
                        $("#rollhelpinfo").empty().append('Roll available!');
                        $("#rollclass").attr('class', 'form-line focused');
                    } 
                    else {
                        $("#rollhelpinfo").empty().append('<span class="col-red">Roll not available for this batch!</span>');
                        $("#rollclass").attr('class', 'form-line error focused');
                    }
                }
            });
        }
        else{
            $("#rollhelpinfo").empty().append('Roll Number should be between 1 to 999');
            $("#rollclass").attr('class', 'form-line');
        }
    });

        // Search Student
    $("#searchStudent").keyup(function(){
        var getName = $(this).val();
        if (getName.length >= 3 ) {
            if (searchRequest != null) 
                searchRequest.abort();
                searchRequest = $.ajax({
                    url: url+'searchStudent',
                    type: 'post',
                    data: {name:getName},
                    dataType: 'json',
                    success:function(response){
                        var len = 30;
                        $("#livesearch").empty();
                        for( var i = 0; i<len; i++){
                            var username = response[i]['username'];
                            var name = response[i]['family_name']+' '+response[i]['given_name'];
                            $("#livesearch").append("<a class='list-group-item' href='?controller=students&action=showStudentProfile&uname="+username+"'>"+name+"</a>");
                        }
                    }
                });
        }
        else{
            $("#livesearch").empty();
        }
    });

        // edit study status
    $("#study_status").on('click', '#update_study_status', function() {
        var username = $("#username").val();
        $.ajax({
            url: url+'getStudyStatuses',
            type: 'post',
            data: {uname:username},
            dataType: 'json',
            success:function(response){
                options = "";
                for( var i = 0; i<response.length; i++){
                    var id = response[i]['id'];
                    var name = response[i]['name'];
                    options += "<option value='"+id+"'>"+name+"</option>";
                }
                $("#study_status").empty().append("<div class='col-lg-8 col-md-8 col-sm-12 col-xs-12'><div class='form-group form-float'><select class='form-control show-tick' id='statuses'>"+options+"</select><div class='help-info'>Select Study Status</div></div></div><div class='col-lg-2 col-md-2 col-sm-12 col-xs-12'><button class='btn btn-primary waves-effect' id='submit_study_status'>Update</button></div>");
            }
        });
    });


        // update study status
    $("#study_status").on('click', '#submit_study_status', function() {
        var username = $("#username").val();
        var status = $("#statuses").val();
        var html = "<div class='alert alert-success alert-dismissible success' role='alert' style='margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Success!</strong> Last school study status has been updated!</div>";
        $.ajax({
            url: url+'updateStudyStatus',
            type: 'post',
            data: {uname:username, study_status:status},
            success:function(response){
                $.ajax({
                    url: url+'getStudyStatus',
                    type: 'post',
                    data: {uname:username},
                    dataType: 'json',
                    success:function(response){
                        $(html).hide().appendTo("#notification").fadeIn(1000, function () {
                            $(this).delay(2000).fadeOut('slow');
                        });  
                        $("#study_status").empty().append("<div class='col-lg-8 col-md-8 col-sm-12 col-xs-12'><p>"+ response +"</p></div><div class='col-lg-2 col-md-2 col-sm-12 col-xs-12'><buttun id='update_study_status' class='btn btn-danger btn-lg waves-effect waves-float pull-right'><span class='glyphicon glyphicon-edit'></span> Update Study Status</buttun></div>");
                    }
                });
            }
        });
    });

        // update if the supporter supporting financially other students in Japan
    $('input[type=radio][name=support_other_students_radio]').change(function () {
        var question = $(this).val();
        if (question == '0'){
            $("#support_other_students_details_class").attr('class', 'form-line');
            $("#support_other_students").val('').prop('disabled', true);
        }
        else if (question == '1'){
            $("#support_other_students_details_class").attr('class', 'form-line focused');
            $("#support_other_students").prop('disabled', false);
        }
    });

        // edit study purpose
    $("#study_purpose_body").on('click', '#update_study_purpose', function() {
       var username = $("#username").val();
        $.ajax({
            url: url+'getStudentData',
            type: 'post',
            data: {uname:username},
            dataType: 'json',
            success:function(response){
                for( var i = 0; i<response.length; i++){
                    if(response[i]['study_purpose'] == null){
                        var studyPurpose = '';
                    }
                    else{
                        var studyPurpose = response[i]['study_purpose'];
                    }
                    $("#study_purpose_body").empty().append("<div class='form-group form-float'><div class='form-line focused'><textarea rows='4' class='form-control no-resize' id='study_purpose_text' placeholder='Write your study purpose' required>"+studyPurpose+"</textarea></div><div class='help-info' id='study_purpose_help'></div></div><button class='btn btn-primary waves-effect' id='submit_study_purpose'>Update</button>");
                }
            }
        });
    });

        // update study purpose
    $("#study_purpose_body").on('click', '#submit_study_purpose', function() {
        var username = $("#username").val();
        var studyPurposeText = $("#study_purpose_text").val();
        var html = "<div class='alert alert-success alert-dismissible success' role='alert' style='margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Success!</strong> Study purpose has been updated!</div>";
        $("#study_purpose_help").empty();
        if (studyPurposeText.length < 100 || studyPurposeText.length > 10000){
            $("#study_purpose_help").append("<span class='col-red'>Study purpose has to have minimum 100 and maximum 10000 characters!</span>");
        }
        else{
            $.ajax({
                url: url+'updateStudyPurpose',
                type: 'post',
                data: {uname:username, study_purpose:studyPurposeText},
                success:function(response){
                    $.ajax({
                        url: url+'getStudentData',
                        type: 'post',
                        data: {uname:username},
                        dataType: 'json',
                        beforeSend: function(){
                            $("#study_purpose_body").empty();
                            $(loader).show().appendTo("#study_purpose_body");
                        },
                        complete: function(){
                            $(loader).hide().appendTo("#study_purpose_body");
                        },
                        success:function(response){
                            $(html).hide().appendTo("#notification").fadeIn(1000, function () {
                                $(this).delay(2000).fadeOut('slow');
                            });  
                            for( var i = 0; i<response.length; i++){
                                if(response[i]['study_purpose'] == null){
                                    var studyPurpose = "<b><span class='col-red'>Not addressed yet!</a></span></b>";
                                }
                                else{
                                    var studyPurpose = response[i]['study_purpose'];
                                }
                                $("#study_purpose_body").empty().append("<p>"+studyPurpose+"</p><div class='row clearfix'><div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><buttun id='update_study_purpose' class='btn btn-danger btn-lg waves-effect waves-float pull-right'><span class='glyphicon glyphicon-edit'></span> Update Study Purpose</buttun></div></div>");
                            }
                        }
                    });
                }
            });
        }
    });

        // TinyMCE selector
    function showTinyMCE(textarea){
        tinymce.EditorManager.execCommand('mceRemoveEditor',true, textarea);
        tinymce.init({
            selector: "textarea#"+textarea,
            theme: "modern",
            height: 200,
            plugins: ['image'],
        });
        tinymce.suffix = ".min";
        tinyMCE.baseURL = 'views/assets/plugins/tinymce';
    }

        // edit additional info
    $("#additional_body").on('click', '#update_additional', function() {
        var username = $("#username").val();
        tinymce.EditorManager.execCommand('mceRemoveControl', true, "textarea#additional_text");
        $.ajax({
            url: url+'getStudentData',
            type: 'post',
            data: {uname:username},
            dataType: 'json',
            success:function(response){
                for( var i = 0; i<response.length; i++){
                    if(response[i]['additional'] == null){
                        var additional = '';
                    }
                    else{
                        var additional = response[i]['additional'];
                    }
                    $("#additional_body").empty().append("<div class='form-group form-float'><textarea rows='4' class='form-control no-resize' id='additional_text' required>"+additional+"</textarea><div class='help-info' id='additional_help'></div></div><button class='btn btn-primary waves-effect' id='submit_additional'>Update</button>");
                    showTinyMCE('additional_text');
                }
            }
        });
    });


        // update additional info
    $("#additional_body").on('click', '#submit_additional', function() {
        var username = $("#username").val();
        var additionalText = tinyMCE.activeEditor.getContent();
        var html = "<div class='alert alert-success alert-dismissible success' role='alert' style='margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Success!</strong> Additional information has been added!</div>";
        $("#additional_help").empty();
        if (additionalText.length == 0 || additionalText.length > 10000){
            $("#additional_help").append("<span class='col-red'>Additional can't be empty and can have maximum 10000 characters!</span>");
        }
        else{
            $.ajax({
                url: url+'updateAdditional',
                type: 'post',
                data: {uname:username, additional:additionalText},
                success:function(response){
                    $.ajax({
                        url: url+'getStudentData',
                        type: 'post',
                        data: {uname:username},
                        dataType: 'json',
                        success:function(response){
                            $(html).hide().appendTo("#notification").fadeIn(1000, function () {
                                $(this).delay(2000).fadeOut('slow');
                            });  
                            for( var i = 0; i<response.length; i++){
                                if(response[i]['additional'] == null){
                                    var additional = '';
                                }
                                else{
                                    var additional = response[i]['additional'];
                                }
                                $("#additional_body").empty().append("<p>"+additional+"</p><div class='row clearfix'><div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><buttun id='update_additional' class='btn btn-danger btn-lg waves-effect waves-float pull-right'><span class='glyphicon glyphicon-edit'></span> Update Additional Information</buttun></div></div>");
                            }
                        }
                    });
                }
            });
        }
    });

        // enable fields if the relative is staying in Japan
    $('input[type=checkbox][name=residence_lever]').change(function () {
        if($(this).is(':checked')){           
            $('#radio_1').prop('disabled', false).prop('checked', true);
            $('#radio_2').prop('disabled', false).prop('checked', false);
            $('input[name=school_employment_place]').prop('disabled', false).prop('required', true);
            $('input[name=residence_card_status]').prop('disabled', false).prop('required', true);
            $('input[name=residence_card_number]').prop('disabled', false).prop('required', true);
        }
        else{
            $('#radio_1').prop('disabled', true).prop('checked', false);
            $('#radio_2').prop('disabled', true).prop('checked', false);
            $("#school_employment_place_class").attr('class', 'form-line');
            $("#school_employment_place-error").empty();
            $('input[name=school_employment_place]').empty().prop('disabled', true).removeAttr('required').val('');
            $("#residence_card_status_class").attr('class', 'form-line');
            $("#residence_card_status-error").empty();
            $('input[name=residence_card_status]').empty().prop('disabled', true).removeAttr('required').val('');
            $("#residence_card_number_class").attr('class', 'form-line');
            $("#residence_card_number-error").empty();
            $('input[name=residence_card_number]').empty().prop('disabled', true).removeAttr('required').val('');
        }
    });

        // update if the student had past entry in Japan
    $('input[type=checkbox][name=past_entry_lever]').change(function () {
        var username = $("#username").val();
        if($(this).is(':checked')){              
            $("<p><b><span class='col-deep-orange'>Add past entry record &#8594; </span></b> <a href='?controller=students&action=addPastEntry&uname="+username+"' class='btn btn-success btn-circle-lg waves-effect waves-circle waves-float add_field_button'><i class='material-icons'>add</i></a></p>").hide().appendTo("#add_more_past_entry_button").fadeIn(500);
        }
        else{
            $('#add_more_past_entry_button').fadeOut(500, function() {
               $(this).empty().show();
            });
        }
    });

        // update if the supporter supporting financially other students in Japan
    $('input[type=radio][name=support_other_students_radio]').change(function () {
        var question = $(this).val();
        if (question == '0'){
            $("#support_other_students_details_class").attr('class', 'form-line');
            $("#support_other_students").val('').prop('disabled', true);
        }
        else if (question == '1'){
            $("#support_other_students_details_class").attr('class', 'form-line focused');
            $("#support_other_students").prop('disabled', false);
        }
    });


        // Function for showing Attachments
    function showAttachments(response, username) {
        var len = response.length;
        var countFade = 10;
        var countDelay = 10; 
        for( var i = 0; i<len; i++){    
            var name = response[i]['name'];
            var link = response[i]['link'];
            var thumbnail = response[i]['thumbnail'];
            var upload_date = response[i]['upload_date'];
            var alert = 'Delete this Attachment?';
            var showAllAttachments = "<div class='col-sm-6 col-md-3'><a href='"+link+"' target='_blank'><img class='img-responsive' src='"+thumbnail+"' alt='"+name+"''></a><p class='font-bold col-teal'>"+name+"</p><p><b>Uplode Date:</b> <span class='col-red'>"+upload_date+"</span></p><p><a href=+"+link+"+ download='"+name+"'' class='btn btn-primary waves-effect'><i class='material-icons'>file_download</i></a> <a href='?controller=students&action=deleteAttachment&uname="+username+"&unlink="+link+"' class='btn btn-danger waves-effect' onclick= 'return confirm(&#34;"+alert+"&#34;)'><i class='material-icons'>delete</i></a></p></div>";
            $(showAllAttachments).hide().appendTo("#showAllAttachments").delay(countDelay = countDelay + 80).fadeIn(countFade = countFade + 100);
        }
    }

        // Document Upload
    (function() {
        var bar = $('#bar');
        var percent = $('#percent');
        var username = $("#username").val();
        var warning = "<div class=five-zero-zero><div class='five-zero-zero-container'><div class='error-code'>Uh-oh! <i class='fa fa-frown-o' aria-hidden='true'></i></div><div class='error-message'>No Submitted File Found!</div></div></div> ";
        $('#file_upload').ajaxForm({
            beforeSend: function() {
                var percentVal = '0%';
                $('#upload_feedback').fadeOut('slow', function() {
                    $(this).html("<div class='progress'><div class='progress-bar bg-green progress-bar-striped active' style='width:"+percentVal+"'>"+percentVal+"</div></div>").fadeIn('slow');
                }); 
            },
            uploadProgress: function(event, position, total, percentComplete) {
                var percentVal = percentComplete + '%';
                $('#upload_feedback').html("<div class='progress'><div class='progress-bar bg-green progress-bar-striped active' style='width:"+percentVal+"'>"+percentVal+"</div></div>");
            },
            success: function() {
                var percentVal = '100%';
                $('#upload_feedback').html("<div class='progress'><div class='progress-bar bg-green progress-bar-striped active' style='width:"+percentVal+"'>"+percentVal+"</div></div>");
            },
            complete: function(xhr) {
                $("#file_input").empty().val("");
                $('#upload_feedback').fadeOut('slow', function() {
                    $(this).html("<div class='well'>"+xhr.responseText+"</div>").fadeIn('slow');
                    $(this).delay(1000).fadeOut(2000);
                });
                $.ajax({
                    url: url+'getAttachments',
                    type: 'post',
                    data: {uname:username},
                    dataType: 'json',
                    beforeSend: function(){
                       $("#showAllAttachments").empty();
                       $(loader).show().appendTo("#showAllAttachments");
                    },
                    complete: function(){
                        $(loader).hide().appendTo("#showAllAttachments");
                    },
                    success:function(response){
                        if(response) {
                            $("#showAllAttachments").empty();
                            showAttachments(response, username);
                        } else {
                            $("#showAllAttachments").empty();
                            $('#showAllAttachments').append(warning);
                        }
                    }
                });
            }
        }); 

    })();

});






























        // add fields sample
    /*var institude       = "<div class='col-sm-2'><div class='form-group form-float'><div class='form-line'><input type='text' class='form-control' name='institude[]' maxlength='255' minlength='5' value='' placeholder='Institude'></div></div></div>";
    var address         = "<div class='col-sm-3'><div class='form-group form-float'><div class='form-line'><input type='text' class='form-control' name='address[]' maxlength='500' minlength='5' value='' placeholder='Address'></div></div></div>";
    var degree          = "<div class='col-sm-2'><div class='form-group form-float'><div class='form-line'><input type='text' class='form-control' name='degree[]' maxlength='20' minlength='1' value='' placeholder='Degree'></div></div></div>";
    var startYear       = "<div class='col-sm-2'><div class='form-group form-float'><div class='form-line'><input type='date' class='form-control' name='start_year[]' value='' placeholder='Start Year'></div></div></div>";
    var endYear         = "<div class='col-sm-2'><div class='form-group form-float'><div class='form-line'><input type='date' class='form-control' name='end_year[]' value='' placeholder='End Year'></div></div></div>";
    var removeButton    = "<div class='col-sm-1'><button class='btn btn-danger btn-circle waves-effect waves-circle waves-float remove_field'><i class='material-icons'>delete</i></button></div>";
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append("<div class='row clearfix'>"+institude+address+degree+startYear+endYear+removeButton+"</div>"); //add input box
            resetFormValidator('#form_advanced_validation');
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').parent('div').remove(); x--;
    })*/