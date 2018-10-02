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

<?php foreach($result as $notice){ ?>
		<!-- Notice -->
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			    <div class="card">
			        <div class="header">
			            <h2>
			                <?php echo $notice['title']; ?>
			                <small>
				            	<strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($notice['create_date'])); ?>,
				            	<strong>Updated At: </strong>  <?php echo $notice['update_date']; ?>
			            	</small>
			            </h2>
			            <ul class="header-dropdown m-r--5">
			                <li>
	                            <a href="?controller=notices&action=viewComments&id=<?php echo $notice['id']; ?>" data-toggle="tooltip" data-placement="bottom" title="View Comments">
	                                <i class="material-icons">comment</i>
	                            </a>
	                        </li>
<?php if($_SESSION['role'] < 4 ){ ?>
			                <li class="dropdown">
			                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			                        <i class="material-icons">more_vert</i>
			                    </a>
			                    <ul class="dropdown-menu pull-right">
			                        <li><a href="?controller=notices&action=editNotice&id=<?php echo $notice['id']; ?>">Update Notice</a></li>
			                        <li><a href="?controller=notices&action=deleteNotice&id=<?php echo $notice['id']; ?>">Delete Notice</a></li>
			                    </ul>
			                </li>
<?php } ?>
			            </ul>
			        </div>
			        <div class="body">
			        	<blockquote>
                            <footer>Added by 
                            	<cite title="Source Title">
                            	<a href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover"  data-html="true" data-placement="right" 
                                            title="View User" data-content="
                                            <img src=&quot;<?php echo $notice['image']; ?>&quot; class=&quot;img-thumbnail center-block&quot; alt=&quot;<?php echo $notice['family_name'].' '.$notice['given_name']; ?>&quot; width= &quot;50&quot; height=&quot;50&quot;>
                                            <div class=&quot;caption center-block&quot;><?php echo $notice['family_name'].' '.$notice['given_name']; ?></div>
                                            <div class=&quot;caption center-block&quot;><a href=&quot;?controller=messages&action=viewMessages&uname=<?php echo $notice['username']; ?>&quot; target=&quot;_blank&quot;>Send Message</a></div>">
                            		<?php echo $notice['family_name'].' '.$notice['given_name']; ?>
                            	</a></cite>
                            </footer>
                        </blockquote>
			        	<?php echo $notice['details']; ?>
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
                        <form method="post" action='?controller=notices&action=storeComment' onsubmit="setFormSubmitting()"> 
                        	<input type="hidden" name="id" value="<?php echo $notice['id']; ?>">
                        	<input type="hidden" name="uname" value="<?php echo $_SESSION['uname']; ?>">
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"></textarea>
                                <div class="help-info">Maximum 5000 Words. Comment can not be empty.</div>
                            </div>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                            <input class="btn btn-warning waves-effect" type="reset" value="Reset">
                            <a class="btn btn-default waves-effect" href="?controller=notices&action=viewComments&id=<?php echo $notice['id']; ?>" target="_blank">
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