## GitHub Actions for Salesforce CI/CD

# Secrets
Go to Settings -> Secrets and variables -> Actions -> Secrets
1. DEVHUB_TOKEN - needed for auth
- populate it with SF User API key (API key can be retrieved via CLI command: sf org display --target-org my-org --verbose --json > authFile.json)

# Variables 
Go to Settings -> Secrets and variables -> Actions -> Variables
1. DEFAULT_QA_USERNAME - QA template username 
2. DEFAULT_USER_QA - real email of the QA Engineer
3. DEFAULT_REGULAR_USERNAME - username for user with regular permissions 
4. DEFAULT_USER_DEV - real email of the Main Developer

## Actions
# create-scratch
Process:
- Create scratch org 
- Deploy metadata 
- Assign permission set to dev 
- Create QA and regular users. Assign permission sets to them
- Create force.com site for further usage with webhooks. Assign permission set to site guest user
- Shows created user credentials and webhook link

# process-pull-request
Process:
- Run Apex PMD
- Create scratch org 
- Deploy metadata 
- Run Apex Unit Tests