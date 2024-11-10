*** Settings ***
Resource                                         ../resources/base.robot                
Test Setup                                       Acessar o site
Test Teardown                                    Encerrar teste
*** Test Cases ***
1
    [Tags]                                       001 - Validar envio do formulário de lead e exibição de mensagem de confirmação após envio bem-sucedido.
    ${dados}                                     Get JSON                                massa_dados.json
    Preencher Formulario                         ${Lead_Form_Body}    ${dados["tc1"]}    ${Lead_Conversion_Button}    ${Success_Message}    Is_WhatsApp=False
2
    [Tags]                                       002 - Validar abertura de formulario de WhatsApp e exibição de mensagem de confirmação após preenchimento e envio.
    ${dados}                                     Get JSON                                massa_dados.json
    Abrir modal whatsapp
    Preencher Formulario                         ${WhatsApp_Form_Body}    ${dados["tc2"]}    ${WhatsApp_Chat_Button}      ${WhatsApp_Title_Modal}    Is_WhatsApp=True