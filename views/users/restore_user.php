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

		<!-- Text Styles -->
		 <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>This user is currently unavailable!</strong> <a href="?controller=users&action=restoreUser&uname=<?php echo $_GET['uname']; ?>" class="alert-link">Click here</a> to restore this user!
        </div>



    </div>
</section> 