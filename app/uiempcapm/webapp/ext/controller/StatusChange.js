sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        onStatusChange: function(oContext, aSelectedContexts) {
            // MessageToast.show("Custom handler invoked.");
            var oID = oContext.getObject().ID;
            var oAction = "updateEMPStatus";
            var omInParameters = {
                    model: this.getModel(),
                    parameterValues: [{
                        type: "employeeId",
                        value: oID
                    }],
                    skipParameterDialog: true
            };
            this.editFlow.invokeAction(oAction,omInParameters).then(function(response){
                if(response){
                    this._controller.getExtensionAPI().refresh();
                }
            }.bind(this));
        }
    };
});
