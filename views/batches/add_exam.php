<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $batch['id']; ?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li class="active"><i class="material-icons">playlist_add</i> Add New Exam</li>
            </ol>
        </div>

        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add New Exam to Batch <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>                  
                            <small>Choose a unique title and date for the exam!</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeExam' onsubmit="return validateForm()"> 
                            <input type="hidden" name="id" value="<?php echo $batch['id']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="text" class="form-control" name="title" maxlength="100" minlength="2" value="<?php echo $data['title']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Exam</label>
                                        </div>
                                        <div class="help-info" id="batchNumberInfo">Title length should be minimum 02, maximum 100</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="<?php echo $data['class']; ?>">
                                            <input type="number" class="form-control" name="score" min="1" max="999" value="<?php echo $data['score']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Max Exam Score</label>
                                        </div>
                                        <div class="help-info">Max Exam Score should be minimum 01, maximum 999</div>
                                    </div>
                                </div>
                            </div>    
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="exam_date" value="<?php echo $data['exam_date']; ?>" placeholder="Choose Exam Date" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="timepicker form-control" name="exam_time" value="<?php echo $data['exam_time']; ?>" placeholder="Choose Exam Time" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <textarea rows="4" class="form-control no-resize" placeholder="Exam Description..." maxlength="500" name="description"><?php echo $data['description']; ?></textarea>
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