$('#mainBox').html("<%= escape_javascript(render partial: 'welcome/pick_critics', locals: {:critics => @critics}) %>")