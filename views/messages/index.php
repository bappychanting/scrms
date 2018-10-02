<!-- Content -->
<section class="content">
    <div class="container-fluid">
        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><a href="?controller=messages&action=allConversations"><i class="material-icons">forum</i> All Conversations</a></li>
                <li class="active"><i class="material-icons">textsms</i> Send Message</li>
            </ol>
        </div>

        <div class="row clearfix">
            <!-- In This Conversation -->
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="info-box-4 hover-zoom-effect">
                    <div class="icon">
                        <a href="?controller=messages&action=deleteConversation&uname=<?php echo $_GET['uname']; ?>"  onclick="return confirm('Are you sure the delete the entire conversation?')" data-toggle="tooltip" data-placement="bottom" title="Delete This Conversation">                            
                            <i class="material-icons col-red">delete</i>
                        </a>    
                    </div>
                    <div class="content">                         
                        <div class="text">Conversation With</div>
                        <div class="number"><?php echo ucfirst($reciever); ?></div>
                    </div>
                </div>
            </div>
            <!-- #END# In this conversation -->
            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
               <?php echo $messages['pagination']; ?>
            </div>
        </div>
<?php   
    if (count($messages['messages']) == 0){
?>

        <div id="warning">
            <div class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <strong>Conversation is Empty!</strong>
            </div>
        </div>

<?php   
    }
    else{
        foreach ($messages['messages'] as $message) {
?>
        <!-- Messages -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <div class="col-lg-1 col-md-1 hidden-sm hidden-xs">
                            <img class="img-thumbnail" src="<?php echo $message['image']; ?>"  width="50" height="50">
                        </div>
                        <h2>
                            <?php echo $message['sender'] ?>
                            <small>
                                <strong>Sent: </strong><?php echo $message['date']; ?>
                            </small>
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="?controller=messages&action=deleteMessage&id=<?php echo $message['id']; ?>">Delete</a></li>
                                    <li><a href="?controller=users&action=showUser&uname=<?php echo $message['sender_username']; ?>">View Sender Profile</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <?php  echo $message['message']; ?>
                    </div>
                </div>
            </div>
        </div>
<?php
        }
    }   
?>
        

        <input type="hidden" id="counter" value="0">
        <div id="newMessage">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p class="text-right"><?php echo $viewed; ?></p>
                </div>
            </div>
        </div>
        <!-- End Messages --> 

        <!-- Editor -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Write New Message
                            <small></small>
                        </h2>
                    </div>
                    <div class="body">
                        <input type="hidden" name="uname" value="<?php echo $_GET['uname']; ?>">
                        <div class="form-group form-float">
                            <textarea id="tinymce" name="message"></textarea>
                            <div class="help-info">Message box can't be empty</div>
                            <label id="error" class="error"></label>
                        </div>
                        <input class="btn btn-primary waves-effect" type="button" name="submit" value="Send">
                    </div>
                </div>
            </div>
        </div>
        <!-- END Editor -->

    </div>
</section>  
<!-- Content Ends -->