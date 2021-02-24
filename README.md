------------------------------------------------------------------------------------

## Project: TF17-aws-codesuite-lab

This project creates an AWS test network in the cloud using Terraform.  

The purpose of this network is to enable the following services to be configured and tested via the AWS Console:

CodeCommit, CodeBuild, CodeDeploy, CodePipeline, CloudWatch, S3 and SNS.

Author: Frank Effrim-Botchey

Library: https://github.com/Frankie116/my-library.git

------------------------------------------------------------------------------------


The network resources listed below can be spun up instantly:

     - n number of EC2 'production' instances in the public subnet.

     - n number of EC2 'production' instances in the private subnet.

     - n number of EC2 'development' instances in the public subnet.

     - n number of EC2 'development' instances in the private subnet.



All EC2 instances:

     - Are configured in either a public or private subnet in a custom VPC.

     - Have a pre-configugred golden ami with the CodeDeploye agent installed.

     - Have an IAM role attatched to allow CodeDeploy/S3 access.

     - Have security groups configured to allow ssh, http & https access.




In this environment the following has been successfully tested:

     - All code within the 'my-webpage' local directory is pushed to CodeCommit.

     - CodeCommit Repo is then used to store/manage the code.

          - CodeCommit triggers SNS to send an email to a user each time new code is committed, or pull request is successfully merged.

     - CodeBuild is used to test code.

          - The test ensures the word 'congratulations' is present in the webpage source code. If not, the build fails.

     - CodeDeploy is used to install the application onto the EC2 instances.

          - 'Production' & 'Development' deployment groups were created. (Specified by their 'Environment' tags)

          - Various deployments were configured and executed as 'Blue/Green', 'AllAtOnce' or 'LinearPercentage'.

     - CodePipeline is used to orchestrate the whole deployment run.

          - Code is updated in local directory and pushed to CodeCommit.

          - CodeCommit triggers email and also a Cloudwatch alarm that code has been committed.

          - Cloudwatch alarm triggers CodePipeline to take code from CodeCommit and place into S3 bucket.

          - Codepipeline then directs CodeBuild to take the code from S3 and use it for CodeBuild testing phase.

          - If tests pass, then CodePipeline stores code back to S3.  If tests fail, then CodePipeline stops and CloudWatch triggers SNS 'failure' email to be sent.

          - CodePipeline then directs CodeDeploy to take code from S3 and use it to deploy the code to ec2 instances specified in deployment group.

          - CloudWatch triggers SNS to send a 'successful' email to user.

          - Once successfully deployed, the new webpage can be viewed by copying the public IP of ec2 into a browser.


     - Codepipeline is also used with a manual intervention step to authorise & deploy a rollout to production instances once development instances have proven to be successful.



Further Info:

     - The 'my-webpage' directory contains the initial code used by Codecommit, Codebuild, Codedeploy & Codepipeline.

     - Terraform only creates the test network (VPC, subnets, ec2 instances, iam role for codedeploy/ec2, security groups & ssh keypairs.)

     - The AWS Console & CLI were used to configure CodeCommit, CodeBuild, CodeDeploy, CodePipeline, Cloudwatch, S3 & SNS services.
     
     - Further updates to this repo will transorm some of the AWS Console/CLI configuration to Terraform code.
