%{ 
#include<stdio.h> 
#include<string.h> 

char replace_with [] = "SIGMA"; 
char replace [] ="alpha"; 


%} 


%% 
[a-zA-Z]+ { if(strcmp(yytext, replace)==0) 
				fprintf(yyout, "%s", replace_with); 
				else
					fprintf(yyout, "%s", yytext);} 
.		 fprintf(yyout, "%s", yytext); 
%% 


int yywrap() 
{ 
	return 1; 
} 

int main() 
{ 
		extern FILE *yyin, *yyout; 
		
		/* open the input file 
		in read mode */
	yyin=fopen("sample39.txt", "r"); 

		/* open the output file 
		in write mode */
	yyout=fopen("output.txt", "w"); 
	
		yylex(); 
} 
