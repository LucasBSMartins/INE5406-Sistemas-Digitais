.data
devices: .word 0x10010020
bit: .word 0
prompt_msg: .asciiz "Digite 1 para ligar ou 0 para desligar (outra tecla para sair): "
newline: .asciiz "\n"
bin_output: .asciiz "A representação binária é: "

.text
main:
    loop:
        # Exibir prompt e ler ação do usuário (ligar/desligar)
        la $a0, prompt_msg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t3, $v0

        # Sair se a ação não for 0 (desligar) ou 1 (ligar)
        beqz $t3, exit
        bnez $t3, process_action

    process_action:
        # Exibir prompt e ler o número do dispositivo44444444444
        li $v0, 5
        syscall

        # Carregar o número do dispositivo em $t2
        move $t2, $v0

        # Sair se o número do dispositivo estiver fora da faixa
        li $t4, 31
        bgez $t2, valid_device

    

    valid_device:
        # Calcular a máscara para ligar/desligar o dispositivo
        li $t5, 1
        sllv $t5, $t5, $t2

        # Carregar o estado atual dos dispositivos
        lw $t0, devices

        # Verificar se o usuário deseja ligar ou desligar
        beq $t3, 1, turn_on
        beq $t3, 0, turn_off

    turn_on:
        # Ligar o dispositivo especificado
        or $t0, $t0, $t5
        j update_devices

    turn_off:
        # Desligar o dispositivo especificado
        li $t6, -1
        xor $t5, $t5, $t6
        and $t0, $t0, $t5

    update_devices:
        # Atualizar o estado dos dispositivos
        sw $t0, devices

        # Chamar a função para converter o estado em binário e exibi-lo
        lw $a0, devices
        jal converter_binario

        # Voltar ao início do loop
        j loop

    exit:
        # Sair do programa
        li $v0, 10
        syscall        
        
converter_binario:
    # Inicializar registradores
    li $t0, 0   # Índice de dígito hexadecimal
    li $t1, 0   # Valor acumulado em binário

convert_loop:
    # Carregar o dígito hexadecimal atual em $t2
    lb $t2, 0($a0)

    # Se chegamos ao final da string, sair do loop
    beqz $t2, done_convert

    # Converter o dígito hexadecimal em binário
    subi $t2, $t2, 48   # Subtrair ASCII '0' para obter o valor numérico

    # Verifique se o dígito está na faixa válida (0-15)
    li $t3, 15
    bgtu $t2, $t3, skip_convert

    j update_binary
update_binary:
    sll $t1, $t1, 4   # Desloca o valor binário acumulado para a esquerda
    or $t1, $t1, $t2  # Atualiza o valor binário acumulado com o dígito convertido
    addi $a0, $a0, 1  # Avança para o próximo dígito na string
    j convert_loop
skip_convert:
    addi $t0, $t0, 1  # Próximo dígito hexadecimal
    j convert_loop

done_convert:
    # Exibir a representação binária
    li $v0, 4
    la $a0, bin_output
    syscall

    # Imprimir o valor binário em $t1
    li $v0, 1
    move $a0, $t1
    syscall
