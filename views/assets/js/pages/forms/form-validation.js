$(function () {
    $('#form_validation').validate({
        rules: {
            'checkbox': {
                required: true
            },
            'gender': {
                required: true
            }
        },
        highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        }
    });

    //Advanced Form Validation
    $('#form_advanced_validation').validate({
        rules: {
            'date': {
                customdate: true
            },
            'creditcard': {
                creditcard: true
            },
			'embedded': {
                embedded: true
            },
			'pass': {
                pass: true
            },
            'end_date' : {
                compareDate: true
            },
            'end_time' : {
                compareTime: true
            },
			'cpassword': {
			  equalTo: "#password"
			}
        },
        highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        }
    });

    //Custom Validations ===============================================================================
        //Date
    $.validator.addMethod('customdate', function (value, element) {
        return value.match(/^\d\d\d\d?-\d\d?-\d\d$/);
    },
        'Please enter a date in the format YYYY-MM-DD.'
    );

    //Credit card
    $.validator.addMethod('creditcard', function (value, element) {
        return value.match(/^\d\d\d\d?-\d\d\d\d?-\d\d\d\d?-\d\d\d\d$/);
    },
        'Please enter a credit card in the format XXXX-XXXX-XXXX-XXXX.'
    );
    //==================================================================================================
	   //Password
    $.validator.addMethod('pass', function (value, element) {
			 return /^[A-Za-z0-9\-@._*=+!()<>"':;|#^&*%,$]*$/.test(value) // consists of only these
		   && /[a-z]/.test(value) // has a lowercase letter
		   && /[A-Z]/.test(value) // has an Uppercase letter
		   && /[0-9]/.test(value) // has a digit
		   && /[-@._*=+!()<>"':;|#^&*%,$]/.test(value); // has a special character
	},
        'Must contain at least one number, one uppercase and lowercase letter and one special character'
    );
    //==================================================================================================
        //Compare Date
    $.validator.addMethod('compareDate', function (value, element) {
            var startDate =  new Date($('#start_date').val());
            var endDate = new Date(value);
            return endDate >startDate;
    },
        'End date must be greater than start date'
    );
    //==================================================================================================
        //Compare Time
    $.validator.addMethod('compareTime', function (value, element) {
            var startTime =  new Date("1970-1-1 " + $('#start_time').val());
            var endTime = new Date("1970-1-1 " + value);
            return endTime >startTime;
    },
        'End time must be greater than start time'
    );
    //==================================================================================================
});