% Reglas para el diagnóstico médico

instruccion('No puede retirar ya que no han pasado ni 5 años desde la ultima vez') :- tiempo, !.

instruccion('No puede retirar espere hasta cumplir 46 dias de desempleo') :- desem, !.

instruccion('No puede retirar por su bajo tiempo con su cuenta de retiro') :- cuenta, !.

instruccion('No puede retirar por su bajo tiempo de cotizacion') :- cotizacion, !.

instruccion('Puedes generar tu clave única de servicios en el portal AforeWeb') :- clave, !.

instruccion('Puedes retirar en la app de AforeMovil') :- sacar_cita, !.

instruccion('Usted necesita sacar una cita en el portal AforeWeb con nombre de usuario y contraseña') :- sucursal, !.

instruccion('Acuda a su sucursal mas cercana.').


% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad

sacar_cita :- ssacar_cita.

sucursal :- ssucursal.

% Preguntas para dirigir al diagn�stico adecuado
pregunta(S) :-
    writeln(S),         % Muestra la pregunta al usuario
    %read(Respuesta),    % Lee la respuesta del usuario
    %assert(respuesta_usuario(Respuesta)).
    (
        (si(S) -> true ; (no(S) -> fail ; preguntar(S)))
    ).


% Identificador de enfermedad que dirige a las preguntas correspondientes

ssucursal :- pregunta('¿Ya tienes una cita?').
ssacar_cita :- pregunta('¿Quiere retirar en una tienda en fisico?'),!.
clave :- pregunta('Tiene su clave unica de servicios (CUS)?'),!.
cotizacion :- pregunta('¿Tiene minimo 2 años cotizados ante el IMMS?'),!.
cuenta :- pregunta('¿Lleva minimo 3 años con cuenta de ahorro para retiro?'),!.
desem :- pregunta('¿Lleva mas de 46 dias desempleado?'),!.
tiempo :- pregunta('¿Lleva más de 5 años sin efectuar este recurso, o es la primera vez que lo solicita?'),!.

% Proceso del diagnóstico basado en preguntas de sí y no
% Cuando el usuario dice sí, se pasa a la siguiente pregunta del mismo ramo, si
% dice que no se pasa a la pregunta del siguiente ramo

:- dynamic si/1,no/1.

preguntar(Problema) :-
    format('~w (si/no): ', [Problema]),
    read(Respuesta),
    ((Respuesta == no) -> assert(no(Problema)) ;
     (Respuesta == si) -> assert(si(Problema)), fail).

% Proceso de elección de acuerdo al diagnóstico basado en las preguntas anteriores

diagnosticar(Problema) :- instruccion(Problema), !.
diagnosticar('Sin resultados, usted no proporcionó suficiente información. Error p560c4!').

% Inicio del programa
inicio :-
    writeln('TE AYUDAMOS CON TU AFORE'),
    writeln('Responde un breve cuestionario para saber si puedes retirar de tu cuenta AFORE.'),
    diagnosticar(Enfermedad),
    write('Solución: '),
    writeln(Enfermedad),
    limpiar.

% Limpieza de hechos
limpiar :- retractall(si(_)), retractall(no(_)).
