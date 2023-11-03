# README


### Create Minimal Requirements.txt

Use the following statement instead of pip freeze because pip freeze installs all dependencies (not just minimally required ones).

```
python -m  pipreqs.pipreqs --encoding utf-8  .
```


### To Deploy:

This will deploy your app to an AWS lambda. This assumes you have the serverless CLI installed and your AWS credentials configured in your shell's environment variables.

```
serverless deploy
```


### To Run:

This will deploy the app to localhost:8000

```
uvicorn main:app --reload
```
