package cp2.pathsample;

import java.nio.file.*;
import java.nio.file.attribute.*;
import java.io.*;
import static java.nio.file.StandardOpenOption.*;
import java.util.*;
import java.text.*;
import static java.nio.file.AccessMode.*;
import java.util.Scanner;
import java.io.IOException;

public class PathSample {

    public static void main(String[] args) {
        
        //example 1
        
        Path filePath = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\sample.txt");
        int count = filePath.getNameCount();
        System.out.println("Path is " + filePath.toString());
        System.out.println("Path is " + filePath.toString());
        System.out.println("File name is " + filePath.getFileName());
        System.out.println("There are " + count + " elements in the file path");
        for (int x = 0; x < count; ++x) {
            System.out.println("Element " + x + " is " + filePath.getName(x));
        }
        
        //example 2 Absolute Path
        /*
        String fileName;
        Scanner s = new Scanner(System.in);

        System.out.print("Enter a filename: ");
        fileName = s.nextLine();
        Path inputPath = Paths.get(fileName);
        Path fullPath = inputPath.toAbsolutePath();

        System.out.println("The full path is " + fullPath.toString());
        */
        
        //example 3 checkAcess Arguments
        //error cannot find symbol READ & EXECUTE
        /*
        Path filePath = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\example.txt");
        System.out.println("Path is " + filePath.toString());
        try {
            filePath.getFileSystem().provider().checkAccess(filePath,READ,EXECUTE);
            System.out.println("The file can be read and executed.");
        }
        catch(IOException e) {
            System.out.println("The file cannot be used.");
        }
        */
        
        //example 4 Deleting a path
        /*
        Path filePath = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\example.txt");
        try {
            Files.delete(filePath);
            System.out.println("The file or directory is deleted");
        }
        catch (NoSuchFileException e) {
            System.out.println("No such file or directory");
        }
        catch (DirectoryNotEmptyException e) {
            System.out.println("Directory is not empty");
        }
        catch (SecurityException e) {
            System.out.println("Directory is not empty");
        }
        catch (IOException e) {
            System.out.println("IO exception");
        }
        */
        
        //example 5 Basic File Attributes
        /*
        Path filePath = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\example.txt");
        try {
            BasicFileAttributes fileAtt = Files.readAttributes(filePath, BasicFileAttributes.class);
            System.out.println("Size: " + fileAtt.size() + " bytes");
            System.out.println("Creation time: " + fileAtt.creationTime());
            System.out.println("Last modified time: " + fileAtt.lastModifiedTime());
        }
        catch (IOException e) {
            System.out.println("IO Exception");
        }
        */
        
        //example 6 Basic File Attributes
        /*
        Path file1 = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\example1.txt");
        Path file2 = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\example2.txt");
        try {
            BasicFileAttributes fileAtt1 = Files.readAttributes(file1, BasicFileAttributes.class);
            BasicFileAttributes fileAtt2 = Files.readAttributes(file2, BasicFileAttributes.class);
            FileTime time1 = fileAtt1.creationTime();
            FileTime time2 = fileAtt2.creationTime();
            System.out.println("file1's creation time is: " + time1);
            System.out.println("file2's creation time is: " + time2);
            if(time1.compareTo(time2) < 0)
                System.out.println("file1 was created before file2.");
            else if(time1.compareTo(time2) > 0)
                System.out.println("file1 was created after file2");
            else
                System.out.println("file1 and file2 were created at the same time.");
        }
        catch (IOException e) {
            System.out.println("IO Exception");
        }
        */
        
        //example 7 OutputStream methods
        /*
        String s = "RANIKA";
        byte[] data = s.getBytes();
        OutputStream output = null;
        try {
            output = System.out;
            output.write(data);
            output.flush();
            output.close();
        }
        catch (Exception e) {
            System.out.println("Message: " + e);
        }
        */
        
        //example 8 StandardOpenOption Arguments
        /*
        Path file = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\first_name.txt");
        String s = "RANIKA";
        byte[] data = s.getBytes();
        OutputStream output = null;
        try {
            output = new BufferedOutputStream(Files.newOutputStream(file, CREATE));
            output.write(data);
            output.flush();
            output.close();
        }
        catch (Exception e) {
            System.out.println("Messsage: " + e);
        }
        */
        
        //example 9 BuffedWriter Methods
        /*
        Scanner input = new Scanner(System.in);
        Path file = Paths.get("C:\\Users\\alexa\\OneDrive\\Documents\\GitHub\\practice-code\\Java\\netbeans\\PathSample\\grades.txt");
        String s = "";
        String delimiter = ",";
        long id;
        String name;
        double grade;
        final long QUIT = 0;
        try {
            OutputStream output = new BufferedOutputStream(Files.newOutputStream(file, CREATE));
            BufferedWriter writer = new
        BufferedWriter(new OutputStreamWriter(output));
            System.out.print("Enter student iD number: ");
            id = input.nextLong();
            while(id != QUIT) {
                System.out.print("Enter name for student no. " + id + ": ");
                input.nextLine();
                name = input.nextLine();
                System.out.print("Enter the subject grade: ");
                grade = input.nextDouble();
                DecimalFormat df = new DecimalFormat("0.00");
                s = id + delimiter + name + delimiter + df.format(grade);
                writer.write(s, 0, s.length());
                writer.newLine();
                System.out.print("Enter next ID number or " + QUIT + " to quit: ");
                id = input.nextLong();
            }
            writer.close();
        }
        catch(Exception e) {
            System.out.println("Message: " + e);
        }
        */
    }
}
