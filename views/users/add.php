<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">people</i> Users</li>
                <li class="active"><i class="material-icons">person_add</i> Add New User</li>
            </ol>
        </div>
        
        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Add New User</h2>
                        <h5></h5>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=users&action=storeUser' onsubmit="setFormSubmitting()"> 
                            <div class="row clearfix">
                                <div class="col-sm-8">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="family_name" maxlength="100" minlength="2" value="<?php echo $data['family_name']; ?>" autocomplete="off" required>
                                            <label class="form-label">Family Name</label>
                                        </div>
                                    <div class="help-info">Min. 2, Max. 100 characters</div>
                                </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="given_name" maxlength="50" minlength="2" value="<?php echo $data['given_name']; ?>" autocomplete="off" required>
                                            <label class="form-label">Given Name</label>
                                        </div>
                                        <div class="help-info">Min. 2, Max. 50 characters</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>" id="uname_class">
                                            <input type="text" class="form-control" id="uname" name="uname" minlength="5" value="<?php echo $data['uname']; ?>" autocomplete="off" required>
                                            <label class="form-label">Username</label>
                                        </div>
                                        <div class="help-info" id="uname_info">Min. Value: 5, Max. Value: 20</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="email" class="form-control" name="email" value="<?php echo $data['email']; ?>" autocomplete="off" required>
                                            <label class="form-label">Email</label>
                                        </div>
                                        <div class="help-info">Figure: example@example.com</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="role" id="role">
                                        <?php foreach($_SESSION['allRoles'] as $role){ ?>
                                                <option value="<?php echo $role['id']; ?>" <?php if($role['id'] == $data['role']){ ?> selected="selected" <?php } ?>><?php  echo $role['role']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Select user role</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>" id="designationClass">
                                            <input type="text" class="form-control" name="designation" maxlength="50" minlength="2" value="<?php echo $data['designation']; ?>" autocomplete="off" required readonly>
                                            <label class="form-label" id="designationLevel"></label>
                                        </div>
                                        <div class="help-info">Mention "Teacher"/"Instructor" in the designation to give user access to teacher functionalities.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="password" class="form-control" name="pass" id="password" minlength="8" autocomplete="off" required>
                                            <label class="form-label">Password</label>
                                        </div>
                                        <div class="help-info">Must contain at least 8 or more characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="password" class="form-control" name="cpassword" required>
                                            <label class="form-label">Confirm Password</label>
                                        </div>
                                        <div class="help-info">Match the password above</div>
                                    </div>
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