<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li class="active"><i class="material-icons">warning</i> Pending Profile Students</li>
            </ol>
        </div>
        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            List of Students Without Profile
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
                                    <th>Create Date</th>
                                    <th>Update Date</th>
                                    <th>Send Message</th>
                                    <th>Create Profile</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>USERNAME</th>
                                    <th>EMAIL</th>
                                    <th>Create Date</th>
                                    <th>Update Date</th>
                                    <th>Send Message</th>
                                    <th>Create Profile</th>
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
                                    <td><?php echo date("F d (l), Y", strtotime($user['create_date'])); ?></td>
                                    <td><?php echo $user['update_date']; ?></td>
                                    <td>
                <a href='?controller=messages&action=viewMessages&uname=<?php echo $user['username']; ?>' target="_blank" class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Send Message"><i class="material-icons">chat</i></a>
                                    </td>
                                    <td>
                <a href='?controller=students&action=createStudentProfile&uname=<?php echo $user['username']; ?>' target="_blank" class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="Create Student Profile"><i class="material-icons">create</i></a>
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