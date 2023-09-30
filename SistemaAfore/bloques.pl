%                                  -------OPCIONES PRINCIPALES--------
op(';voluntario1;(X,Y);Tiene su estado de cuenta AFORE o algun comprobante que acredite tu registro?;', voluntario).
op(';matrimonio1;(X,Y);Es la primera vez que solicita este tipo de retiro?;', matrimonio).
op(';desempleo1;(X,Y);Lleva mas de 5 anios sin efectuar este recurso, o es la primera vez que lo solicita?;', desempleo).
op(';total1;(X,Y);Tiene 60 anios o mas?;', total).

mas_arriba_de(X,Y):-op(X,Y). 

% Volver a hacer preguntas

mensaje(';reset2;(X,Y);Quiere hacer otra consulta?;', okay).
deNuevo(';mas_arriba_de;(X,Y);Ingrese el tipo de retiro;', si).
deNuevo(';_;_;Vuelva pronto :) ;', no).

reset(X,Y):-mensaje(X,Y).
reset2(X,Y):-deNuevo(X,Y).


%                                 --------- AHORRO VOLUNTARIO---------

% Preguntas Ahorro Voluntario

reglaV1(';voluntario2;(X,Y);Tiene su estado de cuenta bancario a su nombre con numero de Clave Bancaria Estandarizada (CLABE)?;', si).
reglaV1(';reset;(X,Y);Necesita su estado de cuenta AFORE, puede obtenerlo en la aplicacion AforeMovil;', no).

reglaV2(';voluntario3;(X,Y);Cuenta con su expediente de identificacion de trabajador actualizado?;', si).
reglaV2(';reset;(X,Y);Necesita su estado de cuenta bancario con CLABE, contacta a tu banco para solicitarlo;', no).

reglaV3(';voluntario4;(X,Y);Sus ahorros fueron hechos a mediano/largo plazo?;', si).
reglaV3(';reset;(X,Y);Necesita su expediente de identificacion de trabajador, puede generarlo en el portal del AFORE;', no).

reglaV4(';voluntario5;(X,Y);Ha retirado en los ultimos 5 anios?;', si).
reglaV4(';voluntario6;(X,Y);Quiere realizar el retiro en tienda fisica?;', no).

reglaV5(';voluntario6;(X,Y);Quiere realizar el retiro en tienda fisica?;', no).
reglaV5(';voluntario7;(X,Y);Puede realizar el retiro de sus recursos, pero le sera retenido el impuesto correspondiente. Quiere continuar?;', si).

reglaV6(';reset;(X,Y);Acuda a su sucursal mas cercana para que le proporcionen la Solicitud de Disposicion de Recursos
la cual debera llenar y firmar, ademas de presentar los documentos antes mencionados. A mas tardar en 5 dias habiles
se le entregaran sus recursos.;', si).

reglaV6(';reset;(X,Y);Puede hacer su retiro desde la app AforeMovil.De clic en Retiros y selecciona la opcion Retiro
de Aportaciones Voluntarias, ingrese su RFC, el monto a retirar y su cuenta CLABE. Confirme la solicitud y espere a
que sea validada por el AFORE. Su dinero sera depositado en 5 dias habiles.;', no).

reglaV7(';voluntario6;(X,Y);Quiere realizar el retiro en tienda fisica?;', si).
reglaV7(';reset;(X,Y);Si decidiste ahorrar a mediano plazo y requieres ocupar tu dinero, lo podras hacer despues de 5 anios.
Si dispones de ellos antes de este plazo, te sera retenido el impuesto correspondiente.;', no).

% reglas Ahorro Voluntario

voluntario1(X,Y):-reglaV1(X,Y).
voluntario2(X,Y):-reglaV2(X,Y).
voluntario3(X,Y):-reglaV3(X,Y).
voluntario4(X,Y):-reglaV4(X,Y).
voluntario5(X,Y):-reglaV5(X,Y).
voluntario6(X,Y):-reglaV6(X,Y).
voluntario7(X,Y):-reglaV7(X,Y).


%                                 ----------- MATRIMONIO--------------

% Preguntas Matrimonio

reglaM1(';matrimonio2;(X,Y);Esta pensionado(a) bajo la ley 97?;', si).
reglaM1(';reset;(X,Y);No puede retirar ya que ha solicitado este retiro anteriormente;', no).

reglaM2(';matrimonio3;(X,Y);Ha cotizado un minimo de 150 semanas?;', si).
reglaM2(';reset;(X,Y);Solo las personas pensionadas bajo el regimen 97 pueden recibir este tipo de retiro;', no).

reglaM3(';matrimonio4;(X,Y);Esta vigente como asegurado?;', si).
reglaM3(';reset;(X,Y);No puede retirar porque necesita mas semenas cotizadas;', no).

reglaM4(';matrimonio5;(X,Y);Se encuentra laborando actualmente?;', si).
reglaM4(';reset;(X,Y);Si su vigencia ha vencido no puede obtener este tipo de retiro;', no).

reglaM5(';matrimonio6;(X,Y);Tiene su expediente de identificacion de trabajador actualizado?;', si).
reglaM5(';matrimonio10;(X,Y);Contrajiste matrimonio dentro de los 90 dias habiles apartir de tu baja?;', no).

reglaM6(';matrimonio7;(X,Y);Tiene su acta de matrimonio?;', si).
reglaM6(';reset;(X,Y);Necesita su expediente de identificacion de trabajador, puede generarlo en el portal del AFORE ;', no).

reglaM7(';matrimonio8;(X,Y);Tiene la pre-solicitud de disposicion de recursos por retiro parcial de matrimonio?;', si).
reglaM7(';reset;(X,Y);Necesita su acta de matrimonio, puede solicitarla en los juzgados del registro civil;', no).

reglaM8(';matrimonio9;(X,Y);Quiere realizar el retiro en tienda fisica?;', si).
reglaM8(';reset;(X,Y);Necesita tramitar su pre-solicitud, puede solicitarla en el portal E-SAR;', no).

reglaM9(';reset;(X,Y);Acuda a su sucursal mas cercana para realizar la solicitud. Una vez realizada la solicitud, 
tu AFORE gestionara el tramite ante el IMSS para obtener el certificado del derecho al Retiro Parcial por ayuda 
para Gastos de Matrimonio. Cuando lo obtenga, te hara entrega de los recursos vaia deposito u orden de pago en un
plazo de maximo 5 dias habiles.
El retiro equivale a 30 veces el valor de la UMA.;', si).

reglaM9(';reset;(X,Y);Puede retirar desde la app AforeMovil. Da clic en Retiros y selecciona la opcion Retiro por 
Matrimonio IMSS, captura los datos y documentos para la solicitud y elige la forma de pago. Tu solicitud sera
validada tanto por tu AFORE como por el IMSS, y en 2 dias habiles recibiras el resultado en tu correo.
El retiro equivale a 30 veces el valor de la UMA.;', no).

reglaM10(';matrimonio6;(X,Y);Tiene su expediente de identificacion de trabajador actualizado?;', si).
reglaM10(';reset;(X,Y);No puedes acceder a este tipo de retiro ya que has exedido el limite de tiempo;', no).

% reglas Matrimonio

matrimonio1(X,Y):-reglaM1(X,Y).
matrimonio2(X,Y):-reglaM2(X,Y).
matrimonio3(X,Y):-reglaM3(X,Y).
matrimonio4(X,Y):-reglaM4(X,Y).
matrimonio5(X,Y):-reglaM5(X,Y).
matrimonio6(X,Y):-reglaM6(X,Y).
matrimonio7(X,Y):-reglaM7(X,Y).
matrimonio8(X,Y):-reglaM8(X,Y).
matrimonio9(X,Y):-reglaM9(X,Y).
matrimonio10(X,Y):-reglaM10(X,Y).


%                                 ---------------- DESEMPLEO ----------------

% Preguntas desempleo

reglaD1(';desempleo2;(X,Y);Lleva mas de 46 dias desempleado?;', si).
reglaD1(';reset;(X,Y);No puede retirar ya que no han pasado ni 5 anios desde la ultima vez que retiro por desempleo;', no).

reglaD2(';desempleo3;(X,Y);Lleva minimo 3 anios con su cuenta de ahorro para el retiro?;', si).
reglaD2(';reset;(X,Y);No puede retirar aun. Espere hasta cumplir 46 dias de desempleo;', no).

reglaD3(';desempleo4;(X,Y);Tiene minimo 2 anios cotizados ante el IMSS?;', si).
reglaD3(';reset;(X,Y);No puede retirar por su bajo tiempo con su cuenta de retiro;', no).

reglaD4(';desempleo5;(X,Y);Tiene su clave unica de servicios (CUS)?;', si).
reglaD4(';reset;(X,Y);No puede retirar por su bajo tiempo de cotizacion;', no).

reglaD5(';desempleo6;(X,Y);Su cuenta tiene 5 anios o mas de haber sido abierta?;', si).
reglaD5(';reset;(X,Y);Puede generar su clave unica de servicios en el portal AforeWeb;', no).

reglaD6(';desempleo7;(X,Y);Quiere retirar en una tienda en fisico?;', si).
reglaD6(';desempleo9;(X,Y);Quiere retirar en una tienda en fisico?;', no).

reglaD7(';desempleo8;(X,Y);Ya tienes una cita?;', si).
reglaD7(';reset;(X,Y);Puede retirar desde la app AforeMovil.
Ya que su cuenta tiene 5 anios o mas de haber sido abierta, recibira lo que resulte menor entre 90 dias de su salario
base de cotizacion de las ultimas 250 semanas o el 11.5 % de los recursos acumulados en la subcuenta de Retiro, 
Cesantia en edad avanzada y Vejez (RCV). ;', no).

reglaD8(';reset;(X,Y);Acuda a la sucursal que selecciono en la cita.
Ya que su cuenta tiene 5 anios o mas de haber sido abierta, recibira lo que resulte menor entre 90 dias de su salario
base de cotizacion de las ultimas 250 semanas o el 11.5 % de los recursos acumulados en la subcuenta de Retiro, 
Cesantia en edad avanzada y Vejez (RCV). ;', si).
reglaD8(';reset;(X,Y);Usted necesita sacar una cita en el portal AforeWeb con su nombre de usuario;', no).

reglaD9(';desempleo10;(X,Y);Ya tienes una cita?;', si).
reglaD9(';reset;(X,Y);Puede retirar desde la app AforeMovil.
Recibira en una sola exhibicion 30 dias de su ultimo salario base de cotizacion con un limite de 10 veces el valor de
la Unidad de Medida y Actualizacion (UMA).;', no).

reglaD10(';reset;(X,Y);Acuda a la sucursal que selecciono en la cita.
Recibira en una sola exhibicion 30 dias de su ultimo salario base de cotizacion con un limite de 10 veces el valor de
la Unidad de Medida y Actualizacion (UMA).;', si).
reglaD10(';reset;(X,Y);Usted necesita sacar una cita en el portal AforeWeb con su nombre de usuario;', no).

% reglas Matrimonio

desempleo1(X,Y):-reglaD1(X,Y).
desempleo2(X,Y):-reglaD2(X,Y).
desempleo3(X,Y):-reglaD3(X,Y).
desempleo4(X,Y):-reglaD4(X,Y).
desempleo5(X,Y):-reglaD5(X,Y).
desempleo6(X,Y):-reglaD6(X,Y).
desempleo7(X,Y):-reglaD7(X,Y).
desempleo8(X,Y):-reglaD8(X,Y).
desempleo9(X,Y):-reglaD9(X,Y).
desempleo10(X,Y):-reglaD10(X,Y).

%                                 ---------------- TOTAL -------------------

% Preguntas retiro total

reglaT1(';total2;(X,Y);Cuenta con su expediente de identificacion de trabajador actualizado?;', si).
reglaT1(';reset;(X,Y);Para solicitar una pension necesita tener al menos 60 anios;', no).

reglaT2(';total3;(X,Y);Tiene su estado de cuenta AFORE o algun comprobante que acredite tu registro?;', si).
reglaT2(';reset;(X,Y);Necesita su expediente de identificacion de trabajador, puede generarlo en el portal del AFORE;', no).

reglaT3(';total4;(X,Y);Tiene su estado de cuenta bancario a su nombre con numero de Clave Bancaria Estandarizada (CLABE)?;', si).
reglaT3(';reset;(X,Y);Necesita su estado de cuenta AFORE, puede obtenerlo en la aplicacion AforeMovil;', no).

reglaT4(';total5;(X,Y);Ya ha solicitado su resolucion de pension?;', si).
reglaT4(';reset;(X,Y);Necesita su estado de cuenta bancario con CLABE, contacta a tu banco para solicitarlo;', no).

reglaT5(';total6;(X,Y);Fue aceptada y validada por el IMSS?;', si).
reglaT5(';reset;(X,Y);Puede solicitarla a traves del portal web del IMSS, o directamente en la Jefatura de Prestaciones
Economicas y Sociales del IMSS;', no).

reglaT6(';total7;(X,Y);Esta pensionado bajo el Regimen-97?;', si).
reglaT6(';reset;(X,Y);Si el IMSS te dio una Negativa de pension deberas acudir a tu AFORE para que te entregue en una
sola exhibicion los siguientes recursos:
        -Retiro Cesantia o Edad Avanzada y Vejez
        -INFONAVIT 1997 (si tienes recursos en esta subcuenta) ;', no).

reglaT7(';total8;(X,Y);Ha cotizado al menos 800 semanas?;', si).
reglaT7(';total10;(X,Y);Ha cotizado al menos 500 semanas?;', no).

reglaT8(';total9;(X,Y);Bajo que modalidad va a pensionarse?;', si).
reglaT8(';reset;(X,Y);No puede retirar por su bajo tiempo de cotizacion;', no).

reglaT9(';reset;(X,Y);Debes acudir al IMSS para iniciar el tramite y que el AFORE inicie el pago de tu pension.
El monto de tu pension dependera del saldo acumulado en tu Cuenta AFORE. Se actualizara anualmente de acuerdo
a la inflacion. Al adquirir una renta vitalicia se te garantiza el pago de una pension predeterminada de por vida.;', renta_vitalicia).

reglaT9(';reset;(X,Y);Debes acudir al IMSS para iniciar el tramite y que el AFORE inicie el pago de tu pension.
El monto de la pension dependera del saldo acumulado en tu cuenta AFORE, de los rendimientos que se obtengan
y de la esperanza de vida que te calculen.;', retiro_programado).

reglaT9(';reset;(X,Y);Debes acudir al IMSS para iniciar el tramite y que el AFORE inicie el pago de tu pension.
Se le otorgara una pension de aproximadamente $7,000 menusales. Dicha cantidad puede variar por las actualizaciones al salario minimo;', pension_minima).

reglaT10(';total11;(X,Y);Tiene 65 anios o mas?;', si).
reglaT10(';reset;(X,Y);No puede retirar por su bajo tiempo de cotizacion;', no).

reglaT11(';reset;(X,Y);PENSION POR VEJEZ: Acuda a la subdelegacion mas cercana para realizar el tramite, el cual sera completado en 6 dias habiles. 
Se le otorgara un 100% de su salario diario de las ultimas 250 semanas cotizadas.;', si).
reglaT11(';reset;(X,Y);PENSION POR CESANTIA: Acuda a la subdelegacion mas cercana para realizar el tramite, el cual sera completado en 6 dias habiles.
Para determinar la pension se toma en cuenta su edad, el salario diario promedio de las ultimas 250 semanas cotizadas y su nivel salarial.;', no).

% reglas retiro total

total1(X,Y):-reglaT1(X,Y).
total2(X,Y):-reglaT2(X,Y).
total3(X,Y):-reglaT3(X,Y).
total4(X,Y):-reglaT4(X,Y).
total5(X,Y):-reglaT5(X,Y).
total6(X,Y):-reglaT6(X,Y).
total7(X,Y):-reglaT7(X,Y).
total8(X,Y):-reglaT8(X,Y).
total9(X,Y):-reglaT9(X,Y).
total10(X,Y):-reglaT10(X,Y).
total11(X,Y):-reglaT11(X,Y).














