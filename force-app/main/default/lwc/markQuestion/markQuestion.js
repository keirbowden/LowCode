import { LightningElement, api } from 'lwc';
import MarkQuestionApex from '@salesforce/apex/MarkQuestionController.MarkQuestion';
import { FlowAttributeChangeEvent, FlowNavigationNextEvent } from 'lightning/flowSupport';

export default class MarkQuestion extends LightningElement {
    _questionId;
    _radioChosen;
    _selectChosen;

    @api
    get questionId() 
    {
        return this._questionId;
    }

    set questionId(id)
    {
        this._questionId=id;
        this.markQuestion();
    }

    @api
    get radioChosen() 
    {
        return this._radioChosen;
    }

    set radioChosen(value)
    {
        this._radioChosen=value;
        this.markQuestion();
    }

    @api
    get selectChosen() 
    {
        return this._selectChosen;
    }

    set selectChosen(value)
    {
        this._selectChosen=value;
        this.markQuestion();
    }

    get correct() 
    {
        return this._correct;
    }

    @api
    set correct(value)
    {
        this._correct=value;
     }

    markQuestion()
    {
        console.log('Id = ' + this._questionId + ', select = ' +
         this._selectChosen + ', radio = ' + this._radioChosen);
        if ( (this._questionId) && 
             (this._radioChosen || this._selectChosen) )
        {
            MarkQuestionApex({questionId: this._questionId, 
                              answers: (this._radioChosen?this._radioChosen:this._selectChosen)})
            .then(result => {
                console.log('Result = ' + result);
                const attributeChangeEvent = new FlowAttributeChangeEvent('correct', result);
                this.dispatchEvent(attributeChangeEvent);
                const navigateNextEvent = new FlowNavigationNextEvent();
                this.dispatchEvent(navigateNextEvent);
            })
            .catch(error => {
                this.error = error;
            });
        }
    }
}