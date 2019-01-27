public class HttpCallout {
	public static HttpResponse makeGetCallout() {
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() == 200) {
			// Deserialize the JSON string into collections of primitive data types.
			Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			Map<String,Object> args = (Map<String,Object>) results.get('args');
			System.debug('Received the following args values:');
			for (Object arg: args.values()) {
				System.debug(arg);
			}
			Map<String,Object> mapHeaders = (Map<String,Object>) results.get('headers');
			System.debug('Received the following headers values:');
			for (Object header: mapHeaders.values()) {
				System.debug(header);
			}
            System.debug(results.get('url'));
		}
        return response;
    }
}