Avaliação técnica de automação

Para executar o teste utilize o comando abaixo:
    cucumber -p pretty -p producao -p html -p chrome

    -p producao - define a url do ambiente a ser executado
    -p html - define o formato do relatório a ser gerado
        -p json - gera relatorio para exebição no JENKINS
    -p chrome - define o browser a ser executado o teste
        -p iphone - determina que o teste será executado simulando o userAgent "iphone"

Os parametros de configuração estão no arquivo cucumber.yml na raiz do projeto
Os parametros de configuração de execução por dispositivo estao no arquivo env.rb dentro da pasta support
Os prints da execução estão na pasta screenshots test_error para os que falharem e test_passed para os de sucesso
