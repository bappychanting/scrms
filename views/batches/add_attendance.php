<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $batch['id']; ?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li class="active"><i class="material-icons">playlist_add</i> Add New Attendance</li>
            </ol>
        </div>

        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add New Schedule Class Date to Batch <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>                  
                            <small>Choose a unique date for class schedule!</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeAttendance' onsubmit="return validateForm()"> 
                            <input type="hidden" name="id" value="<?php echo $batch['id']; ?>">    
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" class="datepicker form-control" name="attendance_date" value="<?php echo $data['attendance_date']; ?>" placeholder="Choose Schedule Class Date" required>
                                </div>
                            </div>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                            <input class="btn btn-warning waves-effect" type="reset" value="Reset">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Advanced Validation -->

    </div>
</section>  