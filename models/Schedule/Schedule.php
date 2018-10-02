<?php

namespace App\Schedule;
use App\Database\Database;

Class Schedule{

            // Function for getting schedule data
    public function getScheduleData() {
        $pdo = Database::getInstance();
        $periodsQuery = $pdo->prepare('SELECT * FROM batch_periods_view');  
        $periodsQuery->execute();
        $periods = $periodsQuery->fetchAll();
        $batchesQuery = $pdo->prepare('SELECT * FROM batches_detailed_view WHERE (start_date < :first_day AND end_date > :last_day) OR (start_date BETWEEN :first_day AND :last_day) OR (end_date BETWEEN :first_day AND :last_day) ORDER BY start_time');   
        $batchesQuery->execute(array(':first_day' => strtotime(date('Y-m-01', time())), ':last_day' => strtotime(date('Y-m-t', time()))));
        $batches = $batchesQuery->fetchAll();
        $findDays = $pdo->prepare('SELECT * from batch_days_view');  
        $findDays->execute();
        $days=$findDays->fetchAll();
        if($periods && $batches && $days){
            return array('periods'=>$periods, 'batches'=>$batches, 'days'=>$days);   
        }
    }

            // Function for getting schedule data
    public function generateSchedulePDF() {
            $data = $this->getScheduleData();
            foreach($data['periods'] as $period){
                $count = 1;
                foreach($data['batches'] as $batch){
                    if($batch['period_id'] == $period['id']){
                        $count ++;
                    }
                }    
                $trs.= "<tr><td rowspan='".$count."'><b>".$period['period']."</b> (".date('h:i A', strtotime($period['start_time']))." - ".date('h:i A', strtotime($period['end_time'])).")</td></tr>";
                foreach($data['batches'] as $batch){
                            if($batch['period_id'] == $period['id']){
                                $trs.= "<tr><td>".$batch['acronym']."-".$batch['period'][0]."-".$batch['batch_number']."</td><td>".date('h:i A', strtotime($batch['start_time']))." - ".date('h:i A', strtotime($batch['end_time']))."</td><td>";
                                foreach($data['days'] as $day){
                                    if($day['batch'] == $batch['id']){
                                        $trs.= $day['weekday'].", ";             
                                    }
                                }
                                $trs.="</td><td>".$batch['teacher_family_name']." ".$batch['teacher_given_name']."</td><td>".$batch['class']."</td>";
                                if($batch['start_date'] > strtotime(date('Y-m-01', time()))){
                                    $trs.= "<td>Starts from ".date('l, F d ', $batch['start_date'])."</td></tr>";
                                }
                                elseif($batch['end_date'] <  strtotime(date('Y-m-t', time()))){
                                    $trs.= "<td>Ends in ".date('l, F d', $batch['end_date'])."</td></tr>";
                                }
                                else{
                                    $trs.="<td>Will continue throughtout this month</td></tr>";
                                } 
                        }
                    }
                };
            $html = 
<<<EOD
                <html>
                    <head>
                        <title>Class Schedule</title>
                        <style>
                            ​h1 {
                                margin: auto;
                            }
                            table, th, td {
                                text-align: center;
                                border: 1px solid black;
                                border-collapse: collapse;
                            }
                            img {
                                height: 141;
                                width: 199;
                                margin: 5px 0;
                                float: right;
                            }
                        </style>
                    </head>
                    <body>
                        <h1>October Class Schedule</h1>
                        <table>
                            <thead>
                                <tr>
                                    <th>Period</th>
                                    <th>Batch Name</th>
                                    <th>Batch Time</th>
                                    <th>Scheduled Days</th>
                                    <th>Teacher</th>
                                    <th>Classroom</th>
                                    <th>Notice</th>
                                </tr>
                            </thead>
                            <tbody>
                                $trs;
                            </tbody>
                        </table>
                        <img src="views/assets/images/djit.png">
                    </body>
                </html>
EOD;
            return $html;
    }

}

?>