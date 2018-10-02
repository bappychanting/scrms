<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li class="active"><i class="material-icons">playlist_add</i> Manage Classrooms</li>
            </ol>
        </div>

            <!-- Advanced Validation -->
   			<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add New Classroom
                                <small>Usually numbers are assigned as class names</small>
                            </h2>
                        </div>
                        <div class="body">
                            <form id="form_advanced_validation" method="post" action='?controller=batches&action=storeClassRoom'>
                                <div class="form-group form-float">
                                    <div class="<?php echo $data['class']; ?>">
                                        <input type="text" class="form-control" name="className" maxlength="20" minlength="2" autocomplete="off" value="<?php echo $data['className']; ?>" required>
                                        <label class="form-label">New Class Name/ No</label>
                                    </div>
                                    <div class="help-info">Min. 2, Max. 20 characters</div>
                                </div>
                                <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Add">
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
                                List of Classrooms
                            </h2>
                        </div>
                        <div class="body table-responsive">                       
                           <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Classroom Name/ No</th>
                                        <th>Create Date</th>
                                        <th>View Batches</th>
                                        <th>Edit Classroom</th>
                                        <th>Delete Classroom</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                       	<th>#</th>
                                        <th>Classroom Name/ No</th>
                                        <th>Create Date</th>
                                        <th>View Batches</th>
                                        <th>Edit Classroom</th>
                                        <th>Delete Classroom</th>
                                    </tr>
                                </tfoot>
                                <tbody>
<?php
    $count = 1;
    foreach ($classrooms as $classroom) {
?>
									<tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td>Class <?php echo $classroom['name']; ?></td>
                                        <td><?php echo date("F d (l), Y", strtotime($classroom['create_date'])); ?></td>
                                        <td>
                <a href='?controller=batches&action=searchByClassroom&classroom=<?php echo $classroom['id']; ?>' class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Batches">
                    <i class="material-icons">search</i>
                </a>    
                                        </td>
										<td>
                <a href='?controller=batches&action=editClassRoom&id=<?php echo $classroom['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Classroom">
                    <i class="material-icons">mode_edit</i>
                </a>
                                        </td>
										<td>
                <a href='?controller=batches&action=deleteClassRoom&id=<?php echo $classroom['id']; ?>' onclick="return confirm('Delete Classroom?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Classroom">
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
