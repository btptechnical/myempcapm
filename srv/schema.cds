using { empcapm.db as mydb } from '../db/schema';

service MyEmpCapmService {

    entity Employees as projection on mydb.Employees;
    entity FamilyMembers as projection on mydb.FamilyMembers;
    

}