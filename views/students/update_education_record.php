<section class="content">
    <div class="container-fluid">

        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Manage Students</li>
                <li><a href="?controller=students&action=allStudents"><i class="material-icons">list</i> All Students</a></li>
                <li><a href="?controller=students&action=showStudentProfile&uname=<?php echo $record['username']; ?>#educational_record"><i class="material-icons">account_box</i> Show Student Profile</a></li>
                <li class="active"><i class="material-icons">edit</i> Update Educational Record</li>
            </ol>
        </div>

        <!-- Update Education Record -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Update <?php echo  $record['family_name'].' '.$record['given_name']; ?>'s Educational Record                      
                            <small>Change following inputs to update Educational Record</small>
                        </h2>
                    </div>
                    <div class="body">
                        <form id="form_advanced_validation" method="post" action='?controller=students&action=updateEducationRecord'>
                            <input type="hidden" name="id" value="<?php echo $record['id']; ?>">
                            <input type="hidden" name="uname" value="<?php echo $record['username']; ?>">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="form-control" name="institude" maxlength="255" minlength="5" value="<?php echo $record['institude']; ?>"  autocomplete="off" required>
                                            <label class="form-label">Institude</label>
                                        </div>
                                        <div class="help-info">Min. 5, Max. 255 characters</div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <select class="form-control show-tick" name="degree" data-live-search="true">
                                        <?php foreach($educationRecord['degrees'] as $degree){ ?>
                                            <option value="<?php echo $degree['id']; ?>" <?php if($degree['id'] == $record['degree']){ ?> selected="selected" <?php } ?>><?php  echo $degree['name']; ?></option>  
                                        <?php } ?>      
                                        </select> 
                                        <div class="help-info">Select Last StudyStatus</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line focused">
                                    <input type="text" class="form-control" name="address" maxlength="500" minlength="5" value="<?php echo $record['address']; ?>"  autocomplete="off" required>
                                    <label class="form-label">Address</label>
                                </div>
                                <div class="help-info">Min. 5, Max. 500 characters</div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line focused">
                                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" value="<?php echo date("l d F Y", $record['start_date']); ?>" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group form-float">
                                        <div class="form-line focused">
                                            <input type="text" class="datepicker form-control" name="end_date"  value="<?php echo date("l d F Y", $record['end_date']); ?>" autocomplete="off" required>
                                        </div>
                                    </div>
                                </div>
                            </div>      
                            <input class="btn btn-primary waves-effect" type="submit" name="submit" value="Update Educational Record">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Education Record -->

    </div>
</section>