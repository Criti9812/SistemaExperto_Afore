% Reglas para el diagnóstico médico

instruccion('No puede retirar ya que ha solicitado este retiro anteriormente') :- tiempo, !.

instruccion('Solo las personas pensionadas bajo el regimen 97 pueden recibir este tipo de retiro') :- ley97, !.

instruccion('No puede retirar porque necesita más semenas cotizadas') :- semanas, !.

instruccion('Si ya no cuenta con vigencia como asegurado no puede obtener este tipo de retiro') :- imss, !.

instruccion('Necesita su expediente de identificación de trabajador, puede generarlo en el portal del AFORE ') :- exp, !.

instruccion('Necesita su acta de matrimonio, puede solicitarla en los juzgados del registro civil') :- acta, !.

instruccion('Necesita tramitar tu pre-solicitud, puede solicitarla en el portal E-SAR') :- e-sar, !.

instruccion('Puede retirar desde la app AforeMovil') :- dias, !.

instruccion('Acuda a su sucursal mas cercana').


% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad



dias :- fisico,
    \+pregunta('¿Esta laborando actualmente?, ¿O contrajo matrimonio dentro de los 90 dias habiles a partir de su baja?').
    

dias :- trabajo,
     pregunta('¿Contrajiste matrimonio dentro de los 90 dias hábiles apartir de tu baja?'),
    writeln('No puedes acceder a este tipo de retiro ya que has exedido el limite de tiempo').

% Preguntas para dirigir al diagn�stico adecuado
pregunta(S) :-
    writeln(S),         % Muestra la pregunta al usuario
    %read(Respuesta),    % Lee la respuesta del usuario
    %assert(respuesta_usuario(Respuesta)).
    (
        (si(S) -> true ; (no(S) -> fail ; preguntar(S)))
    ).


% Identificador de enfermedad que dirige a las preguntas correspondientes

fisico:- pregunta('¿Quiere realizar el retiro en tienda fisica?').
trabajo:- pregunta('¿Se encuentra laborando actualmente?'),!.
e-sar :- pregunta('¿Tiene la pre-solicitud de disposicion de recursos por retiro parcial de matrimonio?'),!.
acta:- pregunta('¿Tiene su acta de matrimonio?'),!.
exp :- pregunta('¿Tiene su expediente de identificacion de trabajador actualizado?'),!.
imss :- pregunta('¿Esta vigente como asegurado?'),!.
semanas :- pregunta('¿Ha cotizado un minimo de 150 semanas?'),!.
ley97 :- pregunta('¿Esta pensionado bajo la ley 97?'),!.
tiempo :- pregunta('¿Es la primera vez que solicita este tipo de retiro?'),!.

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