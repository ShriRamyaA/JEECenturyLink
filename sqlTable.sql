



SQL> create table empDetRam (empUsername varchar2(25) not null, empPassword varchar2(15) not null,constraint empUsername_pk primary key(empUsername));

Table created.

SQL> insert into empDetRam(empUsername, empPassword) values('ASC001','abc123');

1 row created.

SQL> insert into empDetRam(empUsername, empPassword) values('ASC002','abc234');

1 row created.

SQL> insert into empDetRam(empUsername, empPassword) values('ASC003','abc345');

1 row created.

SQL> insert into empDetRam(empUsername, empPassword) values('ASC004','abc456');

1 row created.

SQL> insert into empDetRam(empUsername, empPassword) values('ASC005','abc567');

1 row created.


SQL> create table autoRam(carNumberPlateNum varchar2(20) not null, custName varchar2(50) not null,mobNum number not null,emailId varchar2(40) not null, constraint regNum_pk primary key (carNumberPlateNum));

Table created.


SQL> create table custAddressRam (carNumberPlateNum varchar2(20) not null,lineOne varchar2(100) not null, lineTwo varchar2(100), city varchar2(30) not null,pinCode number not null,constraint regNum_fk foreign key (carNumberPlateNum) references autoRam(carNumberPlateNum));

Table created.

SQL> create table carDetRam(carNumberPlateNum varchar2(20) not null,carName varchar2(25) not null,carCategory varchar2(25) not null,insuranceNumber number,constraint regfkcust_fk foreign key (carNumberPlateNum) references autoRam(carNumberPlateNum));

Table created.

SQL> commit;

Commit complete.

SQL> select * from serviceListRam;

CARCATEGOR SERVICENAME               SERVICECOST                                
---------- ------------------------- -----------                                
Type1      Polishing                        2000                                
Type2      Polishing                        3000                                
Type3      Polishing                        4000                                
Type1      WheelBalancing                   2500                                
Type2      WheelBalancing                   3500                                
Type3      WheelBalancing                   4500                                
Type1      FullService                      4000                                
Type2      FullService                      5000                                
Type3      FullService                      6000                                
Type1      DecorService                     1500                                
Type2      DecorService                     2500                                

CARCATEGOR SERVICENAME               SERVICECOST                                
---------- ------------------------- -----------                                
Type3      DecorService                     3500                                
Type1      BatteryReplacement               3000                                
Type2      BatteryReplacement               4000                                
Type3      BatteryReplacement               5000                                

15 rows selected.


SQL> insert into insuranceDetRam(insuranceNumber,carNumberPlateNum,insuranceAmount) values('POL123','KA123123',3221);

1 row created.

SQL> insert into insuranceDetRam(insuranceNumber,carNumberPlateNum,insuranceAmount) values('POL887','KA112233',774);

1 row created.

SQL> insert into insuranceDetRam(insuranceNumber,carNumberPlateNum,insuranceAmount) values('POL9988','KA178899',1223);

1 row created.

SQL> commit;

Commit complete.

SQL> select * from autoRam;

CARNUMBERPLATENUM    CUSTNAME                                                   
-------------------- --------------------------------------------------         
    MOBNUM EMAILID                                                              
---------- ----------------------------------------                             
KA123123             Shri Ramya                                                 
9483139755 shri@gmail.com                                                       
                                                                                

SQL> select * from custAddressRam;

CARNUMBERPLATENUM                                                               
--------------------                                                            
LINEONE                                                                         
--------------------------------------------------------------------------------
LINETWO                                                                         
--------------------------------------------------------------------------------
CITY                              PINCODE                                       
------------------------------ ----------                                       
KA123123                                                                        
Sri Venkateshwara PG                                                            
Kadabeesanahalli                                                                
Bangalore                          560018                                       
                                                                                

SQL> select * from carDetRam;

no rows selected

SQL> desc carDetRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                         NOT NULL VARCHAR2(20)
 CARNAME                                   NOT NULL VARCHAR2(25)
 CARCATEGORY                               NOT NULL VARCHAR2(25)
 INSURANCENUMBER                                    NUMBER



SQL> create table carDetRam(carNumberPlateNum varchar2(20) not null,carName varchar2(25) not null,carCategory varchar2(25) not null,insuranceNumber varchar2(25),constraint regfkcust_fk foreign key (carNumberPlateNum) references autoRam(carNumberPlateNum));

Table created.

SQL> insert into carDetRam (carNumberPlateNum,carName,carCategory,insuranceNumber ) values('KA123123','Rolls Royce','Type3','POL123');

1 row created.

SQL> commit;

Commit complete.

SQL> select * from autoRam;

CARNUMBERPLATENUM    CUSTNAME                                                   
-------------------- --------------------------------------------------         
    MOBNUM EMAILID                                                              
---------- ----------------------------------------                             
KA112233             Ashok                                                      
9880716225 ashok@gmail.com                                                      
                                                                                
KA123                Gayathri                                                   
9686764410 gay@gmail.com                                                        
                                                                                
KA123123             Shri Ramya                                                 
9483139755 shri@gmail.com                                                       
                                                                                

CARNUMBERPLATENUM    CUSTNAME                                                   
-------------------- --------------------------------------------------         
    MOBNUM EMAILID                                                              
---------- ----------------------------------------                             
KA1231               Lakshman                                                   
9887557521 lakshman@gmail.com                                                   
                                                                                

SQL> desc carDetRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                         NOT NULL VARCHAR2(25)
 CARNAME                                   NOT NULL VARCHAR2(25)
 CARCATEGORY                               NOT NULL VARCHAR2(25)
 INSURANCENUMBER                                    VARCHAR2(25)

SQL> desc serviceHistRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                         NOT NULL VARCHAR2(20)
 SERVICENAME                               NOT NULL VARCHAR2(30)
 SERVICECOST                               NOT NULL NUMBER(10,2)
 INSURANCEAMOUNT                                    NUMBER(10,2)
 NETCOSTPERSERVICE                         NOT NULL NUMBER(10,2)
 DATEOFSERVICE                             NOT NULL DATE


SQL> create table insuranceDetRam(insuranceNumber varchar2(25) not null, carNumberPlateNum varchar2(25),insuranceAmount number(10,2),constraint insNum_pk primary key(insuranceNumber));

Table created.

SQL> insert into insuranceDetRam(insuranceNumber,carNumberPlateNum,insuranceAmount) values('POL1877','KA178899',1233.0);

1 row created.
            

SQL> insert into insuranceDetRam(insuranceNumber,carNumberPlateNum,insuranceAmount) values('POL123','KA123123',3221.0);

1 row created.

SQL> insert into insuranceDetRam(insuranceNumber,carNumberPlateNum,insuranceAmount) values('POL0091','KA112233',774.0);

1 row created.

SQL> select * from insuranceDetRam;

INSURANCENUMBER           CARNUMBERPLATENUM         INSURANCEAMOUNT             
------------------------- ------------------------- ---------------             
POL1877                   KA178899                             1233             
POL123                    KA123123                             3221             
POL0091                   KA112233                              774             


SQL> create table serviceListRam(carCategory varchar2(10),serviceName varchar2(25),serviceCost number(8,2));

Table created.


SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type1','Polishing',2000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type2','Polishing',3000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type3','Polishing',4000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type1','WheelBalancing',2500);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type2','WheelBalancing',3500);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type3','WheelBalancing',4500);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type1','FullService',4000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type2','FullService',5000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type3','FullService',6000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type1','DecorService',1500);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type2','DecorService',2500);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type3','DecorService',3500);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type1','BatteryReplacement',3000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type2','BatteryReplacement',4000);

1 row created.

SQL> insert into serviceListRam(carCategory,serviceName,serviceCost) values('Type3','BatteryReplacement',5000);

1 row created.

SQL> select * from serviceListRam;

CARCATEGOR SERVICENAME               SERVICECOST                                
---------- ------------------------- -----------                                
Type1      Polishing                        2000                                
Type2      Polishing                        3000                                
Type3      Polishing                        4000                                
Type1      WheelBalancing                   2500                                
Type2      WheelBalancing                   3500                                
Type3      WheelBalancing                   4500                                
Type1      FullService                      4000                                
Type2      FullService                      5000                                
Type3      FullService                      6000                                
Type1      DecorService                     1500                                
Type2      DecorService                     2500                                

CARCATEGOR SERVICENAME               SERVICECOST                                
---------- ------------------------- -----------                                
Type3      DecorService                     3500                                
Type1      BatteryReplacement               3000                                
Type2      BatteryReplacement               4000                                
Type3      BatteryReplacement               5000                                

15 rows selected.

SQL> commit;

Commit complete.

SQL> spool out;
SQL> create table serviceHistRam(carNumberPlateNum varchar2(25),dateOfService varchar2(20),serviceName varchar2(30),serviceCost number(10,2));

Table created.

SQL> create table amountHistRam(carNumberPlateNum varchar2(25), dateOfService varchar2(20), insuranceAmount number(10,2),grandTotal number(10,2));

Table created.

SQL> commit;

Commit complete.


SQL> spool out



SQL> desc autoRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                         NOT NULL VARCHAR2(20)
 CUSTNAME                                  NOT NULL VARCHAR2(50)
 MOBNUM                                    NOT NULL NUMBER
 EMAILID                                   NOT NULL VARCHAR2(40)

SQL> desc empDetRam;;
SP2-0565: Illegal identifier.
SQL> desc empDetRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPUSERNAME                               NOT NULL VARCHAR2(25)
 EMPPASSWORD                               NOT NULL VARCHAR2(15)

SQL> desc custAddressRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                         NOT NULL VARCHAR2(20)
 LINEONE                                   NOT NULL VARCHAR2(100)
 LINETWO                                            VARCHAR2(100)
 CITY                                      NOT NULL VARCHAR2(30)
 PINCODE                                   NOT NULL NUMBER

SQL> desc carDetRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                         NOT NULL VARCHAR2(20)
 CARNAME                                   NOT NULL VARCHAR2(25)
 CARCATEGORY                               NOT NULL VARCHAR2(25)
 INSURANCENUMBER                                    VARCHAR2(25)

SQL> desc insuranceDetRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 INSURANCENUMBER                           NOT NULL VARCHAR2(25)
 CARNUMBERPLATENUM                                  VARCHAR2(25)
 INSURANCEAMOUNT                                    NUMBER(10,2)

SQL> desc serviceListRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARCATEGORY                                        VARCHAR2(10)
 SERVICENAME                                        VARCHAR2(25)
 SERVICECOST                                        NUMBER(8,2)

SQL> desc serviceHistRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                                  VARCHAR2(25)
 DATEOFSERVICE                                      VARCHAR2(20)
 SERVICENAME                                        VARCHAR2(30)
 SERVICECOST                                        NUMBER(10,2)

SQL> desc amountHistRam;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARNUMBERPLATENUM                                  VARCHAR2(25)
 DATEOFSERVICE                                      VARCHAR2(20)
 INSURANCEAMOUNT                                    NUMBER(10,2)
 GRANDTOTAL                                         NUMBER(10,2)

SQL> select * from empDetRam;

EMPUSERNAME               EMPPASSWORD                                           
------------------------- ---------------                                       
ASC001                    abc123                                                
ASC002                    abc234                                                
ASC003                    abc345                                                
ASC004                    abc456                                                
ASC005                    abc567                                                

SQL> select * from autoRam;

CARNUMBERPLATENUM    CUSTNAME                                                   
-------------------- --------------------------------------------------         
    MOBNUM EMAILID                                                              
---------- ----------------------------------------                             
KA112233             Ashok                                                      
9880716225 ashok@gmail.com                                                      
                                                                                
KA123                Gayathri                                                   
9686764410 gay@gmail.com                                                        
                                                                                
KA123123             Shri Ramya                                                 
9483139755 shri@gmail.com                                                       
                                                                                

CARNUMBERPLATENUM    CUSTNAME                                                   
-------------------- --------------------------------------------------         
    MOBNUM EMAILID                                                              
---------- ----------------------------------------                             
KA1231               Lakshman                                                   
9887557521 lakshman@gmail.com                                                   
                                                                                

SQL> select * from custAddressRam;

CARNUMBERPLATENUM                                                               
--------------------                                                            
LINEONE                                                                         
--------------------------------------------------------------------------------
LINETWO                                                                         
--------------------------------------------------------------------------------
CITY                              PINCODE                                       
------------------------------ ----------                                       
KA112233                                                                        
Siddapura                                                                       
Kundapura                                                                       
Udupi                              576229                                       
                                                                                

CARNUMBERPLATENUM                                                               
--------------------                                                            
LINEONE                                                                         
--------------------------------------------------------------------------------
LINETWO                                                                         
--------------------------------------------------------------------------------
CITY                              PINCODE                                       
------------------------------ ----------                                       
KA123                                                                           
Shri Nilaya                                                                     
Siddapura                                                                       
Udupi                              576229                                       
                                                                                

CARNUMBERPLATENUM                                                               
--------------------                                                            
LINEONE                                                                         
--------------------------------------------------------------------------------
LINETWO                                                                         
--------------------------------------------------------------------------------
CITY                              PINCODE                                       
------------------------------ ----------                                       
KA123123                                                                        
Sri Venkateshwara PG                                                            
Kadabeesanahalli                                                                
Bangalore                          560018                                       
                                                                                

CARNUMBERPLATENUM                                                               
--------------------                                                            
LINEONE                                                                         
--------------------------------------------------------------------------------
LINETWO                                                                         
--------------------------------------------------------------------------------
CITY                              PINCODE                                       
------------------------------ ----------                                       
KA1231                                                                          
Lucky Nilaya                                                                    
Basaweshwaranagar                                                               
Bangalore                          560021                                       
                                                                                

SQL> select * from carDetRam;

CARNUMBERPLATENUM    CARNAME                   CARCATEGORY                      
-------------------- ------------------------- -------------------------        
INSURANCENUMBER                                                                 
-------------------------                                                       
KA112233             Benz                      Type3                            
POL887                                                                          
                                                                                
KA123                Swift                     Type2                            
                                                                                
                                                                                
KA123123             Rolls Royce               Type3                            
POL123                                                                          
                                                                                

CARNUMBERPLATENUM    CARNAME                   CARCATEGORY                      
-------------------- ------------------------- -------------------------        
INSURANCENUMBER                                                                 
-------------------------                                                       
KA1231               Formula one               Type3                            
                                                                                
                                                                                

SQL> select * from insuranceDetRam;

INSURANCENUMBER           CARNUMBERPLATENUM         INSURANCEAMOUNT             
------------------------- ------------------------- ---------------             
POL123                    KA123123                             3221             
POL887                    KA112233                              774             
POL9988                   KA178899                             1223             

SQL> select * from serviceListRam;

CARCATEGOR SERVICENAME               SERVICECOST                                
---------- ------------------------- -----------                                
Type1      Polishing                        2000                                
Type2      Polishing                        3000                                
Type3      Polishing                        4000                                
Type1      WheelBalancing                   2500                                
Type2      WheelBalancing                   3500                                
Type3      WheelBalancing                   4500                                
Type1      FullService                      4000                                
Type2      FullService                      5000                                
Type3      FullService                      6000                                
Type1      DecorService                     1500                                
Type2      DecorService                     2500                                

CARCATEGOR SERVICENAME               SERVICECOST                                
---------- ------------------------- -----------                                
Type3      DecorService                     3500                                
Type1      BatteryReplacement               3000                                
Type2      BatteryReplacement               4000                                
Type3      BatteryReplacement               5000                                

15 rows selected.

SQL> select * from serviceHistRam;

CARNUMBERPLATENUM         DATEOFSERVICE        SERVICENAME                      
------------------------- -------------------- ------------------------------   
SERVICECOST                                                                     
-----------                                                                     
KA112233                  18/10/2018           Polishing                        
       4000                                                                     
                                                                                
KA112233                  18/10/2018           WheelBalancing                   
       4500                                                                     
                                                                                
KA112233                  18/10/2018           FullService                      
       6000                                                                     
                                                                                

CARNUMBERPLATENUM         DATEOFSERVICE        SERVICENAME                      
------------------------- -------------------- ------------------------------   
SERVICECOST                                                                     
-----------                                                                     
KA123                     18/10/2018           FullService                      
       5000                                                                     
                                                                                
KA123                     18/10/2018           DecorService                     
       2500                                                                     
                                                                                

SQL> select * from amountHistRam;

CARNUMBERPLATENUM         DATEOFSERVICE        INSURANCEAMOUNT GRANDTOTAL       
------------------------- -------------------- --------------- ----------       
KA112233                  18/10/2018                       774      13726       
KA123                     18/10/2018                         0       7500       

SQL> spool out;

