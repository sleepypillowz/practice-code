//note if file is being written to other txt it can't print here in console.

package my.filereader;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws FileNotFoundException, IOException {
        
        //File Location
        File file = new File("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\fileReader\\source.txt");
        
        //Reads the File
        Scanner s = new Scanner(file);
        
        //Print to Console the 1st Line
        //System.out.println(s.nextLine());
        
        //storage for fileContent
        String fileContent = "";
        //Loops until all is printed to the console
        while(s.hasNextLine()) {
            //storing fileContent to string
            fileContent = fileContent.concat(s.nextLine() + "\n");
            //System.out.println(s.nextLine());
        }
        
        FileWriter writer = new FileWriter("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\fileReader\\newFile.txt");
        writer.write(fileContent);
        writer.close();
    }
}
