# GCP information demo
This repo handles knowledge links for google cloud.
The links are stored in a csv file. The csv file is then used by a html page.


 ## GCP Links
 [Links](./links.csv)

 ## How to

 ```
git config --global credential.'https://source.developers.google.com'.helper gcloud.sh
git remote add google https://source.developers.google.com/p/[PROJECT_ID]/r/[REPO_NAME] (git remote add google https://source.developers.google.com/p/daniel-tagt-sbx/r/static-website)

git init
git add .
git commit -m "Initial commit"

git push google main
 ```
