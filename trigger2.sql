create or replace function set_closed()
  returns trigger as $set_closed$
declare
  current_task int;
begin
  current_task := new.task;
  if new.text like '%/payed%' then
    UPDATE examhelp.task SET status = 'payed' where task_id = current_task;
  end if;
  return new;
end;

$set_closed$
language plpgsql;


-- DROP TRIGGER payment_received
-- on examhelp.message;

create trigger payment_received
  after insert
  on examhelp.message
  for each row execute procedure set_closed();

-- delete from examhelp.task * where task_id = 3;


