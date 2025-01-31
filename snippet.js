//Maintenance_Page_from_different_endpoint
export default {
    async fetch(request) {
        return handleRequest(request)
    }
}

async function handleRequest(request) {
    const url = new URL(request.url);
    // External endpoint to fetch the maintenance content
    const targetEndpoint = 'https://maintenance-page-c4h.pages.dev';

    // Fetch the content from the target endpoint
    const response = await fetch(targetEndpoint);
    const content = await response.text();

    return new Response(content, {
        status: 200,
        headers: {
            'Content-Type': 'text/html'
        }
    });
}