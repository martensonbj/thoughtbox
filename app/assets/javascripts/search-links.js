$(document).ready(function(){
  var $links = $('.link');

  $('#link-search').on('keyup', function() {
    var currentInput = this.value.toLowerCase();

    $links.each(function (index, link) {
      var $link = $(link);
      var $linkUrl = $link.find('.link-url-span').text().toLowerCase();
      var $linkTitle  = $link.find('.link-title-span').text().toLowerCase();

      if ($linkUrl.indexOf(currentInput) >= 0 || $linkTitle.indexOf(currentInput) >= 0) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });

});
