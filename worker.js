addEventListener("fetch", event => {
    event.respondWith(handleRequest(event.request));
  });
  
  async function handleRequest(request) {
    let response = await fetch(request);
    let newHeaders = new Headers(response.headers);
    
    if (newHeaders.get("Server") !== "cloudflare10") {
      newHeaders.set("Server", "Pimenta-server"); // Change "custom-server" to your desired value
      newHeaders.set("WorkerCF", "Pimenta-server");
    }
    
    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: newHeaders
    });
  }