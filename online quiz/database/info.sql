--
-- Create Database Script 
--   Database Version   : 10.2.0.1.0 
--   TOAD Version       : 9.0.1.8 
--   DB Connect String  : XE 
--   Script Created by  : LEADQUIEZS 
--   Script Created at  : 11/3/2018 11:00:58 PM 
--   Physical Location  :  
--   Notes              :  
--

CREATE ROLE CONNECT NOT IDENTIFIED;



CREATE ROLE RESOURCE NOT IDENTIFIED;



CREATE ROLE DBA NOT IDENTIFIED;



CREATE ROLE SELECT_CATALOG_ROLE NOT IDENTIFIED;



CREATE ROLE EXECUTE_CATALOG_ROLE NOT IDENTIFIED;



CREATE ROLE DELETE_CATALOG_ROLE NOT IDENTIFIED;



CREATE ROLE EXP_FULL_DATABASE NOT IDENTIFIED;



CREATE ROLE IMP_FULL_DATABASE NOT IDENTIFIED;



CREATE ROLE RECOVERY_CATALOG_OWNER NOT IDENTIFIED;



CREATE ROLE GATHER_SYSTEM_STATISTICS NOT IDENTIFIED;



CREATE ROLE LOGSTDBY_ADMINISTRATOR NOT IDENTIFIED;



CREATE ROLE AQ_ADMINISTRATOR_ROLE NOT IDENTIFIED;



CREATE ROLE AQ_USER_ROLE NOT IDENTIFIED;



CREATE ROLE SCHEDULER_ADMIN NOT IDENTIFIED;



CREATE ROLE HS_ADMIN_ROLE NOT IDENTIFIED;



CREATE ROLE OEM_ADVISOR NOT IDENTIFIED;



CREATE ROLE OEM_MONITOR NOT IDENTIFIED;



CREATE ROLE PLUSTRACE NOT IDENTIFIED;



CREATE ROLE CTXAPP NOT IDENTIFIED;



CREATE ROLE XDBADMIN NOT IDENTIFIED;



CREATE ROLE AUTHENTICATEDUSER NOT IDENTIFIED;



CREATE ROLE XDBWEBSERVICES NOT IDENTIFIED;



CREATE ROLLBACK SEGMENT SYSTEM
  TABLESPACE SYSTEM
  STORAGE    (
              INITIAL          112K
              MINEXTENTS       1
              MAXEXTENTS       32765
             );
ALTER ROLLBACK SEGMENT SYSTEM ONLINE;


begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'AUTO_TASK_CONSUMER_GROUP'
     ,comment                      => 'System maintenance task consumer group');
  sys.dbms_resource_manager.submit_pending_area();
end;
/



begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'DEFAULT_CONSUMER_GROUP'
     ,comment                      => 'consumer group for users not assigned to any group');
  sys.dbms_resource_manager.submit_pending_area();
end;
/

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager_privs.grant_switch_consumer_group (
      grantee_name                 => 'PUBLIC'
     ,consumer_group               => 'DEFAULT_CONSUMER_GROUP'
     ,grant_option                 => TRUE);
  sys.dbms_resource_manager.submit_pending_area();
end;
/




begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'INTERNAL_PLAN'
     ,cpu_mth                      => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default Plan');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'INTERNAL_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,comment                      => 'Other sessions at lower priority'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'INTERNAL_QUIESCE'
     ,cpu_mth                      => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Plan to internally quiesce system');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'INTERNAL_QUIESCE'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,active_sess_pool_p1          => 0
     ,switch_estimate              => FALSE
     ,comment                      => 'Other sessions at lower priority'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'INTERNAL_QUIESCE'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,comment                      => 'System sessions at high priority'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'SYSTEM_PLAN'
     ,cpu_mth                      => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Plan to give system sessions priority');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'SYSTEM_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,cpu_p2                       => 100
     ,switch_estimate              => FALSE
     ,comment                      => 'Other sessions at lower priority'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'SYSTEM_PLAN'
     ,group_or_subplan             => 'SYS_GROUP'
     ,cpu_p1                       => 100
     ,switch_estimate              => FALSE
     ,comment                      => 'System sessions at high priority'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'LOW_GROUP'
     ,comment                      => 'Group of low priority sessions');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'SYSTEM_PLAN'
     ,group_or_subplan             => 'LOW_GROUP'
     ,cpu_p3                       => 100
     ,switch_estimate              => FALSE
     ,comment                      => 'Other sessions at lowest priority'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


