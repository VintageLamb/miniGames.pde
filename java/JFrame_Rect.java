import java.awt.Graphics;
import javax.swing.JFrame;

public class mainClass extends JFrame {

  public static void main(String[] a){
    MainClass f = new MainClass();
    f.setSize(300,300);
    f.setVisible(true);
  }
  
  
  public void paint(Graphics g) {
    g.drawRect(10, 10, 60, 50);
    g.fillRect(100, 10, 60, 50);
    g.drawRoundRect(190, 10, 60, 50, 15, 15);
    g.fillRoundRect(70, 90, 140, 100, 30, 40);
  }
}
