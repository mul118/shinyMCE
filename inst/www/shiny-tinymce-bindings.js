(function(){

var shinymceInputBinding = new Shiny.InputBinding();
$.extend(shinymceInputBinding, {
  find: function(scope) {
    return $(scope).find(".shinytinymce");
  },
  getValue: function(el) {
    return tinyMCE.get($(el).attr('id')).getContent();
  },
  setValue: function(el, value) {
    //TODO
  },
  subscribe: function(el, callback) {  
    tinyMCE.get($(el).attr('id')).on("change", function(e) {
                 callback();
         });     
    $(el).on('change.shinymceInputBinding', function(e){callback();});
  },
  unsubscribe: function(el) {
  //$(el).off(".incrementBinding");
  }
});
Shiny.inputBindings.register(shinymceInputBinding);


Shiny.addCustomMessageHandler('shinyMCE.update', function(data) {
  tinyMCE.get(data.id).setContent(data.content);
  $('#'+data.id).trigger('change');
});


})();