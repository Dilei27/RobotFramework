*Settings*
Documentation    Suite de Teste do cadastro de personagens na API da Marvel

Resource   ${EXECDIR}/resources/Base.robot    
Library    ${EXECDIR}/resources/factories/Guardians.py 

Suite Setup    Super Setup   papito@yahoo.com  
 
*Test Cases*
Deve cadastrar um personagem

    &{personagem}    Factory Star Lord
    ${response}      POST New Character    ${personagem}    

    Status Should Be    200    ${response}

Não pode cadastrar com o mesmo nome

    #BDD (Desenvolvimento Guiado por Compartamento)
    #Dado que o cliente submeteu o formulário de cadastro do personagem Thanos
        #E que esse personagem já está cadastrado
    #Quando eu faço uma requisição POST para a rota /characters
    #Então o código de status deve ser 409
        #E a mensagem de retorno deve ser " Character already exists :("     

    ${personagem}          Factory Groot
    POST New Character     ${personagem}

    ${response}    POST New Character    ${personagem}

    Status Should Be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(



