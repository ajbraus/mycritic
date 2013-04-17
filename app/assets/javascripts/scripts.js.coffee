$ ->
	$('.set_genre').click ->
		#$('#criticsColumn').fadeIn();
		genre_id = $(@).attr('data-genre')
		$.get '/pick_genre',
			genre_id: genre_id

		