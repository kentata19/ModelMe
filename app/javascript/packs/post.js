$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});
$( '.js-input' ).keyup(function() {
  if( $(this).val() ) {
     $(this).addClass('not-empty');
  } else {
     $(this).removeClass('not-empty');
  }
});




$(document).on('turbolinks:load', function() {

  $('#item_images').on('change',function(e){
    var files = e.target.files;
    var d = (new $.Deferred()).resolve();
    $.each(files,function(i,file){
      d = d.then(function() {
          return Uploader.upload(file)})
        .then(function(data){
          return previewImage(file, data.image_id);
      });
    });
    $('#item_images').val('');
  });

  $('.images-field').on('click','.btn-edit', function(e){
    e.preventDefault();
    $(this).parent().find('.edit-image-file-input').trigger("click");
  });

  $('.images-field').on('change','.edit-image-file-input', function(e){
    var file = e.target.files[0];
    var image_box = $(this).parent();
    Uploader.upload(file).done(function(data){
      replaceImage(file, data.image_id, image_box);
    });
  });

  $('.images-field').on('click','.btn-delete', function(e){
    e.preventDefault();
    $(this).parent().remove();
  });

  var replaceImage = function(imageFile, image_id, element){
    var reader = new FileReader();
    var img = element.find('img');
    var input = element.find('.item-images-input');
    var filename = element.find('p');
    reader.onload = function(e){
      input.attr({value: image_id});
      filename.html(imageFile.name);
      img.attr("src", e.target.result);
    };
    reader.readAsDataURL(imageFile);
  }

  var previewImage = function(imageFile, image_id){
    var reader = new FileReader();
    var img = new Image();
    var def =$.Deferred();
    reader.onload = function(e){
      var image_box = $('<div>',{class: 'image-box'});
      image_box.append(img);
      image_box.append($('<p>').html(imageFile.name));
      image_box.append($('<input>').attr({
            name: "item[images][]",
            value: image_id,
            style: "display: none;",
            type: "hidden",
            class: "item-images-input"}));
      image_box.append('<a href="" class= "btn-edit">Edit</a>');
      image_box.append($('<input>').attr({
            name: "edit-image[]",
            style: "display: none;",
            type: "file",
            class: "edit-image-file-input file-input"}));
      image_box.append('<a href="" class="btn-delete">Delete</a>');
      $('.images-field').append(image_box);
      img.src = e.target.result;
      def.resolve();
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  }

  var Uploader = {
    upload: function(imageFile){
      var def =$.Deferred();
      var formData = new FormData();
      formData.append('image', imageFile);
      $.ajax({
        type: "POST",
        url: '/items/upload_image',
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false,
        success: def.resolve
      })
      return def.promise();
    }
  }
})