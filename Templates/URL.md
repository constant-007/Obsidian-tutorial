<%*
// Prompt for URL if not provided
const url = await tp.system.prompt("Enter the URL to embed");
if (url) {
    // Create iframe HTML with responsive dimensions
    tR = `<iframe src="${url}" style="width:100%; height:500px; border:none; border-radius:4px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"></iframe>`;
}
%>