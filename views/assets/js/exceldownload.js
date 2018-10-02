  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();



var $studentToExcel = $('#studentToExcel');
var $teacherToExcel = $('#teacherToExcel');
var $administratorToExcel = $('#administratorToExcel');
var $studentProfileDatabaseToExcel = $('#studentProfileDatabaseToExcel');
var $studentEducationDatabaseToExcel = $('#studentEducationDatabaseToExcel');
var $studentJapaneseLanguageCertificationDatabaseToExcel = $('#studentJapaneseLanguageCertificationDatabaseToExcel');
var $studentCarrerToExcel = $('#studentCarrerToExcel');
var $studentPastEntryJapanToExcel = $('#studentPastEntryJapanToExcel');
var $studentFamilyInformatinDatabaseToExcel = $('#studentFamilyInformatinDatabaseToExcel');
var $downloadAllExamScores = $('#studentExamRecordtoExcel');
var $assignedStudentsToExcel = $('#assignedStudentsToExcel');
var $downloadDegrees = $('#downloadDegree');
var $downloadLevels = $('#downloadLevels');
var $downloadTests = $('#downloadTests');
var $downloadRelationships = $('#downloadRelationships');
var $downloadStudyStatuses = $('#downloadStudyStatuses');
var $downloadScores = $('#examScores');
var $downloadAttendance = $('#attendanceExcel');

$studentToExcel.on('click', function(){  
  var getRole = $studentToExcel.val();
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createExcel',
    type: 'post',
    data: {role:getRole},
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$teacherToExcel.on('click', function(){  
  var getRole = $teacherToExcel.val();
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createExcel',
    type: 'post',
    data: {role:getRole},
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$administratorToExcel.on('click', function(){  
  var getRole = $administratorToExcel.val();
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createExcel',
    type: 'post',
    data: {role:getRole},
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$studentProfileDatabaseToExcel.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createStudentExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$studentEducationDatabaseToExcel.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createEducationExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$studentJapaneseLanguageCertificationDatabaseToExcel.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createJapaneseLanguageExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$studentCarrerToExcel.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createCarrerExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$studentPastEntryJapanToExcel.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createPastEntryExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$studentFamilyInformatinDatabaseToExcel.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createFamilyInformationExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$assignedStudentsToExcel.on('click', function () {
    $("#tableData").excelexportjs({
        containerid: "tableData"
        , datatype: 'table'
    });

});


$downloadDegrees.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createDegreeExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$downloadLevels.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createLevelExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$downloadTests.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createTestExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$downloadRelationships.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createRelationshipExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});

$downloadStudyStatuses.on('click', function(){  
    searchRequest = $.ajax({
    url: 'jquery.php/?controller=jquery&action=createStatusExcel',
    type: 'post',
    dataType: 'json',
    success:function(response){
      var data = response;
      $("#dvjson").excelexportjs({
      containerid: "dvjson"
      , datatype: 'json'
      , dataset: data
      , columns: getColumns(data)     
      });
    }
  });
});


$downloadScores.on('click', function(){  
    var id = $('input[name=id_redirect]').val();
    var exam = $('input[name=exam_redirect]').val();
    searchRequest = $.ajax({
      url: 'jquery.php/?controller=jquery&action=examScores',
      type: 'post',
      data: {id:id, exam:exam},
      dataType: 'json',
      success:function(response){
        var data = response;
        $("#dvjson").excelexportjs({
        containerid: "dvjson"
        , datatype: 'json'
        , dataset: data
        , columns: getColumns(data)     
        });
      }
  });
});

$downloadAllExamScores.on('click', function(){  
    searchRequest = $.ajax({
      url: 'jquery.php/?controller=jquery&action=createScoreExcel',
      type: 'post',
      dataType: 'json',
      success:function(response){
        var data = response;
        $("#dvjson").excelexportjs({
        containerid: "dvjson"
        , datatype: 'json'
        , dataset: data
        , columns: getColumns(data)     
        });
      }
  });
});

$downloadAttendance.on('click', function () {
    $("#tableData").excelexportjs({
        containerid: "tableData"
        , datatype: 'table'
    });

});

