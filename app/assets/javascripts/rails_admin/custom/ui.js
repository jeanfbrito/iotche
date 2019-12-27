//= require_tree .

$(document).on('rails_admin.dom_ready', function() {
  return $('.jsoneditor-target .form-control').each(function() {
    var container, editor, target;
    target = $(this);
    container = $('<div class="jsoneditor-container">').insertAfter(target);
    editor = new JSONEditor(container[0], {
      modes: ['tree', 'code'],
      onChange: function() {
        return target.val(editor.getText());
      }
    });
    editor.set((function() {
      try {
        return JSON.parse(target.val());
      } catch (_error) {}
    })());
    return target.hide();
  });
});
