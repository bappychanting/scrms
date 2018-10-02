<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li class="active"><i class="material-icons">list</i> View Attendance</li>
            </ol>
        </div>

<?php 
    $usernames = array();
    $dates = array();
    foreach($result as $data){
        if(!in_array($data['username'], $usernames)){
            $students[] = array('username'=>$data['username'], 'name'=> $data['family_name'].' '.$data['given_name']);
        }
        if(!in_array($data['attendance_date'], $dates)){
            $attendance_dates[] = array('username'=> $data['username'], 'id'=>$data['attendance_date_id'], 'attendance_date'=>$data['attendance_date']);
        }
        $usernames[] = $data['username'];
        $dates[] = $data['attendance_date'];
    } 
?>

        
        <!-- All Attendance -->

        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                <?php foreach($result as $batch) { ?>
                                    All Attendance of Batch <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>
                                <?php break; } ?>
                            </h2>
                        </div>
                        <div class="body table-responsive">
                            <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Name</th>
                                        <th>Status</th>
                                        <th>Created At</th>
                                        <th>Updated At</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Date</th>
                                        <th>Name</th>
                                        <th>Status</th>
                                        <th>Created At</th>
                                        <th>Updated At</th>
                                    </tr>
                                </tfoot>
                                <tbody>
<?php
    foreach($result as $data){
?>
    
                                    <tr>
                                        <td><?php echo date("F d (l), Y", $data['attendance_date']); ?></td>
                                        <td><?php echo $data['family_name'].' '.$data['given_name']; ?></td>
                                        <td><?php if(empty($data['attendance'])){ echo 'Did Not Attend'; } else{ echo 'Attended'; } ?></td>
                                        <td><?php echo date("F d (l), Y", strtotime($data['create_date'])); ?></td>
                                        <td><?php echo $data['update_date']; ?></td>
                                    </tr>
<?php
        }
?>                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- #END# All Attendance -->


        <!-- All Attendance -->
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                <?php foreach($result as $batch) { ?>
                                    Attendance Chart of Batch <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>
                                <?php break; } ?>
                                <small>If the student attended it is shown in <code>green tick</code>, otherwise it will be shown as <code>red cross</code></small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" id='attendanceExcel'>Download Excel</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Attendance Dates and Students</th>
<?php foreach($students as $data){ ?>
                                    <th><a href="?controller=students&action=showStudentProfile&uname=<?php echo $data['username']; ?>"><?php echo $data['name']; ?></th>

<?php } ?>
                                    <th colspan="2" class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
<?php foreach($attendance_dates as $data){ ?>
                                <tr>
                                    <td>
                                        <a href="?controller=batches&action=editAttendance&id=<?php echo $data['id']; ?>"><?php echo date("F d (l), Y", $data['attendance_date']); ?></a>
                                    </td>
<?php 
    foreach($students as $student){
        foreach($result as $attendance){ 
            if($attendance['attendance_date'] == $data['attendance_date'] && $student['username'] == $attendance['username']){
?>
                                    <td>
                                        <?php if(empty($attendance['attendance'])){ echo "<i class='fa fa-times' style='color:red'></i>"; } else{ echo "<i class='fa fa-check' style='color:green'></i>"; } ?>
                                    </td>
<?php       
            } 
        } 
    } 
?>
                                    <td>
                                        <a href='?controller=batches&action=editAttendance&id=<?php echo $data['id']; ?>' class="btn btn-warning waves-effect" data-toggle="tooltip" data-placement="bottom" title="Update Attendance"><i class="material-icons">edit</i></a>
                                    </td>
                                    <td>
                                        <a href='?controller=batches&action=deleteAttendance&id=<?php echo $data['id']; ?>' onclick="return confirm('Delete Schedule Date?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Schedule Date"><i class="material-icons">delete</i></a>
                                    </td>
                                </tr>
<?php  } ?>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- #END# All Attendance -->

        <!-- Excel Data -->
        <div hidden>
            <table id='tableData'>
                <tr>
                    <th>Attendance Dates and Students</th>
<?php foreach($students as $data){ ?>
                    <th><?php echo $data['name']; ?></th>

<?php } ?>
                </tr>
<?php foreach($attendance_dates as $data){ ?>
                <tr>
                    <td><?php echo date("F d (l), Y", $data['attendance_date']); ?></td>
<?php 
    foreach($students as $student){
        foreach($result as $attendance){ 
            if($attendance['attendance_date'] == $data['attendance_date'] && $student['username'] == $attendance['username']){
?>
                    <td>
                        <?php if(empty($attendance['attendance'])){ echo "-"; } else{ echo "A"; } ?>
                    </td>
<?php       
            } 
        } 
    } 
?>
                </tr>
<?php  } ?>                   
            </table>
        </div>
        <!-- #END# Excel Data -->

    </div>
</section>  