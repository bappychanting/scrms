<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li class="active"><i class="material-icons">list</i> List of Batches</li>
            </ol>
        </div>
        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Batch List
                            <small>Total Found <?php echo count($result); ?></small>
                        </h2>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Batch</th>
                                    <th>Batch Type</th>
                                    <th>Period</th>
                                    <th>State</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>View Students</th>
									<th>View Details</th>
                                    <th>Delete Batch</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Batch</th>
                                    <th>Batch Type</th>
                                    <th>Period</th>
                                    <th>State</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>View Students</th>
                                    <th>View Details</th>
                                    <th>Delete Batch</th>
                                </tr>
                            </tfoot>
                            <tbody>
<?php	
	$count = 1;
	foreach($result as $batch) {
        if(empty($batch['teacher']) || empty($batch['class']))
          $state = "<span class='label label-danger'>Teacher and classroom not assigned!</span>";
        else
          $state = "<h5><span class='label label-success'>Okay!</span></h5>";  
?>
								<tr>
                                    <th scope="row"><?php echo $count; ?></th>
                                    <td><?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?></td>
                                    <td><?php echo $batch['type']; ?></td>
                                    <td><?php echo $batch['period']; ?></td>
                                    <td><?php echo $state; ?></td>
                                    <td><?php echo date("F d (l), Y", $batch['start_date']); ?></td>
                                    <td><?php echo date("F d (l), Y", $batch['end_date']); ?></td>
                                    <td>
                <a href='?controller=students&action=sortByBatch&batch=<?php echo $batch['id'];?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Batch Students"><i class="material-icons">search</i></a>
                                    </td>
                                    <td>
                <a href='?controller=batches&action=viewBatch&id=<?php echo $batch['id'];?>' class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Batch Details"><i class="material-icons">details</i></a>
                                    </td>
									<td>
                <a href='?controller=batches&action=deleteBatch&id=<?php echo $batch['id'];?>' onclick="return confirm('Are you sure to delete this batch?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Batch"><i class="material-icons">delete</i></a>
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