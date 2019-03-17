var ready = function () {
  update_js();
}

$(document).on('turbolinks:request-start', function () {
  Turbolinks.clearCache();
})

$(document).on('turbolinks:load', ready);
$(document).ready(ready);

function update_js() {
  close_modal();
  iframe();
}

function close_modal() {
  $(".modal-close").unbind().click(function () {
    $("#modal").modal('hide');
    $("#alert").modal('hide');
  })
}

function iframe() {
  $(".back-iframe").unbind().click(function() {
    window.parent.postMessage('back', '*');
  })
}
