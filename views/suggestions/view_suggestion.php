<section class="content">
    <div class="container-fluid">

<?php if($_SESSION['role'] == 4){ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">live_help</i> Complaints and Suggestions</li>
                <li><a href="?controller=suggestions&action=studentSuggestions"><i class="material-icons">list</i> View Your Suggestions</a></li>
                <li class="active"><i class="material-icons">details</i> View Suggestion</li>
            </ol>
        </div>
<?php } else{ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><a href="?controller=suggestions&action=allSuggestions"><i class="material-icons">list</i> Complaints and Suggestions</a></li>
                <li class="active"><i class="material-icons">details</i> View Suggestion</li>
            </ol>
        </div>
<?php } ?>        

<?php foreach($result as $suggestion){ ?>
		<!-- Notice -->
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			    <div class="card">
			        <div class="header">
			            <h2>
			                <?php echo $suggestion['title']; ?>
			                <small>
				            	<strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($suggestion['create_date'])); ?>,
				            	<strong>Updated At: </strong>  <?php echo $suggestion['update_date']; ?>
			            	</small>
			            </h2>
			            <ul class="header-dropdown m-r--5">
			                <li>
	                            <a href="?controller=suggestions&action=viewComments&id=<?php echo $suggestion['id']; ?>" data-toggle="tooltip" data-placement="bottom" title="View Comments">
	                                <i class="material-icons">comment</i>
	                            </a>
	                        </li>
			                <li class="dropdown">
			                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			                        <i class="material-icons">more_vert</i>
			                    </a>
			                    <ul class="dropdown-menu pull-right">
			                        <li><a href="?controller=suggestions&action=editSuggestion&id=<?php echo $suggestion['id']; ?>">Update Suggestion</a></li>
			                        <li><a href="?controller=suggestions&action=deleteSuggestion&id=<?php echo $suggestion['id']; ?>">Delete Suggestion</a></li>
			                    </ul>
			                </li>
			            </ul>
			        </div>
			        <div class="body">
			        	<blockquote>
                            <footer>Added by 
                            	<cite title="Source Title">
                            	<a href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover"  data-html="true" data-placement="right" 
                                            title="View User" data-content="
                                            <img src=&quot;<?php echo $suggestion['image']; ?>&quot; class=&quot;img-thumbnail center-block&quot; alt=&quot;<?php echo $suggestion['family_name'].' '.$suggestion['given_name']; ?>&quot; width= &quot;50&quot; height=&quot;50&quot;>
                                            <div class=&quot;caption center-block&quot;><?php echo $suggestion['family_name'].' '.$suggestion['given_name']; ?></div>
                                            <div class=&quot;caption center-block&quot;><a href=&quot;?controller=messages&action=viewMessages&uname=<?php echo $suggestion['username']; ?>&quot; target=&quot;_blank&quot;>Send Message</a></div>">
                            		<?php echo $suggestion['family_name'].' '.$suggestion['given_name']; ?>
                            	</a></cite>
                            </footer>
                        </blockquote>
			        	<?php echo $suggestion['details']; ?>
			    	</div>
			    </div>
			</div>
		</div>
		<!-- #End# Notice -->

		<!-- Add Comment -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Add Comment</h2>
                    </div>
                    <div class="body">
                        <form method="post" action='?controller=suggestions&action=storeComment' onsubmit="setFormSubmitting()"> 
                        	<input type="hidden" name="id" value="<?php echo $suggestion['id']; ?>">
                        	<input type="hidden" name="uname" value="<?php echo $_SESSION['uname']; ?>">
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"></textarea>
                                <div class="help-info">Maximum 5000 Words. Comment can not be empty.</div>
                            </div>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                            <input class="btn btn-warning waves-effect" type="reset" value="Reset">
                            <a class="btn btn-default waves-effect" href="?controller=suggestions&action=viewComments&id=<?php echo $suggestion['id']; ?>" target="_blank">
                            	<span class="glyphicon glyphicon-comment"></span> View Comments
                        	</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Add Comment -->
<?php } ?>

    </div>
</section>  