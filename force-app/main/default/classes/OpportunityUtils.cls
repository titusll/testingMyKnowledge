public with sharing class OpportunityUtils {

    public OpportunityUtils() {

    }

    public static Decimal getOppsForAcc(Id accountId){

        String[] closed = new String[] {'Closed Won', 'Closed Lost'};
        Decimal total = 0;

        List<Opportunity> oppsForAcc  = [SELECT Id, Amount FROM Opportunity WHERE AccountId = :accountId AND StageName NOT IN :closed];

        for (Opportunity o : oppsForAcc){
            total = total + o.Amount;
        }
        return total;
    }

    public static List<Account> accsWithOpps(){

        List<Account> accs = [SELECT Id, (SELECT Id FROM Opportunities) FROM Account];

        List<Account> moreThanFive = new List<Account>();

        for (Account acc : accs){
            if (acc.Opportunities.size()> 5){

                moreThanFive.add(acc);
            }
        }
        return moreThanFive;
    }


    public static void govLimits(){

        List<Account> accs = [SELECT Id, Name FROM Account];

        for (Account a : accs){
            List<Contact> cons = [SELECT Id FROM Contact Where AccountId = :a.Id];
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Case> returnFilteredCases(String prioritySelect){

        List<Case> casesFiltered = [SELECT Id, CaseNumber, Subject, Priority FROM Case WHERE Priority = :prioritySelect];

        System.debug(casesFiltered.size());
        return casesFiltered;
    }
}
