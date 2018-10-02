<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</a></li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Student Detail</li>
            </ol>
        </div>

        <!-- Update Passport -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                         <h2>
                            Edit Student Details for <?php echo  $student['family_name'].' '.$student['given_name']; ?>                     
                            <small>Input following initial information to create student profile</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=updateStudentPassport'>
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <label for="passport">Passport</label>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <input type="text" class="form-control" name="passport_no" maxlength="30" minlength="14" value="<?php echo $student['passport_no']; ?>"  autocomplete="off" required>
                                </div>
                                <div class="help-info">Min. 14, Max. 30 characters</div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <label for="start_date">Issue Date</label>
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="start_date" value="<?php echo date("l d F Y", $student['passport_issue']) ; ?>" id="start_date" placeholder="Issue Date" required>
                                        </div>
                                        <div id="start_date_error" class="help-info"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label for="end_date">Expiration Date</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="end_date" value="<?php echo date("l d F Y", $student['passport_expiration']) ; ?>" placeholder="Expiration Date" required>
                                        </div>
                                    </div>
                                    <div id="end_date_error" class="help-info"></div>
                                </div>
                            </div>                                       
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Education Record -->

    </div>
</section>