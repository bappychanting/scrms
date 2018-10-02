<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#educational_record"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">playlist_add</i> Add Carrer Record</li>
            </ol>
        </div>

        <!-- add carrer record -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add <?php echo  $student['family_name'].' '.$student['given_name']; ?>'s Carrer Record                      
                            <small>Input following information to add carrer record</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=storeCarrerRecord'>
                             <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
					        <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="organization" maxlength="100" minlength="2" value="<?php echo $data['organization']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Organization</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="occupation" maxlength="100" minlength="2" value="<?php echo $data['occupation']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Occupation</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="<?php echo $data['class']; ?>">
                                    <input type="text" class="form-control" name="address" maxlength="500" minlength="5" value="<?php echo $data['address']; ?>"  autocomplete="off" required>
                                    <label class="form-label">Address</label>
                                </div>
                                <div class="help-info">Min. 5, Max. 500 characters</div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" value="<?php echo $data['start_date']; ?>"  placeholder="Start Year" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="datepicker form-control" name="end_date"  value="<?php echo $data['end_date']; ?>" placeholder="End Year" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                            </div>      
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Add Educational Record">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- add carrer record -->

    </div>
</section>