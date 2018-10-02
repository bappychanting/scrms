<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=manageBatchPeriod"><i class="material-icons">playlist_add</i> Manage Batch Periods</a></li>
                <li class="active"><i class="material-icons">mode_edit</i> Edit Batch Period</li>
            </ol>
        </div>
<?php foreach($result as $period){ ?>
            <!-- Advanced Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Edit <?php echo $period['period']; ?> Period
                                <small>Expanded time is how early or late a batch can start than set start or end time.</small>
                            </h2>
                        </div>
                        <div class="body">
                            <form id="form_advanced_validation" method="post" action='?controller=batches&action=updateBatchPeriod'>
                                <input type="hidden" name="id" value="<?php echo $period['id']; ?>" required>
                                <div class="form-group form-float">
                                    <div class="form-line focused" id="batch_period_class">
                                        <input type="text" class="form-control" name="period" maxlength="20" minlength="2" autocomplete="off" value="<?php echo $period['period']; ?>" required>
                                        <label class="form-label">Period Name</label>
                                    </div>
                                    <div class="help-info" id="batch_period_info">Min. 2, Max. 20 characters</div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="form-line focused">
                                                <input type="text" class="timepicker form-control" name="start_time" id="start_time" value="<?php echo $period['start_time']; ?>" placeholder="Batch Period Start Time" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="form-line focused">
                                                <input type="text" class="timepicker form-control" name="end_time" id="end_time" value="<?php echo $period['end_time']; ?>" placeholder="Batch Period End Time" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-sm-6">
                                        <div class="form-group form-float">
                                            <div class="form-line focused">
                                                <input type="number" class="form-control" name="expandStartTime" min="0" max="90" value="<?php echo $period['expand_start_time']; ?>">
                                                <label class="form-label">Expand Start Time in Minutes</label>
                                            </div>
                                            <div class="help-info">Expanded start time can't be more than 90 minutes</div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-float">
                                            <div class="form-line focused">
                                                <input type="number" class="form-control" name="exapndEndTime" min="0" max="90" value="<?php echo $period['expand_end_time']; ?>">
                                                <label class="form-label">Expand End Time in Minutes</label>
                                            </div>
                                            <div class="help-info">Expanded end time can't be more than 90 minutes</div>
                                        </div>
                                    </div>
                                </div>      
                                <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Advanced Validation -->
<?php } ?>

    </div>
</section> 
