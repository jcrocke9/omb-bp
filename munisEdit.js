function OrgObjLine(ombpMdOrg, ombpMdObj, ombpMdAmt) {
    'use strict';
    var self, typeToJson;
    self = this;
    typeToJson = '{"type": "SP.Data.MunisDataListItem" }';
    self.__metadata = JSON.parse(typeToJson);
    self.ombpMdOrg = ko.observable(ombpMdOrg).extend({ maxLength: 8 });
    self.ombpMdObj = ko.observable(ombpMdObj).extend({ maxLength: 5 });
    self.ombpMdAmt = ko.observable(ombpMdAmt);
    console.log(ombpMdOrg, ombpMdObj, ombpMdAmt);
}
function lineItemToJson(mdLine, shTitle, ombpDept2, ombpFocusArea2, ombpProgram) {
    'use strict';
    return JSON.stringify({
        "__metadata": mdLine.__metadata,
        "Title": shTitle,
        "ombpMdOrg": mdLine.ombpMdOrg(),
        "ombpMdObj": mdLine.ombpMdObj(),
        "ombpMdAmt": mdLine.ombpMdAmt(),
        "ombpDept2": ombpDept2,
        "ombpFocusArea2": ombpFocusArea2,
        "ombpProgram": ombpProgram
    });
}
function lineItemToJsonEdit(mdLine) {
    'use strict';
    return JSON.stringify({
        "__metadata": mdLine.__metadata,
        "ombpMdOrg": mdLine.ombpMdOrg,
        "ombpMdObj": mdLine.ombpMdObj,
        "ombpMdAmt": mdLine.ombpMdAmt
    });
}
function generateUUID() {
    'use strict';
    var d, uuid;
    d = new Date().getTime();
    uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c == 'x' ? r : (r & 0x7 | 0x8)).toString(16);
    });
    return uuid;
}
ko.extenders.required = function (target, overrideMessage) {
    target.hasError = ko.observable();
    target.validationMessage = ko.observable();

    function validate(newValue) {
        target.hasError(newValue ? true : false);
        target.validationMessage(newValue ? "" : overrideMessage || "This field is required");
    }

    validate(target());
    target.subscribe(validate);
    return target;
}

function OrgObjViewModel() {
    'use strict';
    var self = this;

    //region
    self.ombpDept2 = ko.observable();
    self.ombpFocusArea2 = ko.observable();
    self.ombpProgram = ko.observable();
    self.shortTitle = ko.observable($("#ctl00_ctl39_g_eb0bfa7d_c547_4dd0_8d45_572e435538dc_ff11_ctl00_ctl00_TextField").val()); //.extend({ required: "Proposed Short Title: Required"});
    console.log(self.shortTitle());
    self.fte = ko.observable("0").extend({ number: true });
    self.revenue = ko.observable("0").extend({ number: true });
    self.expenditure = ko.observable("0").extend({ number: true });
    self.net = ko.pureComputed(function () {
        var value = Number(self.expenditure()) - Number(self.revenue());
        return value ? value.toFixed(2) : "0.00"; //"$" + 
    }, self);

    // Impact
    self.ombpImpactRev02 = ko.observable("0").extend({ number: true });
    self.ombpImpactExp02 = ko.observable("0").extend({ number: true });
    self.ombpImpactNet02 = ko.pureComputed(function () {
        var value = Number(self.ombpImpactExp02()) - Number(self.ombpImpactRev02());
        return value ? value.toFixed(2) : "0.00";
    }, self);
    self.ombpImpactRev03 = ko.observable("0").extend({ number: true });
    self.ombpImpactExp03 = ko.observable("0").extend({ number: true });
    self.ombpImpactNet03 = ko.pureComputed(function () {
        var value = Number(self.ombpImpactExp03()) - Number(self.ombpImpactRev03());
        return value ? value.toFixed(2) : "0.00";
    }, self);
    self.ombpImpactRev04 = ko.observable("0").extend({ number: true });
    self.ombpImpactExp04 = ko.observable("0").extend({ number: true });
    self.ombpImpactNet04 = ko.pureComputed(function () {
        var value = Number(self.ombpImpactExp04()) - Number(self.ombpImpactRev04());
        return value ? value.toFixed(2) : "0.00";
    }, self);
    self.ombpImpactRev05 = ko.observable("0").extend({ number: true });
    self.ombpImpactExp05 = ko.observable("0").extend({ number: true });
    self.ombpImpactNet05 = ko.pureComputed(function () {
        var value = Number(self.ombpImpactExp05()) - Number(self.ombpImpactRev05());
        return value ? value.toFixed(2) : "0.00";
    }, self);
    //endregion
    // Editable data
    self.orgobj = ko.observableArray(
        [new OrgObjLine("", "", "")]
    );
    self.orgobjExisting = ko.observableArray();

    // Get munis data from sharepoint
    var shortTitleVal = $("#ctl00_ctl39_g_eb0bfa7d_c547_4dd0_8d45_572e435538dc_ff11_ctl00_ctl00_TextField").val();

    console.log(shortTitleVal);

    // create the request endpoint
    var appWebUrl = _spPageContextInfo.webAbsoluteUrl;
    var joeCheckUrl =
        appWebUrl
        + '/_api/web/lists/GetByTitle(\'MunisData\')'
        + '/items?$filter=Title+eq+\'' + shortTitleVal + '\'';

    $.ajax(
        {
            url: appWebUrl
            + '/_api/web/lists/GetByTitle(\'MunisData\')'
            + '/items?$filter=Title+eq+\'' + shortTitleVal + '\'',
            method: 'GET',
            accepts: {
                json: 'application/json;odata=verbose',
                xml: 'text/xml'
            },
            dataType: "json",
            success: function (data, textStatus) {
                console.log('JoeSuccess', joeCheckUrl, textStatus, data.d.results[0].ombpMdAmt, data);
                self.addOrgobjFromSp(data.d.results[0].ombpMdOrg, data.d.results[0].ombpMdObj, data.d.results[0].ombpMdAmt);
            },
            error: function (data, textStatus) {
                console.log('JoeError', joeCheckUrl, textStatus, data);
            }
        }
    );


    // Operations
    self.addOrgobj = function (ombpMdOrg, ombpMdObj, ombpMdAmt) {
        self.orgobj.push(new OrgObjLine("", "", ""));

    };
    self.addOrgobjFromSp = function (ombpMdOrg, ombpMdObj, ombpMdAmt) {
        console.log(ombpMdOrg, ombpMdObj, ombpMdAmt);
        self.orgobjExisting.push(new OrgObjLine(ombpMdOrg, ombpMdObj, ombpMdAmt));

    };
    self.removeOrgobj = function (line) { self.orgobj.remove(line); };
    self.createOrgObjBatch = function (orgObjArray) {
        alert(orgObjArray);
        createTheBatchToGo(orgObjArray, self.shortTitle(), self.ombpDept2(), self.ombpFocusArea2(), self.ombpProgram());
    };
    self.editOrgObjBatch = function (orgObjArray) {
        var mdLine = lineItemToJsonEdit(orgObjArray[0]);
        alert(mdLine);
        editTheBatchToGo(mdLine); // , self.shortTitle(), self.ombpDept2(), self.ombpFocusArea2(), self.ombpProgram()
    };

    function createTheBatchToGo(orgObjAsJson, shTitle, dept2, focusArea2, program) {


        // generate a batch boundary
        var batchGuid = generateUUID();

        // creating the body
        var batchContents = new Array();
        var changeSetId = generateUUID();

        // get current host
        var temp = document.createElement('a');
        temp.href = _spPageContextInfo.webAbsoluteUrl;
        var host = temp.hostname;

        // for each orgobj...
        for (var mdLineIndex = 0; mdLineIndex < orgObjAsJson().length; mdLineIndex++) {
            var mdLine = lineItemToJson(orgObjAsJson()[mdLineIndex], shTitle, dept2, focusArea2, program);

            // create the request endpoint
            var endpoint = _spPageContextInfo.webAbsoluteUrl
                + '/_api/web/lists/GetByTitle(\'MunisData\')'
                + '/items';

            // create the changeset
            batchContents.push('--changeset_' + changeSetId);
            batchContents.push('Content-Type: application/http');
            batchContents.push('Content-Transfer-Encoding: binary');
            batchContents.push('');
            batchContents.push('POST ' + endpoint + ' HTTP/1.1');
            batchContents.push('Content-Type: application/json;odata=verbose');
            batchContents.push('');
            batchContents.push(mdLine); //JSON.stringify()
            batchContents.push('');
        }

        // END changeset to update data
        batchContents.push('--changeset_' + changeSetId + '--');


        // generate the body of the batch
        var batchBody = batchContents.join('\r\n');

        // start with a clean array
        batchContents = new Array();

        // create batch for creating items
        batchContents.push('--batch_' + batchGuid);
        batchContents.push('Content-Type: multipart/mixed; boundary="changeset_' + changeSetId + '"');
        batchContents.push('Host: alexandriava1.sharepoint.com')
        batchContents.push('Content-Length: ' + batchBody.length);
        batchContents.push('Content-Transfer-Encoding: binary');
        batchContents.push('');
        batchContents.push(batchBody);
        batchContents.push('');



        // create request in batch to get all items after all are created
        endpoint = _spPageContextInfo.webAbsoluteUrl
            + '/_api/web/lists/GetByTitle(\'MunisData\')'
            + '/items';
        batchContents.push('--batch_' + batchGuid + '--');

        batchBody = batchContents.join('\r\n');

        // create the request endpoint 
        var endpoint = _spPageContextInfo.webAbsoluteUrl
            + '/_api/$batch';

        // batches need a specific header
        var batchRequestHeader = {
            'X-RequestDigest': jQuery("#__REQUESTDIGEST").val(),
            'Content-Type': 'multipart/mixed; boundary="batch_' + batchGuid + '"'
        };
        // create request
        jQuery.ajax({
            url: endpoint,
            type: 'POST',
            headers: batchRequestHeader,
            data: batchBody,
            success: function (response) {

                var responseInLines = response.split('\n');

                // read each line until you find JSON...
                for (var currentLine = 0; currentLine < responseInLines.length; currentLine++) {
                    try {
                        // parse the JSON response...
                        var tryParseJson = JSON.parse(responseInLines[currentLine]);

                        // clear the view model
                        self.orgobj(); // []
                        // set response > lines collection
                        self.orgobj(tryParseJson.d.results);

                    } catch (e) {
                        // don't do anything... just keep moving
                    }
                }
            },
            fail: function (error) {

            }
        });
    };
    // ##############################################################################################################################################
    function editTheBatchToGo(orgObjAsJson) { // , shTitle, dept2, focusArea2, program

        // get current host
        var temp = document.createElement('a');
        temp.href = _spPageContextInfo.webAbsoluteUrl;
        var host = temp.hostname;
       

        // create the request endpoint
        var endpoint = _spPageContextInfo.webAbsoluteUrl
            + '/_api/web/lists/GetByTitle(\'MunisData\')'
            + '/items(\'647\')';
        var batchRequestHeader = {    
            'X-RequestDigest': jQuery("#__REQUESTDIGEST").val(),
            'IF-MATCH': '*',
            'X-HTTP-Method': 'MERGE',
            accept: 'application/json;odata=verbose',
            'Content-Type': 'application/json;odata=verbose'
        };

        // create request
        jQuery.ajax({
            url: endpoint,
            type: 'POST',
            headers: batchRequestHeader,
            data: orgObjAsJson,
            success: function (response) {

                var responseInLines = response.split('\n');

                // read each line until you find JSON...
                for (var currentLine = 0; currentLine < responseInLines.length; currentLine++) {
                    try {
                        // parse the JSON response...
                        var tryParseJson = JSON.parse(responseInLines[currentLine]);

                        // clear the view model
                        self.orgobj(); // []
                        // set response > lines collection
                        self.orgobj(tryParseJson.d.results);

                    } catch (e) {
                        // don't do anything... just keep moving
                    }
                }
            },
            fail: function (error) {

            }
        });
    };
};
$(document).ready(function ($) {
    //GetList();
    var appWebUrl = _spPageContextInfo.webAbsoluteUrl;
    ko.applyBindings(new OrgObjViewModel());

});


$('#joePrivateDiv').scroll(function () {
    $('#joeFixedDiv').css('top', $(this).scrollTop());
});
