#language: pt
@compra

Funcionalidade: Fluxo de compra
    Eu como automatizador
    Quero validar um fluxo de compra automatizado com um usuario não cadastrado
    Para que eu posso demonstrar meus conhecimentos de automação

Cenario: Realizar compra com sucesso

    Dado que eu acesse a pagina My Story
    E escolho um produto
    E adiciono o produto no meu carrinho
    E cadastro o meu usuário
    Quando escolhendo a forma de pagamento no checkout
    Então finalizo a compra com sucesso
