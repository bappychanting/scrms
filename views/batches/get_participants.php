<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li><a href="?controller=batches&action=allExams&id=<?php echo $_GET['id']; ?>"><i class="material-icons">list</i> View All Exams</a></li>
                <li class="active"><i class="material-icons">list</i> Participants</li>
            </ol>
        </div>
        <!-- participant Score -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            <?php foreach($result as $batch) { ?>
                            All Participants of Exam  <?php echo $batch['title'].", Batch ".$batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>
                            <small>
                                Total Found <?php echo count($result); ?>. 
                                Please update the scores once the exam date <code><?php echo date("F d (l), Y", $batch['exam_date']); ?></code> expires.
                                <strong>Max exam score <?php echo $batch['max_score']; ?></strong>.       
                            </small>
                            <?php break; } ?>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);" id='examScores' target="_blank">Download Excel</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeScores' onsubmit="return validateForm()"> 
                            <input type="hidden" name="id_redirect" value="<?php echo $_GET['id']; ?>">
                            <input type="hidden" name="exam_redirect" value="<?php echo $_GET['exam']; ?>">
<?php   
    $count = 1;
    foreach($result as $participant) { 
        $input = "disabled"; if(time() > $participant['exam_date']) $input = "required";
?>
                            <input type="hidden" name="exam[]" value="<?php echo $participant['id']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <h2 class="card-inside-title"><?php echo $count.". ".$participant['family_name'].' '.$participant['given_name']." (Roll: ".$participant['roll'].")"; ?> &#x2192;</h2><hr>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="number" class="form-control" name="score[]"  min="0" max="<?php echo $participant['max_score']; ?>" value="<?php echo $participant['score']; ?>"  autocomplete="off" <?php echo $input; ?>>
                                            <label class="form-label">Score</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <div class="form-line">
                                        <textarea rows="1" class="form-control no-resize auto-growth" name="description[]" placeholder="Add a Comment" maxlength="500" <?php echo $input; ?>><?php echo $participant['exam_comment']; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
<?php   
        $count++;   
    }
?>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Scores" <?php echo $input; ?>>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# participant Score Table -->

    </div>
</section>  