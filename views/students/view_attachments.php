<section class="content">
    <div class="container-fluid">

        <div class="block-header">
            <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li class="active"><i class="material-icons">account_box</i> Show Student Profile</li>
            </ol>
        </div>

        <!-- User data for updating fields -->
            <input type="hidden" id="username" value="<?php echo $student['username']; ?>">
        <!-- #END# User data for updating fields -->

        <!-- Info -->
        <div class="block-header">
             <h2>
                <?php echo $student['family_name'].' '.$student['given_name']; ?> (Student Attachments)
                <small><strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($student['create_date'])); ?>, <strong>Updated At: </strong>  <?php echo date("F d (l), Y", strtotime($student['update_date'])); ?>. <a href="?controller=users&action=showUser&uname=<?php echo $student['username']; ?>">Click here</a> to view his user profile! <a href="?controller=students&action=showStudentProfile&uname=geomatry">Click here</a> to view his student profile!</small>
            </h2>
        </div>
        <!-- #END# Info -->

        <!-- Option -->
        <div class="block-header">
            <a href="?controller=students&action=assignBatch&uname=<?php echo $student['username']; ?>" class="btn btn-default btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Change/Assign Batch">
                <i class="material-icons">input</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#educational_record" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Educational Record">
                <i class="material-icons">school</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#language_certification" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Japaenese Language Certification">
                <i class="material-icons">language</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#carrer_record" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Carrer Record">
                <i class="material-icons">work</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#past_entry" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Past Entry">
                <i class="material-icons">flight_land</i>
            </a>
             <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#family_information" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Family Information">
                <i class="material-icons">wc</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#study_plan" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Study Plan">
                <i class="material-icons">location_city</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#supporter_info" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Supporter's Information">
                <i class="material-icons">rowing</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#study_purpose" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Study Purpose">
                <i class="material-icons">speaker_notes</i>
            </a>
            <a href="?controller=students&action=showStudentProfile&uname=<?php echo $student['username']; ?>#additional" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Additional Information">
                <i class="material-icons">assignment</i>
            </a>
             <a href="?controller=students&action=showStudentPerformance&uname=<?php echo $student['username']; ?>" class="btn btn-danger btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="View Student Performance">
                <i class="material-icons">assessment</i>
            </a>
            <a href="#" class="btn btn-warning btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="View Submitted Files">
                <i class="material-icons">attachment</i>
            </a>
            <a href="?controller=students&action=savePDF&uname=<?php echo $student['username']; ?>" target="_blank" class="btn btn-success btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Save as PDF">
                <i class="material-icons">picture_as_pdf</i>
            </a>
        </div>
        <!-- #END# Option --> 

        <!-- Upload Attachment -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>Upload Files</h2>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-sm-7">
                                <h2 class="card-inside-title">
                                    Upload Files
                                    <small>File should be in pdf, doc, docs format. Upload files included in the list. Server space is limited! Please avoid uploading any unnecesarry file!</small>
                                </h2>
                                <form id="file_upload" action="?controller=jquery&action=uploadAttachment" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                                    <div class="row clearfix">
                                        <div class="col-sm-5">
                                            <input type="file" class="btn btn-default btn-block waves-effect" id="file_input" accept=".pdf,.doc,.docx" name="attachment[]" multiple required>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="filename" maxlength="50" minlength="2" value=""  autocomplete="off" required>
                                                    <label class="form-label">File Name</label>
                                                </div>
                                                <div class="help-info">If possible, just copy paste the file name from the list.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">
                                     <span class="glyphicon glyphicon-upload"></span> Upload File(s) to the server
                                    </button>
                                </form>
                                <h2 class="card-inside-title">Server Feedback</h2><hr>
                                <div id="upload_feedback"></div>
                            </div>
                            <div class="col-sm-5">
                                <h2 class="card-inside-title">
                                    List of Required Files
                                    <small>Follow this list to find out which files you need to upload.</small>
                                </h2>
                                <div class="row clearfix">
                                    <div class="col-sm-6">
                                        <ul>
                                            <li>SSC/ Secondary Certificate</li>
                                            <li>SSC/ Secondary Transcript</li>
                                            <li>HSC/ Higher Secondary Certificate</li>
                                            <li>HSC/ Higher Secondary Transcript</li>
                                            <li>Graduation Certificate</li>
                                            <li>Graduation Transcript</li>
                                            <li>Masters Certificate</li>
                                            <li>Masters Transcript</li>
                                            <li>Reference Letter from current Institution/ Running Studentship Certificate</li>
                                            <li>Explanation of Study Gap</li>
                                            <li>Job Experience Certificate</li>
                                            <li>Birth Certificate</li>
                                            <li>Passport Photocopy</li>
                                        </ul>
                                    </div>                                        
                                    <div class="col-sm-6">
                                        <ul>
                                            <li>Guarantor’s Birth certificate</li>
                                            <li>Birth certificate of the person relating you and guarantor/ Guarantor relating person’s birth certificate</li>
                                            <li>Family Relationship certificate</li>
                                            <li>Guarantor’s Relationship certificate</li>
                                            <li>Employment certificate</li>
                                            <li>Salary certificate</li>
                                            <li>Income Certificate</li>
                                            <li>Personal Income statement for 3 years</li>
                                            <li>Bank solvency certificate</li>
                                            <li>Bank statement 3 years maximum</li>
                                            <li>Income Tax certificate last 3 years</li>
                                            <li>Trade License</li>
                                        </ul>
                                    </div>
                                </div>
                                <p><span class="font-bold col-deep-orange">Note:</span> Sometimes the organization might request files that are not included in the list!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Upload Attachment --> 

        <!-- Title -->
        <div class="block-header">
             <h2>
                Submitted Files
                <small>Click on the <strong>recycle icon</strong> to delete a file</small>
            </h2>
        </div>
        <!-- #END# Title --> 

        <div class="list-unstyled row clearfix" id="showAllAttachments">
<?php 
    if(!empty($student['attachments'])) {
        foreach($student['attachments'] as $attachment){ ?>
            <div class="col-sm-6 col-md-3">
                <a href="<?php echo $attachment['link']; ?>" target="_blank">
                    <img class="img-responsive" src="<?php echo $attachment['thumbnail']; ?>" alt="<?php echo $attachment['name']; ?>">
                </a>
                <p class="font-bold col-teal"><?php echo $attachment['name']; ?></p>
                <p><b>Upload Date:</b> <span class="col-red"><?php echo $attachment['upload_date']; ?></span></p>
                <p>
                    <a href="<?php echo $attachment['link']; ?>" download="<?php echo $attachment['name']; ?>" class="btn btn-primary waves-effect">
                        <i class="material-icons">file_download</i>
                    </a>
                    <a href="?controller=students&action=deleteAttachment&uname=<?php echo $student['username']; ?>&unlink=<?php echo $attachment['link']; ?>" class="btn btn-danger waves-effect" onclick="return confirm('Delete This Attachment?')">
                        <i class="material-icons">delete</i>
                    </a>
                </p>
            </div>
<?php 
        } 
    }
    else{
?>
        <div class="five-zero-zero">
            <div class="five-zero-zero-container">
                <div class="error-code">Uh-oh! <i class="fa fa-frown-o" aria-hidden="true"></i></div>
                <div class="error-message">
                    No Submitted File Found!
                </div>
            </div>
        </div>  
<?php    
    }

?>
        </div>

        <!-- Scroll to top button -->
        <div id="scrollToTopButton" style="margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; right: 25px;">
            <button type="button" class="btn bg-cyan btn-circle-lg waves-effect waves-circle waves-float"><i class="material-icons">arrow_drop_up</i></button>
        </div>
        <!-- #END# Scroll to top button --> 

    </div>
</section>  