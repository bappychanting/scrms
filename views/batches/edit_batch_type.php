<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=manageBatchType"><i class="material-icons">playlist_add</i> Manage Batch Types</a></li>
                <li class="active"><i class="material-icons">mode_edit</i> Edit Batch Type</li>
            </ol>
        </div>
<?php
    foreach($result as $type) {
?>    
    <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Edit Batch Type
                            <small>Batch acronym is suggested to be the first letters of each words of Batch Name</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=batches&action=updateBatchType'>
                            <input type="hidden" name="id" value="<?php echo $type['id']; ?>">
                            <div class="form-group form-float">
                                <div class="form-line focused">
                                    <input type="text" class="form-control" name="type" id="type" maxlength="50" minlength="5" autocomplete="off" value="<?php echo $type['type']; ?>" required>
                                    <label class="form-label">Batch Type</label>
                                </div>
                                <div class="help-info">Min. 5, Max. 50 characters</div>
                            </div>
                             <div class="form-group form-float">
                                <div class="form-line focused" id="batchTypeLevelClass">
                                    <input type="text" class="form-control" name="acronym" maxlength="10" minlength="2" autocomplete="off" value="<?php echo $type['acronym']; ?>" required>
                                    <label class="form-label" id="batchTypeLevel">Batch Type Acronym</label>
                                </div>
                                <div class="help-info">Min. 2, Max. 10 characters</div>
                            </div>
                            <input class="btn btn-warning waves-effect" type="submit" name="submit" value="Update">
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
