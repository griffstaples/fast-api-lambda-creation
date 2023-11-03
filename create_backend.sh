#!/bin/zsh


# Declare variables
CONFIG_FILE="config.txt"
SCRIPT_DIR="$( cd "$( dirname "${(%):-%x}" )" && pwd )"

# Check if the configuration file exists
if [ -f "$CONFIG_FILE" ]; then
  # Read and process each line in the configuration file
  while IFS= read -r line; do
    # Use parameter expansion to extract argument name and value
    arg_name="${line%%=*}"
    arg_value="${line#*=}"
    
    # Check if the argument name is not empty
    if [ -n "$arg_name" ]; then
      # Assign the argument value to a variable with the same name
      eval "$arg_name=\"$arg_value\""
    fi
  done < "$CONFIG_FILE"
else
  echo "Config file not found: $CONFIG_FILE"
  exit 1
fi

PROJECT_FULL_PATH="$PROJECT_BASE_PATH/$PROJECT_NAME"


# create folder for project
mkdir -p $PROJECT_FULL_PATH
cd $PROJECT_FULL_PATH

# initialize git
git init

# create github dir for it
gh repo create $PROJECT_NAME --private --source=. --remote=origin

# copy all files necessary files for it to work
echo "Copying files started"
BASE_PROJECT_FILES_PATH="$SCRIPT_DIR/src/backend_base_files"
cp -r $BASE_PROJECT_FILES_PATH/ $PROJECT_FULL_PATH
echo "Copying files done"

# create venv
$PYTHON_VERSION_NAME -m venv ./venv

# install requirements
$PROJECT_FULL_PATH/venv/bin/pip install -r requirements.txt

# install deployment requirements
source ~/.nvm/nvm.sh
nvm use 18
npm install --save-dev serverless-python-requirements

