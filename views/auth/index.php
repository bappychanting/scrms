<div class="login-box">
    <div class="logo">
        <a href="javascript:void(0);"><b>SMS</b>- Sign In</a>
        <small>Student Management System, Developed by Mahadi Hasan</small>
    </div>
    <div class="card">
        <div class="body">
            <form id="sign_in" method="POST" action="?controller=auth&action=signin">
                <input type="hidden" id="currentTime" value="<?php if(isset($_SESSION['timer'])) { echo $_SESSION['timer']; unset($_SESSION['timer']); } ?>">
                <?php
                    if (! empty($_SESSION['warning'])){
                ?>
                    <div class="alert alert-warning"> 
                        <?php echo $_SESSION['warning']; ?>
                    </div>
                <?php        
                    }
                    elseif (! empty($_SESSION['error'])){
                ?>
                    <div id="error_reload">
                        <div class="alert alert-danger"> 
                            <?php echo $_SESSION['error']; ?>
                        </div>
                    </div>
                <?php      
                    }
                    else{
                ?>
                    <div class="msg">Sign in to start your session</div>
                <?php   
                    }
                ?>
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">person</i>
                    </span>
                    <div class="form-line">
                        <input type="text" class="form-control" name="uname" placeholder="Username or Email" <?php if(isset($_SESSION['error'])){ ?> disabled <?php } else { ?> required autofocus <?php  } ?>>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">lock</i>
                    </span>
                    <div class="form-line">
                        <input type="password" class="form-control" name="pass" placeholder="Password" <?php if(isset($_SESSION['error'])){ ?> disabled <?php }else{ ?> required <?php  } ?>>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-8 p-t-5">
                        <a href="?controller=auth&action=resetPass">Forgot password?</a> 
                    </div>
                    <div class="col-xs-4">
                        <button class="btn btn-block bg-pink waves-effect" id="submit" type="submit" <?php if(isset($_SESSION['error'])){ ?> disabled <?php } ?>>SIGN IN</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>