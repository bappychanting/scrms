$(function () {
    $('#sign_up').validate({
        rules: {
            'pass': {
                pass: true
            },
            'terms': {
                required: true
            },
            'confirm': {
                equalTo: '[name="pass"]'
            }
        },
        highlight: function (input) {
            console.log(input);
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.input-group').append(error);
            $(element).parents('.form-group').append(error);
        }
    });

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

});