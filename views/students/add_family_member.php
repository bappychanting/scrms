<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#family_information"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">playlist_add</i> Add Family Member</li>
            </ol>
        </div>

        <!-- Create Student Profile -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add <?php echo  $student['family_name'].' '.$student['given_name']; ?>'s Family Member          
                            <small>Input following information to add family member</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form method="post" action='?controller=students&action=storeFamilyMember'>
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="name" maxlength="255" minlength="5" value="<?php echo $data['name']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Name</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 255 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="relationship" data-live-search="true">
                                        <?php foreach($studentData['relationships'] as $relationship){ ?>
                                            <option value="<?php echo $relationship['id']; ?>" <?php if($relationship['id'] == $data['relationship']){ ?> selected="selected" <?php } ?>><?php  echo $relationship['name']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Relation with Student</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="dob" value="<?php echo $data['dob']; ?>" placeholder="Date of Birth" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="nationality" maxlength="255" minlength="2" value="<?php echo $data['nationality']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Nationality</label>
                                        </div>
                                        <div class="help-info">Min. 2, Max. 255 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="occupation" maxlength="255" minlength="2" value="<?php echo $data['occupation']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Occupation</label>
                                        </div>
                                        <div class="help-info">Min. 2, Max. 255 characters</div>
                                    </div>
                                </div>
                            </div>   
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="presentAddress" maxlength="500" minlength="4" value="<?php echo $data['presentAddress']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Present Address</label>
                                        </div>
                                        <div class="help-info">Present Address is where the user is currently living in</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="permanentAddress" maxlength="500" minlength="4" value="<?php echo $data['permanentAddress']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Permanent Address</label>
                                        </div>
                                        <div class="help-info">Permanent Address is the address of user's origin</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <h2 class="card-inside-title">Is this family mamber/ relative residing in Japan?</h2>
                                </div>
                                 <div class="col-sm-9">
                                    <div class="demo-switch">
                                        <div class="switch">
                                            <label>No<input type="checkbox" name="residence_lever" <?php if(!empty($data['residence_with_applicant'])){ ?> checked <?php } ?>><span class="lever"></span>Yes</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <input name="residence_with_applicant" type="radio" value="1" id="radio_1" <?php if($data['residence_with_applicant'] == "1"){ ?> checked <?php } if(empty($data['residence_with_applicant'])) { ?> disabled <?php } ?>/>
                                    <label for="radio_1">Will reside with the student</label>
                                    <input name="residence_with_applicant" type="radio" value="2" id="radio_2" <?php if($data['residence_with_applicant'] == "2"){ ?> checked <?php } if(empty($data['residence_with_applicant'])) { ?> disabled <?php } ?>/>
                                    <label for="radio_2">Will not reside with the student</label>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group form-float">
                                        <div class="<?php if(empty($data['residence_with_applicant'])){ echo "form-line"; } else{ echo $data['class']; } ?>" id="school_employment_place_class">
                                            <input type="text" class="form-control" name="school_employment_place" maxlength="100" minlength="5" value="<?php echo $data['school_employment_place']; ?>"  autocomplete="off" <?php if(empty($data['residence_with_applicant'])){ ?> disabled <?php } else {?>  required <?php } ?>>
                                            <label class="form-label">Place of School Employment</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group form-float">
                                        <div class="<?php if(empty($data['residence_with_applicant'])){ echo "form-line"; } else{ echo $data['class']; } ?>" id="residence_card_status_class">
                                            <input type="text" class="form-control" name="residence_card_status" maxlength="100" minlength="5" value="<?php echo $data['residence_card_status']; ?>"  autocomplete="off" <?php if(empty($data['residence_with_applicant'])){ ?> disabled <?php } else {?>  required <?php } ?>>
                                            <label class="form-label">Residence Card Number</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 20 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group form-float">
                                        <div class="<?php if(empty($data['residence_with_applicant'])){ echo "form-line"; } else{ echo $data['class']; } ?>" id="residence_card_number_class">
                                            <input type="text" class="form-control" name="residence_card_number" maxlength="100" minlength="5" value="<?php echo $data['residence_card_number']; ?>"  autocomplete="off" <?php if(empty($data['residence_with_applicant'])){ ?> disabled <?php } else {?>  required <?php } ?>>
                                            <label class="form-label">Residence Card Status</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                            </div>     
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Add Family Member">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Create Student Profile -->

    </div>
</section>