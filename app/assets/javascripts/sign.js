$(document).ready(function() {

  var display_profile = function(response){
    window.location = response.url;
  }

  var process_signin = function () {
    console.log('signin')
    return true;
  }

  var process_signup = function () {
    var name = $('#user_name').val();
    var password = $('#user_password').val();
    var password_confirmation = $('#user_password_confirmation').val();
    var user_id = $('#user_id').val();
    var token = $('input[name="authenticity_token"]').val();
    var url =  '/users';
    if($("#is_restaurant").prop('checked') == true){
      url = '/restaurants';
    }
    $.ajax({
      dataType: 'json',
      type: 'POST',
      url: url,
      data: {
        'authenticity_token': token,
        'id': user_id,
        'user[name]': name ,
        'user[password]': password,
        'user[password_confirmation]': password_confirmation
      }
    }).done(display_profile).error(function (message) {
    });
    return false;
  }

  $('.sign_up').click(process_signup);
  $('.sign_in').click(process_signin);

});