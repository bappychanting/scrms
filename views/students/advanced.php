<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">school</i> Students</li>
                <li class="active"><i class="material-icons">perm_data_setting</i> Advacned Functionalities</li>
            </ol>
        </div>
        
        <!-- Search Student -->
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                              Search Student
                            </h2>
                        </div>
                        <div class="body">        
                            <form  method="post" action='?controller=students&action=searchStudent'>      
                                <div class="input-group col-md-12">
                                    <input type="text" id="searchStudent" name="name" autocomplete="off" class="search-query form-control" placeholder="Search for Student"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-danger" type="submit" value="submit">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </span>
                                </div>
                            </form>
                            <div id="livesearch" class="list-group"></div>                              
                        <div class="row clearfix">
                            <div class="col-sm-12">  
                                <h2 class="card-inside-title">Search Student By Date</h2>
                            </div>
                            <form method="post" id="form_advanced_validation" action='?controller=students&action=searchStudentbyDate'>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="start_date" id="start_date" placeholder="Date from..." required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datepicker form-control" name="end_date" placeholder="To..." required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <input class="btn btn-primary btn-block waves-effect" type="submit" name="submit" value="Search By Date &#10230">
                                </div>
                            </form> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #End# Search Student -->

            <!-- Manage Student Database -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                              Manage Database
                              <small> To update any database create an excel file in <code>.csv</code> format. 
                              <a href="all_images/ID.pdf" target="_blank">Click here</a> for instructions.</small>
                            </h2>
                        </div>
                        <div class="body">
                            <h2 class="card-inside-title">
                                Update Student Database
                                <small>Click the "clear" button to clear the student database. Select database file and click on "import" to add new students</small>
                            </h2><hr>
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button type="button" class="btn btn-warning btn-lg waves-effect" data-toggle="modal" data-target="#clearStudentDatabaseModal">Clear Student Database</button>
                                </div>
                                <div class="col-sm-8"> 
                                    <form class="well" action="?controller=students&action=import" method="post" enctype="multipart/form-data">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="control-label">
                                                    <label>Add Students</label>
                                                </div>
                                                <div class="controls form-group">
                                                    <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg">Import</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                            <h2 class="card-inside-title">
                                Update Degree Database
                                <small>Click the "download" button to have a view on the current state of the database. Then Select database file and click on "import" to add new degrees</small>
                            </h2><hr>
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button id="downloadDegree" class="btn btn-primary btn-lg waves-effect"><span class="glyphicon glyphicon-download-alt"></span> Download Database</button>
                                </div>
                                <div class="col-sm-8">
                                    <form class="well" action="?controller=students&action=importStudentDatabases" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="query" value="degrees">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="control-label">
                                                    <label>Add Degrees</label>
                                                </div>
                                                <div class="controls form-group">
                                                    <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg">Import</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form> 
                                </div>
                            </div>
                            <h2 class="card-inside-title">
                                Update Japanese Language Levels Database
                                <small>Click the "download" button to have a view on the current state of the database. Then Select database file and click on "import" to add new Japanese Language Levels</small>
                            </h2><hr>
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button id="downloadLevels" class="btn btn-primary btn-lg waves-effect"><span class="glyphicon glyphicon-download-alt"></span> Download Database</button>
                                </div>
                                <div class="col-sm-8">
                                    <form class="well" action="?controller=students&action=importStudentDatabases" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="query" value="japanese_language_levels">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="control-label">
                                                    <label>Add Japanese Language Levels</label>
                                                </div>
                                                <div class="controls form-group">
                                                    <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg">Import</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form> 
                                </div>
                            </div>
                            <h2 class="card-inside-title">
                                Update Japanese Language Tests Database
                                <small>Click the "download" button to have a view on the current state of the database. Then Select database file and click on "import" to add new Japanese Language Tests</small>
                            </h2><hr>
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button id="downloadTests" class="btn btn-primary btn-lg waves-effect"><span class="glyphicon glyphicon-download-alt"></span> Download Database</button>
                                </div>
                                <div class="col-sm-8">
                                    <form class="well" action="?controller=students&action=importStudentDatabases" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="query" value="japanese_language_tests">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="control-label">
                                                    <label>Add Japanese Language Tests</label>
                                                </div>
                                                <div class="controls form-group">
                                                    <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg">Import</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form> 
                                </div>
                            </div>
                            <h2 class="card-inside-title">
                                Update Relationships Database
                                <small>Click the "download" button to have a view on the current state of the database. Then Select database file and click on "import" to add new Relationships</small>
                            </h2><hr>
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button id="downloadRelationships" class="btn btn-primary btn-lg waves-effect"><span class="glyphicon glyphicon-download-alt"></span> Download Database</button>
                                </div>
                                <div class="col-sm-8">
                                    <form class="well" action="?controller=students&action=importStudentDatabases" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="query" value="relationships">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="control-label">
                                                    <label>Add Relationships</label>
                                                </div>
                                                <div class="controls form-group">
                                                    <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg">Import</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form> 
                                </div>
                            </div>
                            <h2 class="card-inside-title">
                                Update Study Statuses
                                <small>Click the "download" button to have a view on the current state of the database. Then Select database file and click on "import" to add new Study Statuses</small>
                            </h2><hr>
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button id="downloadStudyStatuses" class="btn btn-primary btn-lg waves-effect"><span class="glyphicon glyphicon-download-alt"></span> Download Database</button>
                                </div>
                                <div class="col-sm-8">
                                    <form class="well" action="?controller=students&action=importStudentDatabases" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="query" value="study_statuses">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="control-label">
                                                    <label>Add Study Statuses</label>
                                                </div>
                                                <div class="controls form-group">
                                                    <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <div class="controls">
                                                <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg">Import</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form> 
                                </div>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
            <!-- #End# Manage Student Database -->
            
            <!-- Clear Student Database Pop up modal -->
            <div class="modal fade" id="clearStudentDatabaseModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Are you sure?</h4>
                        </div>
                        <div class="modal-body">
                            This will remove all the students stored in the database. It is highly recommended to delete students manually. If you are still sure to process please <button id='studentProfileDatabaseToExcel' class="btn btn-primary">click here</button> to create a backup of <b>student data</b>. <button id='studentEducationDatabaseToExcel' class="btn btn-primary">Click here</button> to create a backup of <b>student Education record</b>. <button id='studentJapaneseLanguageCertificationDatabaseToExcel' class="btn btn-primary">Click here</button> to create a backup of <b>Japanese Langauge Certification record</b>. <button id='studentCarrerToExcel' class="btn btn-primary">Click here</button> to create a backup of <b>student Carrer record</b>. <button id='studentPastEntryJapanToExcel' class="btn btn-primary">Click here</button> to create a backup of <b>Past Entry in Japan record</b>. <button id='studentFamilyInformatinDatabaseToExcel' class="btn btn-primary">Click here</button> to create a backup of <b>student Family Information record</b>.  <button id='studentExamRecordtoExcel' class="btn btn-primary">Click here</button> to create a backup of <b>student Exam Record</b>
                        </div>
                        <div class="modal-footer">
                            <a href="?controller=students&action=deleteAllStudents" class="btn btn-link waves-effect">Clear Database</a>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End# Clear Student Database Pop up modal -->

        <!-- End pop-up modals -->
    </div>
</section>  