class DefaultTemplate
  DEFAULT_TEMPLATE = <<EOF
    <html>
      <head>
        <title><%= title %></title>
        <%= css_link %>
      </head>
      <body>
        <%= content %>
      </body>
    </html>
    EOF
end

