<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#supporter_info"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Update Supporter's Information</li>
            </ol>
        </div>

        <!-- Update Supporter Information -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                         <h2>
                            Update <?php echo  $student['family_name'].' '.$student['given_name']; ?>'s Supporter's information                      
                            <small>These are the required supporter's information</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=updateStudentSupporter'>
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="supporterName" maxlength="100" minlength="5" value="<?php echo $student['supporter_name']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Supporter's Name</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 100 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="relationship" data-live-search="true">
                                        <?php foreach($studentData['relationships'] as $relationship){ ?>
                                            <option value="<?php echo $relationship['id']; ?>" <?php if($relationship['id'] == $student['supporter_relationship']){ ?> selected="selected" <?php } ?>><?php  echo $relationship['name']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Relation with Student</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="supporterAddress" maxlength="500" minlength="4" value="<?php echo $student['supporter_address']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Address</label>
                                        </div>
                                        <div class="help-info">Address of where the supporter is currently living in</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="supporterContact" maxlength="11" minlength="11" value="<?php echo $student['supporter_contact']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Personal Contact</label>
                                        </div>
                                        <div class="help-info">Personal Contact has to have 11 characters</div>
                                    </div>
                                </div>
                            </div> 
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="number" class="form-control" name="supporterIncome" min="25000" max="1000000" value="<?php echo $student['supporter_income']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Monthly Income</label>
                                        </div>
                                        <div class="help-info">The amount the supporter earns each month</div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="number" class="form-control" name="supporterExpense" min="25000" max="1000000" value="<?php echo $student['supporter_expense']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Monthly Expense</label>
                                        </div>
                                        <div class="help-info">The amount the supporter spends each month</div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="supporterMethodofPayment" maxlength="500" minlength="4" value="<?php echo $student['mothod_of_payment']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Method of Payment</label>
                                        </div>
                                        <div class="help-info">The way supporter pays</div>
                                    </div>
                                </div>
                            </div>   
                             <div class="row clearfix">
                                <div class="col-sm-4">
                                    <h2 class="card-inside-title">Is the supporter supporting financially other students in Japan?</h2>
                                    <div class="demo-radio-button">
                                        <input type="radio" name="support_other_students_radio" value="1" id="radio_1" <?php if(!empty($student['support_other_students'])){?> checked <?php } ?>/>
                                        <label for="radio_1">Yes</label>
                                        <input type="radio" name="support_other_students_radio" value="0" id="radio_2" <?php if(empty($student['support_other_students'])){?> checked <?php } ?>/>
                                        <label for="radio_2">No</label>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                     <h2 class="card-inside-title">Details</h2>
                                    <div class="form-group">
                                        <div class="form-line" id="support_other_students_details_class">
                                            <textarea rows="1" id="support_other_students" name="support_other_students" class="form-control no-resize auto-growth" <?php if(empty($student['support_other_students'])){?> disabled <?php } ?>><?php echo $student['support_other_students']; ?></textarea>
                                        </div>
                                    </div>
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