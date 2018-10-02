<body class="login-page">
    <div class="login-box">
        <div class="logo">
           <a href="http://djit.ac/" target="_blank">Daffodil Japan <b>IT</b></a>
            <small>Administrator Panel</small>
        </div>
        <div class="card">
            <div class="body">
            	<div class="alert alert-danger"> 
        			<?php echo $_SESSION['info']; ?>
			    </div>
             	<div class="msg">Spam Protection</div>
             	<div class="row">
             		<div class="col-xs-7 p-t-5">
			        	<span class="img"><?php echo '<img src="' . $_SESSION['captcha']['image_src'] . '" alt="CAPTCHA code">';?></span>
			        </div>
			        <div class="col-xs-5 p-t-5">
			        	<a href="resubmit.php" class="btn btn-block bg-red waves-effect"><i class="material-icons">cached</i> <span class="icon-name">ReCaptcha</span></a>
			        </div>
		        </div>
				<form method="post" id="sign_in" action="?controller=auth&action=check_captcha">
					  <div class="input-group">
	                        <span class="input-group-addon">
	                            <i class="material-icons">help_outline</i>
	                        </span>
	                        <div class="form-line">
	                            <input type="text" class="form-control" name="check" placeholder="Enter captcha text" required autofocus>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-xs-4">
	                            <button class="btn btn-block bg-pink waves-effect" type="submit" name="submitcaptcha">SUBMIT</button>
	                        </div>
	                    </div>
				</form>
            </div>
        </div>
    </div>