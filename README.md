# Salesfroce-AWS Integration example (S3) 
Sample code shows how to integrate Salesforce with AWS S3 services. 

# SETUP GUIDE
1. Login to AWS Account
2. Create or open S3 bucket. (Review and save bucket's AWS region name (ex. eu-north-1))
3. Go to IAM -> Users -> Create a new user. Give 'AmazonS3FullAccess' access in the permission policies menu.
4. Generate Access key for the User. Save generated key and secret
5. Deploy named and external credentials + permission set to SF. Assign permission set to your user.
6. Modify 'AWS Named Creds' named credentials:
- URL: https://SET_NAME_OF_YOUR_BUCKET_INSTANCE.s3.amazonaws.com
7. Modify 'AWS External Creds' external credentials:
- Region: bucket's region name from (ex. eu-north-1)
- AWS Account ID: created user Id from IAM page (ex. 886436940600)
- Prinicpal's Access Key and Access Secret: user's key and secret
- Principal's IAM Role ARN: created user ARN from IAM page (ex. arn:aws:iam::886436940600:user/SalesforceIntegrationUser)
8. Deploy AWSIntegration.cls and execute the following snippet in the dev console:

```
String fileName = 'testfile.txt';
String fileContent = 'Hello from Salesforce!';
// Create txt file in the bucket
String uploadResult = AWSIntegration.uploadFileToS3(fileName, fileContent);
System.debug(uploadResult);
// Retrieve created file's text
String retrieveResult = AWSIntegration.getFileFromS3(fileName);
System.debug(retrieveResult);
```
