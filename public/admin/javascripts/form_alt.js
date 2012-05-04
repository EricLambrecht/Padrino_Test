$(document).ready(function() {
prompt('OK');
  $('#tweetcheck').click(
    function ()
    {  
      if ($('#tweetcheck').is(':checked')) {
        $('#tweettext').attr('disabled', false);    
      }
      else {
        $('#tweettext').attr('disabled', true);
      }
    }); 
});