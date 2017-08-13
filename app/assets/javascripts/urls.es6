let collapse = () => {
  let collapseDiv = $('#shortened-container')
  if (!collapseDiv.hasClass('show')) {
    collapseDiv.collapse('show')
  }
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
        $('#shortened').text(response.shortened)
        $('#create-button').attr('disabled', false);
      }
    })
  })
})
