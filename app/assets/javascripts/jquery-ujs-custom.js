(function() {
  if (App.jqueryUjsCustomJsInited) {
    return;
  }
  App.jqueryUjsCustomJsInited = true;

  // Disable `link_to`
  $(document).on('click', 'a[disabled]', function () {
    return false;
  });

  $(document).on('confirm', '[data-confirm]', function(e){
    if (!window.bootbox) { return true; }

    // use custom modal
    var $el = $(this);
    bootbox.confirm({ title: $el.data('title') || '提示', message: $el.data('confirm'), callback: function(confirmed) {
        if (confirmed) {
          // simulate a click on the element but clean the data-confirm attribute first
          // so that we don't get into a loop
          $el.data('confirm', null);
          $el.trigger('click.rails');
        }
      }});

    // prevent the default behaviour of showing the standard window.confirm dialog
    return false;
  });

  // https://github.com/rails/rails/issues/29473#issuecomment-332460176
  $(document).on('ajax:complete', 'a[method!=get][data-remote=true]', function(e, xhr) {
    if (xhr.responseText.substring(0, 10) == 'Turbolinks') {
      // This is a turbolink redirect, so re-disable the form until turbolinks
      // fetches the new page.
      $.rails.disableElement($(e.target));
    } else {
      // Handle if there was a form error... possible solutions in
      // turbolinks/turbolinks#85
    }
  });

  // Handle ujs ajax:error
  $(document).on('ajax:error', '[data-remote="true"]', function(e, xhr) {
    if (xhr.status >= 200 && xhr.status < 300) { return; }

    var n = new Noty({
      text: (xhr.responseJSON && xhr.responseJSON.message) || xhr.statusText,
      type: 'warning',
      queue: 'ajax-error_[data-remote="true"]',
      killer: 'ajax-error_[data-remote="true"]'
    });
    n.show();
  });
}).call(this);