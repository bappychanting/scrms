<section class="content">
    <div class="container-fluid">
        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li class="active"><i class="material-icons">list</i> View All Exams</li>
            </ol>
        </div>

        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            List of Exams for Batch <?php foreach($result as $batch) { echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; break; } ?> 
                            <small>Total Found <?php echo count($result); ?></small>
                        </h2>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Title</th>
                                    <th>Max Score</th>
                                    <th>description</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Create Date</th>
									<th>Update Date</th>
                                    <th>Participants</th>
                                    <th>Edit Exam</th>
                                    <th>Delete Exam</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Title</th>
                                    <th>Max Score</th>
                                    <th>description</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Create Date</th>
                                    <th>Update Date</th>
                                    <th>Participants</th>
                                    <th>Edit Exam</th>
                                    <th>Delete Exam</th>
                                </tr>
                            </tfoot>
                            <tbody>
<?php	
	$count = 1;
	foreach($result as $exam) { 
?>
								<tr>
                                    <th scope="row"><?php echo $count; ?></th>
                                    <td><?php echo $exam['title']; ?></td>
                                    <td><?php echo $exam['max_score']; ?></td>
                                    <td><?php echo $exam['description']; ?></td>
                                    <td><?php echo date("F d (l), Y", $exam['exam_date']);; ?></td>
                                    <td><?php echo date("h:i A", strtotime($exam['exam_time']));; ?></td>
                                    <td><?php echo date("F d (l), Y", strtotime($exam['create_date'])); ?></td>
                                    <td><?php echo $exam['update_date']; ?></td>
                                    <td>
                <a href='?controller=batches&action=getParticipants&id=<?php echo $exam['batch'];?>&exam=<?php echo $exam['id'];?>' class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Participants and Their Scores"><i class="material-icons">supervisor_account</i></a>
                                    </td>
                                    <td>
                <a href='?controller=batches&action=editExam&id=<?php echo $exam['batch'];?>&exam=<?php echo $exam['id'];?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Exam"><i class="material-icons">edit</i></a>
                                    </td>
									<td>
                <a href='?controller=batches&action=deleteExam&id=<?php echo $exam['batch'];?>&exam=<?php echo $exam['id'];?>' onclick="return confirm('Are you sure to delete this exam?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Exam"><i class="material-icons">delete</i></a>
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