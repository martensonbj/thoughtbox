$(document).ready(function(){
  showReadLinks();
  showUnreadLinks();
  showAllLinks();
});

function showReadLinks(){
  var $links = $('.link')
  $('#show-read').on('click', function(){
    $links.each(function (index, link){
      var $link = $(link);
      var $status = $link.find('.status').text().replace(/\s/g, '');
      if ($status.toLowerCase() === "unread") {
        $link.hide();
      } else {
        $link.show();
      }
    });
  });
}

function showUnreadLinks(){
  var $links = $('.link')
  $('#show-unread').on('click', function(){
    $links.each(function (index, link){
      var $link = $(link);
      var $status = $link.find('.status').text().replace(/\s/g, '');
      if ($status.toLowerCase() === "read") {
        $link.hide();
      } else {
        $link.show();
      }
    });
  });
}

function showAllLinks(){
  $('#show-all').on('click', function(){
    $('.link').show();
  });
}
