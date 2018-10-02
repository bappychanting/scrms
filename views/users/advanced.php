<section class="content">
    <div class="container-fluid">

        <div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">people</i> Users</li>
                <li class="active"><i class="material-icons">perm_data_setting</i> Advacned Functionalities</li>
            </ol>
        </div>
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                              Search User
                            </h2>
                        </div>
                        <div class="body">        
                            <form  method="post" action='?controller=users&action=searchUser'>      
                                <div class="input-group col-md-12">
                                    <input type="text" id="searchUser" name="name" autocomplete="off" class="search-query form-control" placeholder="Search for User"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-danger" type="submit" value="submit">
                                            <span class=" glyphicon glyphicon-search"></span>
                                        </button>
                                    </span>
                                </div>
                            </form>
                            <div id="livesearch" class="list-group"></div>                              
                        <div class="row clearfix">
                            <div class="col-sm-12">  
                                <h2 class="card-inside-title">Search User By Date</h2>
                            </div>
                            <form method="post" id="form_advanced_validation" action='?controller=users&action=searchUserbyDate'>
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

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                              Clear User Database
                            </h2>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-4"> 
                                    <button type="button" class="btn btn-block btn-danger btn-lg waves-effect" data-toggle="modal" data-target="#studentmodal">Clear All Students</button>
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" class="btn btn-block btn-danger btn-lg waves-effect" data-toggle="modal" data-target="#teachermodal">Clear All Employees</button> 
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" class="btn btn-block btn-danger btn-lg waves-effect" data-toggle="modal" data-target="#administratortmodal">Clear All Administrators</button>     
                                </div> 
                            </div>
                        </div>    
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                              Import Database
                              <small> The database must be in <code>.csv</code> format. 
                              <a href="all_images/ID.pdf" target="_blank">Click here</a> for instructions.</small>
                            </h2>
                        </div>
                        <div class="body">
                            <form class="well" action="?controller=users&action=import" method="post" enctype="multipart/form-data">
                                <fieldset>
                                    <div class="control-group">
                                        <div class="control-label">
                                            <label>Select Database File:</label>
                                        </div>
                                        <div class="controls form-group">
                                            <input type="file" name="file" id="file" class="input-large form-control" accept=".csv" required>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                        <button type="submit" id="submit" name="Import" class="btn btn-success btn-flat btn-lg pull-right">Import</button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>    
                    </div>
                </div>
            </div>

<!-- Pop up modals -->
            <!-- Clear Student Database -->
            <div class="modal fade" id="studentmodal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Are you sure?</h4>
                        </div>
                        <div class="modal-body">
                            This will remove all the users listed as students. <button id='studentToExcel' class="btn btn-primary" value="4">Click here</button> to create a backup of data before removing them from the database. 
                        </div>
                        <div class="modal-footer">
                            <a href="?controller=users&action=deleteAll&role=4" class="btn btn-link waves-effect">Clear Database</a>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Clear Student Database -->

            <!-- Clear Student Database -->
            <div class="modal fade" id="teachermodal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Are you sure?</h4>
                        </div>
                        <div class="modal-body">
                            This will remove all the users listed as employees.  <button id='teacherToExcel' class="btn btn-primary" value="3">Click here</button> to create a backup of data before removing them from the database. 
                        </div>
                        <div class="modal-footer">
                            <a href="?controller=users&action=deleteAll&role=3" class="btn btn-link waves-effect">Clear Database</a>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Clear Student Database -->

            <!-- Clear Student Database -->
            <div class="modal fade" id="administratortmodal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Are you sure?</h4>
                        </div>
                        <div class="modal-body">
                            This will remove all the users listed as administrators. <button id='administratorToExcel' class="btn btn-primary" value="2">Click here</button> to create a backup of data before removing them from the database. 
                        </div>
                        <div class="modal-footer">
                            <a href="?controller=users&action=deleteAll&role=2" class="btn btn-link waves-effect">Clear Database</a>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Clear Student Database -->
<!-- End pop-up modals -->
    </div>
</section>  