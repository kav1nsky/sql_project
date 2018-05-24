create or replace function create_chat2()
  returns trigger as $create_chat2$
declare
  current_status varchar(20);
  current_chat_id int;
begin
  current_status := new.status;
  select chat_id into current_chat_id from examhelp.chat where chat.solver = new.solver;
  if current_chat_id is null and current_status = 'taken' then
    insert into examhelp.chat (solver, student) select new.solver, old.poster;
  end if;
  return new;
end;

$create_chat2$ language plpgsql;


DROP TRIGGER take_task on examhelp.task;

create trigger take_task after update on examhelp.task
  for each row execute procedure create_chat2();

update examhelp.task set status = 'taken', solver = 3 where task_id = 3;

