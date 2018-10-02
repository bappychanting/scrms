<section class="content">
    <div class="container-fluid">

<?php if($_SESSION['role'] == 4){ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">announcement</i> Complaints and Suggestions</li>
                <li><a href="?controller=suggestions&action=studentSuggestions"><i class="material-icons">list</i> View Your Suggestions</a></li>
                <li><a href="?controller=suggestions&action=viewSuggestion&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Suggestion</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Suggestion</li>
            </ol>
        </div>

<?php } else{ ?>
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><a href="?controller=suggestions&action=allSuggestions"><i class="material-icons">list</i> Complaints and Suggestions</a></li>
                <li><a href="?controller=suggestions&action=viewSuggestion&id=<?php echo $_GET['id']; ?>"><i class="material-icons">details</i> View Suggestion</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Suggestion</li>
            </ol>
        </div>
<?php } ?>

<?php foreach($result as $suggestion){ ?>
        <!-- Update Notice -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Edit Suggestion</h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=suggestions&action=updateSuggestion' onsubmit="setFormSubmitting()"> 
                            <input type="hidden" name="id" value="<?php echo $suggestion['id']; ?>">
                            <div class="form-group form-float">
                                <div class="form-line focused">
                                    <input type="text" class="form-control" name="title" minlength="5" maxlength="500" value="<?php echo $suggestion['title']; ?>" autocomplete="off" required>
                                    <label class="form-label">Suggestion Title</label>
                                </div>
                                <div class="help-info" id="uname_info">Min. Value: 5, Max. Value: 500</div>
                            </div>
                            <label for="details">Edit Suggestion Details</label>
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"><?php echo $suggestion['details']; ?></textarea>
                                <div class="help-info">Maximum 5000 Words. Details can not be empty.</div>
                            </div>
                            <input class="btn btn-warning waves-effect" type="submit" name="submit" value="Update">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Update Notice -->
<?php } ?>
    </div>
</section>  