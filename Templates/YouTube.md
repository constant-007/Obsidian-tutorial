<%*
// Prompt for YouTube URL
const youtubeURL = await tp.system.prompt("Enter YouTube URL");

// Function to extract video ID from various YouTube URL formats
function extractVideoID(url) {
    // Handle different YouTube URL formats
    const regExp = /^.*(youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*/;
    const match = url.match(regExp);
    return (match && match[2].length === 11) ? match[2] : false;
}

// Extract the video ID
const videoID = extractVideoID(youtubeURL);

if (videoID) {
    // Create the embed HTML
    const embedHTML = `<iframe width="560" height="315" src="https://www.youtube.com/embed/${videoID}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
    
    // Output only the embed HTML
    tR += embedHTML;
} else {
    tR += "Invalid YouTube URL. Please try again with a proper YouTube URL.";
}
%>