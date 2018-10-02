<?php foreach($result as $comment){ ?>
<section class="content">
    <div class="container-fluid">


<?php if($_SESSION['role'] == 4){ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">live_help</i> Complaints and Suggestions</li>
                <li><a href="?controller=suggestions&action=studentSuggestions"><i class="material-icons">list</i> View Your Suggestions</a></li>
                <li><a href="?controller=suggestions&action=viewSuggestion"><i class="material-icons">details</i> View Suggestion</a></li>
                <li><a href="?controller=suggestions&action=viewComments&id=<?php echo $comment['suggestion_id']; ?>"><i class="material-icons">comment</i> View Comments</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Comment</li>
            </ol>
        </div>
<?php } else{ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><a href="?controller=suggestions&action=allSuggestions"><i class="material-icons">list</i> Complaints and Suggestions</a></li>
                <li><a href="?controller=suggestions&action=viewSuggestion"><i class="material-icons">details</i> View Suggestion</a></li>
                <li><a href="?controller=suggestions&action=viewComments&id=<?php echo $comment['suggestion_id']; ?>"><i class="material-icons">comment</i> View Comments</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Comment</li>
            </ol>
        </div>
<?php } ?> 

        <!-- Update Notice -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Edit Notice</h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=suggestions&action=updateComment' onsubmit="setFormSubmitting()"> 
                        	<input type="hidden" name="suggestion_id" value="<?php echo $comment['suggestion_id']; ?>">
                            <input type="hidden" name="id" value="<?php echo $comment['id']; ?>">
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"><?php echo $comment['suggestion_comment']; ?></textarea>
                                <div class="help-info">Maximum 5000 Words. Details can not be empty.</div>
                            </div>
                            <input class="btn btn-warning waves-effect" type="submit" name="submit" value="Update">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Update Notice -->

    </div>
</section>
<?php } ?>  