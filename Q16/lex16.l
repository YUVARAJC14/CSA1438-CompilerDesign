%{
#include <stdio.h>
int charCount = 0;
int lineCount = 0;
int wordCount = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { 
    int length = yyleng;
    if (length <= 30) { 
        wordCount++;
    }
}

. { charCount++; } 

\n { lineCount++; }

%%

int yywrap(){}
int main(){
	FILE *fp;
	char filename[50];
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fp = fopen(filename,"r");
	yyin = fp;
	yylex();
        fclose(fp);

    printf("Number of characters: %d\n", charCount);
    printf("Number of lines: %d\n", lineCount);
    printf("Number of words: %d\n", wordCount);

    return 0;
}
