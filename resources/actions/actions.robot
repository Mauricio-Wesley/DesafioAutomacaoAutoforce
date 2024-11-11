*** Settings ***
Documentation                                    Ações da página de carrinho
Resource                                         ../base.robot 
*** Keywords ***
Preencher Formulario
    [Arguments]                                  ${Form_Type}                            ${dados}                    ${Submit_Button}                ${Wait_Element}               ${Is_WhatsApp}=False
    ${email}                                     Run Process                             python                      ${EXECDIR}/resources/fixtures/create_email.py
    ${cpf}                                       Run Process                             python                      ${EXECDIR}/resources/fixtures/create_cpf.py
    Run Keyword If                               not ${Is_WhatsApp}                      Selecionar modelo de veiculo                                ${Form_Type}                  ${dados}
    Fill Text                                    ${Form_Type} ${Input_Name}              ${dados["name"]}
    Fill Text                                    ${Form_Type} ${Input_Email}             ${email.stdout}   
    Fill Text                                    ${Form_Type} ${Input_Phone}             ${dados["phone"]} 
    Fill Text                                    ${Form_Type} ${Input_Cpf}               ${cpf.stdout}     
    Selecionar unidade                           ${Is_WhatsApp}                          ${dados}
    Check Checkbox                               ${Form_Type} input[name="${dados["contact"]}"]
    Run Keyword If                               not ${Is_WhatsApp}                      Selecionar veiculo na troca                                 ${Form_Type}                  ${dados}
    Click                                        ${Form_Type} ${Submit_Button}
    Run Keyword If                               ${Is_WhatsApp}                          Verificar Navegacao WhatsApp
    Wait For Elements State                      ${Wait_Element}                         visible
    Run Keyword If                               not ${Is_WhatsApp}                      Fechar Modal
Selecionar modelo de veiculo
    [Arguments]                                  ${Form_Type}                            ${dados}
    Click                                        ${Vehicle_Dropdown} [1]
    Fill Text                                    ${Form_Type} ${Input_Vehicle}   ${dados["vehicle"]}
    Click                                        ${Form_Type} div[data-value='${dados["vehicle"]}']
Selecionar unidade
    [Arguments]                                  ${Is_WhatsApp}                          ${dados}
    IF  ${Is_WhatsApp} == True
        Click                                    xpath=//legend${Select_Unit}                         
    ELSE
        Click                                    xpath=//label${Select_Unit} 
    END
    Click                                        ${Option_Unit}${dados["unit"]}')]
Selecionar veiculo na troca
    [Arguments]                                  ${Form_Type}                            ${dados}
    Click                                        ${Form_Type} ${Change_Vehicle} input[value='${dados["change_vehicle"]}']
    Check Checkbox                               ${Form_Type} input[name="${dados["contact"]}"]
Abrir modal whatsapp
    Click                                        ${Button_Whataspp}
    Wait For Elements State                      ${WhatsApp_Title_Modal}
Verificar Navegacao WhatsApp
    Sleep                                        3
    ${page_id}                                   Get Page Ids
    Switch Page                                  ${page_id}[0]
    Wait For Elements State                      ${WhatsApp_Title_Button}                visible
    Get Title                                    equals                                  Compartilhe no WhatsApp
    Switch Page                                  ${page_id}[1]
    Close Page                                   ${page_id}[0]
Fechar Modal
    Click                                        ${Button_close_Modal}
    Wait For Elements State                      ${Success_Message}                      hidden
