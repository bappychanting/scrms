<?php

namespace App\Misc;

final class Misc {

		// Function for setting session data */
    public static function setSubmittedData(){
      $_SESSION['data'] = $_POST;
    }

    	// Function for getting data
    public static function getSubmittedData($allData){	
      	if(isset($_SESSION['data'])){
      		$allData['class'] = "form-line focused";
      		foreach($_SESSION['data'] as $key => $value){
      			if(array_key_exists($key, $allData)){
      				$allData[$key] = $value;
      			}
      		}
      		unset($_SESSION['data']);
      	}
      	return $allData;
    }

    	// Function for checking resultselt
    public static function showResult($result, $page, $errorMessage = "Empty Result: Nothing found in the database!", $pagination=''){	
      	if($result){
      		foreach($result as $key => $value){
				if(!empty($result[$key]['update_date'])){
			  		$result[$key]['update_date'] = date("F d (l), Y", strtotime($value['update_date']));
			  	}
			  	else{
			  		$result[$key]['update_date'] = "<span class='label bg-orange'>Not updated yet!</span>";
			  	}
			  	if(!empty($result[$key]['image'])){
			  		$result[$key]['image'] = self::checkImage('all_images/user_images/', $result[$key]['image']);
			  	}
			}
          	require_once($page);  
      	}
      	else{
      		require_once('views/auth/view_error_message.php');
      	}
    }

    	// Function for getting current page URL
    public static function getURL($exclude=''){
    		// $parts = explode('/', $_SERVER['REQUEST_URI']);
			// $url = $parts[count($parts) - 1];
		if (strpos($_SERVER['REQUEST_URI'], $exclude) !== false) {
			$url = substr($_SERVER['REQUEST_URI'], 0, strpos($_SERVER['REQUEST_URI'], $exclude));
		}
		else{
			$url = $_SERVER['REQUEST_URI'];
		}
		return $url;
    } 

    	// Fucntion for setting page name
    public static function setPageName(){
    		// str_replace($search, $replace, $subject); str_replace("11223344", "", "REGISTER 11223344 here");
    	$parts = explode('/', $_SERVER['REQUEST_URI']);
		$getName = $parts[count($parts) - 1]; 
		$currect_name = str_replace(".php", "", $getName);
		$name = ucFirst($currect_name);
		return $name;
    }

    	// Function for cutting a string
    public static function substrwords($text, $maxchar, $end='...') {
    	if (strlen($text) > $maxchar || $text == '') {
        	$words = preg_split('/\s/', $text);      
        	$output = '';
        	$i      = 0;
        	while (1) {
            	$length = strlen($output)+strlen($words[$i]);
            	if ($length > $maxchar) {
                	break;
            	} 
            	else {
                	$output .= " " . $words[$i];
                	++$i;
            	}
        	}
        	$output .= $end;
    	} 
    	else {
        	$output = $text;
    	}
    	return $output;
	}

		//	Function for generating HTML colors
	public static function generateColor(){
		return '#' . str_pad(dechex(mt_rand(0, 0xFFFFFF)), 6, '0', STR_PAD_LEFT);
	} 
	
		// Function for generating year array
	public static function generateYearArray($previousYears = 1){
		$dates = array();
          for ($year=date("Y")-$previousYears; $year<=date("Y"); $year++) {
              $yearOfDates = array();
              for ($month=1; $month<=12; $month++) {
                  $begin = strtotime($year."-".$month."-01 12:00:00AM");
                  $end = strtotime($year."-".($month+1)."-01 12:00:00AM")-1;
                  $key = date("F, Y", $begin); // January, 2017
                  $yearOfDates[$key] = array(
                      'start' => $begin,
                      'end' => $end
                  );
              }
              if ($year==date("Y")) $dates['previousYear'] = $yearOfDates;
              else $dates['currentYear'] = $yearOfDates; //assume 2018
          }
    	return $dates;
	}

		// Function for handling error
	public static function handle_error(){
	    trigger_error("Cannot divide by zero", E_USER_ERROR);
	    require_once('views/auth/view_error_message.php');
	}

    	// Function for declaring pagination
    public static function paginate_declare($perpage=1) {
	    if(isset($_GET["page"])){
	        $page = intval($_GET["page"]);
	    }
	    else {
	      $page = 1;
	    }
	    $calc = $perpage * $page;
	    $start = $calc - $perpage;
	    return array("perpage"=>$perpage, "page"=>$page, "start"=>$start);
    }

    	// Funcntion for pagination
    public static function paginate($total=1, $perpage=1, $page=1) {
		$url = self::getURL('&page');
		$totalPages = ceil($total / $perpage);
		$navigation = array('nav'=>'', 'skip_previous'=>'', 'previous'=>'', 'link'=>'', 'next'=>'', 'skip_next'=>'','endnav'=>'');
		$navigation['nav'] = "<nav><ul class='pagination'>";
		if($page > 1 ){
			$navigation['skip_previous'] = "<li>
                <a href='$url&page=1' class='waves-effect'>
                    <i class='material-icons'>skip_previous</i>
                </a>
            </li>";
		}
	
		if($page <=1 ){
			$navigation['previous'] = " <li class='disabled'>
                    <a href='javascript:void(0);'>
                        Previous
                    </a>
                </li>";
		}
		else{
		$j = $page - 1;
			$navigation['previous'] = " <li>
                <a href='$url&page=$j' class='waves-effect'>
                    Previous
                </a>
            </li>";
		}
	
		if ($totalPages >=1 && $page <= $totalPages){
			$range = 2;
			$limit = $range+1;
			$navigation['link'] = "";
			if ($page > $limit){ 
				$navigation['link'] = "<li><a href='$url&page=1' class='waves-effect'>1</a></li>
				<li class='disabled'><a href = 'javascript:void(0);'>...</a></li>";
			}
        	for($i= ($page-$range); $i <(($page + $range)  + 1); $i++){
				if (($i > 0) && ($i <= $totalPages)){
					if($i<>$page){
						$navigation['link'] .= "<li> <a href='$url&page=$i' class='waves-effect'>$i</a></li>";
					}
					else{
						$navigation['link'] .= "<li class='active'><a href='javascript:void(0);'>$i</a></li>";
					}				
				}
        	}
        	if ($page <= $totalPages - $limit){ 
			$navigation['link'] .= "<li class='disabled'><a href = 'javascript:void(0);'>...</a></li>
					<li> <a href='$url&page=" .$totalPages." ' class='waves-effect'>$totalPages</a></li>"; 
			}
		}	
		if($page == $totalPages ){
			$navigation['next'] = "<li class='disabled'>
				 <a href='javascript:void(0);'>
                    Next
                </a>
             </li>";
		}
		else{
			$j = $page + 1;
			$navigation['next'] = "<li>
				 <a href='$url&page=$j' class='waves-effect'>
                    Next
                </a>
             </li>";
		}
		if($page < $totalPages ){	
			$navigation['skip_next'] = "<li>
            	<a href='$url&page=" .$totalPages." ' class='waves-effect'>
                	<i class='material-icons'>skip_next</i>
            	</a>
        	</li>";	
		}
		$navigation['endnav'] = "</ul></nav>";
		return $pagination = $navigation['nav'].$navigation['skip_previous'].$navigation['previous'].$navigation['link'].$navigation['next'].$navigation['skip_next'].$navigation['endnav'];
	}

    	// Function for Image upload
    public static function imageUpload($directory, $filename){
     	$target_file = $directory . $filename;
		$uploadOk = 1;
		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		$check = getimagesize($_FILES["image"]["tmp_name"]);
		if($check !== false){
			$uploadOk = 1;
		} 
		else{
			$warning = "No image selected or file is not an image.";
			$uploadOk = 0;
		}
		if (file_exists($target_file)) {	
				$uploadOk = 1;
		}
		if ($_FILES["image"]["size"] > 1500000) {
			$warning = "Your image is too large. Keep the maximum file size at 1.5 MB.";
			$uploadOk = 0;
		}
		if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
			$warning = "Only JPG, JPEG, PNG & GIF files are allowed.";
			$uploadOk = 0;
		}		 
		
		if ($uploadOk == 0) {
			$_SESSION['warning'] = "Sorry, the image is not uploaded. " .$warning;
		} 
		else{
			if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
					$_SESSION['success'] = "Image has been updated.";
			} 
			else {
				$_SESSION['error'] = "Image can't be uploaded.";
			}
		}
    }

    	// Function for checking if Image exists
    public static function checkImage($directory, $image){
     	if($image !== '' && $image !== NULL && file_exists($directory.$image))
    	$fileName = $directory.$image."?".time();
		else
		$fileName = $directory."default.png";	

     	return $fileName;
    }

    public static function resizeImage($file, $string = null, $width = 0, $height = 0, $proportional = false, $output = 'file', $delete_original = true, $use_linux_commands = false, $quality = 10){
	    if ( $height <= 0 && $width <= 0 ) return false;
	    if ( $file === null && $string === null ) return false;
	 
	    	// Setting defaults and meta
	    $info = $file !== null ? getimagesize($file) : getimagesizefromstring($string);
	    $image = '';
	    $final_width = 0;
	    $final_height = 0;
	    list($width_old, $height_old) = $info;
		$cropHeight = $cropWidth = 0;
	 
	    	//  Calculating proportionality
	    if ($proportional) {
	      if      ($width  == 0)  $factor = $height/$height_old;
	      elseif  ($height == 0)  $factor = $width/$width_old;
	      else                    $factor = min( $width / $width_old, $height / $height_old );
	 
	      $final_width  = round( $width_old * $factor );
	      $final_height = round( $height_old * $factor );
	    }
	    else {
	      $final_width = ( $width <= 0 ) ? $width_old : $width;
	      $final_height = ( $height <= 0 ) ? $height_old : $height;
		  $widthX = $width_old / $width;
		  $heightX = $height_old / $height;
		  
		  $x = min($widthX, $heightX);
		  $cropWidth = ($width_old - $width * $x) / 2;
		  $cropHeight = ($height_old - $height * $x) / 2;
	    }
	 
	    	// Loading image to memory according to type
	    switch ( $info[2] ) {
	      case IMAGETYPE_JPEG:  $file !== null ? $image = imagecreatefromjpeg($file) : $image = imagecreatefromstring($string);  break;
	      case IMAGETYPE_GIF:   $file !== null ? $image = imagecreatefromgif($file)  : $image = imagecreatefromstring($string);  break;
	      case IMAGETYPE_PNG:   $file !== null ? $image = imagecreatefrompng($file)  : $image = imagecreatefromstring($string);  break;
	      default: return false;
	    }
	    
	    
	    	// This is the resizing/resampling/transparency-preserving magic
	    $image_resized = imagecreatetruecolor( $final_width, $final_height );
	    if ( ($info[2] == IMAGETYPE_GIF) || ($info[2] == IMAGETYPE_PNG) ) {
	      $transparency = imagecolortransparent($image);
	      $palletsize = imagecolorstotal($image);
	 
	      if ($transparency >= 0 && $transparency < $palletsize) {
	        $transparent_color  = imagecolorsforindex($image, $transparency);
	        $transparency       = imagecolorallocate($image_resized, $transparent_color['red'], $transparent_color['green'], $transparent_color['blue']);
	        imagefill($image_resized, 0, 0, $transparency);
	        imagecolortransparent($image_resized, $transparency);
	      }
	      elseif ($info[2] == IMAGETYPE_PNG) {
	        imagealphablending($image_resized, false);
	        $color = imagecolorallocatealpha($image_resized, 0, 0, 0, 127);
	        imagefill($image_resized, 0, 0, $color);
	        imagesavealpha($image_resized, true);
	      }
	    }
	    imagecopyresampled($image_resized, $image, 0, 0, $cropWidth, $cropHeight, $final_width, $final_height, $width_old - 2 * $cropWidth, $height_old - 2 * $cropHeight);
		
		
	    	// Taking care of original, if needed
	    if ( $delete_original ) {
	      if ( $use_linux_commands ) exec('rm '.$file);
	      else @unlink($file);
	    }
	 
	    	// Preparing a method of providing result
	    switch ( strtolower($output) ) {
	      case 'browser':
	        $mime = image_type_to_mime_type($info[2]);
	        header("Content-type: $mime");
	        $output = NULL;
	      break;
	      case 'file':
	        $output = $file;
	      break;
	      case 'return':
	        return $image_resized;
	      break;
	      default:
	      break;
	    }
	    
	    	// Writing image according to type to the output destination and image quality
	    switch ( $info[2] ) {
	      case IMAGETYPE_GIF:   imagegif($image_resized, $output);    break;
	      case IMAGETYPE_JPEG:  imagejpeg($image_resized, $output, $quality);   break;
	      case IMAGETYPE_PNG:
	        $quality = 9 - (int)((0.9*$quality)/10.0);
	        imagepng($image_resized, $output, $quality);
	        break;
	      default: return false;
	    }

		return true;
	}

   
}

?>