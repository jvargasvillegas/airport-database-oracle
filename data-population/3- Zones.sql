BEGIN


    insert into zona_horaria values (sys_guid(), 'UTC', 0);
    insert into zona_horaria values (sys_guid(), 'AST', 4);
    insert into zona_horaria values (sys_guid(), 'EDT', 4);
    insert into zona_horaria values (sys_guid(), 'EST', 5);
    insert into zona_horaria values (sys_guid(), 'CDT', 5);
    insert into zona_horaria values (sys_guid(), 'CST', 6);
    insert into zona_horaria values (sys_guid(), 'MDT', 6);
    insert into zona_horaria values (sys_guid(), 'PDT', 7);
    insert into zona_horaria values (sys_guid(), 'GMT-3', 3);
    insert into zona_horaria values (sys_guid(), 'GMT-4', 4);
    insert into zona_horaria values (sys_guid(), 'GMT-5', 5);
    insert into zona_horaria values (sys_guid(), 'GMT-6', 6);
    insert into zona_horaria values (sys_guid(), 'GMT-7', 7);
    insert into zona_horaria values (sys_guid(), 'GMT', 0);
    insert into zona_horaria values (sys_guid(), 'GMT+1', 1);
    insert into zona_horaria values (sys_guid(), 'GMT+2', 2);
    insert into zona_horaria values (sys_guid(), 'GMT+3', 3);
    
END