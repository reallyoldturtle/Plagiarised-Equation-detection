#include<stdio.h>
#include<conio.h>
int main()
{
 FILE *f1,*f2;
 char c,k=0,i=0,add=0,sub=0,div=0,mul=0,h=0,j=0;
 int x[10][4],y[10][4],flag=0,copy=0;
 clrscr();
 f1=fopen("D:/a.txt","r");
 f2=fopen("D:/b.txt","r");
 while((c=getc(f1))!=EOF)
 {
  if(c!='\n')
  {
   if(c=='+')
   add++;
   if(c=='-')
   sub++;
   if(c=='*')
   mul++;
   if(c=='/')
   div++;
  }
  else if(c=='\n' || c=='\0')
  {
   x[k][0]=add;
   x[k][1]=sub;
   x[k][2]=mul;
   x[k][3]=div;
   add=0;
   sub=0;
   mul=0;
   div=0;
   k++;
   }
  }

   while((c=getc(f2))!=EOF)
 {
// printf("%c",c);
  if(c!='\n')
  {
   if(c=='+')
   add++;
   if(c=='-')
   sub++;
   if(c=='*')
   mul++;
   if(c=='/')
   div++;
  }
  else if(c=='\n' || c=='\0')
  {
   y[h][0]=add;
   y[h][1]=sub;
   y[h][2]=mul;
   y[h][3]=div;
   add=0;
   sub=0;
   mul=0;
   div=0;
   h++;
   }
  }



  fclose(f1);
  fclose(f2);

  //write the check code here
  flag=0;
  for(i=0;i<k;i++)
  {
   for(j=0;j<h;j++)
   {
    if(x[i][0]==0 && x[i][1]==0 && x[i][2]==0 && x[i][3]==0)
    {
    //do nothing
    }
    else
    {
    //printf("h");
     if(x[i][0]==y[j][0] && x[i][1]==y[i][1] && x[i][2]==y[j][2] && x[i][3]==y[j][3])
     {
      flag=1;
      //printf("l");
      copy++;
      }
      }
    }
  }

  if(flag==1)
  {
  printf("Matches found between the two document");
  }
  else if (flag==0)
  {
  printf("Not plagiarised");
  }




  getch();
  return 0;
  }


