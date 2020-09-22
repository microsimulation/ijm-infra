# Build and Deploy procedures

You can find the code of the CI pipeline in ijm repository under .github/workflows folder.

## Main CI pipeline
    This is a main pipeline that build and deploys new application.
    It has 2 triggers - push to the master branch[all files except assets folder] and manual trigger. 

### Build 
    Build phase consists of several stages:
        * Build API docker image
        * Build Journal docker image
        * Prepare test environment
        * Run tests. Note - this step provides artifacts that could be downloaded from GitHub Actions.
        * Examine test results for failed tests. If there`s any next phases will be skipped.

### Deploy  
    Deploy phase consists of next stages:
        * Push API and Journal docker images into ECR
        * Prepare updated configs
        * Upload updated configs into target server
        * Deploy new application

## Assets CI pipeline
    This pipeline will update additional files for articles, like pdf, images, etc..
    Triggers - push to the master branch[assets directory only] and manual trigger

    Steps:
        * Sync github with S3 bucket ijm-elife-assets-bucket
        * Sync S3 bucket with server

## Smoke CI pipeline
    This pipeline will run whole test suite against production environment.
    Triggers - manual trigger only