*** Settings ***
Resource                                         ../base.robot
*** Variables ***
${Selected_Variant}                              select[name="selectedVariant"]
${Input_Name}                                    input[name="name"]
${Input_Email}                                   input[name="email"]
${Input_Cpf}                                     input[name="cpf"]
${Input_Phone}                                   input[name="phone"]
${Checbox_Email}                                 input[name="mailing"]
${Checbox_Whatsapp}                              input[name="whatsapping"]
${Checbox_Phone}                                 input[name="phoning"]
${Lead_Form_Body}                                css=.form-conversion__body
${WhatsApp_Form_Body}                            css=.form-modal.form-modal--whatsapp
${Lead_Conversion_Button}                        button >> text="ESTOU INTERESSADO"
${WhatsApp_Chat_Button}                          button >> text="Converse agora!"
${Input_Vehicle}                                 input[class='choices__input choices__input--cloned']
${Vehicle_Dropdown}                              xpath=(//div[@class='form-conversion__body']//div[@class='choices'])
${Success_Message}                               xpath=//div[@class='form-conversion__body']//..//div[text()='Solicitação realizada com sucesso!']
${Button_close_Modal}                            xpath=//div[@class='form-conversion__body']//..//a[text()='Fechar']
${Select_Unit}                                   xpath=//label[text()='Escolha a unidade:']/..//div[@class='choices']
${Option_Unit}                                   xpath=//div[@class='choices__list choices__list--dropdown is-active']//div[@role='option'][contains(.,'
${Change_Vehicle}                                div[class*=custom-check--radio]
${Button_Whataspp}                               id=new-vehicles-showcase_cta-box-button
${WhatsApp_Title_Button}                         css=a[title='Compartilhe no WhatsApp']
${Title_Page}                                    css=h1[class*=title]
${WhatsApp_Title_Modal}                          xpath=//header[text()='Fale pelo WhatsApp']