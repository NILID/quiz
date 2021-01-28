document.addEventListener("DOMContentLoaded", function() {
  var newThemeButton = document.getElementById('add-theme');
  var closeModal     = document.getElementById('modal_close');
  var themeModal     = document.getElementById('theme_modal');
  var themeErrors    = document.getElementById('theme_errors');
  var themeForm      = document.getElementById('new_theme_form');

  if (typeof(newThemeButton) != 'undefined' && newThemeButton != null)
  {
    newThemeButton.addEventListener('click', function() {
      themeModal.classList.remove('d-none');
    });
  };

  if (typeof(closeModal) != 'undefined' && closeModal != null)
  {
    closeModal.addEventListener('click', function() {
      // Remove old errors
      // Reset and hide form

      themeModal.classList.add('d-none');
      themeErrors.innerHTML = "";
      themeForm.reset();
    });
  };
});