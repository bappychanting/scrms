<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li class="active"><i class="material-icons">contact_mail</i> Contact DJIT Staff</li>
            </ol>
        </div>
        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            All Daffodil Japan IT Staff
                        </h2>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Avatar</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>Role</th>
									<th>Chat</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Avatar</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>Role</th>
                                    <th>Chat</th>
                                </tr>
                            </tfoot>
                            <tbody>
<?php	
	$count = 1;
	foreach($result as $staff) {	
?>
								<tr>
                                    <th scope="row"><?php echo $count; ?></th>
                                    <td><img src="<?php echo $staff['image']; ?>" class="img-thumbnail center-block" alt="<?php echo $staff['image']; ?>" width= "50" height="50"></td>
                                    <td><?php echo $staff['family_name'].' '.$staff['given_name']; ?></td>
                                    <td><?php echo $staff['email']; ?></td>
                                    <td><?php echo $staff['role_name']; ?></td>
                                    <td>
                                        <center>
                        <a href='?controller=messages&action=viewMessages&uname=<?php echo $staff['username']; ?>' target="_blank" class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Send Message"><i class="material-icons">chat</i></a>
                                        </center>
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