//+------------------------------------------------------------------+
//|                                                      MA_TF_2.mq5 |
//|                                                 William Nicholas |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+


// includes 
#include <ChartObjects\ChartObjectsTxtControls.mqh>

// inputs 
input color Text_Color = clrWhite;
input color BullColor   = clrGreen;
input color BearColor   = clrRed;
input int  MA_period    = 50;
input ENUM_MA_METHOD  AverageType    = MODE_EMA;





// Class for Squares 
class EAsquare : public CChartObjectRectLabel
{

protected:
   int m_X_dis;   
   int m_Y_dis;
   int m_X_wid;
   int m_Y_hgt;
   string m_name;
   
public:
   EAsquare(int X_dis,int Y_dis, int X_wid, int Y_hgt, string name_a)
   { 
       m_X_dis = X_dis;
       m_Y_dis = Y_dis;
       m_X_wid = X_wid;
       m_Y_hgt = Y_hgt;
       m_name  = name_a;
   }
   bool Create()
   {
      if(!CChartObjectRectLabel::Create(0,m_name,0,m_X_dis,m_Y_dis,m_X_wid,m_Y_hgt)){
      
            return false ;
      }

      return true;

   }
   void UpdateColor(color M1_color){
   
      CChartObjectRectLabel::BackColor( M1_color );
      
   }
   void OnChartEvent(int id,long lp,double dp,string sp)
   {
   }
  

};


// class for lables 
class EAlabel: public CChartObjectLabel{

protected:
   int m_X_dis;   
   int m_Y_dis;
   
   string m_name;
   
public:
   EAlabel(int X_dis,int Y_dis, string name_a)
   { 
       m_X_dis = X_dis;
       m_Y_dis = Y_dis;
       
       m_name  = name_a;
   }
   bool Create()
   {
      if(!CChartObjectLabel::Create(0,m_name,0,m_X_dis,m_Y_dis)){
      
            return false ;
      }
      
      return true;

   }
   
   void OnChartEvent(int id,long lp,double dp,string sp)
   {
   }
  

};
















// Declare the buttons and labels 

EAsquare M1Label(800,30,40,40,"M1_Label_Square");
EAlabel  M1text( 800 , 15 , "M1");

EAsquare M5Label(850,30,40,40,"M5_Label_Square");
EAlabel  M5text( 850 , 15 , "M5");

EAsquare M15Label(900,30,40,40,"M15_Label_Square");
EAlabel  M15text( 900 , 15 , "M15");

EAsquare M30Label(950,30,40,40,"M30_Label_Square");
EAlabel  M30text( 950 , 15 , "M30");

EAsquare H1Label(1000,30,40,40,"H1_Label_Square");
EAlabel  H1text( 1000 , 15 , "H1");

EAsquare H4Label(1050,30,40,40,"H4_Label_Square");
EAlabel  H4text( 1050 , 15 , "H4");

EAsquare D1Label(1100,30,40,40,"D1_Label_Square");
EAlabel  D1text( 1100 , 15 , "D1");

EAsquare W1Label(1150,30,40,40,"W1_Label_Square");
EAlabel  W1text( 1150 , 15 , "W1");

EAsquare MN1Label(1200,30,40,40,"MN1_Label_Square");
EAlabel  MN1text( 1200 , 15 , "MN1");











int OnInit()
  {
//--- indicator buffers mapping\


   // create the buttons and lables
   if(!M1Label.Create())
      return INIT_FAILED;
   if(!M1text.Create())
      return INIT_FAILED;
   if(!M5Label.Create())
      return INIT_FAILED;
   if(!M5text.Create())
      return INIT_FAILED;
   if(!M15Label.Create())
      return INIT_FAILED;
   if(!M15text.Create())
      return INIT_FAILED;
    if(!M30Label.Create())
      return INIT_FAILED;
   if(!M30text.Create())
      return INIT_FAILED;      
   if(!H1Label.Create())
      return INIT_FAILED;
   if(!H1text.Create())
      return INIT_FAILED;   
   if(!H4Label.Create())
      return INIT_FAILED;
   if(!H4text.Create())
      return INIT_FAILED;   
   if(!D1Label.Create())
      return INIT_FAILED;
   if(!D1text.Create())
      return INIT_FAILED;   
   if(!W1Label.Create())
      return INIT_FAILED;
   if(!W1text.Create())
      return INIT_FAILED;   
   if(!MN1Label.Create())
      return INIT_FAILED;
   if(!MN1text.Create())
      return INIT_FAILED;
      
      
      
      
      
      
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---





   
//--- return value of prev_calculated for next call
   
   

   // get the ask and the bid 
   double current_Ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   double current_Bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
  
  
   color M1_Label_color_MOD_inM1;
   int MA_HandleM1 = iMA(_Symbol,PERIOD_M1,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayM1[];
   ArraySetAsSeries(MAarrayM1,true);
   CopyBuffer(MA_HandleM1,0,0,3,MAarrayM1);
   
   
   if( MAarrayM1[0] < current_Ask){
   
      M1_Label_color_MOD_inM1 = BullColor;
      
   
   }
   else{
   
      M1_Label_color_MOD_inM1 = BearColor;
   
   
   }
   
   M1Label.BackColor(M1_Label_color_MOD_inM1);
   M1text.Color(Text_Color);
     
   
   color M5_Label_color_MOD_inM5;
   int MA_HandleM5 = iMA(_Symbol,PERIOD_M5,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayM5[];
   ArraySetAsSeries(MAarrayM5,true);
   CopyBuffer(MA_HandleM5,0,0,3,MAarrayM5);
   
   
   if( MAarrayM5[0] < current_Ask){
   
      M5_Label_color_MOD_inM5 = BullColor;
      
   
   }
   else{
   
      M5_Label_color_MOD_inM5 = BearColor;
   
   
   }
   
   M5Label.BackColor(M5_Label_color_MOD_inM5);
   M5text.Color(Text_Color);

   
     
   color M15_Label_color_MOD_inM15;
   int MA_HandleM15 = iMA(_Symbol,PERIOD_M15,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayM15[];
   ArraySetAsSeries(MAarrayM15,true);
   CopyBuffer(MA_HandleM15,0,0,3,MAarrayM15);
   
   
   if( MAarrayM15[0] < current_Ask){
   
      M15_Label_color_MOD_inM15 = BullColor;
      
   
   }
   else{
   
      M15_Label_color_MOD_inM15 = BearColor;
   
   
   }
   
   M15Label.BackColor(M15_Label_color_MOD_inM15);
   M15text.Color(Text_Color);
   

   
   color M30_Label_color_MOD_inM30;
   int MA_HandleM30 = iMA(_Symbol,PERIOD_M30,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayM30[];
   ArraySetAsSeries(MAarrayM30,true);
   CopyBuffer(MA_HandleM30,0,0,3,MAarrayM30);
   
   
   if( MAarrayM30[0] < current_Ask){
   
      M30_Label_color_MOD_inM30 = BullColor;
      
   
   }
   else{
   
      M30_Label_color_MOD_inM30 = BearColor;
   
   
   }
   
   M30Label.BackColor(M30_Label_color_MOD_inM30);
   M30text.Color(Text_Color);
   
   
       
   color H1_Label_color_MOD_inH1;
   int MA_HandleH1 = iMA(_Symbol,PERIOD_H1,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayH1[];
   ArraySetAsSeries(MAarrayH1,true);
   CopyBuffer(MA_HandleH1,0,0,3,MAarrayH1);
   
   
   if( MAarrayH1[0] < current_Ask){
   
      H1_Label_color_MOD_inH1 = BullColor;
      
   
   }
   else{
   
      H1_Label_color_MOD_inH1 = BearColor;
   
   
   }
   
   H1Label.BackColor(H1_Label_color_MOD_inH1);
   H1text.Color(Text_Color);
   
   
   color H4_Label_color_MOD_inH4;
   int MA_HandleH4 = iMA(_Symbol,PERIOD_H4,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayH4[];
   ArraySetAsSeries(MAarrayH4,true);
   CopyBuffer(MA_HandleH4,0,0,3,MAarrayH4);
   
   
   if( MAarrayH4[0] < current_Ask){
   
      H4_Label_color_MOD_inH4 = BullColor;
      
   
   }
   else{
   
      H4_Label_color_MOD_inH4 = BearColor;
   
   
   }
   
   H4Label.BackColor(H4_Label_color_MOD_inH4);
   H4text.Color(Text_Color);

     
   color D1_Label_color_MOD_inD1;
   int MA_HandleD1 = iMA(_Symbol,PERIOD_D1,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayD1[];
   ArraySetAsSeries(MAarrayD1,true);
   CopyBuffer(MA_HandleD1,0,0,3,MAarrayD1);
   
   
   if( MAarrayD1[0] < current_Ask){
   
      D1_Label_color_MOD_inD1 = BullColor;
      
   
   }
   else{
   
      D1_Label_color_MOD_inD1 = BearColor;
   
   
   }
   
   D1Label.BackColor(D1_Label_color_MOD_inD1);
   D1text.Color(Text_Color);
      
   color W1_Label_color_MOD_inW1;
   int MA_HandleW1 = iMA(_Symbol,PERIOD_W1,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayW1[];
   ArraySetAsSeries(MAarrayW1,true);
   CopyBuffer(MA_HandleW1,0,0,3,MAarrayW1);
   
   
   if( MAarrayW1[0] < current_Ask){
   
      W1_Label_color_MOD_inW1 = BullColor;
      
   
   }
   else{
   
      W1_Label_color_MOD_inW1 = BearColor;
   
   
   }
   
   W1Label.BackColor(W1_Label_color_MOD_inW1);
   W1text.Color(Text_Color); 
   
         
   color MN1_Label_color_MOD_inMN1;
   int MA_HandleMN1 = iMA(_Symbol,PERIOD_MN1,MA_period,0,AverageType,PRICE_CLOSE);
   double MAarrayMN1[];
   ArraySetAsSeries(MAarrayMN1,true);
   CopyBuffer(MA_HandleMN1,0,0,3,MAarrayMN1);
   
   
   if( MAarrayMN1[0] < current_Ask){
   
      MN1_Label_color_MOD_inMN1 = BullColor;
      
   
   }
   else{
   
      MN1_Label_color_MOD_inMN1 = BearColor;
   
   
   }
   
   MN1Label.BackColor(MN1_Label_color_MOD_inMN1);
   MN1text.Color(Text_Color);
   
   
   return(rates_total);
   
  }
  

//+------------------------------------------------------------------+
