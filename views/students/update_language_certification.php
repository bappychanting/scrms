<?php foreach($result as $record){ ?>
<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $record['username']; ?>#language_certification"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Update Certification</li>
            </ol>
        </div>

        <!-- Update Certificate -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Update <?php echo  $record['family_name'].' '.$record['given_name'].'&#39;s '.$record['name']; ?> Test Japanese Language Certificate                      
                            <small>Change following information to update Language Certification details</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=updateLanguageCertification'>
                            <input type="hidden" name="id" value="<?php echo $record['id']; ?>">
                            <input type="hidden" name="uname" value="<?php echo $record['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line focused">
                                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" value="<?php if(!empty($record['start_date'])){ echo date("l d F Y", $record['start_date']); } ?>"  placeholder="Start Year" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="datepicker form-control" name="end_date"  value="<?php if(!empty($record['end_date'])){ echo date("l d F Y", $record['end_date']); } ?>" placeholder="End Year" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                            </div>      
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Lanugage Certificate">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Certificate -->

    </div>
</section>
<?php } ?>