# TO DO

After running the backend creation script, there are a few more steps before you're done:

1. Update the serverless.yml file
    * change `service` name
    * exclude any additional files/folders you want to exclude
    * change python runtime version to correct version
    * set the aws-region to correct region
    * update environment variables as needed
    * update `function-name` field
    * update project routes as needed

2. Deploy your app using `serverless deploy`