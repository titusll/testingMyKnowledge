import { LightningElement, api, wire } from 'lwc';
import returnFilteredCases from '@salesforce/apex/OpportunityUtils.returnFilteredCases';

export default class CaseListFilter extends LightningElement {

    @api priorityChosen;

    dataList = [];

    columns = [
    { label: 'Case Number', fieldName: 'CaseNumber' },
    { label: 'Subject', fieldName: 'Subject' },
    { label: 'Priority', fieldName: 'Priority' }]; 

    connectedCallback(){
      console.log('CONNECTED CALLBACK');
      console.log(this.priorityChosen);
      this.showCases();
    }

    renderedCallback() {
        this.showCases();
    }

    async showCases(){
      const caseResults = await returnFilteredCases({prioritySelect: this.priorityChosen});
      this.dataList = caseResults;

      console.log('nothing');
    }
}