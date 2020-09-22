import java.util.Random;

public class RandomNameGenerator {
    public static String randomName(int length){
        String letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rand=new Random();
        char [] nameArray=new char[length];
        String name="";
        for (int i = 0; i < nameArray.length; i++) {
            nameArray[i]=letters.charAt(rand.nextInt(letters.length()));
            name+=nameArray[i];
        }
        return name;
    }
}
