-- Execute este SQL no SQL Editor do Supabase.
create table if not exists public.decks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  format text,
  colors text[] default '{}',
  archetype text,
  metadata jsonb default '{}'::jsonb,
  cards jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.decks enable row level security;
drop policy if exists "Usuário vê seus decks" on public.decks;
create policy "Usuário vê seus decks" on public.decks for select using (auth.uid() = user_id);
drop policy if exists "Usuário cria seus decks" on public.decks;
create policy "Usuário cria seus decks" on public.decks for insert with check (auth.uid() = user_id);
drop policy if exists "Usuário altera seus decks" on public.decks;
create policy "Usuário altera seus decks" on public.decks for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Usuário apaga seus decks" on public.decks;
create policy "Usuário apaga seus decks" on public.decks for delete using (auth.uid() = user_id);
