#!/usr/bin/env bash

# Make sure to change me to your autograder repo!
source settings.sh

cd /autograder/source

mkdir -p /root/.ssh
cat ssh_config >> /root/.ssh/config
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
cp deploy_key /root/.ssh/deploy_key
# To prevent host key verification errors at runtime
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clone autograder files
code=1
count=0
max=5
sleep=5s
echo "Attempting to clone $REMOTE..."
while [[ $code != 0 ]]; do
    git clone $REMOTE $AGROOT
    code=$?
    if [[ $cose != 0 ]]; then
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
git checkout $branch
# Run the setup
exit
FILE=setup.sh
if test -f "$FILE"; then
    chmod +x $FILE
    ./$FILE
fi
