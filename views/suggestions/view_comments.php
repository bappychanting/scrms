<!-- Content -->
<section class="content">
    <div class="container-fluid">

<?php if($_SESSION['role'] == 4){ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">live_help</i> Complaints and Suggestions</li>
                <li><a href="?controller=suggestions&action=studentSuggestions"><i class="material-icons">list</i> View Your Suggestions</a></li>
                <li><a href="?controller=suggestions&action=viewSuggestion&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Suggestion</a></li>
                <li class="active"><i class="material-icons">comment</i> View Comments</li>
            </ol>
        </div>
<?php } else{ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><a href="?controller=suggestions&action=allSuggestions"><i class="material-icons">list</i> Complaints and Suggestions</a></li>
                <li><a href="?controller=suggestions&action=viewSuggestion&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Suggestion</a></li>
                <li class="active"><i class="material-icons">comment</i> View Comments</li>
            </ol>
        </div>
<?php } ?> 

        <div class="block-header">
            <h2>
                All Comments
                <small>Showing Last <?php echo count($result); ?> Comments..</small>
            </h2>
        </div>

        <div class="row clearfix">
<?php   
    $result = array_reverse($result);
    foreach ($result as $comment) {
?>
        <!-- Messages -->
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <div class="col-lg-1 col-md-1 hidden-sm hidden-xs">
                            <img class="img-thumbnail" src="<?php echo $comment['image']; ?>"  alt="<?php echo $comment['family_name'].' '.$comment['given_name']; ?>" width="50" height="50">
                        </div>
                        <h2>
                            <?php echo $comment['family_name'].' '.$comment['given_name']; ?>
                            <small>
                                <strong>Added At: </strong> <?php echo date("F d (l), Y, h:i A", strtotime($comment['create_date'])); ?>,
                                <strong>Updated At: </strong>  <?php echo $comment['update_date']; ?>
                            </small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=suggestions&action=editComment&id=<?php  echo $comment['id']; ?>">Update Comment</a></li>
                                    <li><a href="?controller=suggestions&action=deleteComment&id=<?php  echo $comment['id']; ?>">Delete Comment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <?php  echo $comment['suggestion_comment']; ?>
                    </div>
                </div>
            </div>
<?php
    } 
    echo '<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">'.$pagination.'</div>';
?>
        </div>
        
        <!-- Add Comment -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Add Comment</h2>
                    </div>
                    <div class="body">
                        <form method="post" action='?controller=suggestions&action=storeComment' onsubmit="setFormSubmitting()"> 
                            <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                            <input type="hidden" name="uname" value="<?php echo $_SESSION['uname']; ?>">
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"></textarea>
                                <div class="help-info">Maximum 5000 Words. Comment can not be empty.</div>
                            </div>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                            <input class="btn btn-warning waves-effect" type="reset" value="Reset">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Add Notice -->


    </div>
</section>  
<!-- Content Ends -->