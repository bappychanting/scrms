<section class="content">
    <div class="container-fluid">

		<div class="block-header">
		    <ol class="breadcrumb breadcrumb-col-teal">
		        <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
		        <li><i class="material-icons">people</i> Users</li>
		        <li><a href="?controller=users&action=showAllUsers"><i class="material-icons">account_circle</i> Show All Users</a></li>
			    <li class="active"><i class="material-icons">person</i> User Profile</li>
		    </ol>
		</div>	

<?php 
	if($user['role'] == 4 && $_SESSION['uname'] != $user['username']){
?>
		<!-- Alert -->
			<div class="row clearfix" id="student">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Heads up!</strong> Following user appears to be a student! <a href="?controller=students&action=showStudentProfile&uname=<?php echo $user['username']; ?>" class="alert-link">Click here</a>  to visit his student profile.
                        </div>
                </div>
            </div>    
		<!-- End Alert -->
<?php		
	}	
?>
		<!-- Text Styles -->
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			    <div class="card">
			        <div class="header">
			            <h2>
			                <?php echo $user['family_name'].' '.$user['given_name']; ?>
			                <small>
				            	<strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($user['create_date'])); ?>,
				            	<strong>Updated At: </strong>  <?php echo date("F d (l), Y", strtotime($user['update_date'])); ?>
			            	</small>
			            </h2>
			            <ul class="header-dropdown m-r--5">
			                <li class="dropdown">
			                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			                        <i class="material-icons">more_vert</i>
			                    </a>
			                    <ul class="dropdown-menu pull-right">
			                        <li><a href="?controller=users&action=editUser&uname=<?php echo $user['username']; ?>">Edit</a></li>
									<li><a href="?controller=users&action=editPass&uname=<?php echo $user['username']; ?>">Edit Password</a></li>
									<li><a href="?controller=suggestions&action=studentSuggestions&uname=<?php echo $user['username']; ?>">View Suggestions</a></li>
			                    </ul>
			                </li>
			            </ul>
			        </div>
			        <div class="body">
			            <div class="row clearfix">
			            	<form method="post" action='?controller=users&action=updateImage' enctype="multipart/form-data">
				            	<input type="hidden" name="uname" value="<?php echo $user['username']; ?>">
							    <input type="hidden" name="filename" value="<?php echo $user['image']; ?>">
				            	<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
				                	<a href="<?php echo $image ?>" target="_blank">
				             <img src="<?php echo $image; ?>" class="img-responsive center-block" alt="<?php echo $image; ?>" width= "500" height="300px">
				                    </a>
			                    </div>
			                    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
			                      	<label class="btn bg-teal btn-block btn-lg waves-effect" data-toggle="tooltip" data-placement="bottom" title="Click here to select an image">
				                    Change Image <input type="file" name="image" accept="image/*" class="input" onchange="preview()" style="display: none;" required/>
				                    </label>
			                    </div>
			                    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
			                        <label type="button" class="btn bg-green waves-effect waves-light" data-toggle="tooltip" data-placement="bottom" title="Click here to upload">
										<i class="material-icons">publish</i>
										<input type="submit" name="submit" value="Submit" class="hidden">
									</label>
			                    </div>
			                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
			                        <img class="output" src="all_images/preview.png" class="img-responsive" alt="Responsive image" width= "100%" height= "100%">
			                    </div>
		                    </form>      
			            </div>
			        </div>
			    </div>
			</div>
		</div>

        <!-- Hover Zoom Effect -->
            <div class="block-header">
                <h2>USER INFORMATION</h2>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box-3 bg-teal hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">account_circle</i>
                        </div>
                        <div class="content">
                            <div class="number">Username:</div>
                            <div class="text"><?php echo $user['username']; ?></div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box-3 bg-blue hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">email</i>
                        </div>
                        <div class="content">
                           <div class="number">Email:</div>
                           <div class="text"><?php echo $user['email']; ?></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box-3 bg-light-blue hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">people</i>
                        </div>
                        <div class="content">
                           <div class="number">Role:</div>
                           <div class="text"><?php echo $user['role_name']; ?></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box-3 bg-cyan hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">domain</i>
                        </div>
                        <div class="content">
                          	<div class="number">Designation:</div>
                           	<div class="text"><?php echo $user['designation']; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- #END# Hover Zoom Effect -->

    </div>
</section> 