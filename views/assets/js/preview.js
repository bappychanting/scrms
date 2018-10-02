function previewImages() {

  var $preview = $('#preview').empty();
  if (this.files) $.each(this.files, readAndPreview);

  function readAndPreview(i, file) {
    
    if (!/\.(jpe?g|png|gif)$/i.test(file.name)){
      return alert(file.name +" is not an image");
    } // else...
    
    var reader = new FileReader();

    $(reader).on("load", function() {
        var img = $("<img/>", {src:this.result, class: "img-responsive thumbnail"});
        var div = $("<div>", {class: "col-lg-3 col-md-4 col-sm-6 col-xs-12"});
        $preview.append(div.append(img));
    });

    reader.readAsDataURL(file);
    
  }

}

$('#file-input').on("change", previewImages);

function previewImages1() {

  var $preview = $('#preview1').empty();
  if (this.files) $.each(this.files, readAndPreview);

  function readAndPreview(i, file) {
    
    if (!/\.(jpe?g|png|gif)$/i.test(file.name)){
      return alert(file.name +" is not an image");
    } // else...
    
    var reader = new FileReader();

    $(reader).on("load", function() {
        var img = $("<img/>", {src:this.result, class: "img-responsive thumbnail"});
        var div = $("<div>", {class: "col-lg-3 col-md-4 col-sm-6 col-xs-12"});
        $preview.append(div.append(img));
    });

    reader.readAsDataURL(file);
    
  }

}

$('#file-input1').on("change", previewImages1);