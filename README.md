# Google cloud knowledge

## Purpose
This repository has two main purposes. The first is to to share knowledge links about google cloud.
The second is to be a google cloud lab to show how to setup a static web page that will show the README.md file content.


## Links
Here we collect information about google cloud. All from blogs, youtube videos, podcasts, github repos to courses and practice exam questions for certifications.
Feel free to update it with new links :) 
### Knowledge links
| Link                                                                        | Information                                                                        |
| --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| [Google cloud blog](https://cloud.google.com/blog/)                         | Google clouds own blog                                                             | 
| [Google cloud youtube channel](https://www.youtube.com/googlecloudplatform) | Google cloud tech youtube kanal                                                    |
| [Google cloud podcast](https://cloud.google.com/podcasts)                   | Google clouds own podcast                                                          |
| [Google cloud github](https://github.com/GoogleCloudPlatform)               | Google clouds own github page                                                      |
| [Google IO](https://io.google/2023)                                         | Google IO event with the latest developer solutions, products, and technology      | 
| [Google next](https://cloud.withgoogle.com/next/)                           | Google NEXT event is a global exhibition of inspiration, innovation, and education |

### Certification links
#### Professional Cloud Developer
| Link                                                                                                             | Description                                          |
| ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [Google professional cloud developer summary page](https://cloud.google.com/learn/certification/cloud-developer) | Google summary page for professional cloud developer |
| [Exam topics developer questions](https://www.examtopics.com/exams/google/professional-cloud-developer/view/)    | Practice questions for professional cloud developer  |

#### Professional Cloud Architect
| Link                                                                                                             | Description                                          |
| ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [Google professional cloud architect summary page](https://cloud.google.com/learn/certification/cloud-architect) | Google summary page for professional cloud architect |
| [Exam topics architect questions](https://www.examtopics.com/exams/google/professional-cloud-architect/)         | Practice questions for professional cloud architect  |


#### Courses & tutorials
| Link                                                                                             | Description                   |
| ------------------------------------------------------------------------------------------------ | ----------------------------- |
| [Get started with terraform](https://cloud.google.com/docs/terraform/get-started-with-terraform) | Google tutorial for terraform |
| [Getting started with terraform](https://www.cloudskillsboost.google/course_templates/443)       | Google course on terraform    |

## Lab
### Prerequisite
* You need to have a google cloud project setup.

You can use cloud shell or use your'e own computer to do this lab.
* Local setup
    * [Google Cloud SDK](https://cloud.google.com/sdk)
    * [git](https://git-scm.com/)
    * [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [Cloud shell](https://cloud.google.com/shell)

## How to run the lab
### Terraform

Terraform handles the resource creation to google cloud.
Run the following commands to create the resources.
If new to terraform check the above terraform links in the [Courses & tutorials section](#courses--tutorials)

1. Authenticate

    Create default credentials. These are used by terraform for authentication:

    ```
    gcloud auth application-default login
    ```

    **or**

    Create an access token that is valid for 1 hour and only in the terminal that you execute the command in. If both options are used, this takes preceedence.

    ```sh
    export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token)
    ```

1. Deploy terraform

    Change directory to /terraform
    ```
    cd terraform
    ```

    Initizialize terraform
    ```
    terraform init
    ```
    
    Create the storage bucket and upload the files that will serve as the static web page in google cloud
    ```
    terraform apply -var google cloud_project_name=<your google cloud project> // Could also set the variable in the terraform.tfvars file
    ```
1. Review result    
    After terraform have runned the url to the static web page will be shown in the terminal eg:

    ```
    Outputs:
    public_url = "https://storage.googleapis.com/<google-cloud-project-name>-static-website-bucket/index.html"
    ```

## More labs
If you want to try more labs forefront has a repo for it. Azure labs is also included there.
* [Internal forefornt repo with azure & google cloud labs](https://github.com/ffcg/ffcg-labs)
