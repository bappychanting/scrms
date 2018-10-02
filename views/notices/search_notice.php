<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">announcement</i> Notices</li>
                <li><a href="?controller=notices&action=allNotices"><i class="material-icons">list</i> All Notices</a></li>
                <li class="active"><i class="material-icons">search</i> Search Notice</li>
            </ol>
        </div>

        <!-- Basic Table -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Search Notice
                            <small><strong><?php echo count($result); ?> notices found</strong> based on input search query!</small>
                        </h2>
                    </div>
                    <div class="body table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>TITLE</th>
                                    <th>DETAILS</th>
                                    <th>ADDED IN</th>
                                    <th>ADDED BY</th>
                                    <th>VIEW NOTICE</th>
                                    <th>COMMENTS</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>TITLE</th>
                                    <th>DETAILS</th>
                                    <th>ADDED IN</th>
                                    <th>ADDED BY</th>
                                    <th>VIEW NOTICE</th>
                                    <th>COMMENTS</th>
                                </tr>
                            </tfoot>
                            <tbody>
<?php	
	$count = 1;
	foreach($result as $notice) {	
?>
								<tr>
                                    <th scope="row"><?php echo $count; ?></th>
                                    <td><?php echo substr($notice['title'],0,20); ?>...</td>
                                    <td><?php echo substr(strip_tags($notice['details']),0,50); ?>...</td>
                                    <td><?php echo date("F d (l), Y", strtotime($notice['create_date'])); ?></td>
                                    <td><?php echo $notice['family_name'].' '.$notice['given_name']; ?></td>
                                    <td>
                <a href='?controller=notices&action=viewNotice&id=<?php echo $notice['id']; ?>' class="btn btn-default waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Notice"><i class="material-icons">open_in_new</i></a>
                                    </td>
									<td>
                <a href='javascript:void(0);' target="_blank" class="btn btn-success waves-effect" data-toggle="tooltip" data-placement="bottom" title="View Comments"><i class="material-icons">comment</i></a>
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