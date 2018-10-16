$(document).on('turbolinks:load', () => {
  let component = $(".profession-form");
  if (component.length != 1) return;

  component.find('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    component.find('.profession-icon-content').html(
      $.cloudinary.image(
        data.result.public_id,
        {
          format: data.result.format,
          version: data.result.version,
          crop: 'fill',
          width: 64,
          height: 64
        }
      )
    );
    // $('.image_public_id').val(data.result.public_id)
    return true;
  });
});