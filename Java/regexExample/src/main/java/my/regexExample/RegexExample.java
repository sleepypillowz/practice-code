package my.regexExample;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class RegexExample {
    

    String animals = "cat";
    String word = "0bcde";
    String element = "0x";
    String str = "0000000000";
    String input = "ABCDEF123";
    String input2 = "Hello, World!";
    String pattern = "Hello.*";
    String str2 = "AAAAAhhh";
    String str3 = "Passw0rd";
    Pattern p = Pattern.compile("[A-F]{5,}.*");
    Pattern p2 = Pattern.compile("[0-9]"); 

    public boolean checkAnimal() {
        /* EQUALS FUNCTION
        if (animals.equals("cat") || animals.equals("dog")) {
            return true;
        } else {
            return false;
        }
        */
        
        //REGULAR EXPRESSIONS
        
        //Fundamentals
        
        return animals.matches("cat|dog");
        
        //return animals.matches("[Cc]at|[Dd]og");
        
        /* Rhymes with
        if(word.length()==3) if(word.substring(1,3).equals("at"))
        return true; return false;
        */
        
        //Rhymes with v2
        // return word.matches("[a-z]at");
        
        //Rhymes with v3
        //return word.matches("[a-zA-Z](at|AT)");
        
        //Rhymes with v4
        //return word.matches("[ 0-9a-zA-Z]bcde");
        
        //Wildcard "." meaning any single character
        //return element.matches("[0-9].");
        
        //Repetition Operators
        
        //* 0 or more
        //return str.matches("A*");
        
        //? 0 to 1
        //return str.matches("A?");
        
        //+ 1 or more
        //return str.matches("A+");
        
        //{x} occurences
        //return str.matches("A{7}");
        
        //{x, y} between x & y
        //return str.matches("A{7,9}");
        
        //{x,} x or more
        //return str.matches("A{5,}");
        
        //extra
        
        //any character
        //return str.matches(".*");
        
        //.? empty string or single character 0-5 and must be 10 digits
        //return str.matches(".?[0-5]{10}");
        
        //PATTERN AND MATCHER
        
        //
        /*
        boolean isMatch = p.matcher(input).matches();
        return isMatch;
        */
        
        //
        /*
        Pattern compiledPattern = Pattern.compile(pattern);
        Matcher match = compiledPattern.matcher(input2);
        return match.matches();
        */
        
        //
        /*        
        Matcher match = p.matcher(str);
        boolean isMatch = match.matches();
        */
        
        
        //
        //Matcher match = p.matcher(str); System.out.println(match.matches()); 
        
        //REGEX OPERATIONS
        
        //     
        /*     
        Matcher match = p2.matcher(str);
        boolean isMatch = match.matches();
        return isMatch;
        */
        
        /*
        Matcher match = p2.matcher(str);
        boolean isMatch = match.find();
        return isMatch;
        */
        
        
        //replaceAll()
        //code here
        
        
    }
        
        
    

    public static void main(String[] args) {
        RegexExample regex = new RegexExample();
        boolean result = regex.checkAnimal();
        System.out.println(result);
        
        //split()
        
        /*
        String phone = "991-978-6452";
        String[] tokens = phone.split("-");
        for (String t : tokens) {
            System.out.println(t);
        }
        */
        
        //
        
        /*
        Pattern patternName = Pattern.compile("[0-9]");
        String stringName = "Passw0rd";
        Matcher match = patternName.matcher(stringName);
        */
        
    }
}
