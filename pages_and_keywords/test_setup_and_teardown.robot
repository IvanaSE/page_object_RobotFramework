***Settings ***
Resource        ../credentials/environment_variables.robot 
Resource        page_login.robot   


*** Keywords ***
Setup
    Set Environment Variable                   ${driver_name}               ${chromedriver_location}
    Open Browser                               ${base_URL}                  browser=${chrome_browser} 
    Maximize Browser Window            
    Set Selenium Speed                         .2
    Set Selenium Timeout                       30
    Delete All Cookies
    Wait Until Page Contains                   ${login_pg_label_login}  
    Location Should be                         ${base_url}   
    Title Should be                            ${login_pg_title}         
    
Teardown
    Close all Browsers
