package model.beans;

public class Date
{
   private int dd,mm,yy;    //instance variable
  
   public Date()    //default constructor
   {
	//dd=mm=yy=0;
   }

   public Date(int dd,int mm,int yy)   //full parameterised constructor
   { 
	this.dd = dd;    //this is a reference variable
    this.mm = mm;
	this.yy = yy;
   }

   public Date(Date d)    //copy constructor. State of d is getting assigned to this
   {
 	this.dd = d.dd;
 	this.mm = d.mm;
 	this.yy = d.yy;
   }

   public void showDate()
   {
	System.out.println(dd+"/"+mm+"/"+yy);
   }

   public boolean equals(Date d)
   {
 	if(this.dd == d.dd && this.mm == d.mm && this.yy == d.yy)
	     return true;
	else
	     return false;
   }
  	
}