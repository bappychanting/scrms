$(document).ready(function(){

    $('#form_advanced_validation').areYouSure(
      {
        message: 'It looks like you have been editing something. '
               + 'If you leave before saving, your changes will be lost.'
      }
    );

 });