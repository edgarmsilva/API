#language: pt

@booking
Funcionalidade: Constract Testing

@contract
Cenário: Buscar todos os agendamentos
    Dado a rota da api de busca de agendamentos
    Quando realizar uma requisição de agendamentos utilizando o método GET
    Então a API irá retornar o código 200 e a lista de agendamentos
    E valido o contrato busca de todos os agendamentos

@contract @buscaporid
Cenário: Buscar todos os agendamentos
    Dado a rota da api de busca de agendamentos
    Quando realizar uma requisição de agendamentos utilizando o método GET informando um id
    Então a API irá retornar o código 200 e o agendamento correspondente
    E valido o contrato busca de agendamento por id
    
