#language: pt

@authentication
Funcionalidade: Constract Testing

@contract
Cenário: Validar contrato da criação do token
    Dado a rota da api de criação de token
    Quando realizar uma requisição de criação de token utilizando o método POST
    Então a API irá retornar o código 200 e o token gerado
    E valido o contrato da criação do Token

