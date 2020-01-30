---
title:TPMS API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
 

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Turntabl's employee time entry system API documentation. This API documentation contains endpoints with regards to our Time entry System.

The languages used for  Turntabl's employee time entry system are Psql, Java and Angular.
 

Some of the technologies used are SAML, Stored Procedure, Aws RDS, etc.

The Application contains various services: Project Service, Employee Service and Logged Hours Service which use the same Database.

The Project Service has various functionalities such as add project, list all project, get project by employee ID and delete project




# Employee 
```shell
#FORMAT OF DATA 
```
Represents employee's details.

## Employee's attributes:
>
Employee's data format:
>

```json

  {
  "employee_id": 0,
  "employee_firstname": "string",
  "employee_lastname": "string",
  "employee_email": "string",  
 } 
```


Name | Type | Description
---------|---------- | -----------
employee_id | Number | unique identifier for employee. 
employee_firstname | String | First Name. 
employee_lastname | String | Last Name.
employee_email | String | Email.


> 
Data format:
>
```json
 {
  "project_id": 0,
  "project_date": "date",
  "project_hours": "string",
  "sick_date": "date",
  "vacation_date": "date",
 }
```



Name |Type| Description
--------- | ----------- | -----------
project_id | Number | unique identifier for project
project_date | Date | Date of project
project_hours | Number | Hours.
sick_date | Date | sick date.
vacation_date | Date | vacation date.



# Authorization

> To access, use this code:


```shell
curl "https://project.services.turntabl.io/v2/api-docs" 
```

> Make sure you are a Turntabl employee before access the Application

User access to the application is authenticated with GSuite SAML. You can only be registered as a new Turntabl employee by the Administrator.



<aside class="notice">
Make sure you are a Turntabl employee before access the Application
</aside>

# Project 

## Get All Projects


```shell
curl -X GET "https://project.services.turntabl.io/v1/api/projects" -H  "accept: */*"  
```


> The above command returns JSON structured like this:

```json

  {
    "project_id": 1,
    "project_name": "TPMS WEB APP"    
  },
  {
   "project_id": 2,
    "project_name": "AWS"   
  }

```

This endpoint is used to retrieve all projects.

### HTTP Request


`GET https://project.services.turntabl.io/v1/api/projects`



## Add New Project


```shell
curl "https://project.services.turntabl.io/v1/api/project" -H  "accept: */*" -H  "Content-Type: application/json" -d "{  \"project_name\": \"string\"}"
```


> The above command returns JSON structured like this:

```json

  {   
    "project_name": "string"    
  }

```

This endpoint is used to add new project.

### HTTP Request


`POST https://project.services.turntabl.io/v1/api/project`


## Get Projects Assigned to Employee By their ID


```shell
curl "https://project.services.turntabl.io/v1/api/projects/assigned/employee/id" 
-H  "accept: */*"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "project_name": "AWS",
  
}
```

This endpoint is used to retrieve a specific employee's project.


### HTTP Request

`GET https://project.services.turntabl.io/v1/api/projects/assigned/employee/id<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Employee to retrieve their project


## Assigned Project to Employee


```shell
curl -X POST "https://project.services.turntabl.io/v1/api/project/assign/employee" -H  "accept: */*" -H  "Content-Type: application/json" -d "{  \"employee_email\": \"string\",  \"employee_firstname\": \"string\",  \"employee_id\": 0,  \"employee_lastname\": \"string\",  \"project_id\": 0}"
```


> The above command returns JSON structured like this:

```json
{
  "employee_email": "francis.billa@turntabl.io",
  "employee_firstname": "francis",
  "employee_id": 4,
  "employee_lastname": "billa",
  "project_id": 2
}
```

This endpoint is used to assign a project to a specific employee


### HTTP Request

`POST https://project.services.turntabl.io/v1/api/project/assign/employee<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Employee to retrieve their project


# Logged Hours

## Get All Logged Hours


```shell
curl -X GET "https://project.services.turntabl.io/v1/api/{end_date}" -H  "accept: */*"
```

> The above command returns JSON structured like this:

```json

  {
    "project_id": 1,
    "project_name": "TPMS WEB APP"    
  }

```

This endpoint retrieves all the hours logged against all projects.

### HTTP Request

`GET https://project.services.turntabl.io/v1/api/{end_date}`


## Log Project Hour


```shell
curl "https://project.services.turntabl.io/v1/api/project" -H  "accept: */*" -H  "Content-Type: application/json" -d "{  \"project_name\": \"string\"}"
```

> The above command returns JSON structured like this:

```json

  {
  "employee_email": "string",
  "employee_firstname": "string",
  "employee_id": 0,
  "employee_lastname": "string",
  "project_date": "date",
  "project_hours": 0,
  "project_id": 0
}

```

This endpoint is used to log project hours.

### HTTP Request


`POST https://project.services.turntabl.io/v1/api/addloggedproject`


## Log Sick


```shell
curl -X POST "https://project.services.turntabl.io/v1/api/addloggedsick" -H  "accept: */*" -H"Content-Type: application/json" -d "{  \"employee_email\": \"string\",  \"employee_firstname\": \"string\",  \"employee_id\": 0,  \"employee_lastname\": \"string\",  \"sick_date\": \"string\"}"
```


> The above command returns JSON structured like this:

```json

  {
  "employee_email": "string",
  "employee_firstname": "string",
  "employee_id": 0,
  "employee_lastname": "string",
  "sick_date": "date"
}

```

This endpoint to retrieves all logged sick hours.

### HTTP Request

`POST https://project.services.turntabl.io/v1/api/addloggedsick`


## Log Vacation


```shell
curl -X POST "https://project.services.turntabl.io/v1/api/addloggedvaction" -H  "accept: */*" -H  "Content-Type: application/json" -d "{  \"employee_email\": \"string\",  \"employee_firstname\": \"string\",  \"employee_id\": 0,  \"employee_lastname\": \"string\",  \"vacation_date\": \"string\"}"
```


> The above command returns JSON structured like this:

```json

 {
  "employee_email": "string",
  "employee_firstname": "string",
  "employee_id": 0,
  "employee_lastname": "string",
  "vacation_date": "date"
}

```

This endpoint is used to assess logged vacation hours

### HTTP Request

`POST https://project.services.turntabl.io/v1/api/addloggedvaction`


## Get All logged Projects


```shell
curl -X GET "https://project.services.turntabl.io/v1/api/getloggedproject" -H  "accept: */*"
```

> The above command returns JSON structured like this:

```json

 {
      "project_id": 7,
      "project_hours": 7,
      "project_date": "2020-01-24",
      "employee_id": 24,
      "employee_firstname": "ali",
      "employee_lastname": "fuseini",
      "employee_email": "ali.fuseini@turntabl.io"
    },
    {
      "project_id": 1,
      "project_hours": 5,
      "project_date": "2020-01-24",
      "employee_id": 25,
      "employee_firstname": "Samuel",
      "employee_lastname": "Osei Kwakye",
      "employee_email": "samuel.kwakye@turntabl.io"
    }

```

This endpoint is used to get all logged projects

### HTTP Request

`GET https://project.services.turntabl.io/v1/api/getloggedproject`