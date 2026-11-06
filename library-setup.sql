-- The Library (thatonedrawer.com/library/): one row per book, private to each account.
-- Run once in Supabase: SQL Editor > New query > paste > Run.
-- Uses the same Supabase project as the Recipe Box and the Study. Touches no other tables.

create table if not exists public.library_books (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users (id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists library_books_user_idx on public.library_books (user_id);

alter table public.library_books enable row level security;

drop policy if exists "library: own books" on public.library_books;
create policy "library: own books" on public.library_books
  for all to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

grant select, insert, update, delete on public.library_books to authenticated;
