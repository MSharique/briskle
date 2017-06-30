app.User = function() {
  this._input = $('#users-search-txt');
  this._initAutocomplete();
};

app.User.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/search',
        appendTo: '#users-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    alert("in render")
   var markup = [ 
        item.name,
        item.username
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.name + ' - ' + ui.item.username );
    return false;
  }
};