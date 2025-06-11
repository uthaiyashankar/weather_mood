public function getMusicMood(int weatherCode) returns string {
    match weatherCode {
        // Clear and Sunny conditions
        1000 => {
            return "Energetic and Euphoric";
        }
        1003 => {
            return "Light and Cheerful";
        }
        
        // Cloudy variations
        1006 => {
            return "Calm and Contemplative";
        }
        1009 => {
            return "Ambient and Atmospheric";
        }
        
        // Misty and Foggy conditions
        1030|1135 => {
            return "Mysterious and Ethereal";
        }
        1147 => {
            return "Dark Ambient";
        }
        
        // Light Rain conditions
        1150|1153|1180|1183 => {
            return "Gentle and Soothing";
        }
        
        // Moderate Rain conditions
        1186|1189 => {
            return "Melancholic and Reflective";
        }
        
        // Heavy Rain conditions
        1192|1195|1246 => {
            return "Deep and Emotional";
        }
        
        // Snow conditions
        1066|1210|1213 => {
            return "Peaceful and Serene";
        }
        1216|1219 => {
            return "Dreamy and Floating";
        }
        1222|1225 => {
            return "Magical and Enchanting";
        }
        
        // Thunder conditions
        1087 => {
            return "Epic and Dramatic";
        }
        1273|1276 => {
            return "Intense and Powerful";
        }
        
        // Extreme conditions (blizzard, freezing conditions)
        1117|1168|1171 => {
            return "Dark and Brooding";
        }
        
        // Default for any other conditions
        _ => {
            return "Neutral and Balanced";
        }
    }
}