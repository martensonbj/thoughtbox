$(document).ready(function(){
  toggleEditForm();
  editLink();
});


function toggleEditForm(){
  $('.edit-link').on('click', function(){
    $(this).next().toggle();
  });
}

function editLink(){
  $('.edit-link-submit').on('click', function(){
    var $this = $(this);
    var link = $this.closest('.link');
    var newUrl = $this.parents().first().find('.edit-link-url').val();
    var newTitle = $this.parents().first().find('.edit-link-title').val();

    var linkParams = {
      link: {
        url: newUrl,
        title: newTitle
      }
    };
    $(this).parents().first().hide();
    replaceText(link, linkParams);
    sendEditAjaxCall(link, linkParams);
  });
}

function sendEditAjaxCall(link, linkParams){
  $.ajax({
    type: "PUT",
    url: "api/v1/links/" + link.attr("data-id") + ".json",
    data: linkParams,
    success: function(response){
      console.log("response: " + response);
    },
    error: function(xhr){
      console.log("Error in Edit Link Form" + xhr.responseText);
    }
  });
}

function replaceText(link, linkParams){
  var url = link.find('.link-url-span');
  var title = link.find('.link-title-span');

  url.text(linkParams.link.url);
  title.text(linkParams.link.title);
}
