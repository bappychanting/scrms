<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li class="active"><i class="material-icons">playlist_add</i> Manage Batch Periods</li>
            </ol>
        </div>

            <!-- Advanced Validation -->
   			<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add New Period
                                <small>Expanded time is how early or late a batch can start than set start or end time.</small>
                            </h2>
                        </div>
                        <div class="body">
                            <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeBatchPeriod'>
                                <div class="form-group form-float">
                                    <div class="<?php echo $data['class']; ?>" id="batch_period_class">
                                        <input type="text" class="form-control" name="period" maxlength="20" minlength="2" autocomplete="off" value="<?php echo $data['period']; ?>" required>
                                        <label class="form-label">Period Name</label>
                                    </div>
                                    <div class="help-info" id="batch_period_info">Min. 2, Max. 20 characters</div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" class="timepicker form-control" name="start_time" id="start_time" value="<?php echo $data['start_time']; ?>" placeholder="Batch Period Start Time" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" class="timepicker form-control" name="end_time" id="end_time" value="<?php echo $data['end_time']; ?>" placeholder="Batch Period End Time" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-6">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="number" class="form-control" name="expandStartTime" min="0" max="90" value="">
                                                <label class="form-label">Expand Start Time in Minutes</label>
                                            </div>
                                            <div class="help-info">Expanded start time can't be more than 90 minutes</div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="number" class="form-control" name="exapndEndTime" min="0" max="90" value="">
                                                <label class="form-label">Expand End Time in Minutes</label>
                                            </div>
                                            <div class="help-info">Expanded end time can't be more than 90 minutes</div>
                                        </div>
                                    </div>
                              	</div>		
                                <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                                <input class="btn btn-warning waves-effect" type="reset" value="Reset">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Advanced Validation -->


            <!-- Basic Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                List of Periods
                            </h2>
                        </div>
                        <div class="body table-responsive">                       
                           <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Period</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Create Date</th>
                                        <th>View Batches</th>
                                        <th>Edit Batch Period</th>
                                        <th>Delete Batch Period</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                       	<th>#</th>
                                        <th>Period</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Create Date</th>
                                        <th>View Batches</th>
                                        <th>Edit Batch Period</th>
                                        <th>Delete Batch Period</th>
                                    </tr>
                                </tfoot>
                                <tbody>
<?php
    $count = 1;
    foreach ($batchPeriods as $period) {
    	$startTime = strtotime($period['start_time']);
    	$expandStartTime = $startTime - $period['expand_start_time']* 60;
    	$endTime = strtotime($period['end_time']);
    	$expandEndTime = $endTime + $period['expand_end_time']* 60;
?>
									<tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td><?php echo $period['period']; ?></td>
                                        <td>
                                        	<?php echo date('h:i A', $startTime); ?> 
                                        	(<span class="col-orange">Expanded to <?php echo date('h:i A', $expandStartTime);?></span>)
                                        </td>
                                        <td><?php echo date('h:i A', $endTime); ?> 
                                        	(<span class="col-orange">Expanded to <?php echo date('h:i A', $expandEndTime); ?></span>)
                                        </td>
                                        <td><?php echo date("F d (l), Y", strtotime($period['create_date'])); ?></td>
                                        <td>
                <a href='?controller=batches&action=searchByPeriod&period=<?php echo $period['id']; ?>' class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Batches">
                    <i class="material-icons">search</i>
                </a>
                                        </td>
                                        <td>
                <a href='?controller=batches&action=editBatchPeriod&id=<?php echo $period['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Batch Period">
                    <i class="material-icons">mode_edit</i>
                </a>
                                        </td>
										<td>
                <a href='?controller=batches&action=deleteBatchPeriod&id=<?php echo $period['id']; ?>' onclick="return confirm('Delete Batch Period?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Batch Period">
                    <i class="material-icons">delete</i>
                </a>
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
