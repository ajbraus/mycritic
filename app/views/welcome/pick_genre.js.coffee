$('#mainBox').html("<%= escape_javascript(render partial: 'welcome/pick_critics', locals: {:critics => @critics}) %>")

pick_critics = $('#pickCritics')
genre_id = $("#genre").attr('data-genre-id');
critic_ids = []
$('.critic').click ->
	$(@).fadeOut ->
		critic_img = $(@).first().find('img')
		num = $('#criticsColumn').children().length / 2 + 1
		name = $(@).find('h4.media-heading').text();
		$('#criticsColumn').append("<div style='text-align:center;background-color:white;'>" + num + " " + "-" + " " + name + "</div>").append(critic_img);
		critic_img.css("width","100%");
		critic_id = $(@).attr 'data-critic-id'
		critic_ids.push(critic_id)
		if critic_ids.length > 0
			$('#pickCritics').removeClass('disabled').addClass('btn-primary')

	pick_critics.click ->
		if $(@).hasClass("btn-primary")
			$('#ajaxSpinner').show();
			$('#mainBox').hide();
			$.get '/index_works',
				critic_ids: critic_ids,
				genre_id: genre_id
