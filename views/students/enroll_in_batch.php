<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                 <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">input</i> Enroll Student in a Batch</li>
            </ol>
        </div>

        <!-- Enroll in Batch -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                         <h2>
                            Enroll <?php echo  $student['family_name'].' '.$student['given_name']; ?> in a Batch                     
                            <small>Applies for students who have admitted in a training course</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=updateBatch'>
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <select class="form-control show-tick" data-live-search="true" name="batch" id="batch">
                                            <option value="">-- Nothing Selected --</option> 
                                        <?php foreach($verify['batches'] as $batch){ ?>
                                            <option value="<?php echo $batch['id']; ?>" <?php if($batch['id'] == $student['batch']){ ?> selected="selected" <?php } ?>><?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Select Student Batch</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused" id="rollclass">
                                            <input type="number" class="form-control" name="roll" min="1" max="999" value="<?php echo $student['roll']; ?>" required>
                                            <label class="form-label">Roll Number</label>
                                        </div>
                                        <div class="help-info" id="rollhelpinfo">Once a batch is selected system will autometically generate an available roll number for you</div>
                                    </div>
                                </div>
                            </div>    
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Assign">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Enroll in Batch -->

    </div>
</section>