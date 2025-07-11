import { LightningElement } from 'lwc';

export default class CasePrioritySelector extends LightningElement {

    priorityChosen;
    
    options = [
    { label: 'High', value: 'High' },
    { label: 'Low', value: 'Low' },
    { label: 'Dunno', value: 'dunno' }
];

    onstatusChange(event){

        console.log('Inside status change')
        this.priorityChosen = event.detail.value;
              console.log(this.priorityChosen);
    }
}