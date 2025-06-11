import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /MusicMood on httpDefaultListener {
    resource function get playlist(string location) returns error|json|http:InternalServerError {
        do {
            WeatherData weatherResponse = check weatherAPIClient->get(string `current.json?q=${location}&key=${WEATHER_API_KEY}`);
            int weatherCode = weatherResponse.current.condition.code;
            string musicMood = getMusicMood(weatherCode);
            SpotifyPlaylist spotifyResponse = check spotifyClient->get(string `/search?q=${musicMood}&type=playlist`);
            MusicSuggestion musicSuggestion = transform(weatherResponse, spotifyResponse);
            return musicSuggestion;
        } on fail error err {
            return error("unhandled error", err);
        }
    }
}
