<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">people</i> Users</li>
                <li class="active"><i class="material-icons">account_circle</i> Show All Users</li>
            </ol>
        </div>
        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            User List
                            <small>Total Found <?php echo count($result); ?></small>
                        </h2>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>USERNAME</th>
                                    <th>EMAIL</th>
                                    <th>Role</th>
                                    <th>Designation</th>
									<th>Send Message</th>
                                    <th>Show Profile</th>
                                    <th>Delete User</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>USERNAME</th>
                                    <th>EMAIL</th>
                                    <th>Role</th>
                                    <th>Designation</th>
                                    <th>Send Message</th>
                                    <th>Show Profile</th>
                                    <th>Delete User</th>
                                </tr>
                            </tfoot>
                            <tbody>
<?php	
	$count = 1;
	foreach($result as $user) {	
?>
								<tr>
                                    <th scope="row"><?php echo $count; ?></th>
                                    <td><?php echo $user['family_name'].' '.$user['given_name']; ?></td>
                                    <td><?php echo $user['username']; ?></td>
                                    <td><?php echo $user['email']; ?></td>
                                    <td><?php echo $user['role_name']; ?></td>
                                    <td><?php echo $user['designation']; ?></td>
                                    <td>
                <a href='?controller=messages&action=viewMessages&uname=<?php echo $user['username']; ?>' target="_blank" class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Send Message"><i class="material-icons">chat</i></a>
                                    </td>
									<td>
                <a href='?controller=users&action=showUser&uname=<?php echo $user['username']; ?>' target="_blank" class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="Show User Profile"><i class="material-icons">person</i></a>
                                    </td>
									<td>
                <a href='?controller=users&action=deleteUser&uname=<?php echo $user['username']; ?>' onclick="return confirm('Delete User?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete User"><i class="material-icons">delete</i></a>
                                    </td>
                                </tr>
<?php 	
		$count++;	
	}
?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Basic Table -->

    </div>
</section>  