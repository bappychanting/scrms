<!-- Content -->
<section class="content">
    <div class="container-fluid">
        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li class="active"><i class="material-icons">notifications</i> All Notifications</li>
            </ol>
        </div>

        <div class="block-header">
            <h2>
                Notifications
                <small>
                    Read notifications are shown in green, unread notifications are shown in orange. 
                    <a href="?controller=notifications&action=readAllNotifications">Click here</a> to <code>mark all notifications as read</code>!
                </small>
            </h2>
        </div>


<!-- Notifications -->
        <div class="row clearfix">
<?php 
    foreach ($result as $notification) {
        if($notification['viewed'] == 1)
            $class = "bg-green";
        else
            $class = "bg-orange";

?>

        <a href="?controller=notifications&action=notificationRedirection&id=<?php echo $notification['id']; ?>">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="body <?php echo $class; ?>">
                        <b><?php echo $notification['notification'] ?></b>&nbsp;-<?php echo date("F d (l), Y", strtotime($notification['create_date'])); ?>
                    </div>
                </div>
            </div>
        </a>

<?php
    }
    echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">'.$pagination.'</div>';
?>
        </div>
<!-- #End# Notifications -->

 </div>
</section>  
<!-- Content Ends -->
            