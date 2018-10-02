<!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <form name="goto" action="?controller=auth&action=searchBar" method="post">
            <input type="text" id="remote_input" name="title" placeholder="Go To...">
            <input type="submit" />
        </form>
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="?controller=auth&action=home">SMS || Student Management System</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Call Search -->
                    <li><a href="javascript:void(0);" class="js-search" data-close="true"><i class="material-icons">search</i></a></li>
                    <!-- #END# Call Search -->
                     <!-- Notifications -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">notifications</i>
                            <span class="label-count"><?php if(count($newNotifcations) > 0) echo count($newNotifcations); ?></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">NOTIFICATIONS</li>
                            <li class="body">
                                <ul class="menu">
<?php 
    if(empty($newNotifcations)){
?>
                                    <h4 class="col-blue-grey align-center">No New Notification Found!</h4>
<?php
    }
    else{
        foreach($newNotifcations as $notification){ 
?> 
                                    <li>
                                         <a href="?controller=notifications&action=notificationRedirection&id=<?php echo $notification['id']; ?>">
                                            <div class="icon-circle bg-<?php echo $notification['color']; ?>">
                                                <i class="material-icons"><?php echo $notification['icon']; ?></i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><?php echo $notification['notification']; ?></h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> <?php echo date("F d (l), Y", strtotime($notification['create_date'])); ?>
                                                </p>
                                            </div>
                                        </a>
                                    </li>
<?php 
        }
    } 
?>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="?controller=notifications&action=allNotifications">View All Notifications</a>
                            </li>
                        </ul>
                    </li>
                    <!-- #END# Notifications -->
                    <!-- Messages -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">forum</i>
                            <span class="label-count"><?php echo $getNewMessages['total']; ?></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Unread Messages</li>
                            <li class="body">
                                <ul class="menu">   
<?php 
    if(empty($getNewMessages['newmesssages'])){
?>
                                    <h4 class="col-teal align-center">No New Message Found!</h4>
<?php
    }
    else{
        foreach($getNewMessages['newmesssages'] as $message){ 
?>    
                                    <li>
                                        <a href="?controller=messages&action=viewMessages&uname=<?php echo $message['sender_username']; ?>">
                                            <div class="menu-info">
                                                <h4 class="align-left">
                                                    <strong><?php echo $message['sender_family_name'].' '.$message['sender_given_name'] ?>: </strong>
                                                    <span class="col-red"><?php echo $message['total']; ?></span>
                                                </h4>
                                                <p>
                                                    <i class="material-icons">access_time</i>
                                                    <?php echo date("h:i A, F d (l), Y", strtotime($message['send_date'])); ?>
                                                </p>
                                            </div>
                                        </a>
                                    </li>
<?php 
        }
    } 
?>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="?controller=messages&action=allConversations">View All Conversations</a>
                            </li>
                        </ul>
                    </li>
                    <!-- #END# Messages -->
                </ul>
            </div>

        </div>
    </nav>
    <!-- #Top Bar -->
    <!-- Notifications -->
    <div id="notification"></div>
                            
<?php
    if  ( isset($_SESSION['error'])) {
?>
    <div class="alert bg-red alert-dismissible error" role="alert" id="error" style="margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Error!</strong> <?php echo $_SESSION['error'] ?>
    </div>
<?php
        unset ($_SESSION['error']); 
    } 
    if  ( isset($_SESSION['warning'])) {
?>
    <div class="alert alert-warning alert-dismissible warning" role="alert" id="warning" style="margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Warning!</strong> <?php echo $_SESSION['warning'] ?>
    </div>
<?php
        unset ($_SESSION['warning']); 
    }
    if  ( isset($_SESSION['success'])) {
?>
    <div class="alert alert-success success" role="alert" id="success" style="margin: 0px auto; position: fixed; z-index: 1031; bottom: 20px; left: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
        <strong>Success!</strong> <?php echo $_SESSION['success'] ?>
    </div>
<?php
        unset ($_SESSION['success']);  
    }
?>
    <!-- Notifications end -->
 