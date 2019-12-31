#!/usr/bin/env bash

gda_path="/autograder/GradescopeDeploymentAutograder"
mv /autograder/source $gda_path
cd $gda_path
# Make sure you edit the settings.sh file to update for your repo.
source settings.sh

mkdir -p $KEY_STORE
# Make sure to include your private key here
if [[ ! -f "deploy_key" ]]; then
    chmod +x gen_deploy_key.sh
    ./gen_deploy_key
    echo "[INFO]: Please add this public deploy_key to your github repo."
    echo ----------------------------------------
    cat deploy_key.pub
    echo ----------------------------------------
    echo "[INFO]: If you want to keep the same keys, please download the deploy_key private key though ssh."
    echo "[WARNING]: A new deploy key will be generated every time you reset up the autograder. This means you will have to update the github repo's deploy key"
fi
chmod 700 $KEY_STORE $DEPLOY_KEY
cp $DEPLOY_KEY $KEY_STORE
echo -e "Host $REPOHOST\n  IdentityFile $KEY_STORE/$DEPLOY_KEY\n  IdentitiesOnly yes\n\n" >> /root/.ssh/config

# To prevent host key verification errors at runtime
ssh-keyscan -t rsa $REPOHOST >> ~/.ssh/known_hosts

# Clone autograder files
code=1
count=0
max=5
sleep=5s
echo "Attempting to clone $REMOTE..."
while [[ $code != 0 ]]; do
    git clone $REMOTE $AGROOT
    code=$?
    if [[ $code != 0 ]]; then
        count=$((count + 1))
        if [[ $count -eq $max ]]; then
            echo "Giving up on cloning the remote repo..."
            exit 1
        fi
        echo "Could not clone the autograder repository, trying again in $sleep."
        sleep $sleep
    fi
done
cd $AGROOT
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
done
echo "Checking out branch $BRANCH..."
git checkout $BRANCH
# Run the setup

FILE=setup.sh
if [[ -f "$FILE" ]]; then
    echo "Found the setup file. Running it..."
    chmod +x $FILE
    ./$FILE
else
    echo "Could not find the setup file in the downloaded repo!"
fi