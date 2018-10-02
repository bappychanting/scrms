<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#past_entry"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">playlist_add</i> Add Past Entry</li>
            </ol>
        </div>

        <!-- add carrer record -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add <?php echo  $student['family_name'].' '.$student['given_name']; ?>'s Past Entry Record                      
                            <small>Input following information to add past entry record</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=storePastEntry'>
                             <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="residence_status" maxlength="20" minlength="2" value="<?php echo $data['residence_status']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Status of Residence</label>
                                        </div>
                                        <div class="help-info">Min. 2, Max. 20 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="entry_purpose" maxlength="500" minlength="5" value="<?php echo $data['entry_purpose']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Purpose of Entry</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" value="<?php echo $data['start_date']; ?>"  placeholder="Date of Entry" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="datepicker form-control" name="end_date"  value="<?php echo $data['end_date']; ?>" placeholder="Date of Exit" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                            </div>      
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Add Past Entry">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- add carrer record -->

    </div>
</section>