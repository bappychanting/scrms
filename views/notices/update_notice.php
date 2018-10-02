<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">announcement</i> Notices</li>
                <li><a href="?controller=notices&action=allNotices"><i class="material-icons">list</i> All Notices</a></li>
                <li><a href="?controller=notices&action=viewNotice&id=<?php echo $_GET['id']; ?>"><i class="material-icons">list</i> View Notice</a></li>
                <li class="active"><i class="material-icons">edit</i> Edit Notice</li>
            </ol>
        </div>
<?php foreach($result as $notice){ ?>
        <!-- Update Notice -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Edit Notice</h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=notices&action=updateNotice' onsubmit="setFormSubmitting()"> 
                        	<input type="hidden" name="id" value="<?php echo $notice['id']; ?>">
                            <div class="form-group form-float">
                                <div class="form-line focused">
                                    <input type="text" class="form-control" name="title" minlength="5" maxlength="500" value="<?php echo $notice['title']; ?>" autocomplete="off" required>
                                    <label class="form-label">Notice Title</label>
                                </div>
                                <div class="help-info" id="uname_info">Min. Value: 5, Max. Value: 500</div>
                            </div>
                            <label for="details">Edit Notice Details</label>
                            <div class="form-group form-float">
                                <textarea id="tinymce" name="details"><?php echo $notice['details']; ?></textarea>
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