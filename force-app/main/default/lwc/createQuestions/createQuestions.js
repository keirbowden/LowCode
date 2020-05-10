import { LightningElement, wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import HasQuestions from '@salesforce/apex/DataSetupController.HasQuestions';
import CreateQuestionsApex from '@salesforce/apex/DataSetupController.CreateQuestions';

export default class CreateQuestions extends LightningElement {
    questionsCreated=false;

    @wire(HasQuestions)
    hasQuestionsComplete(result) {
        console.log('Result = ' + JSON.stringify(result));
        if (result.data) {
            this.questionsCreated=result.data;
        }
        else if (result.error) {
            const event = new ShowToastEvent({
                variant: 'error',
                title: 'Error',
                message: 'Error checking if questions have been created - ' + result.error
            });
            this.dispatchEvent(event);
        }
    }

    handleCreateQuestions() {
        CreateQuestionsApex()
            .then(result => {
                this.questionsCreated=true;
            })
            .catch(error => {
                const event = new ShowToastEvent({
                    variant: 'error',
                    title: 'Error',
                    message: 'Error creating questions - ' + error
                });
                this.dispatchEvent(event);
            });

    }

}