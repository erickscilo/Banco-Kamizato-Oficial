FUNCTION main()
    LOCAL opcao
    LOCAL nSaldo := 0
    LOCAL saque
    LOCAL deposito
    LOCAL loop := 1
    
    cls

    db_start()
    USE conta_corrente

    hb_cdpSelect("UTF8")
    DO WHILE (loop == 1)
        cls

        ? "Olá, bem-vindo ao Banco Kamizato"

        ?
        ? "Saldo Atual: ", Saldo
        ?
        ? "[1] Saque"
        ? "[2] Depósito"
        ? "[3] Sair"
        
            INPUT "Escolha uma opção: " TO opcao
        
        //Saque
            IF (opcao == 1)
                CLS
                ? "Saldo Atual: R$", Saldo
                INPUT "Digite o valor para saque: R$" TO saque

                IF ((Saldo-saque)<0) //Valida se o saldo ficará negativo
                    CLS
                    ? "Seu saldo ficará negativo :("
                    ? "Tecle para voltar!"
                    INKEY(0)
                ENDIF
                IF saque > 0 .AND. ((Saldo-saque)>=0) //Valida se o valor de saque é maior que zero
                    nSaldo := Saldo - saque
                    replace Saldo with nSaldo //Salva no banco de dados o novo Saldo
                    CLS
                    ? "Saque feito com Sucesso!"
                    ? "Tecle para voltar!"
                    INKEY(0)
                ENDIF
                IF (saque <= 0)
                    CLS
                    ? "Valor inválido :("
                    ? "Tecle para voltar!"
                    INKEY(0)
                ENDIF
            ENDIF
        //Depósito
            IF (opcao == 2)
                CLS
                ? "Saldo Atual: R$", Saldo
                INPUT "Digite o valor para depósito: R$" TO deposito

                IF (deposito > 0) //Valida se o deposito é maior que zero
                    nSaldo := Saldo + deposito
                    replace Saldo with nSaldo //Salva no banco de dados o novo Saldo
                    CLS
                    ? "Depósito feito com Sucesso!"
                    ? "Tecle para voltar!"
                    INKEY(0)
                ELSE 
                    CLS
                    ? "Valor inválido :("
                    ? "Tecle para voltar!"
                    INKEY(0)
                ENDIF
            ENDIF
        //Sair
            IF (opcao == 3)
                CLS
                ? "Até logo :)"
                loop := 2 
                INKEY(0)
                CLS
        ENDIF 
    ENDDO 
RETURN

//Verifica se o banco de dados já existe
FUNCTION db_start
    LOCAL aStruct := {{"Saldo", "N", 20, 2}} 
    
    IF .NOT. file ("conta_corrente.dbf")
        dbcreate("conta_corrente" , aStruct)
    ENDIF
    
    USE conta_corrente

    APPEND BLANK //Para gravar dados no DBF precisamos primeiramente criar um registro em branco
RETURN NIL