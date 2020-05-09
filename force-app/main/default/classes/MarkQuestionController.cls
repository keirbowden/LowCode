public with sharing class MarkQuestionController 
{
    @AuraEnabled
    public static Boolean MarkQuestion(String questionId, String answers)
    {
        System.debug('In Mark Question - questionid = ' + questionId);
        
        Question__c question=[select id, 
                               (select id, Name, Correct__c from Answers__r)
                              from Question__c
                              where id=:questionId];

        Boolean correct=true;
        for (Answer__c answer : question.Answers__r)
        {
            if ( ((!answer.Correct__c) && (answers.contains(answer.Name))) ||
                  ((answer.Correct__c) && (!answers.contains(answer.Name))) )
            {
                correct=false;
            }
        }

        return correct;
    }
}
