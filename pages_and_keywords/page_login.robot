*** Settings ***
Resource                ../credentials/login_variables.robot
Resource                page_dashboard.robot

*** Variables ***

${login_pg_label_login}                  Login
${login_pg_title}                        Hotel Accomodation - login page

#login form
${login_pg_user_textfield}               id=formLogin:login
${login_pg_password_textfield}           id=formLogin:senha
${login_pg_btn_login}                    name=formLogin:j_idt27



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
   
    