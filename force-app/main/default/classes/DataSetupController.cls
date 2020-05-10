public with sharing class DataSetupController 
{
    @AuraEnabled(cacheable=true)
    public static Boolean HasQuestions()
    {
        List<Question__c> questions=[select id from Question__c limit 1];

        return (!questions.IsEmpty());
    }

    @AuraEnabled
    public static void CreateQuestions()
    {
        List<Question__c> questions=new List<Question__c>();

        Question__c toolsQuestion=new Question__c(Name='Tooling',
                                                  Detail__c='Which of the following are low code tools in Salesforce',
                                                  Type__c='Checkbox');
        questions.add(toolsQuestion);

        Question__c frameworkQuestion=new Question__c(Name='Component Framework',
                                                  Detail__c='Choose the component framework that uses modern web standards and JavaScript',
                                                  Type__c='Radio');
        questions.add(frameworkQuestion);

        Question__c workflowQuestion=new Question__c(Name='Workflow',
                                                  Detail__c='Which of the following are workflow actions?',
                                                  Type__c='Checkbox');
        questions.add(workflowQuestion);  

        Question__c apexQuestion=new Question__c(Name='Apex in Flow',
                                                  Detail__c='How can Apex be called from a flow?',
                                                  Type__c='Radio');
        questions.add(apexQuestion);  

        Question__c executeQuestion=new Question__c(Name='Execute Flow',
                                                  Detail__c='What is required to execute a lightning flow?',
                                                  Type__c='Radio');
        questions.add(executeQuestion);  

        
        insert questions;

        List<Answer__c> answers=new List<Answer__c>();
        answers.add(new Answer__c(Name='Appian', 
                                  Question__c=toolsQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Workflow', 
                                  Question__c=toolsQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Kissflow', 
                                  Question__c=toolsQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Visual Lansa', 
                                  Question__c=toolsQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Flow', 
                                  Question__c=toolsQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Aura', 
                                  Question__c=frameworkQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='JQuery', 
                                  Question__c=frameworkQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Lightning Web Components', 
                                  Question__c=frameworkQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Bootstrap Grid System', 
                                  Question__c=frameworkQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Update Records', 
                                  Question__c=workflowQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Post to Chatter', 
                                  Question__c=workflowQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Email Alert', 
                                  Question__c=workflowQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Apex Action', 
                                  Question__c=workflowQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Field Update', 
                                  Question__c=workflowQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Apex Button', 
                                  Question__c=apexQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Apex Controller', 
                                  Question__c=apexQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Apex Action', 
                                  Question__c=apexQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Apex Operation', 
                                  Question__c=apexQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Lightning Container', 
                                  Question__c=executeQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Lightning Runtime', 
                                  Question__c=executeQuestion.Id,
                                  Correct__c=true));

        answers.add(new Answer__c(Name='Lightning VM', 
                                  Question__c=executeQuestion.Id,
                                  Correct__c=false));

        answers.add(new Answer__c(Name='Lightning Context', 
                                  Question__c=executeQuestion.Id,
                                  Correct__c=false));

        insert answers;
    }
}
