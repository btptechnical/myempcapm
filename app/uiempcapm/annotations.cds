using MyEmpCapmService as service from '../../srv/schema';
annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'address',
                Value : address,
            },
            {
                $Type : 'UI.DataField',
                Label : 'mobile',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'salary',
                Value : salary,
            },
            {
                $Type : 'UI.DataField',
                Label : 'country_code',
                Value : country_code,
            },
            {
                $Type : 'UI.DataField',
                Value : FamilyMembers.employee.designation_code,
                Label : 'designation_code',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Family Members',
            ID : 'FamilyMembers',
            Target : 'FamilyMembers/@UI.LineItem#FamilyMembers',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'address',
            Value : address,
        },
        {
            $Type : 'UI.DataField',
            Label : 'mobile',
            Value : mobile,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : FamilyMembers.employee.designation_code,
            Label : 'designation_code',
        },
    ],
);

annotate service.FamilyMembers with @(
    UI.LineItem #FamilyMembers : [
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.address,
            Label : 'address',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.email,
            Label : 'email',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.employee_ID,
            Label : 'employee_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.firstName,
            Label : 'firstName',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.lastName,
            Label : 'lastName',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.mobile,
            Label : 'mobile',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.FamilyMembers.relationship,
            Label : 'relationship',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Member Details',
            ID : 'MemberDetails',
            Target : '@UI.FieldGroup#MemberDetails',
        },
    ],
    UI.FieldGroup #MemberDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.employee_ID,
                Label : 'employee_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.firstName,
                Label : 'firstName',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.lastName,
                Label : 'lastName',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.mobile,
                Label : 'mobile',
            },
            {
                $Type : 'UI.DataField',
                Value : employee.FamilyMembers.relationship,
                Label : 'relationship',
            },
        ],
    },
);

annotate service.Employees with {
    designation @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Designations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : designation_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Designation',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : designation_code,
)};

annotate service.Designations with {
    code @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

