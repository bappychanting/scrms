<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                 <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">announcement</i> Notices</li>
                <li><a href="?controller=notices&action=allNotices"><i class="material-icons">list</i> All Notices</a></li>
                <li class="active"><i class="material-icons">details</i> View Notice</li>
            </ol>
        </div>

        <div class="row clearfix">
        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			    <div class="card">
			        <div class="header">
			            <h2>
			              Search Notices
			            </h2>
			        </div>
			        <div class="body">        
			            <form  method="post" action='?controller=notices&action=searchNotice'>      
			                <div class="input-group col-md-12">
			                    <input type="text" id="searchTitle" name="title" autocomplete="off" class="search-query form-control" placeholder="Search for Notice"/>
			                    <span class="input-group-btn">
			                        <button class="btn btn-danger" type="submit" value="submit">
			                            <span class=" glyphicon glyphicon-search"></span>
			                        </button>
			                    </span>
			                </div>
			            </form>
			            <div id="livesearch" class="list-group"></div>                              
			        	<div class="row clearfix">
				            <div class="col-sm-12">  
				                <h2 class="card-inside-title">Search Notices By Date</h2>
				            </div>
				            <form method="post" id="form_advanced_validation" action='?controller=notices&action=searchNoticebyDate'>
				                <div class="col-sm-4">
				                    <div class="form-group">
				                        <div class="form-line">
				                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" placeholder="Date from..." required>
				                        </div>
				                    </div>
				                </div>
				                <div class="col-sm-4">
				                    <div class="form-group">
				                        <div class="form-line">
				                            <input type="text" class="datepicker form-control" name="end_date" placeholder="To..." required>
				                        </div>
				                    </div>
				                </div>
				                <div class="col-sm-4">
				                    <input class="btn btn-primary btn-block waves-effect" type="submit" name="submit" value="Search By Date &#10230">
				                </div>
				            </form> 
			            </div>
			        </div>
			    </div>
			</div>
		</div>

		<div class="block-header">
            <h2>
                All Notifices
                <small><?php echo count($result); ?> Notices Found!</small>
            </h2>
        </div>

	    <div class="row clearfix">
<?php 
	foreach($result as $notice) {
?>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
	            <div class="card">
	                <div class="header bg-light-blue">
	                    <h2>
	                        <?php echo substr($notice['title'],0,20); ?> <small><?php echo date("F d (l), Y", strtotime($notice['create_date'])); ?></small>
	                    </h2>
	                    <ul class="header-dropdown m-r--5">
	                        <li>
	                            <a href="?controller=notices&action=viewNotice&id=<?php echo $notice['id']; ?>" target="_blank" data-toggle="tooltip" data-placement="bottom" title="View Notice">
	                                <i class="material-icons">open_in_new</i>
	                            </a>
	                        </li>
	                        <li class="dropdown">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	                                <i class="material-icons">more_vert</i>
	                            </a>
	                            <ul class="dropdown-menu pull-right">
	                            	<li><a href="?controller=notices&action=viewNotice&id=<?php echo $notice['id']; ?>">View Notice</a></li>
	                            	<li><a href="?controller=notices&action=viewComments&id=<?php echo $notice['id']; ?>">View Comments</a></li>
	                            </ul>
	                        </li>
	                    </ul>
	                </div>
	                <div class="body">
	                    <?php echo substr(strip_tags($notice['details']),0,50); ?>...
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