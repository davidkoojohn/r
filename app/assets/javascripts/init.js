var R = {};

function tryToPopModal() {
  var $popupModal = $('#popup-modal');
  if ($popupModal.data('should-pop')) {
    $popupModal.modal();
  }
}

$(document).on('turbolinks:load', function () {
  tryToPopModal();
});