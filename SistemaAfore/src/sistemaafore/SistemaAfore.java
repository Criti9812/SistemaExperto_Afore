package sistemaafore;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;
import java.util.Scanner;
import javax.swing.*;
import org.jpl7.Query;
import org.jpl7.Term;

public class SistemaAfore implements ActionListener{
private JFrame ventana = new JFrame();
private JPanel panel, panel1, panel2, panel3, animacion;
private JScrollPane scrol, scrol2;
private JTextField respuesta;
private JTextArea area, area2;
private JButton totalesB, parcialesB, voluntariosB, matrimonioB, desempleoB, enviar;
private JLabel requisitosL,fondoT, tituloP, tituloL, totalTL, voluntarioTL, parcialesTL ,matrimonioTL, desempleoTL , respuestaL, preguntaL, totalesL, parcialesL, voluntariosL, matrimonioL, desempleoL;
private Font tipo = new Font("Serif", Font.BOLD, 25);
private Font tipo2 = new Font("Serif", Font.BOLD, 18);
private Font tipo3 = new Font("Serif", Font.BOLD, 12);
private Font tipo4 = new Font("Serif", Font.BOLD, 20);
private Color verde = new Color(97, 133, 76);
private Color crema = new Color(218, 205, 155);    
private Color azul = new Color(14, 42, 85);  
private ImageIcon opcion1I, opcion2I, opcion3I, opcion4I, opcion5I, fondo;
private int opcionE, contadorr=0;
private javax.swing.Timer timer = null;
private String consulta, varY;
private String requisitos="Para realizar cualquier retiro es necesario que cuentes con:\n" +
"-Identificación Oficial\n" +
"-RFC\n" +
"-CURP\n"+
"Tipos de retiro:\n" +
"-voluntario\n" +
"-matrimonio\n" +
"-desempleo\n" +
"-total\n";
private String tiposP="Tipos de pension:\n"+
        "-renta_vitalicia\n"+
        "-retiro_programado\n"+
        "-pension_minima\n";
public void Interfaz(){
    ventana = new JFrame();
    ventana.setSize(600, 350);
    ventana.setLocationRelativeTo(null);
    ventana.setDefaultCloseOperation(3);
    ventana.setTitle("SISTEMA AFORE");
    Animacion();
    
}//end Interfaz

public void Animacion(){
    animacion = new JPanel();
    animacion.setLayout(null);
    animacion.setBackground(crema);
    ventana.getContentPane().add(animacion);
    fondoT = new JLabel();
    fondoT.setBounds(0,0,600,350);
    fondo= new ImageIcon("src/sistemaafore/fondo.png");
    fondoT.setIcon(fondo);

    // Configurar el JLabel
    tituloP = new JLabel("AFORE");
    tituloP.setForeground(Color.WHITE);
    tituloP.setBackground(Color.BLACK);
    tituloP.setOpaque(true); // Establecemos la opacidad del fondo del JLabel en true
    tituloP.setFont(new Font("Arial", Font.BOLD, 30));//Se crea un estilo para el label y se le asigna
    tituloP.setHorizontalAlignment(SwingConstants.CENTER);
    tituloP.setBounds(0,220,600,30);
    animacion.add(tituloP);
    animacion.add(fondoT);
    ventana.setVisible(true);

    // Configurar el Timer para la animación
    try {
      //Se crea un timer para crear una animacion donde aparece y desaparece un label cada segundo y medio
           timer = new javax.swing.Timer(1000, e -> {
              if (tituloP.isVisible()) {
                  tituloP.setVisible(false);
              } else {
                  tituloP.setVisible(true);
              }
              contadorr++;

              if (contadorr == 6) { // detener después de 3 repeticiones (6 cambios)
                  timer.stop();//Se detiene el temporizador y se manda a llamar al metodo inicio
                  ventana.getContentPane().removeAll(); // Elimina todos los componentes del contenedor principal de la ventana
                  ventana.revalidate(); // Revalida la ventana para que los cambios surtan efecto
                  ventana.repaint();
                  Componentes();
                  ventana.repaint();
              }
          });
          timer.setRepeats(true);//indica que el temporizador debe repetirse después de cada ciclo completo,
          timer.setCoalesce(true);//indica que si el temporizador está configurado para dispararse varias veces durante un período de tiempo
          timer.start();//inicia el temporizador para que comience a ejecutarse en el momento
      } catch (Exception ex) {
          ex.printStackTrace();
      }
}

public void Componentes(){
    Panel();
    LabelP1();
    Botones();
}//end Componentes

public void Panel(){
    panel = new JPanel();
    panel.setLayout(null);
    panel.setBackground(crema);
    ventana.getContentPane().add(panel);
    panel1 = new JPanel();
    panel1.setLayout(null);
    panel1.setBackground(verde);
    panel1.setBounds(30,30,525,250);
    panel.add(panel1);
    panel2 = new JPanel();
    panel2.setLayout(null);
    panel2.setBackground(verde);
    panel2.setBounds(30,30,150,250);
}//end Panel

public void LabelP1(){
    tituloL = new JLabel("AFORE");
    tituloL.setOpaque(true);
    tituloL.setHorizontalAlignment(JLabel.CENTER);
    tituloL.setVerticalAlignment(JLabel.CENTER);
    tituloL.setBackground(Color.WHITE);
    tituloL.setBounds(0,10,525,40);
    tituloL.setForeground(azul);
    tituloL.setFont(tipo);
    panel1.add(tituloL);
    
    totalesL = new JLabel("TOTALES");
    totalesL.setBounds(70,195,150,20);
    totalesL.setForeground(Color.BLACK);
    totalesL.setFont(tipo3);
    panel1.add(totalesL);
    
    parcialesL = new JLabel("PARCIALES");
    parcialesL.setBounds(230,195,150,20);
    parcialesL.setForeground(Color.BLACK);
    parcialesL.setFont(tipo3);
    panel1.add(parcialesL);
    
    voluntariosL = new JLabel("VOLUNTARIO");
    voluntariosL.setBounds(370,195,150,20);
    voluntariosL.setForeground(Color.BLACK);
    voluntariosL.setFont(tipo3);
    panel1.add(voluntariosL);
    
    matrimonioL = new JLabel("MATRIMONIO");
    matrimonioL.setBounds(140,195,150,20);
    matrimonioL.setForeground(Color.BLACK);
    matrimonioL.setFont(tipo3);
    
    desempleoL = new JLabel("DESEMPLEO");
    desempleoL.setBounds(315,195,150,20);
    desempleoL.setForeground(Color.BLACK);
    desempleoL.setFont(tipo3);
}//end Label

public void LabelP(){
    preguntaL = new JLabel("PREGUNTA");
    preguntaL.setBounds(200,50,150,20);
    preguntaL.setForeground(Color.BLACK);
    preguntaL.setFont(tipo2);
    panel.add(preguntaL);
    
    respuestaL = new JLabel("RESPUESTA");
    respuestaL.setBounds(200,165,150,20);
    respuestaL.setForeground(Color.BLACK);
    respuestaL.setFont(tipo2);
    panel.add(respuestaL);
    
    totalTL = new JLabel("RETIRO TOTAL");
    totalTL.setBounds(310,10,200,40);
    totalTL.setForeground(azul);
    totalTL.setFont(tipo4);
    
    voluntarioTL = new JLabel("RETIRO VOLUNTARIO");
    voluntarioTL.setBounds(275,10,300,40);
    voluntarioTL.setForeground(azul);
    voluntarioTL.setFont(tipo4);
  
    matrimonioTL = new JLabel("RETIRO POR MATRIMONIO");
    matrimonioTL.setBounds(250,10,350,40);
    matrimonioTL.setForeground(azul);
    matrimonioTL.setFont(tipo4);
    
    desempleoTL = new JLabel("RETIRO POR DESEMPLEO");
    desempleoTL.setBounds(240,10,350,40);
    desempleoTL.setForeground(azul);
    desempleoTL.setFont(tipo4);

}

public void Area(){
    area = new JTextArea();
    area.setLineWrap(true);
    area.setWrapStyleWord(true);
    scrol = new JScrollPane(area);
    scrol.setBounds(200,75,360,80);
    panel.add(scrol);
    


}//end Area

public void Textos(){
    respuesta = new JTextField();
    respuesta.setBounds(200,195,360,50);
    panel.add(respuesta);
}//end Textos

public void BotonesP(){
    enviar = new JButton("ENVIAR");
    enviar.setBounds(460,260,100,20);
    enviar.addActionListener(this);
    panel.add(enviar);
}

public void Botones(){
    opcion1I = new ImageIcon("src/sistemaafore/opcion1.png");
    opcion2I = new ImageIcon("src/sistemaafore/opcion2.png");
    opcion3I = new ImageIcon("src/sistemaafore/opcion3.png");
    opcion4I = new ImageIcon("src/sistemaafore/opcion4.png");
    opcion5I = new ImageIcon("src/sistemaafore/desempleo.png");
    
    totalesB = new JButton();
    totalesB.setIcon(opcion1I);
    totalesB.setBorderPainted(false);
    totalesB.setContentAreaFilled(false);
    totalesB.setBounds(50,80,100,100);
    totalesB.addActionListener(this);
    panel1.add(totalesB);
    
    parcialesB = new JButton();
    parcialesB.setIcon(opcion2I);
    parcialesB.setBorderPainted(false);
    parcialesB.setContentAreaFilled(false);
    parcialesB.setBounds(210,80,100,100);
    parcialesB.addActionListener(this);
    panel1.add(parcialesB);
    
    voluntariosB = new JButton();
    voluntariosB.setIcon(opcion3I);
    voluntariosB.setBorderPainted(false);
    voluntariosB.setContentAreaFilled(false);
    voluntariosB.setBounds(360,80,100,100);
    voluntariosB.addActionListener(this);
    panel1.add(voluntariosB);
    
    matrimonioB = new JButton();
    matrimonioB.setIcon(opcion4I);
    matrimonioB.setBorderPainted(false);
    matrimonioB.setContentAreaFilled(false);
    matrimonioB.setBounds(130,80,100,100);
    matrimonioB.addActionListener(this);
    
    desempleoB = new JButton();
    desempleoB.setIcon(opcion5I);
    desempleoB.setBorderPainted(false);
    desempleoB.setContentAreaFilled(false);
    desempleoB.setBounds(300,80,100,100);
    desempleoB.addActionListener(this);
}//end Botones

public void Repintar(int desicion){
    area2 = new JTextArea();
    area2.setLineWrap(true);
    area2.setWrapStyleWord(true);
    scrol2 = new JScrollPane(area2);
    scrol2.setBounds(5,5,140,240);
    panel2.add(scrol2);
    
    panel1.add(parcialesL);
    panel.removeAll();
    panel.revalidate();
    panel.repaint();
    panel.add(panel2);
    panel.revalidate();
    Textos();
    Area();
    LabelP();
    BotonesP();
    if(desicion == 1){
      String concan = requisitos + tiposP;
      area2.setText(concan);
      panel2.add(scrol2);
      panel.add(totalTL);
    }else if(desicion == 3){
      area2.setText(requisitos);
      panel2.add(scrol2);
      panel.add(voluntarioTL);
    }else if(desicion == 4){
      area2.setText(requisitos);
      panel2.add(scrol2);
      panel.add(matrimonioTL);
    }else if(desicion == 5){
      area2.setText(requisitos);
      panel2.add(scrol2);
      panel.add(desempleoTL);
    }
    panel.repaint();
    JOptionPane.showMessageDialog(null, "Nota: Contesta las preguntas con si / no . Una vez que el sistema te haya dado una solución termina tu consulta con la palabra 'okay'.", "NOTA", JOptionPane.INFORMATION_MESSAGE);
   
}


public void actionPerformed(ActionEvent ev) {
   if (ev.getSource() == totalesB) {
           consulta = "mas_arriba_de"; 
           varY = "total";
           Repintar(1);
           Empezar(consulta, varY);
           opcionE=1;
        } else if (ev.getSource() == parcialesB) {
            panel1.removeAll();
            panel1.revalidate();
            panel1.repaint();
            panel1.add(matrimonioB);
            panel1.add(desempleoB);
            panel1.add(matrimonioL);
            panel1.add(desempleoL);
            parcialesTL = new JLabel("RETIROS PARCIALES");
            parcialesTL.setBounds(165,10,220,40);
            parcialesTL.setForeground(azul);
            parcialesTL.setFont(tipo4);
            panel1.add(parcialesTL);
            panel.revalidate();
            opcionE=2;
        }else if (ev.getSource() == voluntariosB) {
            consulta = "mas_arriba_de"; 
            varY = "voluntario";
            Repintar(1);
            Empezar(consulta, varY);
            opcionE=3;
        }else if (ev.getSource() == matrimonioB) {
            consulta = "mas_arriba_de"; 
            varY = "matrimonio";
            Repintar(4);
            Empezar(consulta, varY);
            opcionE=4;
        }else if (ev.getSource() == desempleoB) {
            consulta = "mas_arriba_de"; 
            varY = "desempleo";
            Repintar(5);
            Empezar(consulta, varY);
            opcionE=5;
        }else if (ev.getSource() == enviar) {
           varY = respuesta.getText();
           Empezar(consulta, varY);
           opcionE=3;
        }
}//end actionPerformed


private void Empezar(String cons, String varY) {                                      
        String t1 = "consult('bloques.pl')";
        Query q1 = new Query(t1);
        q1.hasSolution();
        String t4 = cons+"(X,"+varY+")";
        Query q4 = new Query(t4);
        while (q4.hasMoreSolutions()) {
        Map<String, Term> solution = q4.nextSolution();
        Term X = solution.get("X");
        Term Y = solution.get("Y");
        String[] partes = X.toString().split(";");
        area.setText( partes[3] + "\n");
        consulta=partes[1];
        }
        panel.repaint();
        
    }       


    public static void main(String[] args) {
        SistemaAfore sa = new SistemaAfore();
        sa.Interfaz();
    }
    
}
