  // Hover Effekt   -   Funktioniert
  $('tbody tr').hover(function(){  
    $(this).find('td').addClass('hovered');  
  }, function(){  
    $(this).find('td').removeClass('hovered');  
  }); 