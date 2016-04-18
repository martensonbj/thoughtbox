$(document).ready(function(){
  updateStatus();
});

function setStatus(status) {
  if(status === "Unread"){
    console.log ("Unread(false), changing to true");
    return true;
  } else if (status === "Read"){
    console.log ("Read(true), changing to false");
    return false;
  }
}

function updateStatus(){
  var status = $('.status');
  return status.on('click', function(){
    var link = $(this).closest('.link');
    var statusText = $(this).text().replace(/\s/g, '');
    var newStatus = setStatus(statusText);
    console.log(newStatus);
    var linkParams = {
      link: {
        read: newStatus
      }
    };
    sendAjaxCall(link, linkParams, newStatus);
  });
}

function sendAjaxCall(link, linkParams, newStatus) {
  $.ajax({
    type: "PUT",
    url: "api/v1/links/" + link.attr("data-id") + ".json",
    data: linkParams,
    success: function(){
      setNewStatus(link, newStatus);
      console.log("New Status Set");
    },
    error: function(xhr){
      console.log("Error in Update Status call");
      console.log(xhr.responseText);
    }
  });
}

function setNewStatus(link, newStatus){
  var status = link.find('.status')
  if (newStatus === true) {
    status.html("Read");
  } else if (newStatus === false) {
    status.html("Unread");
  }
}
