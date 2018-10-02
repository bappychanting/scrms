<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li class="active"><i class="material-icons">done</i> Students with Assigned Batch</li>
            </ol>
        </div>
        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            List of Students
                            <small>Total Found <?php echo count($result); ?></small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);" id='assignedStudentsToExcel'>Download Excel</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>Contact</th>
                                    <th>Batch</th>
                                    <th>Roll</th>
                                    <th>Create Date</th>
                                    <th>Update Date</th>    
                                    <th>Send Message</th>                              
                                    <th>Student Profile</th>
                                    <th>Change Batch</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>Contact</th>
                                    <th>Batch</th>
                                    <th>Roll</th>
                                    <th>Create Date</th>
                                    <th>Update Date</th>
                                    <th>Send Message</th>                                    
                                    <th>Student Profile</th>
                                    <th>Change Batch</th>
                                </tr>
                            </tfoot>
                            <tbody>
<?php   
    $count = 1;
    foreach($result as $student) { 
?>
                                <tr>
                                    <th scope="row"><?php echo $count; ?></th>
                                    <td><?php echo $student['family_name'].' '.$student['given_name']; ?></td>
                                    <td><?php echo $student['email']; ?></td>
                                    <td><?php echo $student['contact']; ?></td>
                                    <td>
                                        <a href="?controller=batches&action=viewBatch&id=<?php echo $student['batch'];?>">
                                            <?php echo $student['acronym']."-".$student['period'][0]."-".$student['batch_number']; ?>
                                        </a>
                                    </td>
                                    <td><?php echo $student['roll']; ?></td>
                                    <td><?php echo date("F d (l), Y", strtotime($student['create_date'])); ?></td>
                                    <td><?php echo $student['update_date']; ?></td>
                                    <td>
                <a href='?controller=messages&action=viewMessages&uname=<?php echo $student['username']; ?>' target="_blank" class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Send Message"><i class="material-icons">chat</i></a>
                                    </td>
                                    <td>
                <a href='?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>' target="_blank" class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="Show Student Profile"><i class="material-icons">account_box</i></a>
                                    </td>
                                    <td>
                <a href='?controller=students&action=assignBatch&uname=<?php echo $student['username']; ?>' target="_blank" class="btn btn-default waves-effect" data-toggle="tooltip" data-placement="bottom" title="Change Batch"><i class="material-icons">input</i></a>
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

        <!-- Excel Data -->
        <div hidden>
            <table id='tableData'>
              <tr>
                <td>#</td>
                <td>NAME</td>
                <td>EMAIL</td>
                <td>Contact</td>
                <td>Batch</td>
                <td>Roll</td>
                <td>Join Date</td>
              </tr>
<?php   
    $count = 1;
    foreach($result as $student) { 
?>
            <tr>
                <th scope="row"><?php echo $count; ?></th>
                <td><?php echo $student['family_name'].' '.$student['given_name']; ?></td>
                <td><?php echo $student['email']; ?></td>
                <td><?php echo $student['contact']; ?></td>
                <td><?php echo $student['acronym']."-".$student['period'][0]."-".$student['batch_number']; ?></td>
                <td><?php echo $student['roll']; ?></td>
                <td><?php echo date("F d (l), Y", strtotime($student['create_date'])); ?></td>
            </tr>
<?php   
        $count++;   
    }
?>                     
            </table>
        </div>
        <!-- #END# Excel Data -->

    </div>
</section>  