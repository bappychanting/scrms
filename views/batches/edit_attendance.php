<section class="content">
    <div class="container-fluid">

<?php foreach($result as $batch){ ?>

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $batch['batch_id']; ?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li><a href="?controller=batches&action=viewAttendance&id=<?php echo $batch['batch_id']; ?>"><i class="material-icons">list</i> View Attendance</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Attendance</li>
            </ol>
        </div>

        <!-- Attendance Score -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            <?php foreach($result as $batch) { ?>
                            Students Attendance of Batch <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']." in ". date("F d (l), Y", $batch['attendance_date']); ?>
                            <small>
                                Total Found <?php echo count($result); ?>.     
                            </small>
                            <?php break; } ?>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=updateAttendance' onsubmit="return validateForm()"> 
                            <input type="hidden" name="attendance_date_id" value="<?php echo $_GET['id']; ?>">
<?php   
    $count = 1;
    foreach($result as $attendance) { 
?>
                            <input type="hidden" name="id[]" value="<?php echo $attendance['id']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-2">
                                    <h2 class="card-inside-title"><?php echo $count.". ".$attendance['family_name'].' '.$attendance['given_name']; ?></h2>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="attendance[]"> 
                                            <option value="1" <?php if($attendance['attendance'] == '1'){ ?> selected="selected" <?php } ?>>Attended</option>  
                                            <option value="0" <?php if(empty($attendance['attendance'])){ ?> selected="selected" <?php } ?>>Did Not Attend</option>         
                                        </select> 
                                        <div class="help-info">Select Attendance</div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <b>Updated at:</b> <?php echo $attendance['update_date']; ?>
                                </div>
                            </div>
<?php   
        $count++;   
    }
?>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Attendance">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Attendance Table -->

<?php break; } ?>

    </div>
</section>  