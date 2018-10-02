<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Student Management System</title>
        <!-- Favicon-->
        <link rel="icon" href="views/assets/images/favicon.png" type="image/x-icon">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

        <!-- Bootstrap Core Css -->
        <link href="views/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Waves Effect Css -->
        <link href="views/assets/plugins/node-waves/waves.css" rel="stylesheet" />

        <!-- Animation Css -->
        <link href="views/assets/plugins/animate-css/animate.css" rel="stylesheet" />

         <!-- Light Gallery Plugin Css -->
        <link href="views/assets/plugins/light-gallery/css/lightgallery.css" rel="stylesheet">

         <!-- JQuery DataTable Css -->
        <link href="views/assets/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

        <!-- Bootstrap Material Datetime Picker Css -->
        <link href="views/assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />

        <!-- Bootstrap Select Css -->
        <link href="views/assets/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

        <!-- Sweet Alert Css -->
        <link href="views/assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

        <!-- Autocomplete Css -->
        <link href="views/assets/plugins/autocomplete/jquery.autocomplete.css" rel="stylesheet">
        <link href="views/assets/plugins/autocomplete/prettify.css" rel="stylesheet" />

        <!-- Custom Css -->
        <link href="views/assets/css/style.css" rel="stylesheet">

        <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
        <link href="views/assets/css/theme-red.css" rel="stylesheet" />

    </head>

    <body class="<?php if ($action == "frontpage"){?> login-page <?php } elseif ($action == "resetPass"){ ?> fp-page <?php } elseif($action == "resetLink"){?> signup-page <?php } else { ?>theme-red<?php } ?>" >
        <!-- Content to update Starts Here -->
<?php 
    require_once('routes.php'); 
?> 
        <!-- Content to update Ends Here -->
        
        <!-- Jquery Core Js -->
        <script src="views/assets/plugins/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core Js -->
        <script src="views/assets/plugins/bootstrap/js/bootstrap.js"></script>

        <!-- Select Plugin Js -->
        <script src="views/assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>

        <!-- Slimscroll Plugin Js -->
        <script src="views/assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

        <!-- Bootstrap Notify Plugin Js -->
        <script src="views/assets/plugins/bootstrap-notify/bootstrap-notify.js"></script>

        <!-- Jquery Validation Plugin Css -->
        <script src="views/assets/plugins/jquery-validation/jquery.validate.js"></script>

        <!-- JQuery Steps Plugin Js -->
        <script src="views/assets/plugins/jquery-steps/jquery.steps.js"></script>

        <!-- Jquery Stay Message Js -->
        <script src="views/assets/plugins/staymessage/jquery.are-you-sure.js"></script>
        <script src="views/assets/plugins/staymessage/ays-beforeunload-shim.js"></script>

         <!-- Jquery DataTable Plugin Js -->
        <script src="views/assets/plugins/jquery-datatable/jquery.dataTables.js"></script>
        <script src="views/assets/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
        <script src="views/assets/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

        <!-- Sweet Alert Plugin Js -->
        <script src="views/assets/plugins/sweetalert/sweetalert.min.js"></script>

        <!-- Waves Effect Plugin Js -->
        <script src="views/assets/plugins/node-waves/waves.js"></script>

        <!-- Chart Plugins Js -->
        <script src="views/assets/plugins/chartjs/Chart.bundle.js"></script>

         <!-- Light Gallery Plugin Js -->
        <script src="views/assets/plugins/light-gallery/js/lightgallery-all.js"></script>

        <!-- Jquery CountTo Plugin Js -->
        <script src="views/assets/plugins/jquery-countto/jquery.countTo.js"></script>

         <!-- Autosize Plugin Js -->
        <script src="views/assets/plugins/autosize/autosize.js"></script>

        <!-- Moment Plugin Js -->
        <script src="views/assets/plugins/momentjs/moment.js"></script>

        <!-- Bootstrap Material Datetime Picker Plugin Js -->
        <script src="views/assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

        <!-- TinyMCE -->
        <script src="views/assets/plugins/tinymce/tinymce.js"></script>

        <!-- Flip Clock -->
        <script src="views/assets/plugins/clock-digital/flipclock.js"></script>
        <script src="views/assets/plugins/clock-digital/script.js"></script>

        <!-- Weather -->
        <script src="views/assets/plugins/weather/jquery.simpleWeather.js"></script>
        <script src="views/assets/plugins/weather/script.js"></script>

        <!-- Autocomplete -->
        <script src="views/assets/plugins/autocomplete/prettify.js"></script>
        <script src="views/assets/plugins/autocomplete/jquery.autocomplete.js"></script>

        <!-- Sparkline Chart Plugin Js -->
        <script src="views/assets/plugins/jquery-sparkline/jquery.sparkline.js"></script>
        
        <!-- Custom Js -->
        <script src="views/assets/js/script.js"></script>
        <script src="views/assets/js/staymessage.js"></script>
        <script src="views/assets/js/jqueryUser.js"></script>
        <script src="views/assets/js/jqueryMessage.js"></script>
        <script src="views/assets/js/jqueryBatch.js"></script>
        <script src="views/assets/js/jqueryStudent.js"></script>
        <script src="views/assets/js/jqueryNotice.js"></script>
        <script src="views/assets/js/excelexportjs.js"></script>
        <script src="views/assets/js/exceldownload.js"></script>
        <script src="views/assets/js/admin.js"></script>
        <script src="views/assets/js/jquery.form.js"></script>
        <script src="views/assets/js/pages/examples/sign-in.js"></script>
        <script src="views/assets/js/pages/examples/forgot-password.js"></script>
        <script src="views/assets/js/pages/examples/sign-up.js"></script>
        <script src="views/assets/js/pages/medias/image-gallery.js"></script>
        <script src="views/assets/js/pages/ui/modals.js"></script>
        <script src="views/assets/js/pages/tables/jquery-datatable.js"></script>
        <script src="views/assets/js/pages/forms/editors.js"></script>
        <script src="views/assets/js/pages/forms/basic-form-elements.js"></script>
        <script src="views/assets/js/pages/forms/form-validation.js"></script>
        <script src="views/assets/js/pages/ui/tooltips-popovers.js"></script>
        <script src="views/assets/js/pages/widgets/infobox/infobox-1.js"></script>
        
        <!-- Page Specific add ons -->
<?php if(isset($_SESSION['role']) && $_SESSION['role'] < 4 && isset($_GET['action']) && $_GET['action'] == 'home'){ ?>
        <script src="views/assets/js/pages/charts/chartjs.js"></script>
<?php } ?>
        <!-- Page Specific add ons -->

        <!-- Demo Js -->
        <script src="views/assets/js/demo.js"></script>    
    </body>

</html>
<?php 
ob_end_flush();
?>