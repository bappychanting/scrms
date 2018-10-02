<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">people</i> Users</li>
                <li><a href="?controller=users&action=showAllUsers"><i class="material-icons">account_circle</i> Show All Users</a></li>
                <li><a href="?controller=users&action=showUser&uname=<?php echo $user['username']; ?>"><i class="material-icons">person</i> User Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit User</li>
            </ol>
        </div>

        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <div class="media">
                        	<div class="media-body">
								<h4 class="media-heading">Edit <?php echo  $user['family_name'].' '.$user['given_name']; ?></h4> 
								Please fill in the with the updated information in the fields below 
							</div>
							<div class="media-right">
								<a href="javascript:void(0);">
									<img class="media-object" src="<?php echo $image ?>" width="100" height="60">
								</a>
							</div>
						</div>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=users&action=updateUser'>
                            <input type="hidden" name="uname" value="<?php echo $user['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-8">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="family_name" maxlength="100" minlength="5" value="<?php echo $user['family_name']; ?>" autocomplete="off" required>
                                            <label class="form-label">Family Name</label>
                                        </div>
                                    <div class="help-info">Min. 5, Max. 100 characters</div>
                                </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="given_name" maxlength="50" minlength="2" value="<?php echo $user['given_name']; ?>" autocomplete="off" required>
                                            <label class="form-label">Given Name</label>
                                        </div>
                                        <div class="help-info">Min. 2, Max. 50 characters</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line focused">
                                    <input type="email" class="form-control" name="email" value="<?php echo $user['email']; ?>" autocomplete="off" required>
                                    <label class="form-label">Email</label>
                                </div>
                                <div class="help-info">Figure: example@example.com </div>
                            </div>
                            <?php if($_SESSION['role'] == $user['role']){?>  
                             <input type="hidden" name="role" value="<?php echo $_SESSION['role']; ?>">
                             <input type="hidden" name="designation" value="<?php echo $_SESSION['designation']; ?>">
                            <?php } else { ?> 
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="role" id="role">
                                        <?php foreach($_SESSION['allRoles'] as $role){ ?>
                                                <option value="<?php echo $role['id']; ?>" <?php if($role['id'] == $user['role']){ ?> selected="selected" <?php } ?>><?php  echo $role['role']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Select user role</div>
                                    </div> 
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line <?php if($user['designation']!="None"){ ?> focused <?php } ?>" id="designationClass">
                                            <input type="text" class="form-control" name="designation" value="<?php echo $user['designation']; ?>" maxlength="50" minlength="2" autocomplete="off" required 
                                            <?php if($user['designation']=="None"){ ?> readonly <?php } ?>>
                                            <label class="form-label" id="designationLevel"><?php if($user['designation']!="None"){ ?>Designation<?php } ?></label>
                                        </div>
                                        <div class="help-info">Min. 2, Max. 50 characters</div>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            <input class="btn btn-warning waves-effect" type="submit" name="submit" value="Update">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>