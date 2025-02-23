public with sharing class AWSIntegration {

    public static String uploadFileToS3(String fileName, String fileContent) {
        try {
            HttpResponse res = sendRequest('PUT', fileName, fileContent);
            if (res.getStatusCode() == 200) {
                return 'File uploaded successfully to S3: ' + fileName;
            } else {
                return 'Error uploading file: ' + res.getStatus() + ' - ' + res.getBody();
            }
        } catch (Exception e) {
            return 'Exception occurred: ' + e.getMessage();
        }
    }
    
    public static String getFileFromS3(String fileName) {
        try {
            HttpResponse res = sendRequest('GET', fileName, null);
            if (res.getStatusCode() == 200) {
                return 'File content: ' + res.getBody();
            } else {
                return 'Error retrieving file: ' + res.getStatus() + ' - ' + res.getBody();
            }
        } catch (Exception e) {
            return 'Exception occurred: ' + e.getMessage();
        }
    }

    private static HttpResponse sendRequest(String method, String fileName, String fileData) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:AWS_Named_Creds/' + fileName);
        req.setMethod(method);
        if (fileData != null) {
            req.setHeader('Content-Type', 'text/plain'); //set to text for example purposes
            req.setBody(fileData);
        }
        Http http = new Http();
        return http.send(req);

    }
}