let collapse = () => {
  let collapseDiv = $('#shortened-container')
  if (!collapseDiv.hasClass('show')) {
    collapseDiv.collapse('show')
  }
}

let urlFormatter = (shortCode) => {
  const baseUrl = window.location.href
  return baseUrl + shortCode
}

let copyToClipboard = (event) => {
  event.preventDefault();
  let url         = $('#shortened').text();
  let placeholder = document.createElement('input');
  placeholder.setAttribute('value', url);
  document.body.appendChild(placeholder);
  placeholder.select();
  document.execCommand('copy');
  document.body.removeChild(placeholder)
}

$(document).ready( () => {

  $(document).on('submit', 'form#new_url', (e) => {
    e.preventDefault();
    const $form     = $(e.target);
    const submitUrl = $form.prop('action');
    const data      = $form.serialize();

    $.ajax({
      method: 'POST',
      data:   data,
      url:    submitUrl,
      success: (response) => {
        collapse();
        let formattedUrl = urlFormatter(response.shortened);

        $('#shortened').text(formattedUrl);

        $('#create-button').attr('disabled', false);
      }
    })
  })
})
