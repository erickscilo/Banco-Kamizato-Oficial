FUNCTION main()
    LOCAL opcao
    LOCAL saldo := 100
    LOCAL saque
    LOCAL deposito
    LOCAL loop := 1

    hb_cdpSelect("UTF8")
    DO WHILE (loop == 1)
        cls

        ? "Olá, bem-vindo ao Banco Kamizato"

        ?
        ? "Saldo Atual: R$", ALLTRIM(STR(saldo)) //Tira o espaçamento do saldo
        ?
        ? "[1] Saque"
        ? "[2] Depósito"
        ? "[3] Sair"
        
            INPUT "Escolha uma opção: " TO opcao
        
        //Saque
            IF (opcao == 1)
                CLS
                ? "Saldo Atual: R$", ALLTRIM(STR(saldo))
                INPUT "Digite o valor para saque: R$" TO saque

                IF ((saldo-saque)<0) //Valida se o saldo ficará negativo
                    CLS
                    ? "Seu saldo ficará negativo :("
                    ? "Tecle para voltar!"
                    INKEY(0)
                ENDIF
                IF saque > 0 .AND. ((saldo-saque)>=0) //Valida se o valor de saque é maior que zero
                    saldo := saldo - saque
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
                ? "Saldo Atual: R$", ALLTRIM(STR(saldo))
                INPUT "Digite o valor para depósito: R$" TO deposito

                IF (deposito > 0) //Valida se o deposito é maior que zero
                    saldo := saldo + deposito
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