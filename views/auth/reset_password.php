<div class="signup-box">
    <div class="logo">
        <a href="javascript:void(0);"><b>SMS</b>- Reset Pass</a>
            <small>Student Management System, Developed by Mahadi Hasan</small>
    </div>
	<div class="card">
        <div class="body">
	        <form id="sign_up" method="POST" action="?controller=auth&action=updateForgottenPass">
                <div class="msg">
                	Enter Your New Password, <b><?php echo $reset['family_name'].' '.$reset['given_name']; ?></b>.                    	
                	<br>(This link will expire within <?php echo $remaining_time; ?> hours)
                </div>
                <input type="hidden" name="id" value="<?php echo $reset['id']; ?>">
                <input type="hidden" name="uname" value="<?php echo $reset['username']; ?>">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">lock</i>
                    </span>
                    <div class="form-line">
                        <input type="password" class="form-control" name="pass" minlength="8" placeholder="New Password" required>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">lock</i>
                    </span>
                    <div class="form-line">
                        <input type="password" class="form-control" name="confirm" minlength="8" placeholder="Confirm New Password" required>
                    </div>
                </div>

                <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">SAVE NEW PASSWORD</button>

                <div class="m-t-25 m-b--5 align-center">
                    <a href="?controller=auth&action=frontpage">Sign In!</a>
                </div>
            </form>
        </div>
    </div>
</div>