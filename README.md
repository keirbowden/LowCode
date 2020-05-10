# Bob Buzzard's Low Code Samples

To try this yourself, execute the commands below, replacing <username> with your authorised username for the Salesforce org.

## Deploy the code

push the source to your scratch org using the command:

    sfdx force:source:push -u <username>

or deploy to a developer edition/sandbox using:

    sfdx force:source:deploy -u <username> -p force-app/

## Permissions

Assign yourself the permission set: 

    sfdx force:user:permset:assign -n Low_Code -u <username>

## Lightning Web Components and Flows

See the blog post at: https://bobbuzz.me.uk/LWCFlow


Login to your Salesforce org and choose the Low Code application, then Data Setup tab.

Click the `Create Questions` button

Navigate to Setup -> Flows and run the FlowQuiz or QuizLWC flows.
