*** Settings ***
Library  RequestsLibrary

*** Variables ***
${base_url}    http://localhost:8080
${api_url}  CloudService/api/servers/allocate?size=0

*** Test Cases ***
Get_base_url
    create session  baseSession  ${base_url}
    ${response}=    get request  baseSession    /${api_url}
    ${body}=  set variable  ${response.content}
    ${body}=  convert to string  ${body}
    ${Invalid_Response}=    set variable   Minimum server size is 1 Giga
    should contain  ${body}  ${Invalid_Response}
