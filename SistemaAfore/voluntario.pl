% Reglas para el diagnóstico médico

instruccion('Necesita su estado de cuenta AFORE, puede obtenerlo en la aplicación AforeMovil'):-afore,!.
instruccion('Necesita su estado de cuenta bancario con CLABE, contacta a tu banco para solicitarlo '):- edoCta,!.
instruccion('Necesita su expediente de identificación de trabajador, puede generarlo en el portal del AFORE '):- exp,!.
instruccion('Puede hacer el retiro ya sea de forma física o digital pero le será retenido el impuesto correspondiente'):- interes,!.
instruccion('Puede hacer su retiro desde la app AforeMovil'):- app,!.
instruccion('Acuda a su sucursal mas cercana'):-fisico,!.



% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad


interes :- plazo,
    \+pregunta('¿Ha retirado en los ultimos 5 años?').

app:-fisico.



% Preguntas para dirigir al diagn�stico adecuado
pregunta(S) :-
    writeln(S),         % Muestra la pregunta al usuario
    %read(Respuesta),    % Lee la respuesta del usuario
    %assert(respuesta_usuario(Respuesta)).
    (
        (si(S) -> true ; (no(S) -> fail ; preguntar(S)))
    ).


% Identificador de enfermedad que dirige a las preguntas correspondientes


fisico:- pregunta('¿Quiere retirar en tienda fisica?').
plazo:- pregunta('¿Sus ahorros fueron hechos a corto plazo?'),!.
exp:- pregunta('¿Cuenta con su expediente de identificación de trabajador actualizado?'),!.
edoCta:- pregunta('¿Tiene su estado de cuenta bancario a su nombre con número de Clave Bancaria Estandarizada (CLABE)?'),!.
afore:- pregunta('¿Tiene su estado de cuenta AFORE o algún comprobante que acredite tu registro?'),!.

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
diagnosticar('Puede retirar en la sucursal mas cercana').

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