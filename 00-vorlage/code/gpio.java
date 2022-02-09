import com.pi4j.io.gpio.*;

public class Main {
  private static boolean exit = false;
  private static double pushTime = 0;

  public static void main(String[] args) throws FileNotFoundException {
    // Singleton-Objekt für den GPIO-Zugriff holen
    final GpioController gpio = GpioFactory.getInstance();

    // Grüne LED initialisieren
    GpioPinDigitalOutput greenLED = gpio.provisionDigitalOutputPin(
        RaspiPin.GPIO_29, "Green LED");

    greenLED.setShutdownOptions(true);
    greenLED.high();
  }
}
