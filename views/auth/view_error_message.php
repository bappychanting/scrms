<!-- Content -->
<section class="content">
    <div class="container-fluid">
    	<div class="five-zero-zero">
    		<div class="five-zero-zero-container">
                <div class="error-code">Uh-oh! <i class="fa fa-frown-o" aria-hidden="true"></i></div>
        		<div class="error-message">
        			<?php 
        				if(empty($errorMessage))
        					$errorMessage = "Something went Worng! Error message is not set.";
        				echo $errorMessage; 
        			?>
        		</div>
    		</div>
    	</div>	
    </div>
</section>  
<!-- Content Ends -->
