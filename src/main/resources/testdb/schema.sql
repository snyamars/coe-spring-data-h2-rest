drop table promotion if exists;

create table promotion (ID bigint identity primary key, 
                        description varchar(50) not null, 
                        PROMOTIONSTARTDATE DATE, 
                        PROMOTIONENDDATE DATE, 
   			promotionownername  varchar(50) not null,
                        last_action  varchar(50), 
                        last_action_by  varchar(50) , 
                        );
                        
