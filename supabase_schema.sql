create table if not exists public.decks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  format text not null,
  colors text[] not null default '{}',
  archetype text,
  metadata jsonb not null default '{}'::jsonb,
  cards jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.decks enable row level security;
create policy "Users can view their own decks" on public.decks
  for select using (auth.uid() = user_id);
create policy "Users can insert their own decks" on public.decks
  for insert with check (auth.uid() = user_id);
create policy "Users can update their own decks" on public.decks
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users can delete their own decks" on public.decks
  for delete using (auth.uid() = user_id);
