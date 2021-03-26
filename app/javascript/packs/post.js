$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev0').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img0").change(function(){
    $('#avatar_img_prev0').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});

$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev1').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img1").change(function(){
    $('#avatar_img_prev1').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});

$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev2').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img2").change(function(){
    $('#avatar_img_prev2').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});

$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev3').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img3").change(function(){
    $('#avatar_img_prev3').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});

$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev4').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img4").change(function(){
    $('#avatar_img_prev4').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});
$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev5').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img5").change(function(){
    $('#avatar_img_prev5').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});