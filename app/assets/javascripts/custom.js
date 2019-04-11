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
  mask();
  btn_collapse();
}

function close_modal() {
  $(".modal-close").unbind().click(function () {
    $("#modal").modal('hide');
  })
}

function iframe() {
  $(".back-iframe").unbind().click(function() {
    window.parent.postMessage('back', '*');
  })
}

function btn_collapse() {
  $(".btn-collapse").unbind().click(function() {
    $("#" + $(this).data('current')).hide();
    $("#" + $(this).data('next')).show();
    $("html, body").animate({ scrollTop: 0 }, "slow");
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


function mask() {
  $('.date').mask("00/00/0000", { placeholder: "__/__/____" });
  $('.hour').mask("00:00", { placeholder: "00:00" });
  $('.cpf').mask("000.000.000-00", { placeholder: "000.000.000-00" });
  $('.cnpj').mask("00.000.000/0000-00", { placeholder: "00.000.000/0000-00" });
  $('.document_number').mask("000-000.000/0000", { placeholder: "000-000.000/0000" });
  $('.cep').mask("00000-000", { placeholder: "00000-000" });
  $('.percent').mask("00.0", { placeholder: "00.0" });
  $('.coin').mask("######0.00", { reverse: true });
  $('.money').mask('000.000.000.000,00', { reverse: true });
}