
create table var (
	   var_id serial primary key,
	   name varchar(30) not null,
	   description varchar(100) not null
);

create table result_set (
	   rs_id serial primary key,
	   dependent_var int not null references var(var_id)
);

create table model (model_id serial primary key,
	   	name varchar(30) not null,
		description varchar(100) not null,
		r_squared real,
		sample_size integer
);

create table effect (
	   model_id integer not null references model(model_id),
	   var_id integer not null references var(var_id),	
	   coefficient real not null,
	   standard_error real not null,
	   unique(model_id, var_id)
);
