#include <stdio.h> // standard input output header. printf is included here


int main (void) { // the main function is the entry point of the code and {} indicates the beginning and end

printf("Welcome to C \n");
printf("Hi there \n");
printf("C is fun! \n");
printf("Great progress \n");
printf("Hello \n");
printf("Awesome \n");
printf("I love coding \n");
printf("I am learning C \n");
printf("My first program \n");
printf("First \n");
printf("Second \n");
printf("Simplicity is the ultimate sophistication \n");
printf("%d \n", 253); // C needs a special format for integers. d stands for decimal
printf("%f \n", 3.14); // f stands for float
printf("%c \n", 'X'); // c stands for character
printf("%s \n", "Hey"); // s stands for string
printf("Score: %f. Level: %d \n", 42.8, 4);
printf("%d %d %c \n", 3, 2, 'z');
printf("Name: %s \n", "James");
printf("Age: %d \n", 42);
printf("%c \n %c \n %c \n", 'A', 'B', 'C');
printf("Product: %s \n", "LCD Monitor");
printf("Price: %f \n", 49.95);

int score = 253;
score = 280;
score = 851;
printf("%d \n", score);

int level;
level = 5;
printf("%d \n", level);

int age = 21;
printf("%d", age);

/*
int x = 9;
int y = 8;
x = 3;
printf("%d %d\n", y, x);
*/

int price = 12;
printf("Price: $%d \n", price);

float height = 61.5;
double temp = 32.64; // the format specifier for double is %lf

float x = 3.14;
int n = 8;
double y = 6.11;
printf("%f \n", x);
printf("%d \n", n);
printf("%lf \n", y);

char letter = 'C'; // the format specifier for char is %c
int p = 3;
printf("Letter %c has the position %d \n", letter, p);

const int num = 42;

const float CAPACITY = 4.6;
printf("%f \n", CAPACITY);

char letter2 = 'B';
int number = 127;
printf("%c%d \n", letter2, number);
return 0; // return 0 indicates that the program has successfully completed

}
