using { empcapm.db as mydb } from '../db/schema';

service MyEmpCapmService {
@odata.draft.enabled
    entity Employees as projection on mydb.Employees;
    entity FamilyMembers as projection on mydb.FamilyMembers;
    entity Designations as projection on mydb.Designations;
}