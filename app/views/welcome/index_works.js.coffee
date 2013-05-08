$('#criticsPool').html("<%= escape_javascript(render partial: 'welcome/index_works', locals: {:works => @works}) %>")
$('#ajaxSpinner').hide();
$('#criticsPool').show();