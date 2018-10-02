<section class="content">
        <div class="container-fluid">

    <!-- Add Ons -->
        <link href="views/assets/plugins/weather/weather.css" rel="stylesheet">
        <link href="views/assets/plugins/clock-digital/flipclock.css" rel="stylesheet">
    <!-- #End# Add Ons -->

    <!-- Dashbooard -->
        
        <div class="animated zoomIn text-center">
            <h2>Hi! Welcome to Dashboard..</h2>
            <p class="col-grey" id="quote"></p>
        </div>
        
        <!-- Widgets -->
        <div class="row clearfix">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="weather">
                    <div class="row clearfix">
                        <div class="col-sm-3">
                            <span id="icon"></span>
                        </div>
                        <div class="col-sm-7">
                            <h2 id="temperature" class="col-orange"></h2>
                            <h4 class="col-green">Dhaka, Bangladesh</h4>
                            <p class="col-red"><span id="condition"></span>, <span id="air"></span></p>
                        </div>
                    </div>
                </div>
            </div> 
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <h5 class="text-center"><i class="fa fa-calendar"></i> <?php echo date('F d (l), Y'); ?></h5>
                <div class="clock" style="margin:2em;"></div>
            </div>
        </div> 
        <!-- #End# Widgets -->

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li class="active"><i class="material-icons">home</i> Dashboard</li>
            </ol>
        </div>

        <div class="row clearfix">

            <!-- Hover Zoom Effect -->
            <a href="?controller=schedule&action=viewSchedule">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box hover-zoom-effect">
                            <div class="icon bg-blue">
                                <i class="material-icons">date_range</i>
                            </div>
                            <div class="content">
                                <div class="text">VIEW CLASS SCHEDULE</div>
                            </div>
                        </div>
                </div>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $_SESSION['uname']; ?>">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box hover-zoom-effect">
                            <div class="icon bg-pink">
                                <i class="material-icons">account_box</i>
                            </div>
                            <div class="content">
                                <div class="text">SHOW STUDENT PROFILE</div>
                            </div>
                        </div>
                </div>
            </a>
            <a href="?controller=suggestions&action=studentSuggestions">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box hover-zoom-effect">
                            <div class="icon bg-light-blue">
                                <i class="material-icons">live_help</i>
                            </div>
                            <div class="content">
                                <div class="text">VIEW YOUR SUGGESTIONS</div>
                            </div>
                        </div>
                </div>
            </a>
            <a href="?controller=messages&action=allStaff">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box hover-zoom-effect">
                            <div class="icon bg-cyan">
                                <i class="material-icons">contact_mail</i>
                            </div>
                            <div class="content">
                                <div class="text">CONTACT DJIT STAFF</div>
                            </div>
                        </div>
                </div>
            </a>
            <!-- #END# Hover Zoom Effect -->

            <!-- Notices -->
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<?php
    if($newNotices){
        $count = 1;
?>
                <div class="card">
                    <div class="header">
                        <h2>
                            Latest Notices
                            <small>Click on the notices to view details</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=notices&action=allNotices">All Notices</a></li>
                                    <li><a href="?controller=notices&action=addNotice">Add New Notice</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="panel-group" id="accordion_3" role="tablist" aria-multiselectable="true">
<?php
        foreach($newNotices as $notice){
?>
                            <div class="panel panel-primary">
                                <div class="panel-heading" role="tab" id="heading<?php echo $count; ?>_3">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_3" href="#collapse<?php echo $count; ?>_3" aria-expanded="false"
                                           aria-controls="collapse<?php echo $count; ?>_3">
                                           <i class="material-icons">info_outline</i>
                                            <?php echo $notice['title']; ?>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse<?php echo $count; ?>_3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading<?php echo $count; ?>_3">
                                    <div class="panel-body">
                                        <div class="row clearfix">
                                            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                                                <h6>
                                                    Announced in
                                                    <?php echo date("F d (l), Y", strtotime($notice['create_date'])); ?> 
                                                    by <a href="?controller=users&action=showUser&uname=<?php echo $notice['username']; ?>">
                                                    <?php echo $notice['family_name'].' '.$notice['given_name']; ?>
                                                    </a>
                                                </h6><hr>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                <span class='col-deep-orange'>View Comments &#8594;</span>
                                                <a class="btn btn-success waves-effect pull-right" href="?controller=notices&action=viewComments&id=<?php echo $notice['id']; ?>">
                                                    <i class="material-icons">comment</i>
                                                </a>
                                            </div>
                                        </div>
                                        <p><?php echo $notice['details']; ?></p>
                                    </div>
                                </div>
                            </div>
<?php
            $count++;
        }
?>
                            </div>
                        </div>
                    </div>
<?php
    }
    else{
        echo "<center><h1><i class='fa fa-frown-o' aria-hidden='true'></i> No New Notices Found!</h1><hr></center>";
    }
?>
                </div>

                <!-- #End Notices# -->

                <!-- Panorama (Street View) -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Information
                            </h2>
                        </div>
                        <div class="body">
                            <p>
                                <a href="javascript:void(0);">Click here</a> to download user manual
                                <br>For any further query please call in this number +8801712423414
                            </p>
                        </div>
                    </div>
                </div>
                <!-- #END# Panorama (Street View) -->
            </div>    
    </div>
</section>                   