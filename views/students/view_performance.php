<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li class="active"><i class="material-icons">account_box</i> Show Student Profile</li>
            </ol>
        </div>

        <!-- User data for updating fields -->
            <input type="hidden" id="username" value="<?php echo $student['username']; ?>">
        <!-- #END# User data for updating fields -->

        <!-- Info -->
        <div class="block-header">
             <h2>
                <?php echo $student['family_name'].' '.$student['given_name']; ?> (Student Performance)
                <small><strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($student['create_date'])); ?>, <strong>Updated At: </strong>  <?php echo date("F d (l), Y", strtotime($student['update_date'])); ?>. <a href="?controller=users&action=showUser&uname=<?php echo $student['username']; ?>">Click here</a> to view his user profile! <a href="?controller=students&action=showStudentProfile&uname=geomatry">Click here</a> to view his student profile!</small>
            </h2>
        </div>
        <!-- #END# Info -->

        <!-- Option -->
        <div class="block-header">
            <a href="?controller=students&action=assignBatch&uname=<?php echo $student['username']; ?>" class="btn btn-default btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Change/Assign Batch">
                <i class="material-icons">input</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#educational_record" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Educational Record">
                <i class="material-icons">school</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#language_certification" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Japaenese Language Certification">
                <i class="material-icons">language</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#carrer_record" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Carrer Record">
                <i class="material-icons">work</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#past_entry" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Past Entry">
                <i class="material-icons">flight_land</i>
            </a>
             <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#family_information" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Family Information">
                <i class="material-icons">wc</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#study_plan" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Study Plan">
                <i class="material-icons">location_city</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#supporter_info" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Supporter's Information">
                <i class="material-icons">rowing</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#study_purpose" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Study Purpose">
                <i class="material-icons">speaker_notes</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#additional" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Additional Information">
                <i class="material-icons">assignment</i>
            </a>
            <a href="#" class="btn btn-danger btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="View Student Performance">
                <i class="material-icons">assessment</i>
            </a>
            <a href="?controller=students&action=showStudentAttachments&uname=<?php echo $student['username']; ?>" class="btn btn-warning btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="View Submitted Files">
                <i class="material-icons">attachment</i>
            </a>
            <a href="?controller=students&action=savePDF&uname=<?php echo $student['username']; ?>" target="_blank" class="btn btn-success btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Save as PDF">
                <i class="material-icons">picture_as_pdf</i>
            </a>
        </div>
        <!-- #END# Option --> 


        <!-- Student Exams -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
<?php 
    if(isset($student['exams'])) {
?>
                <div class="panel-group" id="accordion_1" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-warning">
                        <div class="panel-heading" role="tab" id="headingTwo_1">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_1" href="#collapseTwo_1" aria-expanded="false"
                                   aria-controls="collapseTwo_1">
                                    <i class="fa fa-exclamation-circle"></i>
                                    <?php echo count($student['exams']); ?> Upcoming Exam(s)! Click for details..
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo_1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo_1">
                            <div class="panel-body">
<?php
        foreach($student['exams'] as $exam){ 
            $remaining = $exam['exam_date'] - time();
            $remainingDays=floor($remaining/(60*60*24));
            $remainingHours=round(($remaining-$remainingDays*60*60*24)/(60*60));
?>
                                <h5>Exam <?php echo $exam['title']; ?></h5>
                                <small>
                                    <span class="glyphicon glyphicon-time"></span>
                                    <?php echo date("F d (l), Y", $exam['exam_date']); ?> 
                                    <strong>(
                                        <?php 
                                            if($remainingDays >= 0) 
                                                echo $remainingDays.' Days, '.$remainingHours.' Hours Remaining!';
                                            else
                                                echo 'Exam date expired';
                                        ?>
                                    )</strong>
                                </small>
                                <hr>
                                <?php echo $exam['description']; ?>
<?php
        }
?>
                            </div>
                        </div>
                    </div>
                </div>
<?php
    } else{ 
?>               
                <div class="alert alert-info alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Cheers!</strong> There is no exams upcoming!
                </div>
<?php  
    } 
?>
            </div>
        </div>
        <!-- #END# Student Exams --> 

        <!-- Student Performance -->
<?php 
    if(isset($student['performance']) && isset($student['attendances'])) { 
        $score = 0;
        $maxScore = 0;
        foreach($student['performance'] as $performance){ 
            $score = $score + $performance['score'];
            $maxScore = $maxScore + $performance['max_score'];
        }
        $examAverage =  ($score * 100) / $maxScore;
        $count = 0;
        foreach($student['attendances'] as $data)
            if(!empty($data['attendance']))
                $count++;

        $attendanceAverage = ($count * 100) / count($student['attendances']);

        $totalAverage = ($examAverage + $attendanceAverage) / 2;
        $starRating =  intval(($totalAverage * 5) / 100);
?>
            <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Overall Performance
                            <small>Overall performance and skill is evaluated based on both the student's exam and attedance performance</small>
                        </h2>
                    </div>
                    <div class="body">
                         <div class="row clearfix">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h3>Overall Score: <?php echo  intval($totalAverage); ?> out of 100</h3>
                                <h4>Student Rating: <?php 
                                                for($i=0; $i<5; $i++){ 
                                                    $class = "fa fa-star";
                                                    if($i < $starRating){
                                                         $class = "fa fa-star col-orange";
                                                    }
                                            ?> 
                                            <span class="<?php echo $class; ?>"></span>
                                <?php 
                                            } 
                                ?></h4>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <h4 class="col-teal"> Attendace: <?php echo $count; ?> out of <?php echo count($student['attendances']); ?> classes</h4>
                                <h5 class="col-red"> Average Score: <?php echo $attendanceAverage; ?> out of 100</h5>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <h4 class="col-teal"> Total Exams: <?php echo count($student['performance']); ?></h4>
                                <h5 class="col-red"> Average Score: <?php echo intval($examAverage); ?> out of 100</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<?php  
    } 
    else{ 
?>
        <div class="list-unstyled row clearfix">
            <div class="five-zero-zero">
                <div class="five-zero-zero-container">
                    <div class="error-code">Uh-oh! <i class="fa fa-frown-o" aria-hidden="true"></i></div>
                    <div class="error-message">
                        Overall performance cannot be evaluated without details of both exam and performance!
                    </div>
                </div>
            </div>  
        </div>
<?php  
    } 
?>
        <!-- #END# Student Performance --> 

        <!-- Exam Performance -->
<?php 
    if(isset($student['performance'])) { 
?>
            <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Exam Details
                            <small>Evaluate performance and skill based on the Score and average of all the exams the student has participated</small>
                        </h2>
                    </div>
                    <div class="body">
<?php               
        foreach($student['performance'] as $performance){ 
            $average = ($performance['score'] * 100) / $performance['max_score'];
?>      
                        <h2 class="card-inside-title">
                            Exam <?php echo $performance['title']; ?>
                            <small><strong>Exam Date:</strong> <?php echo date("F d (l), Y", $performance['exam_date']); ?></small>
                        </h2>
                        <hr>
                        <p>
                            <span class="font-bold">Score:</span> 
                            <span class="col-green"><?php echo $performance['score']; ?></span> out of <span class="col-red"><?php echo $performance['max_score']; ?></span>
                        </p>
                        <p class="font-bold"><span class="col-green"><?php echo intval($average); ?>&#37;</span> out of <span class="col-red">100</span></p>
                        <h2 class="card-inside-title">Examiner&rsquo;s Comment: </h2>
                        <blockquote>
                            <p><?php echo $performance['exam_comment']; ?></p>
                            <footer>By <cite title="Source Title"><?php echo $performance['teacher_family_name']." ".$performance['teacher_given_name']; ?></cite></footer>
                        </blockquote>
<?php   
        }   
?>
                    </div>
                </div>
            </div>
        </div>
<?php  
    } 
    else{ 
?>
        <div class="list-unstyled row clearfix">
            <div class="five-zero-zero">
                <div class="five-zero-zero-container">
                    <div class="error-code">Uh-oh! <i class="fa fa-frown-o" aria-hidden="true"></i></div>
                    <div class="error-message">
                        No Exam Records Found!
                    </div>
                </div>
            </div>  
        </div>
<?php  
    } 
?>
        <!-- #END# Exam Performance --> 

        <!-- Student Attendacnce -->
<?php 
    if(isset($student['attendances'])) { 
        $count = 0;
        foreach($student['attendances'] as $data)
            if(!empty($data['attendance']))
                $count++;
?>
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Attendance Details
                                <small>Attended <strong><?php echo $count; ?></strong> out of <strong><?php echo count($student['attendances']); ?></strong> scheduled dates</small>
                            </h2>
                        </div>
                        <div class="body table-responsive">
                            <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Batch</th>
                                        <th>Updated At</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Batch</th>
                                        <th>Updated At</th>
                                    </tr>
                                </tfoot>
                                <tbody>
<?php
    foreach($student['attendances'] as $data){
?>
    
                                    <tr>
                                        <td><?php echo date("F d (l), Y", $data['attendance_date']); ?></td>
                                        <td><?php if(empty($data['attendance'])){ echo 'Did Not Attend'; } else{ echo 'Attended'; } ?></td>
                                        <td><?php echo $data['acronym']."-".$data['period'][0]."-".$data['batch_number']; ?></td>
                                        <td><?php echo $data['update_date']; ?></td>
                                    </tr>
<?php
        }
?>                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
<?php  
    } 
    else{ 
?>
        <div class="list-unstyled row clearfix">
            <div class="five-zero-zero">
                <div class="five-zero-zero-container">
                    <div class="error-code">Uh-oh! <i class="fa fa-frown-o" aria-hidden="true"></i></div>
                    <div class="error-message">
                        No Attendance Records Found!
                    </div>
                </div>
            </div>  
        </div>
<?php  
    } 
?>
        <!-- #END# Student Attendacnce --> 
       

       <!-- Scroll to top button -->
        <div id="scrollToTopButton" style="margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; right: 25px;">
            <button type="button" class="btn bg-cyan btn-circle-lg waves-effect waves-circle waves-float"><i class="material-icons">arrow_drop_up</i></button>
        </div>
        <!-- #END# Scroll to top button --> 

    </div>
</section>  