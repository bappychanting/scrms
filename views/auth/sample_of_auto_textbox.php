<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Update Educational Record</li>
            </ol>
        </div>

        <!-- Create Student Profile -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Update <?php echo  $student['family_name'].' '.$student['given_name']; ?>'s Educational Record                      
                            <small>Input following initial information to create student profile</small>
                        </h2>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
					        <div class="col-sm-10">
                            	<h5>Fields for Educational Record</h5>    
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-success btn-circle-lg waves-effect waves-circle waves-float add_field_button pull-right" data-toggle="tooltip" data-placement="bottom" title="Add More Fields">
					        		<i class="material-icons">add</i>
					        	</button>
                            </div>
				    	</div>
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=storeStudent'>
                    	<div class="input_fields_wrap">
					        <div class="row clearfix">
                                <div class="col-sm-2">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="institude[]" maxlength="255" minlength="5" value="<?php echo $data['fatherName']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Institude</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 255 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="address[]" maxlength="500" minlength="5" value="<?php echo $data['fatherName']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Address</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 500 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" class="form-control" name="degree[]" maxlength="20" minlength="1" value="<?php echo $data['fatherName']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Degree</label>
                                        </div>
                                        <div class="help-info">Min. 1, Max. 20 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="start_year[]" value=""  placeholder="Start Year" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="end_year[]"  value="" placeholder="End Year" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                            </div>                             
					    </div>
					    <h5>Status of Last School Study</h5>
                    	<div class="form-group form-float">
                            <select class="form-control show-tick" name="study_status">
                            <?php foreach($studentData['study_statuses'] as $status){ ?>
                                    <option value="<?php echo $status['id']; ?>" <?php if($status['id'] == $student['study_status']){ ?> selected="selected" <?php } ?>><?php  echo $status['name']; ?></option>  
                            <?php } ?>      
                            </select> 
                            <div class="help-info">Select user role</div>
                        </div>
                        <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Educational Record">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Create Student Profile -->

    </div>
</section>