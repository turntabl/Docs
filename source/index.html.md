---
title:TPMS API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
 

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/turntabl/docs'>Documentation Powered by Turntabl</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Turntabl Project Management System (TPMS) API. This API documentation contains TPMS API endpoints with regards to Time-entry.

The languages used for TPMS Time entry application are Psql, Java and Angular.
 

Some of the technologies used are SAML, Stored Procedure, Aws RDS, etc.

The Application contains various services: Project Service, Employee Service and Logged Hours Service which use same Database.

The Project Service has various functionalities such as add project, list all project, get project by employee ID and delete project




# User 
```shell
#FORMAT OF DATA 
```
Represents user details.

## User attributes:
>
Employee data format:
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
Project data format:
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


Name |Type | Description
--------- | ----------- | -----------
sick_date | Date | Date for sick log.
vacation_date | Date | Date for vacation log.



# Authentication

> To authorize, use this code:


```shell
curl "https://project.services.turntabl.io/" 
```

> Make sure you are a Turntabl employee before assess this API.

TPMS uses SAML to allow access to the API. You can only be registered a new Turntabl employee by the Administrator, TPMS API at our [developer portal](http://turntabl.io/developers).



<aside class="notice">
Make sure you are a Turntabl employee before assess this API
</aside>

# Project  Controller

## Get All Projects


```shell
curl "https://project.services.turntabl.io/v1/api/projects" 
-H  "accept: */*"  
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

This endpoint is use to retrieve all projects.

### HTTP Request


`GET https://project.services.turntabl.io/v1/api/projects`



## Add New Project


```shell
curl "https://project.services.turntabl.io/v1/api/project" 
-H  "accept: */*" 
-H  "Content-Type: application/json" 
-d "{  \"project_name\": \"string\"}"
```


> The above command returns JSON structured like this:

```json

  {   
    "project_name": "string"    
  }

```

This endpoint is use to add new project.

### HTTP Request


`POST https://project.services.turntabl.io/v1/api/project`







## Get Projects Assigned to Employee By His/Her ID


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

This endpoint is use to retrieve a specific employee's project.


### HTTP Request

`GET https://project.services.turntabl.io/v1/api/projects/assigned/employee/id<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Employee to retrieve his/her project





## Assigned Project to Employee


```shell
curl -X POST "https://project.services.turntabl.io/v1/api/project/assign/employee" 
-H  "accept: */*" 
-H  "Content-Type: application/json" 
-d "{  \"employee_email\": \"string\",  \"employee_firstname\": \"string\",  \"employee_id\": 0,  \"employee_lastname\": \"string\",  \"project_id\": 0}"
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

This endpoint is use to assign a project to a specific employee


### HTTP Request

`POST https://project.services.turntabl.io/v1/api/project/assign/employee<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Employee to retrieve his/her project


# Logged Hours Controller

## Get All Logged Hours


```shell
curl -X GET "https://project.services.turntabl.io/v1/api/{end_date}" 
-H  "accept: */*"
```


> The above command returns JSON structured like this:

```json

  {
    "project_id": 1,
    "project_name": "TPMS WEB APP"    
  }

```

This endpoint to retrieves all logged project hours.

### HTTP Request

`GET https://project.services.turntabl.io/v1/api/{end_date}`



## Log Project Hour


```shell
curl "https://project.services.turntabl.io/v1/api/project" 
-H  "accept: */*" 
-H  "Content-Type: application/json" 
-d "{  \"project_name\": \"string\"}"
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

This endpoint is use to log project hours.

### HTTP Request


`POST https://project.services.turntabl.io/v1/api/addloggedproject`


## Log Sick


```shell
curl -X POST "https://project.services.turntabl.io/v1/api/addloggedsick" 
-H  "accept: */*" 
H  "Content-Type: application/json" 
-d "{  \"employee_email\": \"string\",  \"employee_firstname\": \"string\",  \"employee_id\": 0,  \"employee_lastname\": \"string\",  \"sick_date\": \"string\"}"
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
curl -X POST "https://project.services.turntabl.io/v1/api/addloggedvaction" 
-H  "accept: */*" 
-H  "Content-Type: application/json" -
d "{  \"employee_email\": \"string\",  \"employee_firstname\": \"string\",  \"employee_id\": 0,  \"employee_lastname\": \"string\",  \"vacation_date\": \"string\"}"
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

This endpoint is use to assess logged vacation hours

### HTTP Request

`POST https://project.services.turntabl.io/v1/api/addloggedvaction`





## Get All logged Projects


```shell
curl -X GET "https://project.services.turntabl.io/v1/api/getloggedproject" 
-H  "accept: */*"
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

This endpoint is use to get all logged projects

### HTTP Request

`GET https://project.services.turntabl.io/v1/api/getloggedproject`
