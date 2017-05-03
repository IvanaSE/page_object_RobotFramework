*** Settings ***
Resource                ../credentials/login_variables.robot
Resource                page_dashboard.robot

*** Keywords ***

Test_login_into_the_system_as_admin    
    Input Text                               ${login_pg_user_textfield}                    ${username_admin} 
    Input Text                               ${login_pg_password_textfield}                ${password_admin}
    Click Element                            ${login_pg_btn_login} 
    Wait Until Page Contains                 ${dashboard_pg_title}   

Test_login_into_the_system_as_common    
    Input Text                               ${login_pg_user_textfield}                    ${username_common} 
    Input Text                               ${login_pg_password_textfield}                ${password_common}
    Click Element                            ${login_pg_btn_login} 
    Wait Until Page Contains                 ${dashboard_pg_title}   
   
    