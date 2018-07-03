% Main script
% Receives user input and calls other functions to calculate the results
format long

% Getting user input
disp("\nRecebendo inputs do usuário: ")
disp("Para valores padrão, entre em seguida com os seguintes valores: a=1, b=2, n=1000")
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
  disp("Existe ao menos uma raíz de F(x) no intervalo [a, b]")
  disp("\nEncontrando a raiz de F(x) no intervalo [a,b], utilizando o método de Newton:")
  disp("Tomando x0 = 0.5, e eps = 1e-10:")
  [X, err] = newtonr(@(x) F(f, 0, x, n), f, 0.5, 1e-10);
  disp("Raíz: ")
  x = X(size(X)(2))
  disp("Erro: ")
  err(size(err)(2))
  disp("F(x) na raiz encontrada: ")
  F(f, 0, x, n)
endif;
