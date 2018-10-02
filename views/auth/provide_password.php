<section class="content">
    <div class="container-fluid">
        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="/admin/adminpane/"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">people</i> Users</li>
                <li><a href="?controller=users&action=showAllUsers"><i class="material-icons">account_circle</i> Show All Users</a></li>
                <li class="active"><i class="material-icons">person</i> User Profile</li>
            </ol>
        </div>  

        <!-- Advanced Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <div class="media">
                            <div class="media-body">
                                <h4 class="media-heading">Password Authentication</h4> 
                                You need to provide user password first to access requested functionality
                            </div>
                        </div>
                    </div>
                    <div class="body">
                        <form method="post" action='?controller=auth&action=checkPassword'>
                        <input type="hidden" name="uname" value="<?php echo $_GET['uname']; ?>">
                        <input type="hidden" name="redirect" value="<?php echo $_GET['redirect']; ?>">
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <input type="password" class="form-control" name="pass">
                                    <label class="form-label">Current Password</label>
                                </div>
                                <div class="help-info">Please input your current password</div>
                            </div>
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Submit">
                        </form>
                    </div>       
                </div>
            </div>
        </div>
        <!-- #END# Advanced Validation -->
    </div>
</section>