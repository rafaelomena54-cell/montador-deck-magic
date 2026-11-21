# Montador de Deck Magic — versão com login e páginas

## O que mudou
- Acesso às funções somente depois de entrar em uma conta.
- Navegação separada em Montar deck, Buscar cartas, Estatísticas e Meus decks.
- Botão **Detalhes** na busca e **Ver** no deck para abrir a carta e ler seu texto completo.
- Busca Scryfall, importação/exportação, estatísticas, salvamento local por usuário e sincronização Supabase.

## Configuração necessária (uma vez)
1. No Supabase, abra seu projeto.
2. Entre em **SQL Editor**, crie uma consulta e cole o conteúdo de `supabase/supabase_schema.sql`. Execute.
3. Em **Project Settings → API**, copie a **Project URL** e a chave **anon/public**.
4. Abra `mobile/static/config.js` e substitua `https://SEU-PROJETO.supabase.co` e `SUA_CHAVE_ANON_PUBLICA` pelos seus dados.
5. No Supabase, abra **Authentication → Providers → Email** e deixe Email habilitado.
6. Envie os arquivos do ZIP ao repositório GitHub substituindo os arquivos antigos. O Render deverá iniciar um novo deploy.

**Importante:** use apenas a chave pública anon. Nunca coloque a chave `service_role` no navegador ou no GitHub. O acesso às tabelas é protegido por RLS e cada conta só consulta os próprios decks.

## Atualizar pelo celular
Extraia o ZIP. No GitHub, abra o repositório, envie/substitua as pastas e arquivos mantendo os caminhos. Aguarde o deploy no Render. No Chrome do celular, feche e abra o app novamente; se estiver instalado, pode ser necessário atualizar a página.

## Executar localmente
`pip install -r requirements.txt` e `uvicorn app:app --reload`

A busca de cartas utiliza a API pública Scryfall e precisa de internet. O login exige Supabase configurado. Sem configurar a URL e a chave pública, o app permanece bloqueado na tela de login.


## Catálogo e preços de lojas
- A página **Catálogo** percorre cartas de Magic em ordem alfabética, com filtro por tipo e paginação. O catálogo de cartas vem da Scryfall.
- Cada carta pode ser aberta, adicionada ao deck e consultada na LigaMagic ou no catálogo geral da Bolovo Games.
- Para exibir preços e quantidade de ofertas da LigaMagic dentro do app, configure `REEFAPI_KEY` nas variáveis de ambiente do Render. A chave é de um serviço externo (ReefAPI) que disponibiliza os dados da LigaMagic. O serviço informa créditos gratuitos iniciais e pode cobrar após o limite gratuito; confira os termos e custos antes de ativar.
- Nunca coloque essa chave no `config.js`, no GitHub ou no navegador.
- O catálogo público atual da Bolovo mostra produtos lacrados de Magic, não estoque pesquisável de cartas avulsas. Por isso o botão abre o catálogo geral, sem inventar preço ou quantidade de uma carta individual.
