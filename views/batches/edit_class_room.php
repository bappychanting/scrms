<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=manageClassRoom"><i class="material-icons">group_work</i> Manage Classroom</a></li>
                <li class="active"><i class="material-icons">mode_edit</i> Edit Classroom</li>
            </ol>
        </div>
<?php
    foreach($result as $classroom) {
?>    
    <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Change Class <?php echo $classroom['name']; ?> Name
                            <small>Usually numbers are assigned as class names</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=updateClassRoom'>
                            <input type="hidden" name="id" value="<?php echo $classroom['id']; ?>">
                            <div class="form-group form-float">
                                <div class="form-line focused">
                                    <input type="text" class="form-control" name="className" maxlength="20" minlength="2" autocomplete="off" value="<?php echo $classroom['name']; ?>" required>
                                    <label class="form-label">Classroom Name/ No</label>
                                </div>
                                <div class="help-info">Min. 2, Max. 20 characters</div>
                            </div>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- #END# Advanced Validation -->
<?php
    }
?>

    </div>
</section> 
