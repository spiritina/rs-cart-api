create extension if not exists "uuid-ossp";
create type status_enum as enum ('OPEN', 'ORDERED');
create table carts (
	id uuid not null default uuid_generate_v4() primary key,
	user_id uuid not null,
	created_at date not null,
	updated_at date not null,
	status status_enum
);

create table cart_items (
	product_id uuid,
	count integer
);
alter table cart_items add column cart_id uuid references carts(id);

