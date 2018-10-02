<!-- Content -->
<section class="content">
    <div class="container-fluid">
        <div class="block-header">
             <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li class="active"><i class="material-icons">forum</i> All Conversations</li>
            </ol>
        </div>

        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                          Search Conversation
                        </h2>
                    </div>
                    <div class="body">        
                        <form  method="post" action='?controller=messages&action=searchConversation'>      
                            <div class="input-group col-md-12">
                                <input type="text" id="searchConversation" name="names" autocomplete="off" class="search-query form-control" placeholder="Type user name" required/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="submit" value="submit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </form>
                        <div id="liveConversationSearch" class="list-group"></div>   
                    </div>
                </div>
            </div>
        </div>

        <div class="block-header">
            <h2 class="col-cyan">
                List of Conversations
            </h2>
            <h3>                    
                <input type="checkbox" id="md_checkbox_1" class="chk-col-teal"/>
                                <label for="md_checkbox_1">Sort by Unread Messages</label>
            </h3>
        </div>

        <!-- Messages -->
        <div class="row clearfix">
            <div id="conversations">

<?php 
    $count = 0;
    foreach($result as $conversation){
?>
            <a href="?controller=messages&action=viewMessages&uname=<?php echo $conversation['username']; ?>" target="_blank">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="header <?php echo $conversation['class']; ?>">
                            <h2>
                                <?php echo $conversation['name']; ?> 
                                <small>
                                    <strong>Recieved Date:</strong> <?php echo $conversation['send_date']; ?>
                                </small>
                            </h2>
                        </div>
                        <div class="body">
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="<?php echo $conversation['image']; ?>" width="40" height="40">
                                </div>
                                <div class="media-body">
                                    <div style='height:25px;'> 
                                        <p class="media-heading"><?php echo $conversation['message']; ?></p> 
                                    </div>
                                    <div style='height:15px;'>                                    
                                        <?php echo $conversation['view_date']; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>    
<?php
        $count++;
    }
?>
            </div>
        </div>
        <!-- End Messages -->

        <!-- Message Feedbacks -->
        <div class="row clearfix">
            <input type="hidden" id="start" value="<?php echo $count; ?>">
            <input type="hidden" id="condition" value="allConversations">
            <div id="moreMessage"></div>
            <div id="moreMessageFeedback"></div>
        </div>    
        <!-- End Message Feedbacks --> 


    </div>
</section>  
<!-- Content Ends -->