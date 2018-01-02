// $(document).on('turbolinks:load', function() {
// jQuery(function() {
//   var states;
//   states = $('#proposal_car_model_id').html();
//   console.log('states:', states);
//   return $('#proposal_car_make_id').change(function() {
//     var country, options;
//     country = $('#proposal_car_make_id :selected').text();
//     console.log ('country:', country);
//     options = $(states).filter("optgroup[label=" + country + "]").html();
//     console.log('options:', options);
//     if (options) {
//       return $('#proposal_car_model_id').html(options);
//     } else {
//       return $('#proposal_car_model_id').empty();
//     }
//   });
// });

jQuery(function() {
  var states;
  // $('#proposal_car_model_id').parent().hide();
  states = $('#proposal_car_model_id').html();
  console.log('states', states);

  return $('#proposal_car_make_id').change(function() {
    console.log('changed');
    var country, escaped_country, options;
    country = $('#proposal_car_make_id :selected').text();
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(states).filter('optgroup[label="' + escaped_country + '"]').html();
    if (options) {
      $('#proposal_car_model_id').html(options);
      return $('#proposal_car_model_id').parent().show();
    } else {
      $('#proposal_car_model_id').empty();
      return $('#proposal_car_model_id').parent().hide();
    }
  });

});
// });