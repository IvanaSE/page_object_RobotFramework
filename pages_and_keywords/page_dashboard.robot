*** Settings ***
Resource             page_login.robot
Resource             ../credentials/dashboard_variables.robot

*** Variables ***
${dashboard_pg_title}                 Dashboard
${logout_menu}                        xpath=//a[@class='dropdown-toggle']
${logout_submenu}                     xpath=//i[@class='fa fa-sign-out fa-fw']
${dashboard_pg_search_field}          xpath=//*[@id="side-menu"]/li[1]/div/input
${dashboard_pg_search_btn}            xpath=//*[@id="side-menu"]/li[1]/div/span/button/i
${dashboard_pg_search_result_msg}     Search results


*** Keywords ***
perform_logout
    Wait Until Page Contains Element       ${logout_menu}
    click element                          ${logout_menu}
    Wait Until Page Contains Element       ${logout_submenu}
    click element                          ${logout_submenu}
    Wait Until Page Contains               ${login_pg_label_login}
    Title Should be                        ${login_pg_title}
    
perform_search
    Wait Until Page Contains Element       ${dashboard_pg_search_field}  
    click element                          ${dashboard_pg_search_field}  
    Input Text                             ${dashboard_pg_search_field}         ${search_word_1}
    click element                          ${dashboard_pg_search_btn} 
    #this test is going to fail since nothing happens with search         
    Wait Until Page Contains               ${dashboard_pg_search_result_msg}
    
        
