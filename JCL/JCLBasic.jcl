****** ****ZAP****AUTOSAVE********** TOP OF DATA ******************************
000001 //* SET ATTRIBUTES SUCH AS THE START OF THE JOB, JOB NAME, PRIORITY, OUT
000002 //* PUT CLASS, ETC                                                      
000003 //* NOTIFY THAT YOU ARE NOW STARTING ONE BATCH OPERATION                
000004 //MYJOB JOB CLASS=A,MSGCLASS=X                                          
000005                                                                         
000006 //* RUN A FLOWGRAM NAMED MYCOBOL, CREATE A STEP CALLED STEP1            
000007 //* (RUN THE MYCOBOL PROGRAM WITHIN JOB)                                
000008 //STEP1 EXEC PGM=MYCOBOL                                                
000009                                                                         
000010 //* DD : DEFINE THE DATASET (FILE) THAT THE PROGRAM WILL USE            
000011 //* THE LOGICAL FILE NAME INPUT, THE ACTUAL DATA SET IS USER.INPUT.FILE 
000012 //* LOGIC SUCH AS "SELECT INPUT-FILE ASSIGN TO INPUT" IN COBOL          
000013 //INPUT DD DSN=USER.INPUT.FILE,DISP=SHR                                 
000014                                                                         
000015 //* CREATING AND LINKING OUTPUT FILES                                   
000016 //OUTPUT DD DSN=USER.OUTPUT.FILE,                                       
000017 //          DISP=(NEW,CATLG,DELETE),                                    
000018 //          SPACE=(TRK,(10,5))                                          
000019                                                                         
****** ****ZAP****AUTOSAVE********* BOTTOM OF DATA ****************************