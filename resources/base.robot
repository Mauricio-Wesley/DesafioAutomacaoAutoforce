* Settings *
Documentation                                    Arquivo que implementa a estrutura inicial do projeto de teste
Library                                          Browser                                 run_on_failure=None
Library                                          OperatingSystem
Library                                          String
Library                                          Process
Resource                                         actions/actions.robot
Resource                                         dictionary/dictionary.robot
*** Variables ***
${BROWSER}                                       chromium
${HEADLESS}                                      ${True}
${HOME_PAGE}                                     https://testes.autoforce.com.br/dealer-bmw-desafio/novos/z4-2022
* Keywords *
Acessar o site
    New Browser                                  browser=${BROWSER}                      headless=${HEADLESS}
    New Context                                  ignoreHTTPSErrors=True
    New Page                                     ${HOME_PAGE}
    Wait For Elements State                      ${Title_Page}
Encerrar teste
    Run Keyword If Test Failed                   Take Screenshot                         embed                         fullPage=True
    Close Browser
Get JSON
    [Arguments]                                  ${nome_arquivo}
    ${arquivo}                                   Get File                                ${EXECDIR}/resources/fixtures/${nome_arquivo}
    ${super_var}                                 Evaluate                                json.loads($arquivo)          json
    RETURN                                       ${super_var}