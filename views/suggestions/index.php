<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li class="active"><i class="material-icons">list</i> Complaints and Suggestions</li>
            </ol>
        </div>

		<div class="block-header">
            <h2>
                Complaints and Suggestions
                <small><?php echo count($result); ?> Suggestions Found!</small>
            </h2>
        </div>

	    <div class="row clearfix">
<?php 
	foreach($result as $suggestion) {
?>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
	            <div class="card">
                    <div class="header bg-light-green">
                        <h2>
                            <?php echo substr($suggestion['title'],0,20); ?> <small><?php echo date("F d (l), Y", strtotime($suggestion['create_date'])); ?></small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li>
                                <a href="?controller=suggestions&action=viewSuggestion&id=<?php echo $suggestion['id']; ?>" target="_blank" data-toggle="tooltip" data-placement="bottom" title="View Suggestion">
                                    <i class="material-icons">open_in_new</i>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=suggestions&action=viewSuggestion&id=<?php echo $suggestion['id']; ?>">View Suggestion</a></li>
                                    <li><a href="?controller=suggestions&action=viewComments&id=<?php echo $suggestion['id']; ?>">View Comments</a></li>
                                    <li><a href="?controller=suggestions&action=editSuggestion&id=<?php echo $suggestion['id']; ?>">Update Suggestion</a></li>
                                    <li><a href="?controller=suggestions&action=deleteSuggestion&id=<?php echo $suggestion['id']; ?>">Delete Suggestion</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="media">
                            <div class="media-left">
                                <a href="javascript:void(0);">
                                    <img class="media-object" src="<?php echo $suggestion['image']; ?>" width="64" height="64">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"> <?php echo $suggestion['family_name'].' '.$suggestion['given_name']; ?></h4> 
                                <?php echo substr(strip_tags($suggestion['details']),0,200); ?>...
                            </div>
                        </div>
                    </div>
                </div>
	        </div>
<?php
	}
	echo '<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">'.$pagination.'</div>';
?>
        </div>

    </div>
</section>  