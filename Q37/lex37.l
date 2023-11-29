%{
#include <stdio.h>
int max_length = 0;
int current_length = 0;
%}

%%
[a-zA-Z]+ {
    current_length = yyleng;
    if (current_length > max_length) {
        max_length = current_length;
    }
}
.|\n { }
%%

int yywrap(){
	return 1;
}

int main() {
	char filename[50];
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fp = fopen(filename,"r");
	yyin = fp;
        printf("Enter text to find the length of the longest word:\n");
        yylex();
        printf("Length of the longest word: %d\n", max_length);
        return 0;
}
