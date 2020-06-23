*** Settings ***
Library  RequestsLibrary

*** Variables ***
${base_url}    http://localhost:8080
${api_url}  CloudService/api

*** Test Cases ***
Get_base_url
    create session  baseSession  ${base_url}
    ${response}=    get request  baseSession    /${api_url}
    ${status_code}=  set variable  ${response.status_code}
    ${status_code}=  convert to string  ${status_code}
    should be equal  ${status_code}  200
