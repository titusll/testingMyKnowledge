import { LightningElement } from 'lwc';

export default class ParentLWCButton extends LightningElement {

    passThisValue = '';

    handleClick() {

        console.log('hello');

        this.passThisValue = 'works';

        console.log(this.passThisValue);
    }
}