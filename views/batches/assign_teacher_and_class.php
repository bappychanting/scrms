<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li><a href="?controller=batches&action=viewBatch&id=<?php echo $_GET['id'];?>"><i class="material-icons">details</i> View Batch Details</a></li>
                <li class="active"><i class="material-icons">edit</i> Assign Teacher and Classrom</li>
            </ol>
        </div>

<script src="views/assets/js/staymessage.js"></script>

        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
<?php foreach($batchData['batch'] as $batch){ ?>
                        <h2>
                            Assign Teacher and Classroom to <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?>                 
                            <small>Can't find desired teacher or classroom? <a href="#">Click here</a> to update batch information</small>
                        </h2>
<?php } ?>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=updateTeacherClassroom' onsubmit="setFormSubmitting()"> 
                            <h5>Available Teachers and Classrooms</h5>
                            <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                            <div class="form-group form-float">
                                <select class="form-control show-tick" data-live-search="true" name="teacher">
                                <?php foreach($batchData['teachers'] as $teacher){ ?>
                                        <option value="<?php echo $teacher['id']; ?>"><?php echo $teacher['family_name'].' '.$teacher['given_name']; ?></option>  
                                <?php } ?>      
                                </select> 
                                <div class="help-info">Select Teacher</div>
                            </div>
                            <div class="form-group form-float">
                                <select class="form-control show-tick" data-live-search="true" name="classroom">
                                <?php foreach($batchData['classes'] as $class){ ?>
                                        <option value="<?php echo $class['id']; ?>"><?php  echo $class['name']; ?></option>  
                                <?php } ?>      
                                </select> 
                                <div class="help-info">Select Class</div>
                            </div>  
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Assign">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Advanced Validation -->

    </div>
</section>  