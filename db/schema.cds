namespace empcapm.db;
using { cuid, managed, sap.common.Countries } from '@sap/cds/common';


type commonFieldsEMP {
    firstName: String(100);
    lastName: String(100);
    address: String(200);
    mobile: String(13);
    email: String(200);
}

entity Employees : cuid, managed, commonFieldsEMP {
    salary: Decimal(10,2);
    designation: String(100);
    country: Association to Countries;
    FamilyMembers: Composition of  many FamilyMembers on FamilyMembers.employee = $self;
}

entity FamilyMembers : cuid,managed,commonFieldsEMP {
    relationship: String;
    employee: Association to Employees;
}