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
                <?php echo $student['family_name'].' '.$student['given_name']; ?> (Student Profile)
                <small><strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($student['create_date'])); ?>, <strong>Updated At: </strong>  <?php echo date("F d (l), Y", strtotime($student['update_date'])); ?>. <a href="?controller=users&action=showUser&uname=<?php echo $student['username']; ?>">Click here</a> to view his user profile! <a href="?controller=students&action=showStudentAttachments&uname=<?php echo $student['username']; ?>">Click here</a> to view his uploaded files!</small>
            </h2>
        </div>
        <!-- #END# Info -->

        <!-- Option -->
        <div class="block-header">
            <a href="?controller=students&action=assignBatch&uname=<?php echo $student['username']; ?>" class="btn btn-default btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Change/Assign Batch">
                <i class="material-icons">input</i>
            </a>
            <a href="#educational_record" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Educational Record">
                <i class="material-icons">school</i>
            </a>
            <a href="#language_certification" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Japaenese Language Certification">
                <i class="material-icons">language</i>
            </a>
            <a href="#carrer_record" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Carrer Record">
                <i class="material-icons">work</i>
            </a>
            <a href="#past_entry" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Past Entry">
                <i class="material-icons">flight_land</i>
            </a>
             <a href="#family_information" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Family Information">
                <i class="material-icons">wc</i>
            </a>
            <a href="#study_plan" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Study Plan">
                <i class="material-icons">location_city</i>
            </a>
            <a href="#supporter_info" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Supporter's Information">
                <i class="material-icons">rowing</i>
            </a>
            <a href="#study_purpose" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Study Purpose">
                <i class="material-icons">speaker_notes</i>
            </a>
            <a href="#additional" class="btn btn-primary btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Additional Information">
                <i class="material-icons">assignment</i>
            </a>
            <a href="?controller=students&action=showStudentPerformance&uname=<?php echo $student['username']; ?>" class="btn btn-danger btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="View Student Performance">
                <i class="material-icons">assessment</i>
            </a>
            <a href="?controller=students&action=showStudentAttachments&uname=<?php echo $student['username']; ?>" class="btn btn-warning btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="View Submitted Files">
                <i class="material-icons">attachment</i>
            </a>
            <a href="?controller=students&action=savePDF&uname=<?php echo $student['username']; ?>" target="_blank" class="btn btn-success btn-circle-lg waves-effect waves-circle waves-float" data-toggle="tooltip" data-placement="bottom" title="Save as PDF">
                <i class="material-icons">picture_as_pdf</i>
            </a>
        </div>
        <!-- #END# Option -->   

        <!-- Header Information -->
        <div class="row clearfix">
            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="header bg-cyan">
                        <h2>
                            User Information
                            <small>Shows student's user information</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=users&action=editUser&uname=<?php echo $student['username']; ?>">Update User Info</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <p><b>Family Name:</b> <span class="col-green"><?php echo $student['family_name']; ?></span></p> 
                        <p><b>Given Name:</b> <span class="col-teal"><?php echo $student['given_name']; ?></span></p>
                        <p><b>Email:</b> <?php echo $student['email']; ?></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="header bg-deep-orange">
                        <h2>
                            Batch Information
                            <small>Shows assigned batch and student Id</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=assignBatch&uname=<?php echo $student['username']; ?>">Update Batch</a></li>
                                    <li><a href="?controller=students&action=generateBatchDetailsPDF&uname=<?php echo $student['username']; ?>" target="_blank">Download PDF</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <p><b>Student Id:</b> <?php echo $student['roll']; ?></p>
                        <p><b>Batch:</b> <?php echo $student['batch']; ?></p>
                        <p>
                            <a href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover"  data-html="true" data-placement="right" 
                                            title="Batch Change History" data-content="
                                            <?php if(is_array($student['batchChange'])) { ?>
                                            <ul>
                                            <?php foreach($student['batchChange'] as $change){ ?>
                                                <li>
                                                    Migrated to Batch <b><?php echo $change['acronym']."-".$change['period'][0]."-".$change['batch_number']; ?></b> 
                                                    in <b><?php echo date("F d (l), Y", strtotime($change['create_date'])); ?></b>.
                                                    His roll was- <b><?php echo $change['roll']; ?></b>. 
                                                    <br>&nbsp;-Changed by <b><?php echo $change['changed_by_family_name']." ".$change['changed_by_given_name']; ?></b>.</li>
                                            <?php } ?>
                                            </ul>
                                            <?php } else{ echo $student['batchChange']; } ?>">
                                Click to View Batch Change History
                            </a>
                    </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header bg-green">
                        <h2>
                            Passport Information
                            <small>Shows possport number and date</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=editStudentPassport&uname=<?php echo $student['username']; ?>">Update Passport</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <p><b>Passport Number:</b> <?php echo $student['passport_no']; ?></p>
                        <p><b>Issue date:</b> <?php echo $student['passport_issue']; ?></p>
                        <p><b>Expiration date:</b> <?php echo $student['passport_expiration']; ?></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Header Information --> 

        <!-- Profile Details -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Student Origin
                            <small>Displays the initial information of the student</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=editStudentDetails&uname=<?php echo $student['username']; ?>">Update Information</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                <a class="thumbnail" href="<?php echo $student['studentPhotograph']; ?>"  data-toggle="modal" data-color="red" data-target="#updatePhotograph">
                                     <img class="img-responsive" src="<?php echo $student['studentPhotograph']; ?>" alt="<?php echo $student['studentPhotographAlt']; ?>">
                                </a>
                                <h2 class="card-inside-title">Student Photograph<small>Click on the image to update</small></h2>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <p><b><i class="fa fa-mars" style="color:blue"></i> Father's Name:</b> <?php echo $student['fatherName']; ?></p>
                                <p><b><i class="fa fa-venus" style="color:pink"></i> Mother's Name:</b> <?php echo $student['motherName']; ?></p>
                                <p><b><i class="fa fa-birthday-cake" style="color:darksalmon"></i> Date of Birth:</b> <?php echo $student['dob']; ?></p>
                                <p><b><i class="fa fa-heartbeat" style="color:red"></i> Age:</b> <?php echo $student['age']; ?></p>
                                <p><b><i class="fa fa-flag-o"></i> Nationality:</b> <?php echo $student['nationality']; ?></p>
                                <p><b><i class="fa fa-intersex"></i> Sex:</b> <?php echo $student['sex']; ?></p>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <p><b><i class="fa fa-mobile" style="color:green"></i> Personal Contact:</b> +88<?php echo $student['contact1']; ?></p>
                                <p><b><i class="fa fa-mobile" style="color:orange"></i> Guardian Contact:</b> +88<?php echo $student['contact2']; ?></p>
                                <p><b><i class="fa fa-phone-square"></i> Home Contact:</b> +88<?php echo $student['contact3']; ?></p>
                                <p><b><i class="fa fa-home" style="color:green"></i> Present Address:</b> <?php echo $student['presentAddress']; ?></p>
                                <p><b><i class="fa fa-home" style="color:orange"></i> Place of Birth:</b> <?php echo $student['permanentAddress']; ?></p>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                <a class="thumbnail" href="<?php echo $student['studentSignature']; ?>" data-toggle="modal" data-target="#updateSignature">
                                    <img src="<?php echo $student['studentSignature']; ?>" alt="<?php echo $student['studentSignatureAlt']; ?>" class="img-responsive">
                                </a>
                                <h2 class="card-inside-title">Student Signature<small>Click on the image to update</small></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Basic Table -->

        <!-- Educational Record -->
        <div id="educational_record"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Educational Record 
                            <small>Add educational history from the header dropdown</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=addEducationRecord&uname=<?php echo $student['username']; ?>">Add Educational History</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">   
                            <?php 
                                if(is_array($student['educational_record'])) {
                            ?> 
                            <div class="row clearfix">
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                    <p><b>Last/present school Name: </b></p>
                                </div>
                                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                                    <p><?php echo $student['final_institude']; ?></p>
                                </div>
                            </div> 
                            <div class="row clearfix">
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                    <p><b>Last/present school status: </b></p>
                                </div>
                                <div id="study_status">
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <p><?php echo $student['study_status']; ?></p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                        <buttun id="update_study_status" class="btn btn-danger btn-lg waves-effect waves-float pull-right" <?php if(!is_array($student['educational_record'])) { ?> disabled="disabled" <?php } ?>>
                                            <span class="glyphicon glyphicon-edit"></span> Update Study Status
                                        </buttun>
                                    </div>
                                </div>
                            </div>
                            <p><b>Study Record: </b></p>
                            <div class="body table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name of School</th>
                                            <th>Address</th>
                                            <th>Degree</th>
                                            <th>Starting Year</th>
                                            <th>Ending Year</th>
                                            <th>Edit Record</th>
                                            <th>Delete Record</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            <?php   
                                $count = 1;
                                foreach($student['educational_record'] as $record) { 
                            ?>
                                    <tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td><?php echo $record['institude']; ?></td>
                                        <td><?php echo $record['address']; ?></td>
                                        <td><?php echo $record['degree_name']; ?></td>
                                        <td><?php echo date("F d (l), Y", $record['start_date']); ?></td>
                                        <td><?php echo date("F d (l), Y", $record['end_date']); ?></td>
                                        <td>
                <a href='?controller=students&action=editEducationRecord&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Education Record">
                    <i class="material-icons">mode_edit</i>
                </a>
                                        </td>
                                    <td>
                <a href='?controller=students&action=deleteEducationRecord&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' onclick="return confirm('Delete Education Record?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Education Record">
                    <i class="material-icons">delete</i>
                </a>
                                    </td>
                                </tr>
                            <?php   
                                    $count++;   
                                }
                            ?>
                                    </tbody>
                                </table>
                            </div>
                            <?php    
                                } 
                                else {
                            ?>        
                                <p><?php echo $student['educational_record']; ?></p>
                            <?php
                                } 
                            ?> 
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Educational Record -->

        <!-- Japanese Education Certification -->
        <div id="language_certification"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Japanese Langauge Certification
                            <small>Record of Japanese language certificates recieved by the student</small>
                        </h2>
                    </div>
                    <div class="body">
                            <div class="body table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Test Name</th>
                                            <th>Starting Year</th>
                                            <th>Ending Year</th>
                                            <th>Update Record</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                        <?php   
                            $count = 1;
                            foreach($student['certificate_record'] as $record) { 
                        ?>
                                        <tr>
                                            <th scope="row"><?php echo $count; ?></th>
                                            <td><?php echo $record['name']; ?> Test</td>
                                            <td><?php if(empty($record['start_date'])){ echo "Not updated yet"; } else { echo date("F d (l), Y", $record['start_date']); } ?></td>
                                            <td><?php if(empty($record['end_date'])){ echo "Not updated yet"; } else { echo date("F d (l), Y", $record['end_date']); } ?></td>
                                            <td>
            <a href='?controller=students&action=editLanguageCertification&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Update Language Certificate Record">
                <i class="material-icons">mode_edit</i>
            </a>
                                    </td>
                                        </tr>
                        <?php   
                                $count++;   
                            }
                        ?>
                                    </tbody>
                                </table>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Educational Certification -->

        <!-- Carrer Record -->
        <div id="carrer_record"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Carrer Record 
                            <small>Add carrer history from the header dropdown</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=addCarrerRecord&uname=<?php echo $student['username']; ?>">Add Educational History</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">  
                        <?php 
                            if(is_array($student['carrer_record'])) {
                        ?> 
                            <div class="body table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Organization</th>
                                            <th>Address</th>
                                            <th>Occupation</th>
                                            <th>Starting Year</th>
                                            <th>Ending Year</th>
                                            <th>Edit Record</th>
                                            <th>Delete Record</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                        <?php   
                            $count = 1;
                            foreach($student['carrer_record'] as $record) { 
                        ?>
                                        <tr>
                                            <th scope="row"><?php echo $count; ?></th>
                                            <td><?php echo $record['organization']; ?></td>
                                            <td><?php echo $record['address']; ?></td>
                                            <td><?php echo $record['occupation']; ?></td>
                                            <td><?php echo date("F d (l), Y", $record['start_date']); ?></td>
                                            <td><?php echo date("F d (l), Y", $record['end_date']); ?></td>
                                            <td>
            <a href='?controller=students&action=editCarrerRecord&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Carrer Record">
                <i class="material-icons">mode_edit</i>
            </a>
                                    </td>
                                    <td>
            <a href='?controller=students&action=deleteCarrerRecord&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' onclick="return confirm('Delete Carrer Record?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Carrer Record">
                <i class="material-icons">delete</i>
            </a>
                                    </td>
                                        </tr>
                        <?php   
                                $count++;   
                            }
                        ?>
                                    </tbody>
                                </table>
                            </div>
                        <?php    
                            } 
                            else {
                        ?>        
                            <p><?php echo $student['carrer_record']; ?></p>
                        <?php
                            } 
                        ?> 
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Carrer Record -->

        <!-- Past Entry Information -->
        <div id="past_entry"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Past Entry in Japan
                            <small>Information about the student's last entry in Japan (if available)</small>
                        </h2>
                    </div>
                    <div class="body">
                        <?php 
                            if(is_array($student['past_entry'])) {
                        ?> 
                          <div class="row clearfix">
                            <div class="col-lg-10 col-md-10 col-sm-6 col-xs-6">
                                <p><b>Total Found: </b> <span class='col-red'><?php echo count($student['past_entry']); ?></span></p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">    
                               <a href="?controller=students&action=addPastEntry&uname=<?php echo $record['username']; ?>" class="btn btn-success btn-circle-lg waves-effect waves-circle waves-float add_field_button pull-right" data-toggle="tooltip" data-placement="bottom" title="Add More Past Entry Records">
                                    <i class="material-icons">add</i>
                                </a>
                            </div>
                        </div>
                        <div class="body table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Status of Residence</th>
                                        <th>Purpose of Entry</th>
                                        <th>Date of Entry</th>
                                        <th>Date of Exit</th>
                                        <th>Edit Record</th>
                                        <th>Delete Record</th>
                                    </tr>
                                </thead>
                                <tbody>
                        <?php   
                            $count = 1;
                            foreach($student['past_entry'] as $record) { 
                        ?>
                                    <tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td><?php echo $record['residence_status']; ?></td>
                                        <td><?php echo $record['entry_purpose']; ?></td>
                                        <td><?php echo date("F d (l), Y", $record['start_date']); ?></td>
                                        <td><?php echo date("F d (l), Y", $record['end_date']); ?></td>
                                        <td>
        <a href='?controller=students&action=editPastEntry&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Entry Record">
            <i class="material-icons">mode_edit</i>
        </a>
                                        </td>
                                        <td>
        <a href='?controller=students&action=deletePastEntry&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' onclick="return confirm('Delete Entry Record?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Entry Record">
            <i class="material-icons">delete</i>
        </a>
                                        </td>
                                    </tr>
                        <?php   
                                $count++;   
                            }
                        ?>
                                </tbody>
                            </table>
                        </div>
                        <?php    
                            } 
                            else {
                        ?> 
                        <div class="row clearfix">
                            <div class="col-lg-10 col-md-10 col-sm-6 col-xs-6">
                                <div class="demo-switch">
                                    <div class="switch">
                                        <label>No<input type="checkbox" name="past_entry_lever"><span class="lever"></span>Yes</label>
                                    </div>
                                </div>
                                <br><br>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">    
                                <div id="add_more_past_entry_button">
                                </div>
                            </div>
                        </div>   
                        <?php
                            } 
                        ?> 
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Past Entry Information -->

        <!-- Family Information -->
        <div id="family_information"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Family Information
                            <small>Record of Student's family information in Bangladesh</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=addFamilyMember&uname=<?php echo $student['username']; ?>">Add Family Member</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <?php 
                            if(is_array($student['familyInBangladesh'])) {
                        ?>
                        <p><b>Family in Bangladesh:</b></p>
                        <div class="body table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Relationship</th>
                                        <th>Date of Birth</th>
                                        <th>Nationality</th>
                                        <th>Occupation</th>
                                        <th>Present Address</th>
                                        <th>Permanent Address</th>
                                        <th>Edit Member</th>
                                        <th>Delete Member</th>
                                    </tr>
                                </thead>
                                <tbody>
                        <?php   
                            $count = 1;
                            foreach($student['familyInBangladesh'] as $record) { 
                        ?>
                                    <tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td><?php echo $record['name']; ?></td>
                                        <td><?php echo $record['relationship_name']; ?></td>
                                        <td><?php echo date("F d (l), Y", $record['dob']); ?></td>
                                        <td><?php echo $record['nationality']; ?></td>
                                        <td><?php echo $record['occupation']; ?></td>
                                        <td><?php echo $record['present_address']; ?></td>
                                        <td><?php echo $record['permanent_address']; ?></td>
                                        <td>
        <a href='?controller=students&action=editFamilyMember&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Family Member">
            <i class="material-icons">mode_edit</i>
        </a>
                                        </td>
                                        <td>
        <a href='?controller=students&action=deleteFamilyMember&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' onclick="return confirm('Delete Family Member?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Family Member">
            <i class="material-icons">delete</i>
        </a>
                                        </td>
                                    </tr>
                        <?php   
                                $count++;   
                            }
                        ?>
                                </tbody>
                            </table>
                        </div>
                        <?php    
                            } 
                            else {
                        ?>           
                        <p><b>Family in Bangladesh:</b> <?php echo $student['familyInBangladesh']; ?></p>
                        <?php
                            } 
                            if(is_array($student['familyInJapan'])) {
                        ?>
                        <p><b>Family in Japan:</b></p>
                        <div class="body table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Relationship</th>
                                        <th>Date of Birth</th>
                                        <th>Nationality</th>
                                        <th>Occupation</th>
                                        <th>Present Address</th>
                                        <th>Permanent Address</th>
                                        <th>Residing With the Applicant</th>
                                        <th>Place of School Employment</th>
                                        <th>Resident Card Number</th>
                                        <th>Resident Card Status</th>
                                        <th>Edit Member</th>
                                        <th>Delete Member</th>
                                    </tr>
                                </thead>
                                <tbody>
                        <?php   
                            $count = 1;
                            foreach($student['familyInJapan'] as $record) { 
                        ?>
                                    <tr>
                                        <th scope="row"><?php echo $count; ?></th>
                                        <td><?php echo $record['name']; ?></td>
                                        <td><?php echo $record['relationship_name']; ?></td>
                                        <td><?php echo date("F d (l), Y", $record['dob']); ?></td>
                                        <td><?php echo $record['nationality']; ?></td>
                                        <td><?php echo $record['occupation']; ?></td>
                                        <td><?php echo $record['present_address']; ?></td>
                                        <td><?php echo $record['permanent_address']; ?></td>
                                        <td><?php if($record['residence_with_applicant'] == 1){ echo "Yes!"; } else { echo "No"; } ?></td>
                                        <td><?php echo $record['school_employment_place']; ?></td>
                                        <td><?php echo $record['residence_card_status']; ?></td>
                                        <td><?php echo $record['residence_card_number']; ?></td>
                                        <td>
        <a href='?controller=students&action=editFamilyMember&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' class="btn btn-primary waves-effect" data-toggle="tooltip" data-placement="bottom" title="Edit Family Member">
            <i class="material-icons">mode_edit</i>
        </a>
                                        </td>
                                        <td>
        <a href='?controller=students&action=deleteFamilyMember&uname=<?php echo $record['username']; ?>&id=<?php echo $record['id']; ?>' onclick="return confirm('Delete Family Member?')" class="btn btn-danger waves-effect" data-toggle="tooltip" data-placement="bottom" title="Delete Family Member">
            <i class="material-icons">delete</i>
        </a>
                                        </td>
                                    </tr>
                        <?php   
                                $count++;   
                            }
                        ?>
                                </tbody>
                            </table>
                        </div>
                        <?php    
                            } 
                            else {
                        ?>        
                        <p><b>Family in Japan:</b> <?php echo $student['familyInJapan']; ?></p>
                        <?php
                            } 
                        ?> 
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Family Information -->

        <!-- Study Plan -->
        <div id="study_plan"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Study Plan 
                            <small>Plan after studying Japanese in Japan</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=editStudyPlan&uname=<?php echo $student['username']; ?>">Update Study Plan</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <p><b>Name of school wish to enroll:</b> <?php echo $student['school_to_enroll']; ?></p>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <p><b>Subject of study:</b> <?php echo $student['study_subject']; ?></p>
                            </div>
                        </div>
                        <p><b>Other Details:</b> <?php echo $student['study_plan_details']; ?></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Study Plan -->

        <!-- Supporter's Information -->
        <div id="supporter_info"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Supporter's Information 
                            <small>Information about the person who will provide financial, job, stay and other kind of supports for the student in Japan</small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=students&action=editStudentSupporter&uname=<?php echo $student['username']; ?>">Update Supporter's Information</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <p><b>Supporter's Name:</b> <?php echo $student['supporter_name']; ?></p>
                                <p><b>Relationship with the applicant:</b> <?php echo $student['supporter_relationship']; ?></p>
                                <p><b>Supporter's address:</b> <?php echo $student['supporter_address']; ?></p>
                                <p><b>Supprter's contact</b> <?php echo $student['supporter_contact']; ?></p>
                                <p><b>Method of Payment:</b> <?php echo $student['mothod_of_payment']; ?></p>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <p><b>Monthly Income:</b> <?php echo $student['supporter_income']; ?></p>
                                <p><b>Annual Income:</b> <?php echo $student['supporter_annual_income']; ?></p>
                                <p><b>Monthly Living Expenses:</b> <?php echo $student['supporter_expense']; ?></p>
                                <p><b>Annual Living Expenses:</b> <?php echo $student['supporter_annual_expense']; ?></p>
                                <p><b>Annual Save:</b> <?php echo $student['annual_save']; ?></p>
                            </div>
                        </div>
                        <h5>Is the supporter supporting financially other students in Japan?</h5>
                        <p><?php echo $student['support_other_students_yes_no']; ?></p>
                        <div class="row clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                <p><b>Details: </b></p>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                                <p><?php echo $student['support_other_students']; ?></p>
                            </div>
                        </div> 
                        <div class="row clearfix">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <a class="thumbnail" href="<?php echo $student['supporterSignature']; ?>" data-toggle="modal" data-target="#updateSupporterSignature">
                                    <img src="<?php echo $student['supporterSignature']; ?>" alt="<?php echo $student['supporterSignatureAlt']; ?>" class="img-responsive">
                                </a>
                                <h2 class="card-inside-title">Supporter Signature<small>Click on the image to update</small></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Supporter's Information -->

        <!-- Study Purpose -->
        <div id="study_purpose"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Study Purpose
                            <small>The purpose of applying for Japan</small>
                        </h2>
                    </div>
                    <div class="body">
                        <div id="study_purpose_body">
                            <p>
                                <?php echo $student['study_purpose']; ?>
                            </p>
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <buttun id="update_study_purpose" class="btn btn-danger btn-lg waves-effect waves-float pull-right">
                                        <span class="glyphicon glyphicon-edit"></span> Update Study Purpose
                                    </buttun>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Study Purpose -->

        <!-- Additional Information -->
        <div id="additional"></div>
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Additional Information
                            <small>Information other than what available above</small>
                        </h2>
                    </div>
                    <div class="body">
                        <div id="additional_body">
                            <p>
                                <?php echo $student['additional']; ?>
                            </p>
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <buttun id="update_additional" class="btn btn-danger btn-lg waves-effect waves-float pull-right">
                                        <span class="glyphicon glyphicon-edit"></span> Update Additional Information
                                    </buttun>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Additional Information -->

        <!-- Scroll to top button -->
        <div id="scrollToTopButton" style="margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; right: 25px;">
            <button type="button" class="btn bg-cyan btn-circle-lg waves-effect waves-circle waves-float"><i class="material-icons">arrow_drop_up</i></button>
        </div>
        <!-- #END# Scroll to top button --> 

        <!-- Change Student Photograph -->
        <div class="modal fade" id="updatePhotograph" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="defaultModalLabel">Update Student Photograph</h4>
                    </div>
                    <div class="modal-body">
                        <div class="thumbnail">
                        <form name="<?php echo uniqid(); ?>" method="post" action='?controller=students&action=updateStudentImage' enctype="multipart/form-data">
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <img src="<?php echo $student['studentPhotograph']; ?>" class="img-responsive output" alt="Responsive image" width= "100%" height= "100%">
                            <div class="caption">
                                <h3>Follow These Instructions</h3>
                                <p>
                                    <ul>
                                        <li>Student photograph must be your passport size image!</li>
                                        <li>Selected Image must not exceed the size of 2 MB!</li>
                                        <li>Selected Image must be in '.jpg' format!</li>
                                        <li>Click the "Choose Image" button to select an Image.</li>
                                        <li>Once the preview changes, click "Update Photograph" button to update your student photograph!</li>
                                    </ul>
                                </p>
                                <p class="col-green imageAlert"></p>
                                <div class="button-demo">
                                    <label class="btn btn-default waves-effect" data-toggle="tooltip" data-placement="bottom" title="Click here to select an image">
                                        Choose Image <input type="file" name="file" accept="image/jpeg" class="input" onchange="preview()" style="display: none;" required/>
                                    </label>
                                    <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Student Photograph" disabled>
                                    <button type="button" class="btn btn-warning waves-effect clear_preview" disabled>Clear</button>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Change Student Photograph -->

        <!-- Change Student Signature -->
        <div class="modal fade" id="updateSignature" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="defaultModalLabel">Update Student Signature</h4>
                    </div>
                    <div class="modal-body">
                        <div class="thumbnail">
                        <form name="<?php echo uniqid(); ?>" method="post" action='?controller=students&action=updateStudentImage' enctype="multipart/form-data">
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <img src="<?php echo $student['studentSignature']; ?>" class="img-responsive output" alt="Responsive image" width= "100%" height= "100%">
                            <div class="caption">
                                <h3>Follow These Instructions</h3>
                                <p>
                                    <ul>
                                        <li>Selected image must be a clean digital scan of your analog signature!</li>
                                        <li>Selected Image must not exceed the size of 2 MB!</li>
                                        <li>Selected Image must be in '.jpg' format!</li>
                                        <li>Click the "Choose Image" button to select an Image.</li>
                                        <li>Once the preview changes, click "Update Signature" button to update your student signature!</li>
                                    </ul>
                                </p>
                                <p class="col-green imageAlert"></p>
                                <div class="button-demo">
                                    <label class="btn btn-default waves-effect" data-toggle="tooltip" data-placement="bottom" title="Click here to select an image">
                                        Choose Image <input type="file" name="file" accept="image/jpeg" class="input" onchange="preview()" style="display: none;" required/>
                                    </label>
                                    <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Student Signature" disabled>
                                    <button type="button" class="btn btn-warning waves-effect clear_preview" disabled>Clear</button>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Change Student Signature --> 

        <!-- Change Suppporter Signature -->
        <div class="modal fade" id="updateSupporterSignature" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="defaultModalLabel">Update Supporter's Signature</h4>
                    </div>
                    <div class="modal-body">
                        <div class="thumbnail">
                        <form name="<?php echo uniqid(); ?>" method="post" action='?controller=students&action=updateStudentImage' enctype="multipart/form-data">
                            <input type="hidden" name="uname" value="<?php echo $student['username']; ?>">
                            <img src="<?php echo $student['supporterSignature']; ?>" class="img-responsive output" alt="Responsive image" width= "100%" height= "100%">
                            <div class="caption">
                                <h3>Follow These Instructions</h3>
                                <p>
                                    <ul>
                                        <li>Selected image must be a clean digital scan of your supporter's analog signature!</li>
                                        <li>Selected Image must not exceed the size of 2 MB!</li>
                                        <li>Selected Image must be in '.jpg' format!</li>
                                        <li>Click the "Choose Image" button to select an Image.</li>
                                        <li>Once the preview changes, click "Update Supporter Signature" button to update your supporter's signature!</li>
                                    </ul>
                                </p>
                                <p class="col-green imageAlert"></p>
                                <div class="button-demo">
                                    <label class="btn btn-default waves-effect" data-toggle="tooltip" data-placement="bottom" title="Click here to select an image">
                                        Choose Image <input type="file" name="file" accept="image/jpeg" class="input" onchange="preview()" style="display: none;" required/>
                                    </label>
                                    <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Supporter Signature" disabled>
                                    <button type="button" class="btn btn-warning waves-effect clear_preview" disabled>Clear</button>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Change Student Signature -->      


    </div>
</section>  