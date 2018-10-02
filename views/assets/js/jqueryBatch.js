$(document).ready(function(){

    url = "jquery.php/?controller=jquery&action="; 
    var batchValidated = true;
    var checkboxValidated = true;
    var startTimeValidated = true;
    var endTimeValidated = true;

        // Get Batch Type Acronym  
    $("#type").keyup(function(){
        var getType = $(this).val();
        if (getType.length >= 1) {
            searchRequest = $.ajax({
                url: url+'suggestAcronym',
                type: 'post',
                data: {type:getType},
                dataType: 'json',
                success:function(response){
                    $("#batchTypeLevelClass").attr('class', 'form-line focused');
                    $('input[name=acronym]').val(response);
                    $('input[name=acronym]').attr("value",response);
                }
            });
        }
        else{
            $("#batchTypeLevelClass").attr('class', 'form-line');
            $('input[name=acronym]').val('');
            $('input[name=acronym]').attr("value",'');
        }
    });

        // Check batch period availability
    $("input[name=period]").keyup(function(){
        var period = $(this).val();
        var id = $("input[name=id]").val();
        if (period.length > 0) {
            $.ajax({
                url: url+'checkBatchPeriodNameAvailability',
                type: 'post',
                data: {id: id, period: period},
                dataType: 'json',
                success:function(response){
                    if(response == "yes") {
                        $("#batch_period_info").empty().append('Period Name available!');
                        $("#batch_period_class").attr('class', 'form-line focused');
                    } 
                    else {
                        $("#batch_period_info").empty().append('<span class="col-red">Period name not available! Please try again with different period name!</span>');
                        $("#batch_period_class").attr('class', 'form-line error focused');
                    }
                }    
            });
        }
        else{
            $("#batch_period_info").empty().append('Min. 2, Max. 20 characters');
            $("#batch_period_class").attr('class', 'form-line');
        }
    });

        // Check batch availability
    $("#batchType").change(function(){
        $("#batchNumber").empty().val('');
        $("#batchNumberInfo").empty().append('Batch number should be minimum 01, maximum 999');
        $("#batchNumberClass").attr('class', 'form-line');
    });
    $("#batchNumber").keyup(function(){
        var batchNumber = $(this).val();
        var batchType = $("#batchType").val();
        var batchId = $("#batch_id").val();
        if (batchNumber.length > 0) {
            $.ajax({
                url: url+'checkBatchAvailability',
                type: 'post',
                data: {id: batchId, type:batchType, number:batchNumber},
                dataType: 'json',
                success:function(response){
                    if(response == "yes") {
                        batchValidated = true;
                        $("#batchNumberInfo").empty().append('Batch type and number available!');
                        $("#batchNumberClass").attr('class', 'form-line focused');
                    } 
                    else {
                        batchValidated = false;
                        $("#batchNumberInfo").empty().append('<span class="col-red">Combination of Batch type and number is not available! Please try again with different batch type or number.</span>');
                        $("#batchNumberClass").attr('class', 'form-line error focused');
                    }
                }    
            });
        }
        else{
            $("#batchNumberInfo").empty().append('Batch number should be minimum 01, maximum 999');
            $("#batchNumberClass").attr('class', 'form-line');
        }
    });  


        // Checkbox validation
    $('input[type=checkbox]').change(function () {
        checked = $("input[type=checkbox]:checked").length;
        if(!checked) {
            checkboxValidated = false;
            $("#checkbox_error_message").empty().append('<span class="col-red">You must check at least one checkbox!</span>');
        }
        else{
            checkboxValidated = true;
            $("#checkbox_error_message").empty();
        }
    });

        // Batch Period validation
    $('#period').change(function () {
        $("#start_time").empty().val('');
        $("#start_time_error").empty();
        $("#end_time").empty().val('');
        $("#end_time_error").empty();
    });


        // Validate start time of a batch
    $('#start_time').change(function(){
        var startTime = new Date("1970-1-1 " + $(this).val());
        var periodId = $("#period").val(); 
        $.ajax({
            url: url+'validateBatchTime',
            type: 'post',
            data: {id:periodId},
            dataType: 'json',
            success:function(response){
                var len = response.length;
                for( var i = 0; i<len; i++){
                    var period = response[i]['period'];
                    var expandStarttime = response[i]['expand_start_time'];
                    var time = new Date("1970-1-1 " + response[i]['start_time']);
                    var expandStartTime = new Date(time - expandStarttime*60000);
                    var limit = expandStartTime.getHours()+':'+expandStartTime.getMinutes();
                    if(startTime < expandStartTime){
                        startTimeValidated = false;
                        $("#start_time_error").empty().append('<span class="col-red">Starting time for '+period+' batch has to be after '+limit+'.</span>');
                    }
                    else{
                        startTimeValidated = true;
                        $("#start_time_error").empty();
                    }
                }
            }    
        });
    }); 

        // Validate end time of a batch
    $('#end_time').change(function(){
        var endTime = new Date("1970-1-1 " + $(this).val());
        var periodId = $("#period").val(); 
        $.ajax({
            url: url+'validateBatchTime',
            type: 'post',
            data: {id:periodId},
            dataType: 'json',
            success:function(response){
                var len = response.length;
                for( var i = 0; i<len; i++){
                    var period =response[i]['period'];
                    var expandEndtime = response[i]['expand_end_time'];
                    var time = new Date("1970-1-1 " + response[i]['end_time']);
                    var expandEndTime = new Date(time.getTime() + expandEndtime*60000);
                    var limit = expandEndTime.getHours()+':'+expandEndTime.getMinutes();
                    if(endTime > expandEndTime){
                        endTimeValidated = false;
                        $("#end_time_error").empty().append('<span class="col-red">Ending time for '+period+' batch has to be before '+limit+'.</span>');
                    }
                    else{
                        endTimeValidated = true;
                        $("#end_time_error").empty();
                    }
                }
            }    
        });
    });

        // Batch Form Validation
    $("#form_advanced_validation").submit(function(){ 
        if(!batchValidated){
            return false;
        }
        else if(!checkboxValidated){
            return false;
        }   
        else if(!startTimeValidated){
            return false;
        }   
        else if(!endTimeValidated){
            return false;
        } 
    });


});