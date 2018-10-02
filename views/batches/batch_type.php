<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li class="active"><i class="material-icons">playlist_add</i> Manage Batch Types</li>
            </ol>
        </div>

            <!-- Advanced Validation -->
   			<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add New Batch Type
                                <small>Batch acronym is suggested to be the first letters of each words of Batch Name</small>
                            </h2>
                        </div>
                        <div class="body">
                            <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeBatchType'>
                                <div class="form-group form-float">
                                    <div class="<?php echo $data['class']; ?>">
                                        <input type="text" class="form-control" name="type" id="type" maxlength="50" minlength="5" autocomplete="off" value="<?php echo $data['type']; ?>" required>
                                        <label class="form-label">Batch Type</label>
                                    </div>
                                    <div class="help-info">Min. 5, Max. 50 characters</div>
                                </div>
                                 <div class="form-group form-float">
                                    <div class="<?php echo $data['class']; ?>" id="batchTypeLevelClass">
                                        <input type="text" class="form-control" name="acronym" maxlength="10" minlength="2" autocomplete="off" value="<?php echo $data['acronym']; ?>" required>
                                        <label class="form-label">Batch Type Acronym</label>
                                    </div>
                                    <div class="help-info">Min. 2, Max. 10 characters</div>
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
                                List of Batch Types
                            </h2>
                        </div>
                        <div class="body table-responsive">                       
                           <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Batch Type ID</th>
                                        <th>Batch Type Abbreviation</th>
                                        <th>Create Date</th>
                                        <th>View Batches</th>
                                        <th>Edit Batch Type</th>
                                        <th>Delete Batch Type</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                       	<th>#</th>
                                        <th>Batch Type ID</th>
                                        <th>Batch Type Abbreviation</th>
                                        <th>Create Date</th>
                                        <th>View Batches</th>
                                        <th>Edit Batch Type</th>
                                        <th>Delete Batch Type</th>
                                    </tr>
                                </tfoot>
                                <tbody>
<?php
    $count = 1;
    foreach ($batchTypes as $type) {
?>
									<tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td><?php echo $type['type']; ?></td>
                                        <td><?php echo $type['acronym']; ?></td>
                                        <td><?php echo date("F d (l), Y", strtotime($type['create_date'])); ?></td>
                                        <td>
                <a href='?controller=batches&action=searchByType&type=<?php echo $type['id']; ?>' class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Batches">
                    <i class="material-icons">search</i>
                </a>
                                        </td>
                                        <td>
                <a href='?controller=batches&action=editBatchType&id=<?php echo $type['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Batch Type">
                    <i class="material-icons">mode_edit</i>
                </a>
                                        </td>
										<td>
                <a href='?controller=batches&action=deleteBatchType&id=<?php echo $type['id']; ?>' onclick="return confirm('Deleting batch Type will delete all associated batches! Are you sure?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Batch Type">
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
