# FastAPI Lambda Creation

This project allows you to easily create a FastAPI backend that is deployed to a AWS Lambda function. 

### Prerequesites

You must install and configure both the `git` CLI and the Github CLI. You must also have a recent version of `nvm`, `node` and `npm` installed and the `serverless` CLI installed globally (`npm install -g serverless`). 

### Running the Script

To create the FastAPI backend you must first choose your configuration in `config.txt`. Then run:

```bash
chmod +x ./create_backend.sh
./create_backend.sh
```

### Follow up tasks and deployment

Once your repository is created, navigate to it and follow the steps in the `TO_DO.md` file to deploy your app.