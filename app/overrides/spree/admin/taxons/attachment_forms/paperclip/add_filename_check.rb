# frozen_string_literal: true

Deface::Override.new(
  name: 'spree/admin/taxons/attachment_forms/paperclip/add_filename_check',
  virtual_path: 'spree/admin/taxons/attachment_forms/_paperclip',
  original: 'c15d7457875dbbce987638e26fe548e5b9415160',
  surround: 'erb[silent]:contains("if f.object.send(attachment).exists?")',
  text: '
    <% if !f.object.send(attachment).original_filename.nil? %>
      <%= render_original %>
    <% end %>
  '
)
