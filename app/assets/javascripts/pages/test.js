R.LoginModal = function () {
  console.log($('div').length)
};

$(document).on('turbolinks:load', function () {
  if ($('a').length > 0) {
    R.LoginModal();
  }
});








