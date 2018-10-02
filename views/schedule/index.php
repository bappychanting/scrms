<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li class="active"><i class="material-icons">date_range</i> View Class Schedule</li>
            </ol>
        </div>

        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            <?php echo date('F', time()); ?> Class Schedule
                            <small>Click on <code>download PDF</code> from the header drop down to download <strong>PDF version of the class schedule</strong>.</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=schedule&action=generateSchedulePDF" target="_blank">Download PDF</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th><center><span class="col-teal"><i class="fa fa-hourglass-1"></i> Period</span></center></th>
                                    <th><center><span class="col-blue-grey"><i class="fa fa-language"></i> Batch Name</span></center></th>
                                    <th><center><span class="col-pink"><i class="fa fa-clock-o"></i> Batch Time</span></center></th>
                                    <th><center><span class="col-green"><i class="fa fa-calendar"></i> Scheduled Days</span></center></th>
                                    <th><center><span class="col-red"><i class="fa fa-id-card-o"></i> Teacher</span></center></th>
                                    <th><center><span class="col-blue"><i class="fa fa-compass"></i> Classroom</span></center></th>
                                    <th><center><span class="col-orange"><i class="fa fa-warning"></i> Batch Notice</span></center></th>
                                </tr>
                            </thead>
                            <tbody>
<?php 
    foreach($scheduleData['periods'] as $period){
        $count = 1;
        foreach($scheduleData['batches'] as $batch){
            if($batch['period_id'] == $period['id']){
                $count ++;
            }
        }    
?>
                                <tr>
                                    <td rowspan="<?php echo $count; ?>">
                                        <center>
                                            <span class='col-teal'>
                                            <?php echo "<b>".$period['period']."</b> (".date('h:i A', strtotime($period['start_time']))." - ".date('h:i A', strtotime($period['end_time'])).")"; ?>
                                            </span>
                                        </center>
                                    </td>
                                </tr>
<?php
        foreach($scheduleData['batches'] as $batch){
            if($batch['period_id'] == $period['id']){
?>
                                <tr>
                                    <td>
                                        <center>
                                            <span class='col-blue-grey'>
                                        <?php if($_SESSION['role'] == 4){ echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; } else { ?>
                                            <a href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover"  data-html="true" data-placement="right" 
                                            title="Actions" data-content="<ul>
                                                    <li><a href=&quot;?controller=students&action=sortByBatch&batch=<?php echo $batch['id'];?>&quot;>View All Students</a></li>
                                                     <li><a href=&quot;?controller=batches&action=viewAttendance&id=<?php echo $batch['id'];?>&quot;>View Attendance</a></li>
                                                    <li><a href=&quot;?controller=batches&action=addAttendance&id=<?php echo $batch['id'];?>&quot;>Add Attendance</a></li>
                                                    <li><a href=&quot;?controller=batches&action=allExams&id=<?php echo $batch['id'];?>&quot;>View All Exams</a></li>
                                                    <li><a href=&quot;?controller=batches&action=addExam&id=<?php echo $batch['id'];?>&quot;>Add New Exam</a></li>
                                                    <li><a href=&quot;?controller=batches&action=viewBatch&id=<?php echo $batch['id'];?>&quot;>View Batch Details</a></li>
                                                </ul>">
                                            <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>
                                            </a>
                                        <?php } ?>
                                            </span>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <span class='col-pink'>
                                            <?php echo date('h:i A', strtotime($batch['start_time']))." - ".date('h:i A', strtotime($batch['end_time'])); ?>
                                            </span>    
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <span class='col-green'>
<?php
                foreach($scheduleData['days'] as $day){
                    if($day['batch'] == $batch['id']){
                        echo $day['weekday'].", ";             
                    }
                }
?>
                                            </span>
                                        </center>
                                    </td>
                                    <td>
                                        <center><span class='col-red'><?php echo $batch['teacher_family_name'].' '.$batch['teacher_given_name']; ?></span></center>
                                    </td>
                                    <td>
                                        <center><span class='col-blue'><?php echo $batch['class']; ?></span></center>
                                    </td>
                                    <td>
                                        <center>
                                            <span class="col-orange">
                                            <?php 
                                                if($batch['start_date'] > strtotime(date('Y-m-01', time()))){
                                                    echo "Starts from ".date('l, F d ', $batch['start_date']);
                                                }
                                                elseif($batch['end_date'] <  strtotime(date('Y-m-t', time()))){
                                                    echo "Ends in ".date('l, F d', $batch['end_date']);
                                                }
                                                else{
                                                    echo "Will continue throughtout this month";
                                                }
                                            ?>
                                            </span>    
                                        </center>
                                    </td>
                                </tr>
<?php
            }
        }
    }
?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Basic Table -->

    </div>
</section>  