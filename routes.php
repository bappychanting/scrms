<?php

  function call($controller, $action) {
    
    require_once('controllers/' . $controller . '_controller.php');

    switch($controller) {
      case 'jquery': 
        $controller = new JqueryController();
      break;
      case 'auth':
        $controller = new AuthController(); 
      break;
      case 'users': 
        $controller = new UsersController();
      break;
      case 'messages': 
        $controller = new MessagesController();
      break;
      case 'notifications': 
        $controller = new NotificationsController();
      break;
      case 'notices': 
        $controller = new NoticesController();
      break;
      case 'suggestions': 
        $controller = new SuggestionsController();
      break;
      case 'batches':
        $controller = new BatchesController();
      break;
      case 'schedule':
        $controller = new ScheduleController();
      break;
      case 'students':
        $controller = new StudentsController();
      break;
    }

    $controller->{ $action }();
  }

    $controllers = array('auth' => ['frontpage', 'check_captcha', 'signin', 'home', 'searchBar', 'requirePassword', 'checkPassword', 'signout', 'resetPass', 'getLink', 'resetLink', 'updateForgottenPass', 'error'],
                       'users' => ['showAllUsers',  'showSpecificUsers', 'showUser', 'addUser', 'storeUser', 'editUser', 'updateUser', 'editPass', 'updatePass', 'updateImage', 'deleteUser', 'advanced', 'searchUser', 'searchUserbyDate', 'restoreUser', 'deleteAll', 'import'],
                       'messages' => ['viewMessages', 'allConversations', 'allStaff', 'searchConversation', 'deleteMessage', 'deleteConversation'],
                       'notifications' => ['allNotifications', 'notificationRedirection', 'readAllNotifications'],
                       'notices' => ['allNotices', 'viewNotice', 'viewComments', 'searchNotice', 'searchNoticebyDate', 'addNotice', 'storeNotice', 'storeComment', 'editNotice', 'editComment', 'updateNotice', 'updateComment', 'deleteNotice', 'deleteComment'],
                       'suggestions' => ['allSuggestions', 'studentSuggestions', 'viewSuggestion', 'addSuggestion', 'storeSuggestion', 'editSuggestion', 'updateSuggestion', 'deleteSuggestion', 'viewComments', 'storeComment', 'editComment', 'updateComment', 'deleteComment'],
                       'batches' => ['allBatches', 'addBatch', 'storeBatch', 'viewBatch', 'editBatch', 'updateBatch', 'deleteBatch', 'assignTeacherClassroom','updateTeacherClassroom',  'unassignTeacherClassroom', 'addExam', 'storeExam', 'allExams', 'getParticipants', 'storeScores', 'editExam', 'updateExam', 'deleteExam', 'viewAttendance', 'addAttendance', 'storeAttendance', 'editAttendance', 'updateAttendance', 'deleteAttendance', 'searchByPeriod', 'searchByType', 'searchByClassroom', 'manageBatchPeriod', 'storeBatchPeriod', 'editBatchPeriod', 'updateBatchPeriod', 'deleteBatchPeriod', 'manageBatchType', 'storeBatchType', 'editBatchType', 'updateBatchType', 'deleteBatchType', 'manageClassRoom', 'storeClassRoom', 'editClassRoom', 'updateClassRoom', 'deleteClassRoom'],
                       'schedule' => ['viewSchedule', 'generateSchedulePDF'],
                       'jquery' => ['homeSearch', 'chartData', 'searchUser', 'checkUsername', 'createExcel', 'sendMessage', 'viewNewMessages', 'searchConversation', 'sortConversations', 'allConversations', 'suggestAcronym', 'validateBatchTime', 'checkBatchAvailability', 'checkBatchPeriodNameAvailability', 'getRoll', 'verifyRoll', 'searchStudent', 'getStudentData', 'getStudyStatuses', 'updateStudyPurpose', 'updateAdditional', 'updateStudyStatus', 'getStudyStatus', 'createStudentExcel', 'createEducationExcel', 'createJapaneseLanguageExcel', 'createCarrerExcel', 'createPastEntryExcel', 'createFamilyInformationExcel', 'createScoreExcel', 'createDegreeExcel', 'createLevelExcel', 'createTestExcel', 'createRelationshipExcel', 'createStatusExcel', 'uploadAttachment', 'getAttachments', 'examScores', 'searchNotice'],
                       'students' => ['pendingStudents', 'allStudents', 'unassignedStudents', 'assignedStudents', 'sortByBatch', 'searchStudent', 'searchStudentbyDate', 'createStudentProfile', 'storeStudent', 'skipProfile', 'showStudentProfile', 'assignBatch', 'updateBatch', 'updateStudentPassport', 'editStudentDetails', 'updateStudentDetails', 'updateStudentImage', 'editStudentSupporter', 'editStudentPassport', 'addEducationRecord', 'storeEducationRecord', 'editEducationRecord', 'updateEducationRecord', 'deleteEducationRecord', 'editLanguageCertification', 'updateLanguageCertification', 'addCarrerRecord', 'storeCarrerRecord', 'editCarrerRecord', 'updateCarrerRecord', 'deleteCarrerRecord', 'addPastEntry', 'storePastEntry', 'editPastEntry', 'updatePastEntry', 'deletePastEntry', 'addFamilyMember', 'storeFamilyMember', 'editFamilyMember', 'updateFamilyMember', 'deleteFamilyMember', 'editStudyPlan', 'updateStudyPlan', 'editStudentSupporter', 'updateStudentSupporter', 'showStudentPerformance', 'showStudentAttachments', 'deleteAttachment', 'savePDF', 'generateBatchDetailsPDF', 'deleteStudent', 'advanced', 'deleteAllStudents', 'import', 'importStudentDatabases']) ;

 // check if the controller & action exists from "$controllers" array, otherwise calls error page
 if (array_key_exists($controller, $controllers)) {
    if (in_array($action, $controllers[$controller])) {
      call($controller, $action);
    } else {
      call('auth', 'error');
    }
  } 
  else {
    call('auth', 'error');
  }
?>