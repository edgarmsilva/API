#language: pt

@contract
Funcionalidade: Constract Testing

Cenário: Validar contrato da criação do token
    Dado a rota da api de criação de token
    Quando realizar uma requisição utilizando o método POST
    Então a API irá retornar o código 200 e o token gerado

