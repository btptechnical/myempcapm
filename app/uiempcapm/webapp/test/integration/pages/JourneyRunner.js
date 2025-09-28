sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"uiempcapm/test/integration/pages/EmployeesList",
	"uiempcapm/test/integration/pages/EmployeesObjectPage",
	"uiempcapm/test/integration/pages/FamilyMembersObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, FamilyMembersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('uiempcapm') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheFamilyMembersObjectPage: FamilyMembersObjectPage
        },
        async: true
    });

    return runner;
});

