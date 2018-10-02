<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                 <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">live_help</i> Complaints and Suggestions</li>
                <li class="active"><i class="material-icons">playlist_add</i> Add New Suggestion</li>
            </ol>
        </div>

        <!-- Add Notice -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Add New Suggestion</h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=suggestions&action=storeSuggestion' onsubmit="setFormSubmitting()"> 
                        	<input type="hidden" name="uname" value="<?php echo $_SESSION['uname']; ?>">
                            <div class="form-group form-float">
                                <div class="<?php echo $data['class']; ?>">
                                    <input type="text" class="form-control" name="title" minlength="5" maxlength="500" value="<?php echo $data['title']; ?>" autocomplete="off" required>
                                    <label class="form-label">Suggestion Title</label>
                                </div>
                                <div class="help-info" id="uname_info">Min. Value: 5, Max. Value: 500</div>
                            </div>
                            <label for="details">Add Suggestion Details</label>
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"><?php echo $data['details']; ?></textarea>
                                <div class="help-info">Maximum 5000 Words. Details can not be empty.</div>
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