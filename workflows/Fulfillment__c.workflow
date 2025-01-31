<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Clear_Fulfillment_Date</fullName>
        <description>The Fulfillment Date is cleared when the Status is set to Open</description>
        <field>Fulfillment_Date__c</field>
        <name>Clear Fulfillment Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fulfillment_Status_Closed</fullName>
        <description>Fulfillment Status is set to Closed</description>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Fulfillment Status Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fulfillment_Status_Open</fullName>
        <description>Fulfillment Status is set to Open</description>
        <field>Status__c</field>
        <literalValue>Open</literalValue>
        <name>Fulfillment Status Open</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Fulfillment_Date</fullName>
        <description>The Fulfillment Date is set to the same date the Status is set to Closed</description>
        <field>Fulfillment_Date__c</field>
        <formula>TODAY()</formula>
        <name>Set Fulfillment Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Fulfillment Status to Closed when all Fulfillment Items are Complete and%2For Cancelled</fullName>
        <actions>
            <name>Fulfillment_Status_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Fulfillment_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Open_Fulfillment_Items__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <description>When there are zero Open Fulfillment Item records of Status &apos;Ready&apos; or &apos;In Progress&apos;,  then the Fulfillment Status is set to Closed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Fulfillment Status to Open when all Fulfillment Items are Ready and%2For In Progress</fullName>
        <actions>
            <name>Clear_Fulfillment_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Fulfillment_Status_Open</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Open_Fulfillment_Items__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>When there more than zero Open Fulfillment Item records of Status &apos;Ready&apos; or &apos;In Progress&apos;, then the Fulfillment Status is set to Open.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
