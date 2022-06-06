 <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                <img src="<?php echo $userImage."?".time(); ?>" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['name']; ?></div>
                    <div class="email">
                    <?php echo $_SESSION['role_name']." (".$_SESSION['designation'].")"; ?>
                    </div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="?controller=users&action=showUser&uname=<?php echo $_SESSION['uname']; ?>">
                                    <i class="material-icons">person</i>View Profile
                                </a>
                            </li>
                            <li role="seperator" class="divider"></li>
                            <li><a href="?controller=auth&action=signout"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->


   
           <!-- Menu -->
        <div class="menu">
            <ul class="list">
                <li class="header">MAIN NAVIGATION</li>
                <li <?php if ($_GET['controller'] == 'auth'){?> class="active" <?php } ?>>
                    <a href="?controller=auth&action=home">
                        <i class="material-icons">home</i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li <?php if ($_GET['controller'] == 'schedule'){ ?> class="active" <?php } ?> >
                    <a href="?controller=schedule&action=viewSchedule">
                        <i class="material-icons">date_range</i>
                        <span>View Class Schedule</span>
                    </a>
                </li>  
                <li <?php if ($_GET['controller'] == 'batches'){ ?> class="active" <?php } ?> >
                    <a href="?controller=batches&action=allBatches">
                        <i class="material-icons">domain</i>
                        <span>List of Batches</span>
                    </a>
                </li>  
                <li <?php if ($_GET['controller'] == 'students'){ ?> class="active" <?php } ?> >
                    <a href="javascript:void(0);" class="menu-toggle">
                        <i class="material-icons">school</i>
                        <span>Manage Students</span>
                    </a>
                    <ul class="ml-menu">
                        <li <?php if ($_GET['controller'] == 'students' && $_GET['action'] == 'pendingStudents' || $_GET['action'] == 'createStudentProfile'){ ?> class="active" <?php } ?> >
                            <a href="?controller=students&action=pendingStudents">
                                Pending Profile Students
                            </a>
                        </li>
                        <li <?php if ($_GET['controller'] == 'students' && $_GET['action'] == 'allStudents'  || $_GET['action'] == 'assignBatch' || $_GET['action'] == 'showStudentProfile' || $_GET['action'] == 'editStudentDetails' || $_GET['action'] == 'editStudentPassport' || $_GET['action'] == 'editStudentSupporter' || $_GET['action'] == 'addEducationRecord' || $_GET['action'] == 'editEducationRecord' || $_GET['action'] == 'editLanguageCertification' || $_GET['action'] == 'addCarrerRecord' || $_GET['action'] == 'editCarrerRecord' || $_GET['action'] == 'addPastEntry' || $_GET['action'] == 'editPastEntry' || $_GET['action'] == 'addFamilyMember' || $_GET['action'] == 'editFamilyMember' || $_GET['action'] == 'editStudyPlan'|| $_GET['action'] == 'updateStudentImage'|| $_GET['action'] == 'showStudentPerformance' || $_GET['action'] == 'showStudentAttachments'){ ?> class="active" <?php } ?> >
                            <a href="?controller=students&action=allStudents">
                                All Students
                            </a>
                        </li>
                        <li <?php if ($_GET['controller'] == 'students' && $_GET['action'] == 'unassignedStudents'){ ?> class="active" <?php } ?> >
                            <a href="?controller=students&action=unassignedStudents">
                                Batch Unassigned Students
                            </a>
                        </li>
                        <li <?php if ($_GET['controller'] == 'students' && $_GET['action'] == 'assignedStudents'  || $_GET['action'] == 'sortByBatch'){ ?> class="active" <?php } ?> >
                            <a href="?controller=students&action=assignedStudents">
                                Students with Assigned Batch
                            </a>
                        </li>
                        <li <?php if ($_GET['controller'] == 'students' && $_GET['action'] == 'advanced'|| $_GET['action'] == 'searchStudent'|| $_GET['action'] == 'searchStudentbyDate'){?> class="active" <?php } ?>>
                            <a href="?controller=students&action=advanced">
                                Advanced Functionalities
                            </a>
                        </li>
                    </ul>
                </li>     
                <li <?php if ($_GET['controller'] == 'users'){?> class="active" <?php } ?>>
                    <a href="javascript:void(0);" class="menu-toggle">
                        <i class="material-icons">people</i>
                        <span>Users</span>
                    </a>
                    <ul class="ml-menu"> 
                        <li <?php if ($_GET['controller'] == 'users' && $_GET['action'] == 'showAllUsers' || $_GET['action'] == 'showUser' || $_GET['action'] == 'editUser' || $_GET['action'] == 'editPass'){?> class="active" <?php } ?>>
                            <a href="?controller=users&action=showAllUsers">
                                Show All Users
                            </a>
                        </li>
<?php foreach($_SESSION['allRoles'] as $role){ ?>                  
                        <li <?php if ($_GET['action'] == 'showSpecificUsers' && $_GET['role'] == $role['id']){ ?> class="active" <?php } ?>>
                            <a href="?controller=users&action=showSpecificUsers&role=<?php echo $role['id']; ?>">Show All <?php  echo $role['role']; ?></a>
                        </li>
<?php } ?>   
                        <li <?php if ($_GET['controller'] == 'users' && $_GET['action'] == 'advanced'|| $_GET['action'] == 'searchUser'|| $_GET['action'] == 'searchUserbyDate'){?> class="active" <?php } ?>>
                            <a href="?controller=users&action=advanced">
                                Advanced Functionalities
                            </a>
                        </li>
                    </ul>
                </li> 
                <li <?php if ($_GET['controller'] == 'notices'){ ?> class="active" <?php } ?> >
                    <a href="?controller=notices&action=allNotices">
                        <i class="material-icons">announcement</i>
                        <span>Notices</span>
                    </a>
                </li>
                <li <?php if ($_GET['controller'] == 'suggestions'){?> class="active" <?php } ?>>
                    <a href="?controller=suggestions&action=allSuggestions">
                        <i class="material-icons">live_help</i>
                        <span>Complaints and Suggestions</span>
                    </a>
                </li>
            </ul>
        </div>         
            <!-- #Menu -->


            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; <?php echo date('Y'); ?> <a href="http://djit.ac/" target="_blank">Student Management System</a>.
                </div>
                <div class="version">
                   <b>Developed by: </b> <a href="http://mhasan.infinityfreeapp.com" target="blank">Mahadi Hasan</a>
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
    </section>
