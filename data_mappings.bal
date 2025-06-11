function transform(WeatherData weatherResponse, SpotifyPlaylist spotifyResponse) returns MusicSuggestion => {
    location: weatherResponse.location.name,
    weather: weatherResponse.current.condition.text,
    musicMood: getMusicMood(weatherResponse.current.condition.code),
    playlist: from var itemsItem in spotifyResponse.playlists.items
        where (itemsItem?.name is string)
        select {
            name: itemsItem?.name ?: "",
            url: itemsItem?.external_urls?.spotify ?: "",
            artist: itemsItem?.owner?.display_name ?: ""
        }
};