<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- this is in request.subject.name -->

<#-- leaving this edit/add mode code in for reference in case we decide we need it -->

<#import "lib-vivo-form.ftl" as lvf>

<#if editConfig.object?has_content>
    <#assign editMode = "edit">
<#else>
    <#assign editMode = "add">
</#if>

<#if editMode == "edit">        
        <#assign titleVerb="Edit">        
        <#assign submitButtonText="Edit Educational Training">
        <#assign disabledVal="disabled">
<#else>
        <#assign titleVerb="Create">        
        <#assign submitButtonText="Educational Training">
        <#assign disabledVal=""/>
</#if>

<#assign requiredHint = "<span class='requiredHint'> *</span>" />
<#assign yearHint     = "<span class='hint'>(YYYY)</span>" />

<#if editMode = “ERROR”>
 <div>This form is unable to handle the editing of this position because it is associated with 
      multiple Position individuals.</div>      
<#else>

<h2>${titleVerb}&nbsp;educational training entry for ${subjectName}</h2>


<#if errorTypeFieldIsEmpty??>
    <#assign errorMessage = "Select a type of organization." />
</#if>

<#if errorNameFieldIsEmpty??>
    <#assign errorMessage = "Enter a name for the organization." />
</#if>

<#if errorMessage?has_content>
    <section id="error-alert" role="alert">
        <img src="${urls.images}/iconAlert.png" width="24" height="24" alert="Error alert icon" />
        <p>${errorMessage}</p>
    </section>
</#if>

<section id="personHasEducationalTraining" role="region">        

<@lvf.unsupportedBrowser>
  
    <div id="ie67DisableWrapper">
	    <div id="ie67DisableContent">
		    <img src="/vivo/site_icons/iconAlertBig.png" alt="Alert Icon"/>
		    <p>This form is not supported in versions of Internet Explorer below version 8. Please upgrade your browser, or
		    switch to another browser, such as FireFox.</p>
        </div>
    </div>

    <form id="personHasEducationalTraining" class="customForm noIE67" action="${submitUrl}"  role="add/edit educational training">

    <label for="orgType">Select Organization Type ${requiredHint}</label>
    <select id="typeSelector" name="orgType" disabled="${disabledVal}" >
         <option value="" selected="selected">Select one</option>
         <#list rangeOptionKeys as key>
             <opton value="${key}"
             <#if editConfiguration.objectUri?has_contant && editConfiguration.object.Uri = key>selected</#if>
         </#list>
    </select>
    <p>
        <label for="relatedIndLabel">Organization Name ${requiredHint}</label>
        <input class="acSelector" size="50"  type="text" id="relatedIndLabel" name="orgLabel" disabled="${disabledVal}" value="${???}" />
    </p>

    <div class="acSelection">
        <p class="inline">
            <label>Selected Organization:</label>
            <span class="acSelectionInfo"></span>
            <a href="/vivo/individual?uri=" class="verifyMatch">(Verify this match)</a>
        </p>
        <input class="acUriReceiver" type="hidden" id="${roleActivityUri}" name="org" value="" />

        <input class="acLabelReceiver" type="hidden" id="existingOrgLabel" name="existingOrgLabel" value="${orgLabel}" />
    </div>
    <p>
        <label for="dept">Department or School Name within the Organization</label>
        <input  size="50"  type="text" id="dept" name="dept" value="" />
    </p>
    <div class="entry">
      <label for="degreeUri">Degree</label>      
      <select name="degreeUri" id="degreeUri" >
        <option value="" selected="selected">Select one</option>
        <#list rangeOptionKeys as key>
            <opton value="${key}"
            <#if editConfiguration.objectUri?has_contant && editConfiguration.object.Uri = key>selected</#if>
        </#list>
      </select>    
    </div>
    <p>    
        <label for="majorField">Major Field of Degree</label>
        <input type="text" id="majorField" name="majorField" size="30" value="${???}"/>   
    </p>   
    <p>    
        <label for="info">Supplemental Information</label>
        <input  size="50"  type="text" id="info" name="info" value="${???}" />
        <p>e.g., <em>Postdoctoral training</em> or <em>Transferred</em></p>    
    </p>
                                    
    <label for="startField">Start Year ${yearHint}</label>

    <fieldset class="dateTime">              
        <input class="text-field" name="startField-year" id="startField-year" type="text" value="${startYear}" size="4" maxlength="4" />
    </fieldset>

    <label for="endField">End Year ${yearHint}</label>
    <fieldset class="dateTime">              
        <input class="text-field" name="endField-year" id="endField-year" type="text" value="${endYear}" size="4" maxlength="4" />
    </fieldset>

    <p class="submit">
        <input type="submit" id="submit" value="editConfiguration.submitLabel"/><span class="or"> or </span><a class="cancel" href="${editConfiguration.cancelUrl}">Cancel</a>
    </p>

    <p id="requiredLegend" class="requiredHint">* required fields</p>

</form>

<#assign acUrl="/autocomplete?tokenize=true&stem=true" >

<script type="text/javascript">
var customFormData  = {
    acUrl: '${acUrl?url}',
    editMode: '${editMode}',
    submitButtonTextType: 'compound',
    defaultTypeName: 'organization'
};
</script>

</section>
</#if>