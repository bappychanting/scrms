<?php

namespace App\Student;
use App\Database\Database;

class PDF extends Student{

      /* generate PDF file title */
    public function generatePDFTitle(){
      $filename = $this->setFoldername();
      $title = $filename.'_Student Management Form';
      return $title;
    }

    public function generatePDFHeader(){
      $getStudent = $this->getUser();
      foreach ($getStudent as $student) {
        $header = "<p style='text-align: center; color: gray;'> Student Management Form- ".$student['family_name']." ".$student['given_name']."</p>";
      }
      return $header;
    }

    public function generatePDFFooter(){
      $footer = "<p style='text-align: right; color: gray;'>".date('Y').", Daffodil Japan IT</p>";
      return $footer;
    }

            // Function for generating Student PDF
    public function generateStudentPDF() {
      $title = $this->generatePDFTitle();
      $profile = $this->getStudentProfile();
      if($profile){
        foreach($profile as $student){
          $studentPhotograph = $student['studentPhotograph'];
          $studentSignature = $student['studentSignature'];
          $supporterSignature = $student['supporterSignature'];
          $studentGivenName = $student['given_name'];
          $studentFamilyName = $student['family_name'];
          $studentNationality = $student['nationality'];
          $studentDob = $student['dob'];
          $studentAge = $student['age'];
          $studentSex = $student['sex'];
          $studentMail = $student['email'];
          $studentPresentAddress = $student['presentAddress'];
          $studentPermanentAddress = $student['permanentAddress'];
          $studentPersonalContact = $student['contact1'];
          $studentGuardianContact = $student['contact2'];
          $studentHomeContact = $student['contact3'];
          $studentPassportNumber = $student['passport_no'];
          $studentPassportIssueDate = $student['passport_issue'];
          $studentPassportExpiration = $student['passport_expiration'];

            // Educational Record
          if(is_array($student['educational_record'])) {
            $countEducation = 1;
            $studentEducationRecord.= "<p><b>Last/present school Name:</b> ".$student['final_institude']."</p>";
            $studentEducationRecord.= "<p><b>Last/present school status:</b> ".$student['study_status']."</p>";
            $studentEducationRecord.= "<table><thead>
                                          <tr>
                                            <th>#</th>
                                            <th>Name of School</th>
                                            <th>Address</th>
                                            <th>Degree</th>
                                            <th>Starting Year</th>
                                            <th>Ending Year</th>
                                          </tr>
                                        </thead><tbody>";
            foreach($student['educational_record'] as $record) { 
              $studentEducationRecord.= "<tr>
                                            <td>".$countEducation."</td>
                                            <td>".$record['institude']."</td>
                                            <td>".$record['address']."</td>
                                            <td>".$record['degree_name']."</td>
                                            <td>".date("F d (l), Y", $record['start_date'])."</td>
                                            <td>".date("F d (l), Y", $record['end_date'])."</td>
                                          </tr>";
              $countEducation++;   
            }
            $studentEducationRecord.= "</tbody></table>";
          }            
          else{
            $studentEducationRecord = $student['educational_record'];
          }

            // Language Certificate
          $studentLanguageCertificate.= "<table><thead>
                                        <tr>
                                          <th>Test Name</th>
                                          <th>Starting Year</th>
                                          <th>Ending Year</th>
                                        </tr>
                                      </thead><tbody>";
          foreach($student['certificate_record'] as $record) { 
            if(empty($record['start_date'])){ $record['start_date'] = "Not updated yet"; } else { $record['start_date'] = date("F d (l), Y", $record['start_date']); }
            if(empty($record['end_date'])){ $record['end_date'] = "Not updated yet"; } else { $record['end_date'] = date("F d (l), Y", $record['end_date']); }
            $studentLanguageCertificate.= "<tr>
                                          <td>".$record['name']." Test</td>
                                          <td>".$record['start_date']."</td>
                                          <td>".$record['end_date']."</td>
                                        </tr>";  
          }
          $studentLanguageCertificate.= "</tbody></table>";

            // Carrer Record
          if(is_array($student['carrer_record'])) {
            $countCarrer = 1;
            $studentCarrerRecord.= "<table><thead>
                                          <tr>
                                            <th>#</th>
                                            <th>Organization</th>
                                            <th>Address</th>
                                            <th>Occupation</th>
                                            <th>Starting Year</th>
                                            <th>Ending Year</th>
                                          </tr>
                                        </thead><tbody>";
            foreach($student['carrer_record'] as $record) { 
              $studentCarrerRecord.= "<tr>
                                            <td>".$countCarrer."</td>
                                            <td>".$record['organization']."</td>
                                            <td>".$record['address']."</td>
                                            <td>".$record['occupation']."</td>
                                            <td>".date("F d (l), Y", $record['start_date'])."</td>
                                            <td>".date("F d (l), Y", $record['end_date'])."</td>
                                          </tr>";
              $countCarrer++;   
            }
            $studentCarrerRecord.= "</tbody></table>";
          }            
          else{
            $studentCarrerRecord = $student['carrer_record'];
          }

            // Past Entry
          if(is_array($student['past_entry'])) {
            $countPastEntry = 1;
            $studentPastEntry.= "<table><thead>
                                          <tr>
                                            <th>#</th>
                                            <th>Status of Residence</th>
                                            <th>Purpose of Entry</th>
                                            <th>Date of Entry</th>
                                            <th>Date of Exit</th>
                                          </tr>
                                        </thead><tbody>";
            foreach($student['past_entry'] as $record) { 
              $studentPastEntry.= "<tr>
                                            <td>".$countPastEntry."</td>
                                            <td>".$record['residence_status']."</td>
                                            <td>".$record['entry_purpose']."</td>
                                            <td>".date("F d (l), Y", $record['start_date'])."</td>
                                            <td>".date("F d (l), Y", $record['end_date'])."</td>
                                          </tr>";
              $countPastEntry++;   
            }
            $studentPastEntry.= "</tbody></table>";
          }            
          else{
            $studentPastEntry = $student['past_entry'];
          }


            // Family in Bangladesh
          if(is_array($student['familyInBangladesh'])) {
            $countFamilyBangladesh = 1;
            $studentFamilyBangladesh.= "<table><thead>
                                          <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Relationship</th>
                                            <th>Date of Birth</th>
                                            <th>Nationality</th>
                                            <th>Occupation</th>
                                            <th>Present Address</th>
                                            <th>Permanent Address</th>
                                          </tr>
                                        </thead><tbody>";
            foreach($student['familyInBangladesh'] as $record) { 
              $studentFamilyBangladesh.= "<tr>
                                            <td>".$countFamilyBangladesh."</td>
                                            <td>".$record['name']."</td>
                                            <td>".$record['relationship_name']."</td>
                                            <td>".date("F d (l), Y", $record['dob'])."</td>
                                            <td>".$record['nationality']."</td>
                                            <td>".$record['occupation']."</td>
                                            <td>".$record['present_address']."</td>
                                            <td>".$record['permanent_address']."</td>
                                          </tr>";
              $countFamilyBangladesh++;   
            }
            $studentFamilyBangladesh.= "</tbody></table>";
          }            
          else{
            $studentFamilyBangladesh = $student['familyInBangladesh'];
          }

            // Family in Japan
          if(is_array($student['familyInJapan'])) {
            $countFamilyJapan = 1;
            $studentFamilyJapan.= "<table><thead>
                                          <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Relationship</th>
                                            <th>Date of Birth</th>
                                            <th>Nationality</th>
                                            <th>Occupation</th>
                                            <th>Residing With the Applicant</th>
                                            <th>Place of School Employment</th>
                                            <th>Resident Card Number</th>
                                            <th>Resident Card Status</th>
                                          </tr>
                                        </thead><tbody>";
            foreach($student['familyInJapan'] as $record) {
              if($record['residence_with_applicant'] == 1){ $record['residence_with_applicant'] = "Yes!"; } else { $record['residence_with_applicant'] = "No"; } 
              $studentFamilyJapan.= "<tr>
                                      <td>".$countFamilyJapan."</td>
                                      <td>".$record['name']."</td>
                                      <td>".$record['relationship_name']."</td>
                                      <td>".date("F d (l), Y", $record['dob'])."</td>
                                      <td>".$record['nationality']."</td>
                                      <td>".$record['occupation']."</td>
                                      <td>".$record['residence_with_applicant']."</td>
                                      <td>".$record['school_employment_place']."</td>
                                      <td>".$record['residence_card_status']."</td>
                                      <td>".$record['residence_card_number']."</td>
                                    </tr>";
              $countFamilyJapan++;   
            }
            $studentFamilyJapan.= "</tbody></table>";
          }            
          else{
            $studentFamilyJapan = $student['familyInJapan'];
          }

            // Study Plan 
          $studentSchoolToEnroll = $student['school_to_enroll'];
          $studentStudySubject = $student['study_subject'];
          $studentStudyPlanDetails = $student['study_plan_details'];

            // Supporter Information 
          $studentSupporterName = $student['supporter_name']; 
          $studentSupporterRelationship = $student['supporter_relationship'];  
          $studentSupporterAddress = $student['supporter_address'];  
          $studentSupporterContact = $student['supporter_contact'];
          $studentMethodofPayment = $student['mothod_of_payment'];
          $studentSupporterIncome = $student['supporter_income'];
          $studentSupporterAnnualIncome = $student['supporter_annual_income']; 
          $studentSupporterExpense = $student['supporter_expense'];
          $studentSupporterAnnualExpense = $student['supporter_annual_expense'];
          $studentAnnualSave = $student['annual_save'];
          $studentSupportOtherStudent = $student['support_other_students_yes_no'];
          $studentSupportOtherStudentsDetails = $student['support_other_students'];

          // Study Purpose
          $studentStudyPurpose = $student['study_purpose'];

          // Additional 
          $studentAdditional = $student['additional'];

        }
      }

            $html = 
<<<EOD
                <html>
                    <head>
                        <title>$title</title>
                        <style>
                            .centerTitle {
                                padding: 10px;
                                margin: auto;
                                text-align: center;
                            }
                            .center {
                                text-align: center;
                            }
                            .infoLeft {
                                width: 50%;
                                float: left;
                            }
                            .infoRight {
                                margin-left: 15%;
                                width: 50%;
                                float: right;
                            }
                            .clear {
                              clear:both;
                            } 
                            table {
                              border-collapse: collapse;
                              width: 100%;
                            }
                            td, th {
                                border: 1px solid #ddd;
                                padding: 8px;
                            }
                            tr:nth-child(even){background-color: #f2f2f2;}
                            th {
                                padding-top: 12px;
                                padding-bottom: 12px;
                                text-align: left;
                                background-color: gray;
                                color: white;
                            }
                            .photograph {
                                height: 141;
                                width: 199;
                                margin: 5px 0;
                                float: right;
                            }
                        </style>
                    </head>
                    <body>
                        <h2 class="centerTitle">STUDENT MANAGEMENT FORM</h2><hr>
                        <div class="infoLeft">
                          <p><b>Family Name:</b> $studentGivenName</p>
                          <p><b>Given Name:</b> $studentFamilyName</p>
                          <p><b>Date of Birth:</b> $studentDob</p>
                          <p><b>Age:</b> $studentAge</p>
                          <p><b>Nationality:</b> $studentNationality</p>
                          <p><b>Sex:</b> $studentSex</p>
                          <p><b>Email:</b> $studentMail</p>
                          <p><b>Personal Contact:</b> $studentPersonalContact</p>
                          <p><b>Guardian Contact:</b> $studentGuardianContact</p>
                          <p><b>Home Contact:</b> $studentHomeContact</p>
                        </div>
                        <div class="infoRight">
                          <img src="$studentPhotograph">
                          <p class="center">Applicant Photograph</p>
                        </div>
                        <div class="clear"></div>
                        <p><b>Place of Birth:</b> $studentPresentAddress</p>
                        <p><b>Present Address:</b> $studentPermanentAddress</p>
                        <p><b>Passport Number:</b> $studentPassportNumber</p>
                        <p><b>Passport Issue Date:</b> $studentPassportIssueDate</p>
                        <p><b>Passport Expiration Date:</b> $studentPassportExpiration</p>
                        <div class="infoLeft">
                          <p><b>Digital Signature of Applicant:</b></p>
                        </div>
                        <div class="infoRight">
                          <img src="$studentSignature">
                        </div>
                        <div class="clear"></div>

                        <pagebreak />

                        <h3 class="centerTitle">Educational Record</h3>
                          $studentEducationRecord

                        <pagebreak />

                        <h3 class="centerTitle">Japanese Langauge Certification</h3>
                          $studentLanguageCertificate
                        <h3 class="centerTitle">Carrer Record</h3>
                          $studentCarrerRecord 
                        <h3 class="centerTitle">Past Entry</h3>
                          $studentPastEntry

                        <pagebreak />

                        <h3 class="centerTitle">Family Information</h3>
                        <p><b>Family in Bangladesh:</b></p>
                          $studentFamilyBangladesh
                        <p><b>Family in Japan:</b></p>
                          $studentFamilyJapan

                        <pagebreak />

                        <h3 class="centerTitle">Study Plan</h3>
                        <p><b>Name of school wish to enroll:</b> $studentSchoolToEnroll</p>
                        <p><b>Subject of study:</b> $studentStudySubject</p>
                        <p><b>Other Details:</b> $studentStudyPlanDetails</p>

                        <h3 class="centerTitle">Supporter Information</h3>
                        <div class="infoLeft">
                          <p><b>Supporter Name:</b> $studentSupporterName</p>
                          <p><b>Relationship With Student:</b> $studentSupporterRelationship</p>
                          <p><b>Supporter Address:</b> $studentSupporterAddress</p>
                          <p><b>Supporter Contact:</b> $studentSupporterContact</p>
                        </div>
                        <div class="infoRight">
                          <p><b>Supporter Method of Payment:</b> $studentMethodofPayment</p>
                          <p><b>Supporter Monthly Income:</b> $studentSupporterIncome</p>
                          <p><b>Supporter Annual Income:</b> $studentSupporterAnnualIncome</p>
                          <p><b>Supporter Monthly Expense:</b> $studentSupporterExpense</p>
                          <p><b>Supporter Annual Expense:</b> $studentSupporterAnnualExpense</p>
                          <p><b>Supporter Annual Save:</b> $studentAnnualSave</p>
                        </div>
                        <div class="clear"></div>
                        <p><b>Support Other Student:</b> $studentSupportOtherStudent</p>
                        <p><b>Support Other Student Details:</b> $studentSupportOtherStudentsDetails</p>
                        <div class="infoLeft">
                          <p><b>Supporter Signature:</b></p>
                        </div>
                        <div class="infoRight">
                          <img src="$supporterSignature">
                        </div>
                        <div class="clear"></div>

                        <pagebreak />

                        <h3 class="centerTitle">Study Purpose</h3>
                          $studentStudyPurpose 
                        <h3 class="centerTitle">Additional Information</h3>
                          $studentAdditional

                    </body>
                </html>
EOD;
            return $html;
    }


            // Function for generating Student PDF
    public function generateStudentBatchDetailsPDF() {
      $title = $this->setFoldername().'_Student Batch Details';
      $profile = $this->getStudentProfile();
      if($profile){
        foreach($profile as $student){
          $studentGivenName = $student['given_name'];
          $studentFamilyName = $student['family_name'];
          $currentBatch = $student['batch'];
          $currentBatchRoll = $student['roll'];

            // Educational Record
          if(is_array($student['batchChange'])) {
            $studentEducationRecord.= "<ul>";
            foreach($student['batchChange'] as $change) { 
              $studentEducationRecord.= "<li>Migrated to Batch <b>".$change['acronym']."-".$change['period'][0]."-".$change['batch_number']."</b> 
                                              in <b>".date('F d (l), Y', strtotime($change['create_date']))."</b>. His roll was <b>".$change['roll']."</b>! 
                                              <br>&nbsp;-Changed by <b>".$change['changed_by_family_name']." ".$change['changed_by_given_name']."</b></li>";  
            }
            $studentEducationRecord.= "</ul>";
          }            
          else{
            $studentEducationRecord = "<p>None so far!</p>";
          }
        }
      }

            $html = 
<<<EOD
                <html>
                    <head>
                        <title>$title</title>
                    </head>
                    <body>
                        <h2 class="centerTitle">STUDENT BATCH DETAILS</h2><hr>
                        <p><b>Family Name:</b> $studentGivenName</p>
                        <p><b>Given Name:</b> $studentFamilyName</p>
                        <p><b>Currently Enrolled Batch:</b> $currentBatch</p>
                        <p><b>Student Batch ID:</b> $currentBatchRoll</p>
                        <h3>Batch Change History: </h3>
                        $studentEducationRecord
                    </body>
                </html>
EOD;
            return $html;
    }

}


?>