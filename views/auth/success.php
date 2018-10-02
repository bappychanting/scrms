<div class="four-zero-four">
	<div class="four-zero-four-container">
	    <div class="error-code"> <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Success!</div>
	    <?php 
			if(empty($successMessage)){
		?>
		<div class="error-message">
	    	 Please check your mail! A password reset link will be sent to the given mail address if it is found in our database.
	    	 <br><a href="?controller=auth&action=resetPass">Try again if no mail is sent!</a>
	    </div>
	    <div class="button-place">
            <a href="?controller=auth&action=frontpage" class="btn btn-default btn-lg waves-effect">GO TO HOMEPAGE</a>
        </div>
		<?php
			} else {
		?>
			<div class="error-message">
				<?php echo $successMessage; ?>
			</div>
		<?php } ?>
	</div>
</div>