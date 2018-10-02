<?php

namespace App\Student;
use App\Database\Database;

class Attachment extends Student{

    private $filename;

      // Study Purpose setter getter
    function setFileName($filename){
      $this->filename =  $filename;
    }
    function getFileName(){
        return $this->filename;
    }

      // Setting all the student data
    public function setAttachmentData($data = ''){
        if (isset($data['uname'])){
            $this->setUsername($data['uname']);
        }
        if (isset($data['filename'])){
            $this->setFileName(str_replace('/','-',$data['filename']));
        }
        if (isset($data['unlink'])){
            $this->setFileName($data['unlink']);
        }
        return $this;
    }

        // upload Attachments
    public function uploadAttachment(){
      for ($i = 0; $i < count($_FILES['attachment']['name']); $i++) {
        $directory = 'all_student_files/'.$this->setFoldername().'/';
        $validextensions = array("pdf", "doc", "docx");  
        $ext = explode('.', basename($_FILES['attachment']['name'][$i]));
        $file_extension = end($ext); 
        $attachment_name = time()."_".md5(uniqid())."_".$this->getFileName()."- ".$i."." . $ext[count($ext) -1];  
        if (($_FILES["attachment"]["size"][$i] < 2000000) && in_array($file_extension, $validextensions)) {
          if (move_uploaded_file($_FILES['attachment']['tmp_name'][$i], $directory. $attachment_name)) {
            $message[] = array('message'=> "<p class='col-green'><i class='fa fa-check-circle'></i> ".$_FILES['attachment']['name'][$i]." has been uploaded successfully!</p>");
          } 
          else {
            $message[] = array('message'=> "<p class='col-red'><i class='fa fa-info-circle'></i> There was something wrong while uploading ".$_FILES['attachment']['name'][$i]."</p>");
          }
        } 
        else {
          $message[] = array('message'=> "<p class='col-warning'><i class='fa fa-question-circle'></i> Invalid file Size or Type Detected for attachment #".$_FILES['attachment']['name'][$i].". Try uploading only Word and PDF files under 500KB</p>");
        }
      }
      return $message;
    } 

        // upload Attachments
    public function deleteAttachment(){
      if (file_exists($this->getFileName())){
        if (unlink($this->getFileName())) {    
          $directory = 'all_student_files/'.$this->setFoldername().'/';
          $getName = str_replace($directory, "", $this->getFileName());
          $attchmentName = pathinfo(substr($getName, 44), PATHINFO_FILENAME);
          return $attchmentName;
        }
      }
    } 

}


?>