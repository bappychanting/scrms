<section class="content">
    <div class="container-fluid">
        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">people</i> Users</li>
                <li><a href="?controller=users&action=showAllUsers"><i class="material-icons">account_circle</i> Show All Users</a></li>
                <li><a href="?controller=users&action=showUser&uname=<?php echo $user['username']; ?>"><i class="material-icons">person</i> User Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Password</li>
            </ol>
        </div>

        <!-- Advanced Validation -->
			<div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <div class="media">
                        	<div class="media-body">
								<h4 class="media-heading">Edit <?php echo $user['family_name'].' '.$user['given_name']; ?></h4> 
								Please follow the fields below to update your password 
							</div>
							<div class="media-right">
								<a href="javascript:void(0);">
									<img class="media-object" src="<?php echo $image ?>" width="100" height="60">
								</a>
							</div>
						</div>
                    </div>
                <div class="body">
                    <form id="form_advanced_validation" method="post" action='?controller=users&action=updatePass'>
                    <input type="hidden" name="uname" value="<?php echo $user['username']; ?>">
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password" class="form-control" name="pass" id="password" minlength="8" required>
                                <label class="form-label">New Password</label>
                            </div>
                            <div class="help-info">Must contain at least 8 or more characters</div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password" class="form-control" name="cpassword" required>
                                <label class="form-label">Confirm New Password</label>
                            </div>
                            <div class="help-info">Match the password above</div>
                        </div>
                        <input class="btn btn-warning waves-effect" type="submit" name="submit" value="Update">
                    </form>
                </div>       
                </div>
            </div>
        </div>
        <!-- #END# Advanced Validation -->
    </div>
</section>