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
                <li <?php if ($_GET['controller'] == 'students'){ ?> class="active" <?php } ?> >
                    <a href="?controller=students&action=showStudentProfile&uname=<?php echo $_SESSION['uname']; ?>">
                        <i class="material-icons">account_box</i>
                        <span>Show Student Profile</span>
                    </a>
                </li>
                <li <?php if ($_GET['controller'] == 'notices'){ ?> class="active" <?php } ?> >
                    <a href="?controller=notices&action=allNotices">
                        <i class="material-icons">announcement</i>
                        <span>View All Notices</span>
                    </a>
                </li> 
                <li <?php if ($_GET['controller'] == 'suggestions'){?> class="active" <?php } ?> >
                    <a href="javascript:void(0);" class="menu-toggle">
                        <i class="material-icons">live_help</i>
                        <span>Complaints and Suggestions</span>
                    </a>
                    <ul class="ml-menu">
                        <li <?php if ($_GET['controller'] == 'suggestions' && $_GET['action'] == 'studentSuggestions' || $_GET['action'] == 'viewSuggestion' || $_GET['action'] == 'editSuggestion' || $_GET['action'] == 'viewComments' || $_GET['action'] == 'editComment'){ ?> class="active" <?php } ?> >
                            <a href="?controller=suggestions&action=studentSuggestions">
                                View Your Suggestions
                            </a>
                        </li>
                        <li <?php if ($_GET['controller'] == 'suggestions' && $_GET['action'] == 'addSuggestion'){ ?> class="active" <?php } ?> >
                            <a href="?controller=suggestions&action=addSuggestion">
                                Add New Suggestion
                            </a>
                        </li>
                    </ul>
                </li> 
                <li <?php if ($_GET['controller'] == 'messages' && $_GET['action'] == 'allStaff'){?> class="active" <?php } ?>>
                    <a href="?controller=messages&action=allStaff">
                        <i class="material-icons">contact_mail</i>
                        <span>Contact DJIT Staff</span>
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
                   <b>Developed by: </b> <a href="http://www.mahadihasanbappy.info" target="blank">Mahadi Hasan</a>
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
    </section>