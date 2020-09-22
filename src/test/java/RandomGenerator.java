import java.util.Random;

public class RandomGenerator {

    public static String randomName(int length){
        String letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rand=new Random();
        String name="";
        for (int i = 0; i <length; i++) {
            name+=letters.charAt(rand.nextInt(letters.length()));
        }
        return name;
    }

    public static String randomNumber(int length){
        String digits="0123456789";
        Random rand=new Random();
        String number="";
        for (int i = 0; i <length; i++) {
            number+=digits.charAt(rand.nextInt(digits.length()));
        }
        return number;
    }
}
