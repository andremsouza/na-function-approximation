% Main script
format long


disp("\nEsse programa irá fazer os cálculos solicitados na especificação.")
% Getting user input
disp("\nRecebendo inputs do usuário: ")
fflush(stdout);
while(true)
  try
    a = input("Digite o valor de (a), do intervalo [a,b]: ")
    b = input("Digite o valor de (b), do intervalo [a,b]: ")
    n = input("Digite o valor de (n), (n) par, número de subintervalos de [a,b]: ")
    if(n <= 0 || rem(n, 2) != 0) error("(n) deve ser um valor inteiro par e positivo."); endif;
    break;
  catch err
    disp(strcat("ERRO: ", err.message))
    continue;
  end_try_catch;
endwhile;

%Defining initial variables
disp("Variáveis iniciais: ")
f = @(x) e^(-x^2/2)/(sqrt(2*pi))
I = @(f, a, b, n) simpc13(f, a, b, n)
F = @(f, a, b, n) I(f, a, b, n) - 0.45


disp("\nCalculando I(f)(x) no intervalo [a, b] com (n) subintervalos: ")
I(f, a, b, n)
disp("\nCalculando I(f)(x) no intervalo [0, a] com (n) subintervalos: ")
I(f, 0, a, n)
disp("\nCalculando I(f)(x) no intervalo [0, b] com (n) subintervalos: ")
I(f, 0, b, n)

disp("Verificando existencia de raiz de F(x) no intervalo [a,b] dado: ")
F(f, 0, a, n)*F(f, 0, b, n)
if ans < 0
  disp("Existe uma raíz de F(x) no intervalo [a, b]")
endif;