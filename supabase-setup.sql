-- Sarah quizzes — Supabase schema
-- Run this once in your Supabase project: Dashboard → SQL Editor → paste → Run.
--
-- It creates one table holding each saved quiz result, owned by the signed-in
-- user, with Row-Level Security so every account can only read/write its own
-- rows. The website (browser) and the `sarah` CLI both talk to this table
-- using the public anon key + the user's login — no secret key is ever needed
-- by a client.

create table if not exists public.results (
  id            uuid primary key default gen_random_uuid(),
  owner         uuid not null references auth.users (id) on delete cascade default auth.uid(),
  profile_name  text not null,                 -- the person the result is for (e.g. "Matt")
  quiz          text not null,                 -- attachment | love | bigfive | darktriad | mbti | rice
  payload       jsonb not null,                -- the full result entry (scores, answers, saved_at, …)
  updated_at    timestamptz not null default now(),
  -- one result per (account, person, quiz); lets the apps upsert cleanly
  unique (owner, profile_name, quiz)
);

create index if not exists results_owner_idx on public.results (owner);

-- Row-Level Security: a user may only see and change their own rows.
alter table public.results enable row level security;

drop policy if exists "results_select_own" on public.results;
drop policy if exists "results_insert_own" on public.results;
drop policy if exists "results_update_own" on public.results;
drop policy if exists "results_delete_own" on public.results;

create policy "results_select_own" on public.results
  for select using (owner = auth.uid());
create policy "results_insert_own" on public.results
  for insert with check (owner = auth.uid());
create policy "results_update_own" on public.results
  for update using (owner = auth.uid()) with check (owner = auth.uid());
create policy "results_delete_own" on public.results
  for delete using (owner = auth.uid());

-- Keep updated_at fresh on every change.
create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists results_touch_updated_at on public.results;
create trigger results_touch_updated_at
  before update on public.results
  for each row execute function public.touch_updated_at();
