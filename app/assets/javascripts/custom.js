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
  jquery_upload();
}

function close_modal() {
  $(".modal-close").unbind().click(function () {
    $("#modal").modal('hide');
    $("#modal").modal('hide');
  })
}

function iframe() {
  $(".back-iframe").unbind().click(function() {
    window.parent.postMessage('back', '*');
  })
}


function jquery_upload() {
  return $('#form-upload').fileupload({
    dataType: "script",
    add: function (e, data) {
      var file, types;
      types = /(\.|\/)(gif|jpe?g|png)$/i;
      file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        data.context = $(tmpl("template-upload", file));
        $('#form-upload .progress-content').html(data.context);
        return data.submit();
      } else {
        return alert(`${file.name} não é uma imagem do tipo gif, jpeg, ou png. Favor verificar.`);
      }
    },
    progress: function (e, data) {
      var progress;
      if (data.context) {
        progress = parseInt(data.loaded / data.total * 100, 10);
        return data.context.find('.progress-bar').css('width', progress + '%');
      }
    }
  });
}