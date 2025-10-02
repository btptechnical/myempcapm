namespace empcapm.db;
using { cuid, managed, sap.common.Countries } from '@sap/cds/common';


type commonFieldsEMP {
    firstName: String(100) @mandatory;
    lastName: String(100);
    address: String(200);
    mobile: String(10);
    email: String(200);
}

entity Employees : cuid, managed, commonFieldsEMP {
    salary: Decimal(10,2) @readonly;   
    country: Association to Countries;
    FamilyMembers: Composition of  many FamilyMembers on FamilyMembers.employee = $self;
    designation: Association to Designations;
    status: Association to Status default 'DCT';
}

entity FamilyMembers : cuid,managed,commonFieldsEMP {
    relationship: String;
    employee: Association to Employees;
}

entity Designations {
    key code : String;
    name: String;
}

entity Status  {
    key code: String;
    name: String;
}