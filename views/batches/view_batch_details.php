
<section class="content">
    <div class="container-fluid">

		<div class="block-header">
           <ol class="breadcrumb breadcrumb-col-teal">
                <li><a href="?controller=auth&action=home"><i class="material-icons">home</i> Dashboard</a></li>
                <li><i class="material-icons">domain</i> Manage Batches</li>
                <li><a href="?controller=batches&action=allBatches"><i class="material-icons">list</i> List of Batches</a></li>
                <li class="active"><i class="material-icons">details</i> View Batch Details</li>
            </ol>
        </div>			
<?php foreach($result as $batch){ ?>
		<!-- Text Styles -->
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			    <div class="card">
			        <div class="header">
			            <h2>
			                BATCH <?php echo $batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']; ?> 
			                <small>
				            	<strong>Created At: </strong> <?php echo date("F d (l), Y", strtotime($batch['create_date'])); ?>,
				            	<strong>Updated At: </strong>  <?php echo $batch['update_date']; ?>
			            	</small>
			            </h2>
			            <ul class="header-dropdown m-r--5">
			                <li class="dropdown">
			                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			                        <i class="material-icons">more_vert</i>
			                    </a>
			                    <ul class="dropdown-menu pull-right">
			                        <li><a href="?controller=batches&action=editBatch&id=<?php echo $batch['id']; ?>">Update Batch Details</a></li>
									<li><a href="?controller=batches&action=assignTeacherClassroom&id=<?php echo $batch['id']; ?>">Change Teacher and Classroom</a></li>
									<li><a href="?controller=students&action=sortByBatch&batch=<?php echo $batch['id']; ?>">View Students</a></li>
									<li><a href="?controller=batches&action=viewAttendance&id=<?php echo $batch['id']; ?>">View Attendance</a></li>
									<li><a href="?controller=batches&action=addAttendance&id=<?php echo $batch['id']; ?>">Add Attendance</a></li>
									<li><a href="?controller=batches&action=allExams&id=<?php echo $batch['id']; ?>">View All Exams</a></li>
									<li><a href="?controller=batches&action=addExam&id=<?php echo $batch['id']; ?>">Add New Exam</a></li>
									<li><a href="?controller=batches&action=unassignTeacherClassroom&id=<?php echo $batch['id']; ?>">Unassign Teacher and Classroom</a></li>
			                    </ul>
			                </li>
			            </ul>
			        </div>
			        <div class="body">
			        	<p><i class="fa fa-language" aria-hidden="true"></i> 
			        		<span class="font-bold col-teal">Batch Type:</span>
			        		<span class="col-deep-orange"> <?php echo $batch['type']; ?></span>,
			        	</p> 
			        	<p><i class="fa fa-list-ol" aria-hidden="true"></i>
			        		<span class="font-bold col-teal"> Batch Number:</span>
			        		<span class="col-deep-orange"> <?php echo $batch['batch_number']; ?></span>,
			        	</p>
			        	<p><i class="fa fa-id-badge" aria-hidden="true"></i>
			        		<span class="font-bold col-teal"> Assigned Teacher:</span>
			        		<span class="col-deep-orange"> <?php echo $batch['teacher_family_name'].' '.$batch['teacher_given_name']; ?></span>,
			        	</p>
			        	<p><i class="fa fa-map-signs" aria-hidden="true"></i>
			        		<span class="font-bold col-teal"> Assinged Classroom:</span>
			        		<span class="col-deep-orange"> <?php echo $batch['class']; ?></span>,
			        	</p>
			        	<p><i class="fa fa-hourglass" aria-hidden="true"></i>
			        		<span class="font-bold col-teal"> Batch Period:</span>
			        		<span class="col-deep-orange"> <?php echo $batch['period']; ?></span>,
			        	</p>
    					<p><i class="fa fa-clock-o" aria-hidden="true"></i>
    						<span class="font-bold col-teal"> Batch Starting Time:</span>
    						<span class="col-deep-orange"> <?php echo date('h:i A', strtotime($batch['start_time'])); ?></span>, 
    						<span class="font-bold col-teal"> Batch Ending Time: </span><span class="col-deep-orange"><?php echo date('h:i A', strtotime($batch['end_time'])); ?></span>,
    					</p>
    					<p><i class="fa fa-calendar-check-o" aria-hidden="true"></i>
    						<span class="font-bold col-teal"> Batch Days:</span>
    						<span class="col-deep-orange">
							<?php
    							foreach($batch['days'] as $day){
    								echo " ".$day['weekday'].", "; 
    							} 
    						?>
    						</span>
    					</p>
    					<p><i class="fa fa-calendar" aria-hidden="true"></i>
    						<span class="font-bold col-teal"> Batch Starting Time:</span>
    						<span class="col-deep-orange"> <?php echo date("F d (l), Y", $batch['start_date']); ?></span>, 
    						<span class="font-bold col-teal"> Batch Ending Time:</span><span class="col-deep-orange"> <?php echo date("F d (l), Y", $batch['end_date']); ?></span>,
    					</p>  
			    	</div>
			    </div>
			</div>
		</div>

<?php } ?>
		

    </div>
</section> 