<section class="content">
        <div class="container-fluid">
			
            <div class="block-header">
                <ol class="breadcrumb breadcrumb-col-teal">
                    <li class="active"><i class="material-icons">home</i> Dashboard</li>
                </ol>
            </div>

    <!-- Dashbooard -->
        <div class="row clearfix"> 
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2> 
                            Notifications
                            <small>Check the <strong>session data</strong> below</small>
                        </h2>
                    </div>
                    <div class="body">      
                        <p> <?php echo print_r($_SESSION); ?> </p>        
                    </div>
                </div>
            </div>
        </div>  

    </div>
</section>                   