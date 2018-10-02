<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                 <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li class="active"><i class="material-icons">playlist_add</i> Add New Batch</li>
            </ol>
        </div>

        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add New Batch                      
                            <small>Batch name is created by joining selected batch type and number</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeBatch' onsubmit="return validateForm()"> 
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" data-live-search="true" name="type" id="batchType">
                                        <?php foreach($allBatchData['types'] as $type){ ?>
                                                <option value="<?php echo $type['id']; ?>" <?php if($type['id'] == $data['type']){ ?> selected="selected" <?php } ?>><?php  echo $type['acronym'].' - '.$type['type']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Select Batch Type</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>" id="batchNumberClass">
                                            <input type="number" class="form-control" name="number" id="batchNumber" min="1" max="999" value="<?php echo $data['number']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Batch Number</label>
                                        </div>
                                        <div class="help-info" id="batchNumberInfo">Batch number should be minimum 01, maximum 999</div>
                                    </div>
                                </div>   
                                <div class="col-sm-6">
                                    <h2 class="card-inside-title">Scheduled days</h2>
                                    <?php foreach($allBatchData['days'] as $day){ ?>
                                            <input type="checkbox" value="<?php echo $day['id']; ?>" name="days[]" id="md_checkbox_<?php echo $day['id']; ?>" class="filled-in chk-col-green" <?php if(in_array($day['id'], $data['days'])){ ?> checked <?php } ?> />
                                            <label for="md_checkbox_<?php echo $day['id']; ?>"><?php  echo $day['weekday']; ?></label>
                                    <?php } ?> 
                                    <div class="align-right" id="checkbox_error_message"></div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="period" id="period">
                                        <?php foreach($allBatchData['periods'] as $period){ ?>
                                                <option value="<?php echo $period['id']; ?>" <?php if($period['id'] == $data['period']){ ?> selected="selected" <?php } ?>><?php  echo $period['period']; ?></option>
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Select Batch Period</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="timepicker form-control" name="start_time" id="start_time" value="<?php echo $data['start_time']; ?>" placeholder="Choose Batch Start Time" required>
                                        </div>
                                        <div id="start_time_error" class="help-info"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="timepicker form-control" name="end_time" id="end_time" value="<?php echo $data['end_time']; ?>" placeholder="Choose Batch End Time" required>
                                        </div>
                                        <div id="end_time_error" class="help-info"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" value="<?php echo $data['start_date']; ?>" placeholder="Choose Batch Start Date" required>
                                        </div>
                                        <div id="start_date_error" class="help-info"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="end_date" value="<?php echo $data['end_date']; ?>" placeholder="Choose Batch End Date" required>
                                        </div>
                                        <div id="end_date_error" class="help-info"></div>
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

    </div>
</section>  