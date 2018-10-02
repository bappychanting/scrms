<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#supporter_info"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Update Study Plan</li>
            </ol>
        </div>

        <!-- Update Supporter Information -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                         <h2>
                            Update <?php echo  $student['family_name'].' '.$student['given_name']; ?>'s Study Plan               
                            <small>Change information in following fields to update study plan</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=updateStudyPlan'>
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <p><b>Enter a school of higher education in Japan</b></p>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="school_to_enroll" maxlength="100" minlength="5" value="<?php echo $student['school_to_enroll']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Name of school wish to enroll</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="study_subject" maxlength="100" minlength="5" value="<?php echo $student['study_subject']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Subject of study</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                            </div> 
                            <h2 class="card-inside-title">Details</h2>
                            <div class="form-group">
                                <div class="form-line focused">
                                    <textarea rows="1" name="study_plan_details" class="form-control no-resize auto-growth" required><?php echo $student['study_plan_details']; ?></textarea>
                                </div>
                            </div>                                  
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Supporter Information -->

    </div>
</section>